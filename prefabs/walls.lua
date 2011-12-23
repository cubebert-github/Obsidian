----------------------------------------------------------------
--  WALL PREFABS
----------------------------------------------------------------
--
--  Oblige Level Maker
--
--  Copyright (C) 2010 Andrew Apted
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
----------------------------------------------------------------

PREFAB.WALL =
{
  fitted = "xy"

  brushes =
  {
    {
      { x =   0, y =  0, mat = "?facade" }
      { x = 192, y =  0, mat = "?wall" }
      { x = 192, y = 16, mat = "?wall" }
      { x =   0, y = 16, mat = "?wall" }
    }
  }
}


PREFAB.SKY_FENCE =
{
  fitted = "xy"

  brushes =
  {
    {
      { x =   0, y =  0, mat = "_SKY" }
      { x = 192, y =  0, mat = "_SKY" }
      { x = 192, y = 16, mat = "_SKY" }
      { x =   0, y = 16, mat = "_SKY" }
      { b = 80, delta_z=-16, mat = "_SKY" }
    }

    {
      { x =   0, y =  0, mat = "?wall" }
      { x = 192, y =  0, mat = "?wall" }
      { x = 192, y = 16, mat = "?wall" }
      { x =   0, y = 16, mat = "?wall" }
      { t = 64, mat = "?wall" }
    }
  }
}


PREFAB.PICTURE =
{
  fitted = "xy"

  x_ranges = { {64,1}, {64,0,"?width"}, {64,1} }
  y_ranges = { {8,1}, {8,0} }
  z_ranges = { {32,0}, {64,0,"?height"} }

  defaults =
  {
    width  = 64
    height = 64

    side = "?wall"

    special = 0
    x_offset = 0
    y_offset = 0
    peg = 0
  }

  brushes =
  {
    -- wall behind picture
    {
      { x =   0, y =  0, mat = "?wall" }
      { x = 192, y =  0, mat = "?wall" }
      { x = 192, y =  4, mat = "?wall" }
      { x =   0, y =  4, mat = "?wall" }

      { b = 0 }  --<<  FIXME: hack
    }

    -- picture itself
    {
      { x =  64, y =  4 }
      { x = 128, y =  4 }
      { x = 128, y =  8, mat = "?pic", peg="?peg", x_offset="?x_offset", y_offset="?y_offset", special="?special" }
      { x =  64, y =  8 }
      { b = 32 }
      { t = 96 }
    }

    -- right side wall
    {
      { x = 0, y =  4, mat = "?wall" }
      { x = 8, y =  4, mat = "?wall" }
      { x = 8, y = 16, mat = "?wall" }
      { x = 0, y = 16, mat = "?wall" }
    }

    {
      { x =  8, y =  4, mat = "?wall" }
      { x = 64, y =  4, mat = "?side" }
      { x = 64, y = 16, mat = "?wall" }
      { x =  8, y = 16, mat = "?side" }
    }

    -- left side wall
    {
      { x = 184, y =  4, mat = "?wall" }
      { x = 192, y =  4, mat = "?wall" }
      { x = 192, y = 16, mat = "?wall" }
      { x = 184, y = 16, mat = "?wall" }
    }

    {
      { x = 128, y =  4, mat = "?wall" }
      { x = 184, y =  4, mat = "?side" }
      { x = 184, y = 16, mat = "?wall" }
      { x = 128, y = 16, mat = "?side" }
    }

    -- frame bottom
    {
      { x =  64, y =  4, mat = "?wall" }
      { x = 128, y =  4, mat = "?wall" }
      { x = 128, y = 16, mat = "?wall", blocked=1 }
      { x =  64, y = 16, mat = "?wall" }
      { t = 32, mat = "?floor" }
    }

    -- frame top
    {
      { x =  64, y =  4, mat = "?wall" }
      { x = 128, y =  4, mat = "?wall" }
      { x = 128, y = 16, mat = "?wall", blocked=1 }
      { x =  64, y = 16, mat = "?wall" }
      { b = 96, mat = "?floor", light = "?light"  }
    }
  }
}



PREFAB.WALL_SPIKE_SHOOTER =
{
  fitted = "xy"

  x_ranges = { {16,1}, {96,0}, {16,1} }
  y_ranges = { {16,1}, {24,0} }

  repeat_width = 128

  defaults =
  {
    spike_group = "spikey"
  }

  brushes =
  {
    -- wall behind it
    {
      { x =   0, y =  0, mat = "?wall" }
      { x = 128, y =  0, mat = "?wall" }
      { x = 128, y = 16, mat = "?wall" }
      { x =   0, y = 16, mat = "?wall" }
    }

    -- space in front of it
    {
      -- FIXME: bbox brush
      { x =   0, y =  16, mat = "?floor" }
      { x = 128, y =  16, mat = "?floor" }
      { x = 128, y = 112, mat = "?floor" }
      { x =   0, y = 112, mat = "?floor" }
      { t = 0, mat = "?floor" }
    }

    -- the shooter
    {
      { x =  40, y = 16, mat = "?metal" }
      { x =  60, y = 16, mat = "?metal" }
      { x =  60, y = 40, mat = "?metal" }
      { b = 32, mat = "?metal" }
      { t = 56, mat = "?metal" }
    }

    {
      { x =  68, y = 16, mat = "?metal" }
      { x =  88, y = 16, mat = "?metal" }
      { x =  68, y = 40, mat = "?metal" }
      { b = 32, mat = "?metal" }
      { t = 56, mat = "?metal" }
    }

    {
      { x =  60, y = 16, mat = "?metal" }
      { x =  68, y = 16, mat = "?metal" }
      { x =  68, y = 40, mat = "?metal" }
      { x =  60, y = 40, mat = "?metal" }
      { b = 32, mat = "?metal" }
      { t = 36, mat = "?metal" }
    }

    {
      { x =  60, y = 16, mat = "?metal" }
      { x =  68, y = 16, mat = "?metal" }
      { x =  68, y = 40, mat = "?metal" }
      { x =  60, y = 40, mat = "?metal" }
      { b = 52, mat = "?metal" }
      { t = 56, mat = "?metal" }
    }
  }

  models =
  {
    -- the trigger
    {
      x1 =  16, x2 = 112, x_face = { mat="TRIGGER" }
      y1 =  16, y2 = 480, y_face = { mat="TRIGGER" }
      z1 =   0, z2 =  80, z_face = { mat="TRIGGER" }

      entity =
      {
        ent = "trigger", target = "?spike_group",
      }
    }
  }

  entities =
  {
    { x = 64, y = 20, z = 20, ent = "spiker", angle = 90, targetname="?spike_group" }
  }
}


