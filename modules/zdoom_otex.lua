------------------------------------------------------------------------
--  MODULE: OTEX Theme Generator
------------------------------------------------------------------------
--
--  Copyright (C) 2024-2025 MsrSgtShooterPerson
--
--  This program is free software; you can redistribute it and/or
--  modify it under the terms of the GNU General Public License
--  as published by the Free Software Foundation; either version 2
--  of the License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
-------------------------------------------------------------------
gui.import("zdoom_otex_db.lua")


OTEX_PROC_MODULE = { }

OTEX_MATERIALS = { }
OTEX_ROOM_THEMES = { }
OTEX_THEMES = { }

OTEX_EXCLUSIONS =
{
  -- animated textures
  WRNG = "textures",
  CHAN = "all",
  COMP = "all",

  -- textures with transparency
  EXIT = "all",
  FENC = "all",
  SWTC = "all",
  WARP = "all",
  VINE = "all",
  SOLI = "all",
  DOOR = "all",
  GATE = "all",
  FLAG = "all",
  RAIL = "all",
  LASR = "all",

  -- VFX
  FIRE = "all",

  -- liquids
  FALL = "all",
  BLOD = "all",
  GOOP = "all",
  LAVA = "all",
  ICYW = "all",
  NUKE = "all",
  SLUD = "all",
  TAR_ = "all",
  WATE = "all",
  POOP = "all", -- I am sad this has to be excluded... for now.

  -- skies
  SKY0 = "all",
  SKY1 = "all",
  SKY2 = "all",
  SKY3 = "all",
  SKY4 = "all",
  SKY5 = "all",
  SKY6 = "all",

  -- teleporter flats
  TLPT = "all",

  LGHT = "all",

  -- outdoors
  GRSS = "all",
  ICE_ = "all",

  -- just plain weird
  CRPT = "textures",
  TRAK = "all",
  KEYS = "all",
  EFCT = "all",

  -- too colorful
  TECH = "textures",
  FADE = "all"
}

-- some textures that must be removed manually from the DB
OTEX_DIRECT_REMOVALS =
{
  "OMRBLA90",
  "OMRBLA91",
  "OMRBLA92",
  "OMRBLA93",
  "OMRBLA94",
  "OMRBLC90",
  "OMRBLF28",
  "OMRBLF29",
  "OMRBLF38",
  "OMRBLF90",
  "OMRBLG90",
  "OMRBLI92",
  "OMRBLI93",
  "OMRBLJ90",
  "OMRBLJ93",
  "OMRBLK90",
  "OMRBLO28",
  "OMRBLO29",
  "OMRBLP90",
  "OMRBLP91",
  "OMRBLR90",
  "OMRBLR94",

  "OBRCKB10",
  "OBRCKB11",
  "OBRCKB12",
  "OBRCKB13",
  "OBRCKB20",
  "OBRCKB21",
  "OBRCKB22",
  "OBRCKB23",
  "OBRCKF11",
  "OBRCKF12",
  "OBRCKF13",
  "OBRCKF14",
  "OBRCKF21",
  "OBRCKF22",
  "OBRCKF23",
  "OBRCKF24",
  "OBRCKL10",
  "OBRCKL11",
  "OBRCKL21",
  "OBRCKU03",
  "OBRCKU04",
  "OBRCKU05",
  "OBRCKU06",
  "OBRCKU13",
  "OBRCKU14",
  "OBRCKU15",
  "OBRCKU16",
  "OBRCKU23",
  "OBRCKU24",
  "OBRCKU25",
  "OBRCKU26",
  "OBRCKU3D",
  "OBRCKU3E",
  "OBRCKU3F",
  "OBRCKU3G",
  "OBRCKU3H",
  "OBRCKU3I",
  "OTUDRB80",
  "OTUDRB81",

  "OBKMTB04",
  "OBKMTD90",
  "OBKMTD91",
  "OBKMTD92",
  "OBKMTD95",
  "OBKMTD96",
  "OBKMTD97",

  "OMETLJ91",
  "OMETLJ93",
  "OMETLJ94",

  "OBOOKA01",
  "OBOOKA02",
  "OBOOKA05",
  "OBOOKA10",
  "OBOOKA11",
  "OBOOKA12",

  "OVENTE01",
  "OVENTE02",
  "OVENTE03",
  "OVENTE04",
  "OVENTE13",
  "OVENTE14",

  "OMETLC96",
  "OMETLC97",
  "OMETLC98",
  "OMETLC99",
  "OMETLC92",
  "OMETLC93",
  "OMETLC94",
  "OMETLC95",
  "OMETLN37",
  "OMETLO37",
  "OMETLP37",

  "ONDSTJ91",
  "ONDSTJ93",
  "ONDSTJ94",

  "OTUDRA80",
  "OTUDRA81",
  "OTUDRB80",
  "OTUDRB81"
}

OTEX_THEME_RESTRICTIONS =
{
  MRBL = {"tech"},
  BONE = {"tech", "urban"},
  FLSH = {"tech", "urban"},
  HELL = {"tech", "urban"},
  SKIN = {"tech"},
  CMBD = {"tech"},

  FNCY = {"tech"},
  PALC = {"tech"},
  STCC = {"tech"},

  BRCK = {"tech"},
  BOOK = {"tech"},
  WOOD = {"tech"},
  TUDR = {"tech"},

  STON = {"tech"},
  SOIL = {"tech"},
  ROCK = {"tech", "urban"},
  SAND = {"tech", "urban"},
  DIRT = {"tech", "urban"}
}

OTEX_SPECIAL_RESOURCES =
{
  rail_materials =
  {
    OIRONK28 = {t="OIRONK28", rail_h=128},

    OBASEE70 = {t="OBASEE70", rail_h=128},
    OBASEE38 = {t="OBASEE38", rail_h=128},

    OFENCA01 = {t="OFENCA01", rail_h=128},
    OFENCA02 = {t="OFENCA02", rail_h=128},
    OFENCB01 = {t="OFENCB01", rail_h=56},
    OFENCB02 = {t="OFENCB02", rail_h=64},
    OFENCC01 = {t="OFENCC01", rail_h=128},
    OFENCC64 = {t="OFENCC64", rail_h=64},
    OFENCC96 = {t="OFENCC96", rail_h=96},
    OFENCD01 = {t="OFENCD01", rail_h=128},
    OFENCE01 = {t="OFENCE01", rail_h=128},

    OFENCF01 = {t="OFENCF01", rail_h=128},
    OFENCF02 = {t="OFENCF02", rail_h=64},
    OFENCF03 = {t="OFENCF03", rail_h=128},
    OFENCF04 = {t="OFENCF04", rail_h=64},
    OFENCF05 = {t="OFENCF05", rail_h=128},
    OFENCF06 = {t="OFENCF06", rail_h=96},
    OFENCF07 = {t="OFENCF07", rail_h=64},
    OFENCF08 = {t="OFENCF08", rail_h=32},
    OFENCF09 = {t="OFENCF09", rail_h=128},
    OFENCF10 = {t="OFENCF10", rail_h=96},
    OFENCF11 = {t="OFENCF11", rail_h=64},
    OFENCF12 = {t="OFENCF12", rail_h=32},
    OFENCF13 = {t="OFENCF13", rail_h=64},
    OFENCF14 = {t="OFENCF14", rail_h=64},

    OFENCF20 = {t="OFENCF20", rail_h=128},
    OFENCF21 = {t="OFENCF21", rail_h=64},

    OFENCG01 = {t="OFENCG01", rail_h=128},
    OFENCG02 = {t="OFENCG02", rail_h=64},
    OFENCH01 = {t="OFENCH01", rail_h=96},
    OFENCH02 = {t="OFENCH02", rail_h=96},

    OFENCJ11 = {t="OFENCJ11", rail_h=128},

    OFENCK01 = {t="OFENCK01", rail_h=128},
    OFENCL01 = {t="OFENCL01", rail_h=128},
    OFENCL02 = {t="OFENCL02", rail_h=128},
    OFENCM01 = {t="OFENCM01", rail_h=128},
    OFENCM02 = {t="OFENCM02", rail_h=64},
    OFENCM11 = {t="OFENCM11", rail_h=128},
    OFENCM12 = {t="OFENCM12", rail_h=128},

    OFENCN01 = {t="OFENCN01", rail_h=128},
    OFENCN02 = {t="OFENCN02", rail_h=128},
    OFENCN11 = {t="OFENCN11", rail_h=128},
    OFENCN12 = {t="OFENCN12", rail_h=128},

    ORAILA01 = {t="ORAILA01", rail_h=32},
    ORAILA02 = {t="ORAILA02", rail_h=32},
    ORAILA03 = {t="ORAILA03", rail_h=32},
    ORAILB01 = {t="ORAILB01", rail_h=32},

    OBKMTA92 = {t="OBKMTA92", rail_h=128},
    OBKMTA93 = {t="OBKMTA93", rail_h=128},
    OBKMTA94 = {t="OBKMTA94", rail_h=128},
    OBKMTA97 = {t="OBKMTA97", rail_h=64},

    OBKMTD32 = {t="OBKMTD32", rail_h=128},
    OBKMTD33 = {t="OBKMTD33", rail_h=128},
    OBKMTD37 = {t="OBKMTD37", rail_h=64},
    OBKMTD38 = {t="OBKMTD38", rail_h=64},
    OBKMTD39 = {t="OBKMTD39", rail_h=64}
  },

  rail_scenic_fences =
  {
    tech =
    {
      OIRONK28 = 20,

      OBASEE70 = 20,

      OFENCA01 = 20,
      OFENCA02 = 20,

      OFENCC01 = 20,
      OFENCC64 = 20,
      OFENCC96 = 20,
      OFENCD01 = 20,
      OFENCE01 = 20,
      OFENCF01 = 20,
      OFENCF02 = 20,
      OFENCF03 = 20,
      OFENCF04 = 20,
      OFENCF05 = 20,
      OFENCF06 = 20,
      OFENCF07 = 20,
      OFENCF08 = 20,
      OFENCF09 = 20,
      OFENCF10 = 20,
      OFENCF11 = 20,
      OFENCF12 = 20,
      OFENCF13 = 20,
      OFENCF14 = 20,

      OFENCJ11 = 25,
      OFENCL01 = 25,
      OFENCL02 = 25,
      OFENCM11 = 25,
      OFENCN01 = 25,
      OFENCN02 = 25,
      OFENCN11 = 25,
      OFENCN12 = 25,

      ORAILA01 = 35,
      ORAILA02 = 35,
      ORAILA03 = 35
    },

    gothic =
    {
      OFENCB01 = 30,
      OFENCB02 = 30,
      OFENCG01 = 30,
      OFENCG02 = 30,
      OFENCH01 = 15,
      OFENCH02 = 15,
      OFENCK01 = 30,
      OFENCM01 = 30,
      OFENCM02 = 30,
      OFENCM11 = 30,
      OFENCM12 = 30,

      OBKMTD32 = 30,
      OBKMTD33 = 30,
      OBKMTD37 = 30,
      OBKMTD38 = 30,
      OBKMTD39 = 30
    }
  },

  liquid_materials =
  {
    OBLODA01 = { t="OFALLB01", f="OBLODA01"},
    OGOOPY01 = { t="OFALLG01", f="OGOOPY01"},
    OICYWA01 = { t="OFALLW11", f="OICYWA01"},

    OLAVAA01 = { t="OFALLL01", f="OLAVAA01"},
    OLAVAA02 = { t="OFALLM01", f="OLAVAA02"},
    OLAVAB01 = { t="OFALLL01", f="OLAVAB01"},
    OLAVAC01 = { t="OFALLL01", f="OLAVAC01"},
    OLAVAD01 = { t="OFALLM01", f="OLAVAD01"},
    OLAVAE01 = { t="OFALLL11", f="OLAVAE01"},
    OLAVAF01 = { t="OFALLL11", f="OLAVAF01"},

    ONUKEA01 = { t="OFALLN01", f="ONUKEA01"},
    OSLUDG01 = { t="OFALLS01", f="OSLUDG01"},
    OPOOPY01 = { t="OFALLP01", f="OPOOPY01"},
    OTAR__01 = { t="OFALLT01", f="OTAR__01"},
    OWATER01 = { t="OFALLW01", f="OWATER01"}
  },

  liquid_defs =
  {
    otex_blood = { mat="OBLODA01", special=0},
    otex_purple_goop = { mat="OGOOPY01", light_add=16, special=0},
    otex_ice = { mat="OICYWA01", light_add=8, special=0},

    otex_lavaA1 = { mat="OLAVAA01", light_add=56, special=5, damage=10},
    otex_lavaA2 = { mat="OLAVAA02", light_add=56, special=5, damage=10},
    otex_lavaB1 = { mat="OLAVAB01", light_add=56, special=5, damage=10},
    otex_lavaC1 = { mat="OLAVAC01", light_add=56, special=5, damage=10},
    otex_lavaD1 = { mat="OLAVAD01", light_add=56, special=5, damage=10},
    otex_lavaE1 = { mat="OLAVAE01", light_add=56, special=5, damage=10},
    otex_lavaF1 = { mat="OLAVAF01", light_add=56, special=5, damage=10},

    otex_nukage = { mat="ONUKEA01", light_add=24, special=7, damage=5},

    otex_sludge = { mat="OSLUDG01", special=0},
    otex_poop = { mat="OPOOPY01", special=0},
    otex_tar = { mat="OTAR__01", special=0},
    otex_water = { mat="OWATER01", special=0}
  },

  liquid_themes =
  {
    tech =
    {
      otex_purple_goop = 10,
      otex_ice = 20,

      otex_lavaA1 = 3,
      otex_lavaA2 = 3,
      otex_lavaB1 = 3,
      otex_lavaC1 = 3,
      otex_lavaD1 = 3,
      otex_lavaE1 = 3,
      otex_lavaF1 = 3,

      otex_nukage = 50,
      otex_sludge = 30,
      otex_poop = 10,
      otex_tar = 40,
      otex_water = 20
    },

    urban =
    {
      otex_blood = 20,
      otex_purple_goop = 10,
      otex_ice = 20,

      otex_lavaA1 = 2,
      otex_lavaA2 = 2,
      otex_lavaB1 = 2,
      otex_lavaC1 = 2,
      otex_lavaD1 = 2,
      otex_lavaE1 = 2,
      otex_lavaF1 = 2,

      otex_nukage = 10,
      otex_sludge = 20,
      otex_poop = 50,
      otex_tar = 40,
      otex_water = 20
    },

    hell =
    {
      otex_blood = 70,
      otex_purple_goop = 10,
      otex_ice = 20,

      otex_lavaA1 = 12,
      otex_lavaA2 = 12,
      otex_lavaB1 = 12,
      otex_lavaC1 = 12,
      otex_lavaD1 = 12,
      otex_lavaE1 = 12,
      otex_lavaF1 = 12,

      otex_sludge = 30,
      otex_tar = 40,
      otex_poop = 40
    }
  }
}

OTEX_GLOWING_FLATS =
[[    OBLODA01
    OBLODA02
    OBLODA03
    OBLODA04
    OBLODA05
    OBLODA06
    OBLODA07
    OBLODA08

    OGOOPY01
    OGOOPY02
    OGOOPY03
    OGOOPY04
    OGOOPY05
    OGOOPY06
    OGOOPY07
    OGOOPY08

    OICYWA01
    OICYWA02
    OICYWA03
    OICYWA04
    OICYWA05
    OICYWA06
    OICYWA07
    OICYWA08
  
    OLAVAA01
    OLAVAA02
    OLAVAB01

    OLAVAC01
    OLAVAC02
    OLAVAC03
    OLAVAC04
    OLAVAC05
    OLAVAC06
    OLAVAC07
    OLAVAC08

    OLAVAD01
    OLAVAD02
    OLAVAD03
    OLAVAD04
    OLAVAD05
    OLAVAD06
    OLAVAD07
    OLAVAD08

    OLAVAE01
    OLAVAE02
    OLAVAE03
    OLAVAE04
    OLAVAE05
    OLAVAE06
    OLAVAE07
    OLAVAE08

    OLAVAF01
    OLAVAF02
    OLAVAF03
    OLAVAF04
    OLAVAF05
    OLAVAF06
    OLAVAF07
    OLAVAF08
    OLAVAF09
    OLAVAF10

    ONUKEA01
    ONUKEA02
    ONUKEA03
    ONUKEA04
    ONUKEA05
    ONUKEA06
    ONUKEA07
    ONUKEA08

    OSLUDG01
    OSLUDG02
    OSLUDG03
    OSLUDG04
    OSLUDG05
    OSLUDG06
    OSLUDG07
    OSLUDG08

    OPOOPY01
    OPOOPY02
    OPOOPY03
    OPOOPY04
    OPOOPY05
    OPOOPY06
    OPOOPY07
    OPOOPY08

    OTAR__01
    OTAR__02
    OTAR__03
    OTAR__04
    OTAR__05
    OTAR__06
    OTAR__07
    OTAR__08

    OWATER01
    OWATER02
    OWATER03
    OWATER04
    OWATER05
    OWATER06
    OWATER07
    OWATER08
]]

OTEX_MATERIAL_MANUAL_ASSIGNMENTS =
{
  -- green BASE
  OBASEN00 = {t="OBASEN30",f="OBASEN00"},

  OBASEN30 = {t="OBASEN30",f="OBASEN00"},
  OBASEN33 = {t="OBASEN33",f="OBASEN00"},
  OBASEN34 = {t="OBASEN34",f="OBASEN00"},
  OBASEN36 = {t="OBASEN36",f="OBASEN00"},
  OBASEN39 = {t="OBASEN39",f="OBASEN00"},
  OBASEN43 = {t="OBASEN43",f="OBASEN00"},
  OBASEN44 = {t="OBASEN44",f="OBASEN00"},

  -- blue BASE
  OBASEN01 = {t="OBASER59",f="OBASEN01"},

  OBASEP33 = {t="OBASEP33",f="OBASEN01"},
  OBASEP34 = {t="OBASEP34",f="OBASEN01"},
  OBASEP36 = {t="OBASEP36",f="OBASEN01"},
  OBASEP39 = {t="OBASEP39",f="OBASEN01"},
  OBASEP43 = {t="OBASEP33",f="OBASEN01"},
  OBASEP44 = {t="OBASEP44",f="OBASEN01"},

  OBASER19 = {t="OBASER19",f="OSTARA07"},
  OBASER30 = {t="OBASER30",f="OSTARA07"},
  OBASER50 = {t="OBASER50",f="OSTARA07"},
  OBASER59 = {t="OBASER59",f="OSTARA07"},

  -- red BASE
  OBASEQ33 = {t="OBASEQ33",f="OBASEL22"},
  OBASEQ34 = {t="OBASEQ34",f="OBASEL22"},
  OBASEQ36 = {t="OBASEQ36",f="OBASEL22"},
  OBASEQ39 = {t="OBASEQ39",f="OBASEL22"},
  OBASEQ43 = {t="OBASEQ43",f="OBASEL22"},
  OBASEQ44 = {t="OBASEQ44",f="OBASEL22"},

  ----------
  -- HELL --
  ----------

  OHELLA13 = {t="OHELLA13",f="OHELLA03"},
  OHELLA03 = {t="OHELLA13",f="OHELLA03"},

  -- pink walls
  OMRBLK01 = {t="OMRBLK43",f="OMRBLK01"},
  OMRBLK44 = {t="OMRBLK48",f="OMRBLK44"},
  OMRBLK59 = {t="OMRBLK91",f="OMRBLK59"},

  OMRBLK33 = {t="OMRBLK33",f="OMRBLK01"},
  OMRBLK35 = {t="OMRBLK35",f="OMRBLK01"},
  OMRBLK36 = {t="OMRBLK36",f="OMRBLK01"},
  OMRBLK37 = {t="OMRBLK37",f="OMRBLK01"},
  OMRBLK38 = {t="OMRBLK38",f="OMRBLK01"},
  OMRBLK39 = {t="OMRBLK39",f="OMRBLK01"},
  OMRBLK40 = {t="OMRBLK40",f="OMRBLK01"},
  OMRBLK43 = {t="OMRBLK43",f="OMRBLK01"},
  OMRBLK48 = {t="OMRBLK48",f="OMRBLK44"},
  OMRBLK49 = {t="OMRBLK49",f="OMRBLK44"},
  OMRBLK90 = {t="OMRBLK90",f="OMRBLK59"},
  OMRBLK91 = {t="OMRBLK91",f="OMRBLK59"},

  -- blue walls
  OMRBLR00 = {t="OMRBLR00",f="OMRBLR33"},
  OMRBLR14 = {t="OMRBLR14",f="OMRBLR33"},
  OMRBLR19 = {t="OMRBLR19",f="OMRBLR39"},
  OMRBLR22 = {t="OMRBLR22",f="OMRBLR39"},
  OMRBLR40 = {t="OMRBLR40",f="OMRBLR44"},
  OMRBLR43 = {t="OMRBLR43",f="OMRBLR44"},
  OMRBLR48 = {t="OMRBLR48",f="OMRBLR44"},
  OMRBLR49 = {t="OMRBLR49",f="OMRBLR44"},
  OMRBLR91 = {t="OMRBLR91",f="OMRBLR44"},
  OMRBLR92 = {t="OMRBLR92",f="OMRBLR44"},
  OMRBLR93 = {t="OMRBLR93",f="OMRBLR44"},
  OMRBLR95 = {t="OMRBLR95",f="OMRBLR44"}
}

OTEX_SANE_FLOORS =
{
  all =
  {
    "1DMD",
    "2DMD",
    "3DMD",
    "4DMD",
    "5DMD",
    "8DMD",
    "9DMD",
    "BSKT",
    "DIAG",
    "DMND",
    "GRBL",
    "NMLM",
    "PAVE",
    "PENT",
    "PLUS",
    "QSLP",
    "TL08",
    "TL16",
    "TL32",
    "TLMX",
    "TRHX",
    "TMPL"
  },

  industrial =
  {
    "GRAT",
  },

  gothic =
  {
    "CBBL",
    "DMUD",
    "FNCY",
    "HERR",
  }
--[[
  "DIRT",
  "GRSS",  
  "GRVL",
  "LLLL",
  "MRLT",  
  "ROOF",  
  "SNOW",  
  "SAND",]]
}

-- table of too-colorful specific texture names
OTEX_LIMITED_SAMPLES =
{
  "OHELLA13",
  "OMRBLK43",

  -- specific floors
  "O1DMDA05",
  "O1DMDA06",
  "O1DMDA07",
  "O8DMDA12",
  "O8DMDA13",
  "O9DMDA01",

  "OFNCYA21",
  "OFNCYA22",
  "OFNCYA23",
  "OFNCYA24",

  "OFNCYA31",
  "OFNCYA32",
  "OFNCYA33",
  "OFNCYA34",

  "OPLUSB08",
  "OPLUSB09",

  "OTL08A11",
  "OTL16B11",

  "OTRHXD06",
  "OTRHXD07",
  "OTRHXD08",

  "OTRHXE05",
  "OTRHXE06",
  "OTRHXE07",

  --

  "OBASEK29",
  "OBASEK36",
  "OBASEL29",
  "OBASEL36"
}

-- table of colorful texture groups
OTEX_LIMITED_SAMPLES_SUB =
{
  -- BASE
  "OBASEM",
  "OBASEN",
  "OBASEO",
  "OBASEP",
  "OBASEQ",
  "OBASER",

  "OSTARC",
  "OSTARD",

  -- HELL MARBLES
  "OMRBLD",
  "OMRBLK",
  "OMRBLO",
  "OMRBLR",
  "OPALCB",
  "OSPRTL",

  -- CHROME
  "OCHRMC",

  -- PALACE
  "OPALCA",
  "OPALCB",
  "OPALCE",

  -- CONS
  "ONDSTB",
  "ONDSTO",
  "ONDSTP",

  -- TECH
  "OTECHA",
  "OTECHB",
}

OTEX_SINK_BASES =
{
  OLGHTA01 = {dz = 128},
  OLGHTA02 = {dz = 128},
  OLGHTA03 = {dz = 128},
  OLGHTA04 = {dz = 128},
  OLGHTA05 = {dz = 128, color = "violet"},
  OLGHTA06 = {dz = 128},
  OLGHTA07 = {dz = 128},

  OLGHTB01 = {dz = 8},
  OLGHTB02 = {dz = 8},
  OLGHTB03 = {dz = 8},
  OLGHTB04 = {dz = 8},
  OLGHTB05 = {dz = 8},
  OLGHTB06 = {dz = 8, color = "violet"},
  OLGHTB07 = {dz = 8},
  OLGHTB08 = {dz = 8},

  OLGHTC01 = {dz = 128},
  OLGHTC02 = {dz = 64},
  OLGHTC03 = {dz = 128},
  OLGHTC04 = {dz = 64},
  OLGHTC05 = {dz = 128},
  OLGHTC06 = {dz = 64},
  OLGHTC07 = {dz = 128},
  OLGHTC08 = {dz = 64},
  --
  OLGHTC11 = {dz = 64},
  OLGHTC13 = {dz = 64},
  OLGHTC15 = {dz = 64},
  OLGHTC17 = {dz = 64},
  --
  OLGHTD01 = {dz = 64},
  OLGHTD02 = {dz = 32},
  OLGHTD03 = {dz = 64},
  OLGHTD04 = {dz = 32},
  OLGHTD05 = {dz = 64},
  OLGHTD06 = {dz = 32},
  --
  OLGHTF01 = {dz = 64},
  OLGHTF02 = {dz = 16},
  OLGHTF03 = {dz = 64},
  OLGHTF04 = {dz = 16},
  OLGHTF05 = {dz = 64},
  OLGHTF06 = {dz = 16},
  OLGHTF07 = {dz = 64},
  OLGHTF08 = {dz = 16},
  OLGHTF09 = {dz = 64},
  OLGHTF10 = {dz = 16},
  OLGHTF11 = {dz = 64},
  OLGHTF12 = {dz = 16},
  OLGHTG34 = {dz = 64},
  OLGHTG35 = {dz = 64},
  OLGHTG36 = {dz = 64},
  OLGHTG37 = {dz = 64},
  OLGHTG38 = {dz = 64},
  OLGHTG39 = {dz = 64},
  OLGHTG3A = {dz = 64},
  --
  OLGHTK01 = {dz = 8},
  OLGHTK02 = {dz = 8},
  OLGHTK03 = {dz = 8},
  OLGHTK04 = {dz = 8},
  OLGHTK05 = {dz = 8},
  OLGHTK06 = {dz = 8, color = "violet"},
  OLGHTK07 = {dz = 8},
  OLGHTK08 = {dz = 8},
  --
  OLGHTL01 = {dz = 16},
  OLGHTL02 = {dz = 16},
  OLGHTL03 = {dz = 16},
  OLGHTL04 = {dz = 16},
  OLGHTL05 = {dz = 16},
  OLGHTL06 = {dz = 16, color = "violet"},
  OLGHTL07 = {dz = 16},
  OLGHTL08 = {dz = 16},
  --
  OLGHTM11 = {dz = 8},
  OLGHTM12 = {dz = 8},
  OLGHTM21 = {dz = 8},
  OLGHTM22 = {dz = 8},
  OLGHTM29 = {dz = 8},
  OLGHTM31 = {dz = 8},
  OLGHTM32 = {dz = 8},
  OLGHTM39 = {dz = 8},
  OLGHTM41 = {dz = 8},
  OLGHTM42 = {dz = 8},
  OLGHTM49 = {dz = 8},
  OLGHTM51 = {dz = 8},
  OLGHTM52 = {dz = 8},
  OLGHTM59 = {dz = 8},
  OLGHTM61 = {dz = 8, color = "violet"},
  OLGHTM62 = {dz = 8, color = "violet"},
  OLGHTM69 = {dz = 8, color = "violet"},
  OLGHTM71 = {dz = 8},
  OLGHTM72 = {dz = 8},
  OLGHTM79 = {dz = 8},
  OLGHTM81 = {dz = 8},
  OLGHTM82 = {dz = 8},
  OLGHTM89 = {dz = 8},
  --
  OLGHTO01 = {dz = 64},
  OLGHTO02 = {dz = 64},
  OLGHTO03 = {dz = 64},
  OLGHTO04 = {dz = 64},
  OLGHTO05 = {dz = 64},
  OLGHTO11= {dz = 64},
  OLGHTO12 = {dz = 64},
  OLGHTO13 = {dz = 64},
  OLGHTO14 = {dz = 64},
  OLGHTO15 = {dz = 64},
  OLGHTP01 = {dz = 64},
  OLGHTP02 = {dz = 64},
  OLGHTP03 = {dz = 64},
  OLGHTP04 = {dz = 64},
  OLGHTP05 = {dz = 64},

  OLGHTQ01 = {dz = 128},
  OLGHTQ02 = {dz = 128},
  OLGHTQ03 = {dz = 128},
  OLGHTQ04 = {dz = 128},
  OLGHTQ05 = {dz = 128},
  OLGHTQ06 = {dz = 128, color = "violet"},
  OLGHTQ07 = {dz = 128},
  OLGHTQ08 = {dz = 128},
  --
  OLGHTQ11 = {dz = 64},
  OLGHTQ12 = {dz = 64},
  OLGHTQ13 = {dz = 64},
  OLGHTQ14 = {dz = 64},
  OLGHTQ15 = {dz = 64},
  OLGHTQ16 = {dz = 64, color = "violet"},
  OLGHTQ17 = {dz = 64},
  OLGHTQ18 = {dz = 64},

  OMETLC80 = {dz = 128},
  OMETLC81 = {dz = 128},
  OMETLC82 = {dz = 64},
  OMETLC83 = {dz = 64},

  OMETLD95 = {dz = 128},
  OMETLD96 = {dz = 128},
  OMETLD97 = {dz = 64},

  OMETLE95 = {dz = 128},
  OMETLE96 = {dz = 128},
  OMETLE97 = {dz = 64},

  OMETLF95 = {dz = 128},
  OMETLF96 = {dz = 128},
  OMETLF97 = {dz = 64},

  OMETLH91 = {dz = 128},
  OMETLH93 = {dz = 128},
  OMETLH97 = {dz = 128}
}

function OTEX_PROC_MODULE.setup(self)
  PARAM.OTEX_module_activated = true
  module_param_up(self)
  OTEX_PROC_MODULE.synthesize_procedural_themes()
end


function OTEX_PROC_MODULE.synthesize_procedural_themes()
  local resource_tab = {}

  local function otex_match_theme(comp_theme, base_theme)
    if comp_theme == "all" or base_theme == "all" then return true end
    if comp_theme == base_theme then return true end

    if comp_theme == "industrial" then
      if base_theme == "tech" then return true end
      if base_theme == "urban" then return true end
    end

    if comp_theme == "gothic" then
      if base_theme == "urban" then return true end
      if base_theme == "hell" then return true end
    end

    if comp_theme == "deimos" then
      if base_theme == "tech" then return true end
      if base_theme == "hell" then return true end
    end

    return false
  end

  local function tex_is_colorful(tex)
    if OTEX_LIMITED_SAMPLES[tex] then return true end

    if OTEX_LIMITED_SAMPLES_SUB[tex.sub(1,6)] then return true end

    return false
  end

  local function pick_texture_with_filter(tex_group, pick, mode, fallback_group)
    local tex
    local filtered_color_texes = {}
    local fallback_table = {}
    fallback_table = table.copy(fallback_group)

    tex = pick

    -- create table of colored textures to pick from
    for _,T in pairs(tex_group) do
      if mode == "match_color" then
        if T.sub(2,6) == tex.sub(2,6) then
          table.insert(filtered_color_texes, T)
        end
      else
        if T.sub(2,6) ~= tex.sub(2,6) then
          table.insert(filtered_color_texes, T)
        end
      end
    end

    for FG_tex,prob in pairs(fallback_table) do
      if tex_is_colorful(FG_tex) then
        fallback_table.FG_tex = 0
      end
    end

    if not table.empty(filtered_color_texes) then
      tex = rand.pick(filtered_color_texes)
    else
      tex = rand.key_by_probs(fallback_table)
    end

    return tex
  end

  local function pick_generic_flat(theme, floors)
    local tex_groups = {}
    local flat_themes = {}
    local tex_list = {}

    -- gather available themes
    for k,_ in pairs(OTEX_SANE_FLOORS) do
      if otex_match_theme(k, theme) then
        table.insert(flat_themes, k)
      end
    end

    -- gather groups
    for _,T in pairs(flat_themes) do
      for _,G in pairs(OTEX_SANE_FLOORS[T]) do
        table.insert(tex_groups, G)
      end
    end
    local group_pick = rand.pick(tex_groups)

    -- pick a texture from generic_floors based on group limit
    for tex, prob in pairs(floors) do
      if string.sub(tex,2,5) == group_pick then
        tex_list[tex] = prob
      end
    end

    assert(not table.empty(tex_list), "OTEX: No textures found for theme")

    return rand.key_by_probs(tex_list)
  end

  local function check_elem(t, v)
    for _,val in pairs(t) do
      if val == v then
        return true
      end
    end
    return false
  end

  resource_tab = table.copy(OTEX_RESOURCE_DB)
  table.name_up(resource_tab)

  -- create pick list
  local group_pick_list = {
    tech = {textures = {}, flats = {}},
    urban = {textures = {}, flats = {}},
    hell = {textures = {}, flats = {}},
    any = {textures = {}, flats = {}}
  }
  local av_themes = {"hell","urban","tech","any"}

  -- associate Doom themes with OTEX texture groups
  for group,_ in pairs(resource_tab) do
    for _,theme in pairs(av_themes) do

      -- do textures
      if OTEX_EXCLUSIONS[group] and OTEX_EXCLUSIONS[group] == "all" then
        -- do nothing
      else
        if OTEX_THEME_RESTRICTIONS then
          if OTEX_THEME_RESTRICTIONS[group]
          and check_elem(OTEX_THEME_RESTRICTIONS[group], theme) then
            -- do nothing
          else
            if resource_tab[group].has_textures == true
            and not OTEX_EXCLUSIONS[group] then
              local prob = table.size(resource_tab[group].textures)
              group_pick_list[theme].textures[group] = prob
            end

            if resource_tab[group].has_flats == true
            and not OTEX_EXCLUSIONS[group] then
              local prob = table.size(resource_tab[group].flats)
              group_pick_list[theme].flats[group] = prob
            end
          end
        else
          if resource_tab[group].has_textures == true
          and not OTEX_EXCLUSIONS[group] then
            local prob = table.size(resource_tab[group].textures)
            group_pick_list[theme].textures[group] = prob
          end

          if resource_tab[group].has_flats == true
          and not OTEX_EXCLUSIONS[group] then
            local prob = table.size(resource_tab[group].flats)
            group_pick_list[theme].flats[group] = prob
          end
      end

      end

    end
  end

  -- direct removals
  for _,RT in pairs(OTEX_DIRECT_REMOVALS) do
    for _,group in pairs(resource_tab) do
      table.kill_elem(group.textures, RT)
      table.kill_elem(group.flats, RT)
    end
  end

  -- special handling for floors without corresponding group textures
  local generic_floor_groups = {}
  for _,sane_floor_themes in pairs(OTEX_SANE_FLOORS) do
    for _,group in pairs(sane_floor_themes) do
      table.insert(generic_floor_groups, group)
    end
  end

  -- create a list of all ungrouped floors (generic floors)
  local generic_floors_list = {}
  for _,G in pairs(generic_floor_groups) do
    for _,T in pairs(resource_tab[G].flats) do
      local prob = table.size(resource_tab[G].flats)
      if OTEX_LIMITED_SAMPLES[T] then
        prob = math.floor(prob * 0.75)
      end
      generic_floors_list[T] = prob
    end
  end

  -- create a generic walls resource table for re-usable walls
  -- to be assigned to groupless flats
  local generic_walls_merge = {}
  local generic_walls_tab = {}
  table.merge_w_copy(generic_walls_merge, resource_tab["BASE"].textures)
  table.merge_w_copy(generic_walls_merge, resource_tab["STAR"].textures)
  table.merge_w_copy(generic_walls_merge, resource_tab["BKMT"].textures)
  table.merge_w_copy(generic_walls_merge, resource_tab["CONC"].textures)
  table.merge_w_copy(generic_walls_merge, resource_tab["IRON"].textures)
  table.merge_w_copy(generic_walls_merge, resource_tab["NDST"].textures)
  for _,T in pairs(generic_walls_merge) do
    generic_walls_tab[T] = 1
  end

  -- create material mappings
  for group_name,resource_group in pairs(resource_tab) do

    if resource_group.has_all then
      for _,T in pairs(resource_group.textures) do
        OTEX_MATERIALS[T]=
        {
          t=T,
          f=pick_texture_with_filter(resource_group.flats, T, "match_color", generic_floors_list)
        }
      end
      for _,F in pairs(resource_group.flats) do
        OTEX_MATERIALS[F]=
        {
          f=F,
          t=pick_texture_with_filter(resource_group.textures, F, "match_color", generic_walls_tab)
        }
      end
    end

    -- handling for groups that have textures but no flats, will use generic floors instead
    if resource_group.has_textures == true and
    resource_group.has_flats == false then
      for _,T in pairs(resource_group.textures) do
        OTEX_MATERIALS[T]=
        {
          t=T,
          f=rand.key_by_probs(generic_floors_list)
        }
      end
    end

    -- handling for groups with flats but no textures
    if resource_group.has_flats == true and
    resource_group.has_textures == false then
      for _,F in pairs(resource_group.flats) do
        local side_tex

        -- hack fix to assign flats-only groups a side texture rather than just a default
        ::pick_wall_for_lone_flats_again::
        side_tex = rand.key_by_probs(generic_walls_tab)
        if tex_is_colorful(side_tex) and rand.odds(75) then
          goto pick_wall_for_lone_flats_again
        end
        OTEX_MATERIALS[F] =
        {
          f=F,
          t=side_tex
        }
      end
    end
  end

  -- material group override for manual assignments
  for _,M in pairs(OTEX_MATERIAL_MANUAL_ASSIGNMENTS) do
    OTEX_MATERIALS[_]=
    {
      t=M.t,
      f=M.f
    }
  end

  -- resource_tab exclusions
  for k,v in pairs(OTEX_EXCLUSIONS) do
    if v == "textures" then
      resource_tab[k].textures = {}
      resource_tab[k].has_textures = false
      resource_tab[k].has_all = false
    elseif v == "flats" then
      resource_tab[k].flats = {}
      resource_tab[k].has_flats = false
      resource_tab[k].has_all = false
    else
      resource_tab[k] = {}
      resource_tab[k] = nil
    end
  end

  -- try to create a consistent theme
  local themes =
  {
    "tech","hell","urban"
  }
  for i = 1, PARAM.float_otex_num_themes * 0.75 do
    for _,T in pairs(themes) do
      local room_theme = {}
      local tab_pick, tex_pick, RT_name, tex_sub

      RT_name = T .. "_OTEX_cons_" .. i .. "_"
      room_theme =
      {
        env = "building",
        prob = rand.pick({40,50,60}) * PARAM.float_otex_rt_prob_mult,
        name = RT_name
      }
      room_theme.walls = {}
      room_theme.floors = {}
      room_theme.ceilings = {}

      -- pick walls

      tab_pick = rand.key_by_probs(group_pick_list[T].textures)
      for j = 1, 3 do
        ::pick_cons_wall_again::
        tex_pick = rand.pick(resource_tab[tab_pick].textures)
        assert(tex_pick)
        room_theme.walls[tex_pick] = 5

        -- try again if picked a very colorful texture
        tex_sub = tex_pick.sub(1,6)
        if OTEX_LIMITED_SAMPLES_SUB[tex_sub] and rand.odds(75) then goto pick_cons_wall_again end
      end
      RT_name = RT_name .. tex_pick .. "_"

      -- pick floors

      if rand.odds(25) or resource_tab[tab_pick].has_flats == false then
        tab_pick = rand.key_by_probs(group_pick_list[T].flats)
      end
      for j = 1, 3 do
        if rand.odds(66) then
          tex_pick = rand.pick(resource_tab[tab_pick].flats)
        else
          tex_pick = pick_generic_flat(T, generic_floors_list)
        end
        assert(tex_pick)
        room_theme.floors[tex_pick] = 5
      end
      RT_name = RT_name .. tex_pick .. "_"

      -- pick ceilings

      if rand.odds(25) or resource_tab[tab_pick].has_flats == false then
        tab_pick = rand.key_by_probs(group_pick_list[T].flats)
      end
      for j = 1, 3 do
        if rand.odds(66) then
          tex_pick = rand.pick(resource_tab[tab_pick].flats)
        else
          tex_pick = pick_generic_flat(T, generic_floors_list)
        end
        assert(tex_pick)
        room_theme.ceilings[tex_pick] = 5
      end
      RT_name = RT_name .. tex_pick

      room_theme.name = RT_name
      OTEX_ROOM_THEMES[RT_name] = room_theme
    end
  end

  -- try a completely random theme
  for i = 1, PARAM.float_otex_num_themes * 0.25 do
    local RT_name = "any_OTEX_random_" .. i .. "_"
    local room_theme, tab_pick = {}, {}
    local tex_pick
    local tex_sub

    room_theme =
    {
      env = "building",
      prob = rand.pick({40,50,60}),
    }
    room_theme.walls = {}
    room_theme.floors = {}
    room_theme.ceilings = {}

    -- pick walls

    tab_pick = rand.key_by_probs(group_pick_list["any"].textures)
    ::pick_rand_wall_again::
    tex_pick = rand.pick(resource_tab[tab_pick].textures)
    assert(tex_pick)
    room_theme.walls[tex_pick] = 5
    RT_name = RT_name .. tex_pick .. "_"

    if OTEX_LIMITED_SAMPLES_SUB[tex_sub] or rand.odds(75) then goto pick_rand_wall_again end

    -- pick floors
    tab_pick = rand.key_by_probs(group_pick_list["any"].flats)
    if rand.odds(66) then
      tex_pick = rand.pick(resource_tab[tab_pick].flats)
    else
      tex_pick = pick_generic_flat("any", generic_floors_list)
    end
    assert(tex_pick)
    room_theme.floors[tex_pick] = 5
    RT_name = RT_name .. tex_pick .. "_"

    -- pick ceilings
    tab_pick = rand.key_by_probs(group_pick_list["any"].flats)
    if rand.odds(66) then
      tex_pick = rand.pick(resource_tab[tab_pick].flats)
    else
      tex_pick = pick_generic_flat("any", generic_floors_list)
    end
    assert(tex_pick)
    room_theme.ceilings[tex_pick] = 5
    RT_name = RT_name .. tex_pick

    room_theme.name = RT_name
    OTEX_ROOM_THEMES[RT_name] = room_theme
  end

  -- insert into outdoor facades
  for theme,table_group in pairs(GAME.THEMES) do
    local tab_pick, tex_pick

    if GAME.THEMES[theme].facades then
      for i = 1, 50 do
        local pick_num
        pick_num = 0
        tex_pick = "none"

        tab_pick = rand.key_by_probs(group_pick_list[theme].textures)
        while not GAME.THEMES[theme].facades[tex_pick] and pick_num < 5 do
          tex_pick = rand.pick(resource_tab[tab_pick].textures)
          assert(tex_pick)
          GAME.THEMES[theme].facades[tex_pick] = rand.pick({15,20,25,30})
          pick_num = pick_num + 1
        end
      end
    end

  end

  -- insert some floors into outdoor generics

  for _,T in pairs(av_themes) do
    if T ~= "any" then
      for i = 1, 20 do
        local pick_tex = pick_generic_flat(T, generic_floors_list)
        GAME.ROOM_THEMES[T .. "_Outdoors_generic"].floors[pick_tex] = rand.pick({5,10,15})
        GAME.ROOM_THEMES[T .. "_Outdoors_generic"].porch_floors[pick_tex] = rand.pick({5,10,15})
      end
    end
  end

  -- create scenic fences
  local rail_tab = table.copy(OTEX_SPECIAL_RESOURCES.rail_materials)
  for rail_mat,_ in pairs(rail_tab) do
    GAME.MATERIALS[rail_mat]={t=_.t, rail_h=_.rail_h}
  end
  local scenic_fence_tab = table.copy(OTEX_SPECIAL_RESOURCES.rail_scenic_fences)
  for fence,prob in pairs(scenic_fence_tab.tech) do
    GAME.THEMES.tech.scenic_fences[fence] = math.floor(prob * 0.75)
    GAME.THEMES.urban.scenic_fences[fence] = math.floor(prob * 0.75)
  end
  for fence,prob in pairs(scenic_fence_tab.gothic) do
    GAME.THEMES.hell.scenic_fences[fence] = math.floor(prob * 0.75)
    GAME.THEMES.urban.scenic_fences[fence] = math.floor(prob * 0.75)
  end

  -- create liquid attachments
  if PARAM.bool_otex_liquids == 1 then

    local liquid_tab = table.copy(OTEX_SPECIAL_RESOURCES.liquid_materials)
    for liquid_mat,_ in pairs(liquid_tab) do
      GAME.MATERIALS[liquid_mat]={t=_.t, f=_.f}
    end

    table.deep_merge(GAME.MATERIALS, OTEX_SPECIAL_RESOURCES.liquid_materials, 2)

    local liquid_defs = table.copy(OTEX_SPECIAL_RESOURCES.liquid_defs)
    for liquid,_ in pairs(liquid_defs) do
      GAME.LIQUIDS[liquid]=liquid_defs[liquid]
    end
    local liquid_themes = table.copy(OTEX_SPECIAL_RESOURCES.liquid_themes)
    for theme,l_tab in pairs(liquid_themes) do
      for liquid,prob in pairs(l_tab) do
        GAME.THEMES[theme].liquids[liquid] = prob
      end
    end
  end

  -- create liquid sink defs
  OTEX_THEMES =
  {
    tech = {ceiling_sinks = {}},
    urban = {ceiling_sinks = {}},
    hell = {ceiling_sinks = {}},
  }
  for name,info in pairs(OTEX_SINK_BASES) do
    local sink_name = "light_" .. name

    GAME.SINKS[sink_name] =
    {
      mat = rand.pick({"_WALL","_FLOOR"}),
      dz = info.dz,
      light = 48,

      trim_mat = name,
      trim_dz = 0,
      trim_light = 24
    }

    OTEX_MATERIALS[name] =
    {
      t = name,
      f = pick_generic_flat("all", generic_floors_list)
    }

    if string.sub(name,2,5) == "LGHT" then
      local prob = 4
      if info.color == "violet" then
        prob = 3
      end
      OTEX_THEMES.tech.ceiling_sinks[sink_name] = prob
      OTEX_THEMES.urban.ceiling_sinks[sink_name] = prob
      OTEX_THEMES.hell.ceiling_sinks[sink_name] = prob
    else
      local prob = 16
      OTEX_THEMES.tech.ceiling_sinks[sink_name] = prob
      OTEX_THEMES.urban.ceiling_sinks[sink_name] = prob
      OTEX_THEMES.hell.ceiling_sinks[sink_name] = prob
    end
  end

end


function OTEX_PROC_MODULE.get_levels_after_themes()
  table.deep_merge(GAME.MATERIALS, OTEX_MATERIALS, 2)
  table.deep_merge(GAME.ROOM_THEMES, OTEX_ROOM_THEMES, 2)
  table.deep_merge(GAME.THEMES, OTEX_THEMES, 3)
end


function OTEX_PROC_MODULE.all_done()
  GAME.RESOURCES.GLOWING_FLATS_GLDEFS = string.gsub(
    GAME.RESOURCES.GLOWING_FLATS_GLDEFS,
    "GLOWFLTS",
    OTEX_GLOWING_FLATS
  )
end

----------------------------------------------------------------

OB_MODULES["otex_proc_module"] =
{

  name = "otex_proc_module",

  label = _("OTEX Resource Pack"),

  where = "other",
  priority = 75,

  port = "zdoom",

  game = "doomish",

  hooks =
  {
    setup = OTEX_PROC_MODULE.setup,
    get_levels_after_themes = OTEX_PROC_MODULE.get_levels_after_themes,
    all_done = OTEX_PROC_MODULE.all_done
  },

  tooltip = _("If enabled, generates room themes using OTEX based on a resource table. "..
  "OTEX WAD (not pk3 version) must be manually loaded in the sourceport.\n\n" ..
  "Tries to use all textures and flats as much as possible organized into room themes."),

  options =
  {
    {
      name="float_otex_num_themes",
      label=_("Room Themes Count"),
      valuator = "slider",
      min = 2,
      max = 40,
      increment = 2,
      default = 8,
      tooltip = _("How many OTEX room themes to synthesize."),
      longtip = _("Not all room themes may show up in levels as appearance " ..
      "is reliant on use probability. Use multipler below to increase " ..
      "or decrease further"),
      priority = 1
    },
    {
      name="float_otex_rt_prob_mult",
      label=_("Probability Multiplier"),
      valuator="slider",
      units="x",
      min = 0,
      max = 20,
      increment = 0.1,
      default = 1,
      tooltip = _("Multiplier for all synthesized OTEX room themes."),
      priority = 2
    },
    {
      name="bool_otex_liquids",
      label=_("Enable OTEX Liquids"),
      valuator = "button",
      default = 1,
      tooltip = _("Whether to include OTEX liquids in generated levels or not"),
      priority = 3
    }
  }
}
