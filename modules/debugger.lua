------------------------------------------------------------------------
--  MODULE: Debug Statement Control
------------------------------------------------------------------------
--
--  Copyright (C) 2019-2022 MsrSgtShooterPerson
--
--  This program is free software; you can redistribute it and/or
--  modify it under the terms of the GNU General Public License
--  as published by the Free Software Foundation; either version 2,
--  of the License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
-------------------------------------------------------------------

DEBUG_CONTROL = { }

DEBUG_CONTROL.MISSING_MAT_CHOICES =
{
  "ignore",  _("Ignore"),
  "warn",  _("Warn"),
  "abort", _("Abort"),
}

DEBUG_CONTROL.TITLE_SCREEN_CHOICES =
{
  "titlegen",  _("Default"),
  "filename",  _("Filename"),
  "randomwords", _("Random Word List"),
}

DEBUG_CONTROL.GROWTH_STEP_CHOICES =
{
  "showmore", _("Show All Steps"),
  "show",     _("Show Successful Steps Only"),
  "no",       _("No"),
}

DEBUG_CONTROL.LIVEMAP_CHOICES =
{
  "livemap_step", _("Per Step (Very Slow)"),
  "livemap_room", _("Per Room (Slightly Slow)"),
  "livemap_none", _("No Live Minimap"),
}

function DEBUG_CONTROL.setup(self)

  module_param_up(self)

end

function DEBUG_CONTROL.get_levels()
  if PARAM.custom_error_texture and PARAM.bool_custom_error_texture == 1 then
    GAME.MATERIALS._ERROR.t = "ZZWOLF7"
  end
end

function DEBUG_CONTROL.all_done()
  --[[if PARAM.attach_debug_info and PARAM.bool_attach_debug_info == 1 then
    local log_text = {}

    gui.wad_add_text_lump("OBLOGS", log_text)
  end]]

  if PARAM.custom_error_texture and PARAM.bool_custom_error_texture == 1 then
    gui.wad_merge_sections("games/doom/data/error_wall.wad")
  end
end

----------------------------------------------------------------

OB_MODULES["debugger"] =
{

  name = "debugger",

  label = _("Miscellaneous Options"),

  where = "other",
  priority = 5,

  tooltip = _("Provides options for printing out more verbose log information. Unusual or experimental features can also be found here."),

  hooks =
  {
    setup = DEBUG_CONTROL.setup,
    get_levels = DEBUG_CONTROL.get_levels
  },

  options =
  {

    {
      name = "title_screen_source",
      label=_("Title Screen Source"),
      choices=DEBUG_CONTROL.TITLE_SCREEN_CHOICES,
      default = "titlegen",
      tooltip = _("Choose how the WAD title is determined"),
      longtip = _("Default: Will use Obsidian's regular naming tables.\n\nFilename: Will use the filename provided for the WAD (minus file extension).\n\nRandom Word List: Will randomly pick from the internal random word list.\n\nNOTE: Only EN locale characters are supported at this time, other languages may result in a blank title!"),
      priority=107,
    },

    {
      name = "bool_sub_titles",
      label=_("Disable Sub-Titles"),
      valuator = "button",
      default = 0,
      tooltip = _("Disable sub-titles on the Title Screen."),
      priority=106,
    },

    {
      name = "float_name_generator_mode",
      label=_("Name Generator Setting"),
      valuator = "slider",
      units = _("% of Levels Use Whole Names"),
      min = 0,
      max = 100,
      increment = 1,
      default = 33,
      tooltip = _("Choose between whole names or pattern-based names only for levels."),
      longtip = _("Choose between whole names or pattern-based names only for levels.\n\n" ..
      "Whole names are full single strings e.g. boss maps.\n\n" ..
      "Pattern names are generative and based on replacement formats e.g. 'Sludge Generator E-710' from '[adjective] + [noun] + [hash_number]\n\n" ..
      "Default functionality obeys the probabilities set in names.lua\n\n" ..
      "WAD sub titles and Boss maps will continue to use whole level names as they do not have pattern definitions."),
      priority=101,
      },


    {
      name = "bool_shape_rule_stats",
      label = _("Shape Rule Stats"),
      valuator = "button",
      default = 0,
      tooltip = _("Displays usage statistics for shape grammar rules."),
      priority=95,
    },
    

    {
      name = "bool_save_svg",
      label = _("Save Map Previews"),
      valuator = "button",
      default = 0,
      tooltip = _("Saves SVG format images of generated map thumbnails."),
      priority=94,
      gap = 1,
    },

    {
      name="live_minimap",
      label=_("Live Growth Minimap"),
      choices=DEBUG_CONTROL.LIVEMAP_CHOICES,
      default="livemap_none",
      tooltip= _("Controls the granularity of steps shown on the GUI minimap as a level is built."),
      longtip= _("Higher levels of detail will increase the amount of time that it takes to generate a WAD."),
      gap = 1
    },

  },
}

OB_MODULES["material_debugger"] =
{

  name = "material_debugger",

  label = _("Material Options"),

  where = "debug",
  priority = 5,

  tooltip = _("Debugging options related to textures and flats"),

  hooks =
  {
    setup = DEBUG_CONTROL.setup,
  },

  options =
  {
    {
      name = "bool_print_fab_materials",
      label=_("Print Fab Materials"),
      valuator = "button",
      default = 0,
      tooltip = _("Print list of textures/flats present in each fab"),
      longtip = _("Print the names of all textures/flats preset in a prefab WAD. This will also list values like _FLOOR, _WALL, etc, prior to their conversion."),
      priority=104,
    },

    {
      name = "missing_material_behavior",
      label=_("Missing Fab Material Behavior"),
      choices=DEBUG_CONTROL.MISSING_MAT_CHOICES,
      default = "ignore",
      tooltip = _("Choose what to do when encountering a missing material"),
      longtip = _("Provides the following options if a material definition isn't present in a game's MATERIALS table: \n\nIgnore: Silently continue; missing materials are usually replaced by an _ERROR or _DEFAULT texture.\n\nWarn: Continue, but write the name of the fab and the missing material to the logfile.\n\nAbort: Throw an error and halt generation, with an error message explaining which fab and material are causing the issue. Will also write this information to the logfile."),
      priority=103,
    },

    {
      name = "bool_non_vanilla_as_missing",
      label=_("Check For Non-Vanilla Materials"),
      valuator = "button",
      default = 0,
      tooltip = _("Choose what to do when encountering a non-vanilla material"),
      longtip = _("If checked, will compare all flats/textures used against a list of vanilla materials for that IWAD, and treat non-vanilla materials as missing for the purposes of logging and throwing errors."),
      priority=102,
    },

    {
      name = "bool_custom_error_texture",
      label = _("Custom Error Texture"),
      valuator = "button",
      default = 0,
      tooltip = _("Replaces Obsidian's default texture with a high visibility version for easier detection of broken level geometry or missing textures."),
      priority = 101,
    },
  },
}

OB_MODULES["pickup_params"] =
{

  name = "pickup_params",

  label = _("Pickup Options"),

  where = "experimental",
  priority = 5,

  tooltip = _("Experimental options related to pickups (items, weapons, etc)"),

  hooks =
  {
    setup = DEBUG_CONTROL.setup,
  },

  options =
  {
    {
      name = "bool_scale_items_with_map_size",
      label=_("Alternate Item Quantities"),
      valuator = "button",
      default = 0,
      tooltip = _("Scales item distribution with map size"),
      priority=105,
    },
  },
}

OB_MODULES["arch_exp"] =
{

  name = "arch_exp",

  label = _("Architecture Experimentals"),

  where = "experimental",
  priority = 5,

  tooltip = _("Features related to likely radical level architecture and content curation changes."),

  hooks =
  {
    setup = DEBUG_CONTROL.setup,
  },

  options =
  {
    {
      name = "float_ungroup_fabs",
      label = _("Ungroup Some Fabs"),
      valuator = "slider",
      min = 0,
      max = 100,
      increment = 10,
      default = 10,
      tooltip = _("Takes decor and picture fabs and allows them to spawn randomly around levels."),
      priority = 105
    },

    {
      name = "float_grower_tries",
      label = _("Shape Grower Tries"),
      valuator = "slider",
      min = 5,
      max = 100,
      increment = 5,
      default = 20,
      tooltip = _("Changes the amount of shape grower tests per growth step. Default is 20. Higher values mean shapes can fit more snuggly, for longer generation time."),
      priority = 104
    },

    {
      name = "bool_auto_shape_rule_prob",
      label = _("Automatic Shape Rule Probs"),
      valuator = "button",
      default = 0,
      tooltip = _("Shape rules be automatically applied probabilities, overriding manual assignment. May cause some rarer shape rules to have a better statistical chance to show up compared to manually assigned probs. Or not. Who knows."),
      priority = 103
    },

    {
      name = "bool_fail_on_track",
      label = _("Fail on Tracked Bugs"),
      valuator = "button",
      default = 0,
      tooltip = _("If checked, parts of the generator with expected bugs will return an error instead of proceeding without issue. Unless you are actively planning to participate in active bug tracking, it is preferred to just keep this off."),
      priority = 1
    }
  },
}
