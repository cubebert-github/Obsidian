#!/bin/bash

# The script collects all of the translatable strings.
# Must be launched from the OBSIDIAN "/language" directory.

PACKAGEERR=""

function check_if_installed {
	if ! which $1 > /dev/null; then
		[ -z "$2" ] && PACKAGENAME="$1" || PACKAGENAME="$2"
		echo "check_if_installed(): Cannot find the \"$1\" program (from the package \"$2\")."
		PACKAGEERR="true"
	fi
}

check_if_installed sed
check_if_installed date coreutils
check_if_installed msgcat gettext
check_if_installed msguniq gettext

[ -n "$PACKAGEERR" ] && echo && exit 2


LOCALIZATIONDIR="language"
TEMPLATEFILENAME="TEMPLATE_Obsidian.po"

RESULTFILE="$LOCALIZATIONDIR/$TEMPLATEFILENAME"
INTERMEDFILE="$RESULTFILE.new"

if [[ ! -f $TEMPLATEFILENAME || `basename $(pwd)` != "$LOCALIZATIONDIR" ]]; then
	echo "This directory doesn't look like \"<OBSIDIAN_dir>/$LOCALIZATIONDIR/\". Make sure you launch the script in it."
	exit 1
fi

# Stop the script at the first error:
set -e

# Start to collect from the project root:
cd ..



function lines_eq {
	printf "$1\n$2\n" | sort | uniq --repeated
}

function lines_xor {
	printf "$1\n$2\n" | sort | uniq --unique
}

function lines_not {
	printf "$1\n$(lines_eq "$1" "$2")\n" | sort | uniq --unique
}

#TEST_A="$(printf "A\nB\nC\nD")"
#TEST_B="$(printf "A\nB\nD\nE\nF")"
#echo A: $TEST_A
#echo B: $TEST_B
#echo "XOR: $(lines_xor "$TEST_A" "$TEST_B" | wc)"
#echo "EQ : $(lines_eq  "$TEST_A" "$TEST_B" | wc)"
#echo "NT1: $(lines_not "$TEST_A" "$TEST_B" | wc)"
#echo "NT2: $(lines_not "$TEST_B" "$TEST_A" | wc)"



echo Locating files to localize...
EXCLUDE_DIRS_ARG="$(echo ".git|attic|build|data|language|misc|presets|theme" | sed "s/|/ --exclude-dir=/g" | sed "s/^/--exclude-dir=/1")"

LOCZ_GETTEXT=`grep -r --files-with-matches -E "gui\.gettext\(\".*\"\)" $EXCLUDE_DIRS_ARG`
LOCZ_UNDERSC=`grep -r --files-with-matches -E "_\(\".*\"\)" $EXCLUDE_DIRS_ARG`
LOCZ_UNDERSC_MULTILINE=`grep -r --files-with-matches -E "_\(\".*\.\.\s*\$" $LOCZ_UNDERSC`
LOCZ_UNDERSC="$(lines_not "$LOCZ_UNDERSC" "$LOCZ_UNDERSC_MULTILINE")"


echo Collecting simple strings...
grep -Eno "gui\.gettext\(\".*\"\)" $LOCZ_GETTEXT | sed -E 's/^/#: /;  s/:gui\.gettext\(/\nmsgid /;  s/\)$/\nmsgstr ""\n/' > $INTERMEDFILE
grep -Eno "_\(\".*\"\)" $LOCZ_UNDERSC | sed -E 's/^/#: /;  s/:_\(/\nmsgid /;  s/\)$/\nmsgstr ""\n/' >> $INTERMEDFILE


echo Collecting multiline strings...

awk '
function print_po_entry( po_msg ) {
	print "#: " FILENAME ":" FNR "\nmsgid " po_msg "\nmsgstr \"\"\n"
}

/_\("/ {
	if (match($0, "_\\((\".*?\")\\)", str)) {
		print_po_entry(str[1])
	} else {
		MLSTR=substr( $0, 2 + index($0, "_(\"") )
		sub(/\s*\.\.\s*$/, "\n", MLSTR);
		FIRSTMLLINE=1
		#print(">>>>>" MLSTR)
	}
}

{
	if (MLSTR) {
		if (!FIRSTMLLINE) {
			CURLINE=$0
			sub(/^[ \t]*/, "", CURLINE);
			sub(/\s*\.\.\s*$/, "\n", CURLINE);
			#print("   >>" CURLINE)

			if (match(CURLINE, "(.+\")\\)", str)) {
				print_po_entry(MLSTR str[1])
				MLSTR = ""
			} else {
				MLSTR = MLSTR CURLINE
			}
		} else {
			FIRSTMLLINE = 0
		}
	}
}

END {
	if (MLSTR) print MLSTR
}' $LOCZ_UNDERSC_MULTILINE >> $INTERMEDFILE


echo Removing unnecessary internal lines...
grep -n -B1 -A2 "\s\.\.\s" $INTERMEDFILE | sed -n 's/^\([0-9]\{1,\}\).*/\1d/p' | sed -f - $INTERMEDFILE -i

echo Removing duplicates...
cat $INTERMEDFILE | msguniq --no-wrap --use-first - -o "$INTERMEDFILE"

echo Writing to the $TEMPLATEFILENAME...
cat <<EOT > $RESULTFILE
# Language Translation for Obsidian.
# This file is put in the public domain.
# 
msgid ""
msgstr ""
"Project-Id-Version: Obsidian Level Maker\n"
"Report-Msgid-Bugs-To: \n"
"POT-Creation-Date: 2016-05-09 23:41+1000\n"
"PO-Revision-Date: $(date +'%Y-%m-%d %H:%M%z')\n"
"Last-Translator:  Dasho\n"
"Language-Team: English\n"
"Language: en_US\n"
"MIME-Version: 1.0\n"
"Content-Type: text/plain; charset=UTF-8\n"
"Content-Transfer-Encoding: 8bit\n"
"Plural-Forms: nplurals=2; plural=(n != 1);\n"

# ################################################################################################################################################################################################## #
# Comments by Dashodanger: One can automate this process for each time the code is changed with the following nightmarish one-liners:                                                                #
# grep -n -r -o "gui[.]gettext[(]\".*\"[)]" | sed -r {s/"^"/"#: "/} | sed -r {s/":_"/"\n"/} | sed -r {s/"\gui[.]gettext[(]"/"\nmsgid "/} | sed -r {s/"\)$"/"\nmsgstr \"\"\n"/} | sed -r {s/":$"/""/} #
# grep -n -r -o "[_][(]\".*\"[)]" | sed -r {s/"^"/"#: "/} | sed -r {s/":_"/"\n"/} | sed -r {s/"\("/"msgid "/} | sed -r {s/"\)$"/"\nmsgstr \"\"\n"/} | sed -r {s/":$"/""/}                            #
# msguniq --no-wrap --use-first --escape <result file from above commands> -o <target PO file> (may need to use dos2unix depending on platform)                                                      #
# ################################################################################################################################################################################################## #

# The file was auto-generated by $0.
#   [END OF THE PREFIX SECTION]

EOT

cat $INTERMEDFILE >> $RESULTFILE

rm $INTERMEDFILE

echo Done!
