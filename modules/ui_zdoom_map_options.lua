------------------------------------------------------------------------
--  PANEL: ZDoom Map Options
------------------------------------------------------------------------
--
--  Copyright (C) 2021 Dashodanger
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
------------------------------------------------------------------------

UI_ZDOOM_MAP_OPTIONS = { }

UI_ZDOOM_MAP_OPTIONS.YES_NO =
{
  "yes", _("Yes"),
  "no",  _("No"),
}

UI_ZDOOM_MAP_OPTIONS.MAP_FORMAT_CHOICES = 
{
  "binary",  _("Binary"),
  "udmf", _("UDMF"),
}

OB_MODULES["ui_zdoom_map_options"] =
{
  label = _("Map Build Options"),
  
  engine = { zdoom=1, gzdoom=1 },

  side = "left",
  priority = 105,

  options =
  {
    {
      name = "build_nodes",
      label = _("Build Nodes"),
      choices = UI_ZDOOM_MAP_OPTIONS.YES_NO,
      default = "yes",
      tooltip = "For ZDoom based engines, choose to either build nodes or allow the engine itself to do so " ..
      "upon loading the map. No effect on other engines.",
    },
    {
      name = "map_format",
      label = _("Map Format"),
      choices = UI_ZDOOM_MAP_OPTIONS.MAP_FORMAT_CHOICES,
      default = "binary",
      tooltip = "For ZDoom based engines, choose between UDMF and binary map format. No effect on other engines.",
      gap = 1
    }
  }
}