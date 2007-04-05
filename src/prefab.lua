----------------------------------------------------------------
-- PREFAB definitions
----------------------------------------------------------------
--
--  Oblige Level Maker (C) 2006,2007 Andrew Apted
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
--
--  Thanks to Derek "Dittohead" Braun who originally made
--  some of these Prefabs.
--
----------------------------------------------------------------


PREFABS =
{

-- Note: texture names (like STARTAN3) are never used here.
-- Instead the names here (like "frame") are looked-up in a
-- SKIN table.  This allows the same prefab to be used with
-- different textures (which are game-dependent).

------ Arches ------------------------------------

ARCH =
{
  structure =
  {
    "##aaaaaaaa##",
    "##aaaaaaaa##",
    "##aaaaaaaa##",
    "##aaaaaaaa##",
  },

  elements =
  {
    a = { f_h=0, c_rel="door_top", c_h=0, },
  },
},

ARCH_EDGE =
{
  copy="ARCH",

  mirror=true,

  structure =
  {
    "#aaa",
    "#aaa",
    "#aaa",
    "#aaa",
  },
},

ARCH_NARROW =
{
  copy="ARCH",

  structure =
  {
    "#aaaaaa#",
    "#aaaaaa#",
    "#aaaaaa#",
    "#aaaaaa#",
  },
},

ARCH_ARCHED =
{
  structure =
  {
    "##cbaaaabc##",
    "##cbaaaabc##",
    "##cbaaaabc##",
    "##cbaaaabc##",
  },

  elements =
  {
    a = { f_h=0, c_rel="door_top", c_h=0, },

    b = { copy="a", c_h=-16 },
    c = { copy="a", c_h=-32 },
  },
},

ARCH_TRUSS =
{
  structure =
  {
    "##BaaaaaaB##",
    "##CaaaaaaC##",
    "##CaaaaaaC##",
    "##BaaaaaaB##",
  },

  elements =
  {
    a = { f_h=0, c_rel="door_top", c_h=0, },

    B = { f_rel="door_top", f_h=0, c_rel="door_top", c_h=0,
          l_tex="beam_w",  f_tex="beam_c",
        },

    C = { f_h=0, c_rel="door_top", c_h=-8,
          u_tex="beam_w",  c_tex="beam_c", u_peg="top",
        }
  },
},

ARCH_RUSSIAN =
{
  structure =
  {
    "##aaaaaaaa##",
    "##BssssssB##",
    "##BssssssB##",
    "##aaaaaaaa##",
  },

  elements =
  {
    a = { f_h=0, c_rel="door_top", c_h=16, },

    s = { f_h=0, c_rel="door_top", c_h=0,
          u_tex="beam_w", c_tex="beam_c", u_peg="top"
        },

    B = { solid="beam_w" },
  },
},

ARCH_BEAMS =
{
  copy="ARCH_RUSSIAN",

  structure =
  {
    "#aaaaaaaaaa#",
    "#aaaaaaaaaa#",
    "#aBaaaaaaBa#",
    "#aaaaaaaaaa#",
  },
},

ARCH_BEAM_WIDE =
{
  copy="ARCH_BEAMS",

  structure =
  {
    "##aaaaaaaaaaaa##",
    "##aBBaaaaaaBBa##",
    "##aBBaaaaaaBBa##",
    "##aaaaaaaaaaaa##",
  },
},

ARCH_CURVY =
{
  structure =
  {
    "##aaaaaaaa##",
    "#RaaaaaaaaS#",
    "#TaaaaaaaaU#",
    "##aaaaaaaa##",
  },

  elements =
  {
    a = { f_h=0, c_rel="door_top", c_h=0, },

    R = { solid="wall", [9]={ dx= 16,dy=0 }, [3]={ dx= 20,dy=0 } },
    S = { solid="wall", [7]={ dx=-16,dy=0 }, [1]={ dx=-20,dy=0 } },

    T = { solid="wall", [3]={ dx= 16,dy=0 } },
    U = { solid="wall", [1]={ dx=-16,dy=0 } },
  },
},


------ Windows ------------------------------------

WINDOW_NARROW =
{
  structure =
  {
    "#ww#",
    "#ww#",
    "#ww#",
    "#ww#",
  },

  elements =
  {
    w = { f_h=0, f_rel="low_h", c_h=0, c_rel="high_h" },
  }
},

WINDOW_EDGE =
{
  mirror=true,

  structure =
  {
    "#www",
    "#www",
    "#www",
    "#www",
  },

  elements =
  {
    w = { f_h=0, f_rel="low_h", c_h=0, c_rel="high_h" },
  }
},

WINDOW_EDGE_ARCHED =
{
  mirror=true,

  structure =
  {
    "#abw",
    "#abw",
    "#abw",
    "#abw",
  },

  elements =
  {
    w = { f_h=0, f_rel="low_h", c_h=0, c_rel="high_h" },

    a = { copy="w", f_h=12, c_h=-12 },
    b = { copy="w", f_h=24, c_h=-24 },
  }
},

WINDOW_CROSS =
{
  structure =
  {
    "#aawwaa#",
    "#aawwaa#",
    "#aawwaa#",
    "#aawwaa#",
  },

  elements =
  {
    w = { f_h=0, f_rel="low_h", c_h=0, c_rel="high_h" },

    a = { f_h=-16, f_rel="mid_h", c_h=16, c_rel="mid_h" },
  }
},

WINDOW_CROSS_BIG =
{
  copy="WINDOW_CROSS",

  structure =
  {
    "#aaaawwaaaa#",
    "#aaaawwaaaa#",
    "#aaaawwaaaa#",
    "#aaaawwaaaa#",
  },
},

WINDOW_BARRED =
{
  structure =
  {
    "#wwwwwwwww##",
    "#wBwwwBwww##",
    "#wwwBwwwBw##",
    "#wwwwwwwww##",
  },

  elements =
  {
    w = { f_h=0, f_rel="low_h", c_h=0, c_rel="high_h" },

    B = { solid="bar_w" },
  }
},

WINDOW_RAIL =
{
  structure =
  {
    "#wwwwwwwwww#",
    "#wwwwwwwwww#",
    "#RRRRRRRRRR#",
    "#wwwwwwwwww#",
  },

  elements =
  {
    w = { f_h=0, f_rel="low_h", c_h=0, c_rel="high_h" },

    R = { copy="w", [8] = { rail="rail_w", impassible=true } },
  }
},



------ Doors ------------------------------------

DOOR =
{
  structure =
  {
    "#LssssssssM#",
    "#TddddddddT#",
    "#TddddddddT#",
    "#LssssssssM#",
  },

  elements =
  {
    -- steps
    s = { f_h=8, c_rel="door_top", c_h=8,
          f_tex="frame_f", c_tex="frame_c", l_tex="step_w",
          l_peg="top", light=224
        },

    -- door
    d = { copy="s", c_rel="floor_h", c_h=8, u_tex="door_w", c_tex = "door_c",
          kind="door_kind", tag="tag", u_peg="bottom", l_peg="bottom"
        },

    -- track
    T = { solid="track_w", l_peg="bottom" },

    -- lights
    L = { solid="wall", [6]={ l_tex="lite_w", l_peg="bottom" }},
    M = { solid="wall", [4]={ l_tex="lite_w", l_peg="bottom" }},
  },
},

DOOR_NARROW =
{
  copy="DOOR",

  structure =
  {
    "#LssssM#",
    "#tddddt#",
    "#tddddt#",
    "#LssssM#",
  },
},

DOOR_LOCKED =
{
  structure =
  {
    "KKssssssssKK",
    "KTddddddddTK",
    "KTddddddddTK",
    "KKssssssssKK",
  },

  elements =
  {
    -- steps
    s = { f_h=8, c_rel="door_top", c_h=8,
          f_tex="frame_f", c_tex="frame_c", l_tex="step_w",
          l_peg="top", light=224
        },

    -- door
    d = { copy="s", c_rel="floor_h", c_h=8, u_tex="door_w", c_tex = "door_c",
          kind="door_kind", tag="tag", u_peg="bottom", l_peg="bottom"
        },

    -- track
    T = { solid="track_w", l_peg="bottom" },

    -- key
    K = { solid="key_w" },
  },
},

BARS_1 =
{
  structure =
  {
    "##ssssssss##",
    "##sBBssBBs##",
    "##sBBssBBs##",
    "##ssssssss##",
  },

  elements =
  {
    -- step
    s = { c_rel="door_top", c_h=0 },

    -- bars
    B = { f_rel="door_top", f_h=0, f_tex="bar_f",
          c_rel="door_top", c_h=0, c_tex="bar_f",
          u_tex="bar_w", u_peg="bottom",
          l_tex="bar_w", l_peg="bottom",

          kind="door_kind", tag="tag",
        },
  },
},

BARS_2 =
{
  copy="BARS_1",

  structure =
  {
    "##sssssssss#",
    "##sssssssss#",
    "##sBsBsBsBs#",
    "##sssssssss#",
  },
},

BARS_NARROW =
{
  copy="BARS_1",

  structure =
  {
    "#ssssss#",
    "#ssBBss#",
    "#ssBBss#",
    "#ssssss#",
  },
},


------ Exit Stuff ------------------------------------

EXIT_DOOR =
{
  structure =
  {
    "##ssss##",
    "#MssssL#",
    "#TddddT#",
    "#LssssM#",
  },

  elements =
  {
    -- steps
    s = { f_h=8, c_rel="door_top", c_h=8,
          f_tex="frame_f", c_tex="frame_c", l_tex="step_w",
          l_peg="top", light=224
        },

    -- door
    d = { copy="s", c_rel="floor_h", c_h=8, u_tex="door_w", c_tex = "door_c",
          kind="door_kind", tag="tag", u_peg="bottom", l_peg="bottom"
        },

    -- sign
    X = { copy="s", u_tex="exit_w", c_rel="door_top", c_h=-8,
          c_tex="exit_c", u_peg="top",
          [4] = { x_offset=32 }, [6] = { x_offset=32 },
        },

    -- front sign
    F = { solid="front_w", l_peg="bottom" },

    -- track
    T = { solid="track_w", l_peg="bottom" },

    -- light
    L = { solid="wall", l_peg="bottom",
          [4] = { l_tex="door_w", x_offset=72 },
          [6] = { l_tex="door_w", x_offset=72 }
        },

    M = { solid="wall", l_peg="bottom",
          [4] = { l_tex="door_w", x_offset=88 },
          [6] = { l_tex="door_w", x_offset=88 }
        },
  },
},

EXIT_DOOR_WIDE =
{
  copy="EXIT_DOOR",

  structure =
  {
    "FFFFssssFFFF",
    "###MssssL###",
    "###TddddT###",
    "###LssssM###",
  },
},

EXIT_DOOR_W_SIGN =
{
  copy="EXIT_DOOR",

  structure =
  {
    "##ssss##",
    "##sXXs##",
    "##ssss##",
    "#MssssL#",
    "#TddddT#",
    "#LssssM#",
    "##sXXs##",
    "##ssss##",
  },
},

EXIT_SIGN_CEIL =
{
  region="ceil",
  environment="indoor",
  height_range={ 80,160 },

  structure =
  {
    "....",
    "....",
    ".XX.",
    "....",
  },

  elements =
  {
    -- sign
    X = { c_h=-16, u_tex="exit_w", c_tex="exit_c", u_peg="top",
          [4] = { x_offset=32 }, [6] = { x_offset=32 },
        },
  },
},

EXIT_SIGN_FLOOR =
{
  region="floor",

  structure =
  {
    "....",
    "....",
    ".XX.",
    "....",
  },

  elements =
  {
    -- sign
    X = { f_h=16, l_tex="exit_w", f_tex="exit_c", l_peg="top",
          [4] = { x_offset=32 }, [6] = { x_offset=32 },
        },
  },
},

EXIT_HOLE_ROUND =
{
  add_mode="island",

  structure =
  {
    "............",
    "............",
    "............",
    "............",
    "....jihg....",
    "....kzzf....",
    "....mzze....",
    "....abcd....",
    "............",
    "............",
    "............",
    "............",
  },

  elements =
  {
    z = { f_tex="hole_f", f_h=-16, },

    a = { copy="z",
          [1] = { dx=-12, dy=-12 }, [7] = { dx=-24, dy=-8 },
          [2] = { x_offset=336 }, [4] = { x_offset=313 },
        },
    b = { copy="z",
          [1] = { dx=-8, dy=-24 },
          [2] = { x_offset=359 },
        },
    c = { copy="z",
          [1] = { dx=  0, dy=-29 },
          [2] = { x_offset=  0 },
        },

    d = { copy="z",
          [3] = { dx=12, dy=-12 }, [1] = { dx=8, dy=-24 },
          [6] = { x_offset= 48 }, [2] = { x_offset= 25 },
        },
    e = { copy="z",
          [3] = { dx=24, dy=-8 },
          [6] = { x_offset= 71 },
        },
    f = { copy="z",
          [3] = { dx=29, dy= 0 },
          [6] = { x_offset= 96 },
        },

    g = { copy="z",
          [9] = { dx=12, dy=12 }, [3] = { dx=24, dy=8 },
          [8] = { x_offset=144 }, [6] = { x_offset=121 },
        },
    h = { copy="z",
          [9] = { dx=8, dy=24 },
          [8] = { x_offset=167 },
        },
    i = { copy="z",
          [9] = { dx= 0, dy=29 },
          [8] = { x_offset=192 },
        },

    j = { copy="z",
          [7] = { dx=-12, dy=12 }, [9] = { dx=-8, dy=24 },
          [4] = { x_offset=240 }, [8] = { x_offset=217 },
        },
    k = { copy="z",
          [7] = { dx=-24, dy=8 },
          [4] = { x_offset=263 },
        },
    m = { copy="z",
          [7] = { dx=-29, dy= 0 },
          [4] = { x_offset=288 },
        },
  },
},

EXIT_DEATHMATCH =
{
  structure =
  {
    "############",
    "##iiWWWWii##",
    "##iiiiiiii##",
    "##iiiiiiii##",
    "##iiiiiiii##",
    "##iiiiiiii##",
    "##iiiiiiii##",
    "##iiiiiiii##",
    "##iiiiiiii##",
    "####ssss####",
    "###TddddT###",
    "FFFFssssFFFF",
  },

  elements =
  {
    -- inside area
    i = { f_h=0, c_rel="floor_h", c_h=80, },

    -- step
    s = { f_h=8, c_rel="door_top_h", c_h=8,
          f_tex="frame_f", c_tex="frame_c", l_tex="step_w",
          l_peg="top", light=224
        },

    -- front sign
    F = { solid="front_w", l_peg="bottom" },

    -- door
    d = { copy="s", c_rel="floor_h", c_h=8,
          u_tex="door_w", c_tex="door_c",
          u_peg="bottom", l_peg="bottom",
          kind="door_kind", tag="tag",
        },

    -- track
    T = { solid="track_w", l_peg="bottom" },

    -- switch
    W = { copy="i", f_h=72, f_tex="switch_f",
          l_tex="side_w", l_peg="top",

          [2] = { l_tex="switch_w", l_peg="top", y_offset="switch_yo",
                  kind="switch_kind", tag="tag" },
        },
  },
},


------ Switches ------------------------------------

SWITCH_PILLAR =
{
  scale=64,
  add_mode="island",
  height_range={ 128,384 },

  structure =
  {
    "P"
  },

  elements =
  {
    P = { solid="wall",

          [2] = { l_tex="switch_w", l_peg="bottom", kind="kind", tag="tag" }
        },
  },
},

SWITCH_FLOOR =
{
  region="floor",
  height_range={ 96,999 },

  structure =
  {
    "....",
    "ssss",
    "....",
    "....",
  },

  elements =
  {
    s = { f_rel="switch_h", f_h=0,
          l_tex="side_w", f_tex="switch_f", l_peg="top",

          [2] = { l_tex="switch_w", l_peg="top", kind="kind", tag="tag",
                  y_offset="y_offset" }
        },

    -- beam
    B = { f_rel="switch_h", f_h=12,
          l_tex="beam_w", f_tex="beam_f", l_peg="top"
        },
  },
},

SWITCH_FLOOR_BEAM =
{
  copy="SWITCH_FLOOR",

  structure =
  {
    "........",
    ".BssssB.",
    "........",
    "........",
  },
},

SWITCH_FLOOR_TINY =
{
  region="floor",
  height_range={ 64,512 },

  structure =
  {
    "....",
    ".ss.",
    "....",
    "....",
  },

  elements =
  {
    s = { f_rel="switch_h", f_h=0,
          l_tex="side_w", f_tex="switch_f", l_peg="top",

          [2] = { l_tex="switch_w", l_peg="top", kind="kind", tag="tag",
                  x_offset="x_offset", y_offset="y_offset" }
        },
  },
},

SWITCH_CEIL =
{
  height_range={ 80,160 },
  
  structure =
  {
    "bbbb",
    "ssss",
    "bbbb",
    "....",
  },

  elements =
  {
    s = { c_rel="floor_h", c_h=40,
          c_tex="side_w", c_tex="switch_f", l_peg="top",

          [2] = { u_tex="switch_w", u_peg="top", kind="kind", tag="tag",
                  y_offset="y_offset" }
        },

    -- beam coming down from ceiling
    b = { c_rel="switch_h", c_h=40, c_tex="beam_c",
          u_tex="beam_w", u_peg="bottom",
        }
  },
},

SWITCH_NICHE =
{
  add_mode="wall",

  structure =
  {
    "########",
    "########",
    "##ssss##",
    "#LnnnnL#",
  },

  elements =
  {
    -- niche
    n = { f_h=0, c_rel="switch_h", c_h=0, c_tex="frame_c",
          light=192 },

    -- switch
    s = { solid="switch_w", l_peg="top",
          [2] = { kind="kind", tag="tag", y_offset="y_offset" }
        },

    -- light
    L = { solid="wall", light=192,
          [4] = { l_tex="light_w" },
          [6] = { l_tex="light_w" },
        },
  },
},

SWITCH_NICHE_TINY =
{
  add_mode="wall",

  structure =
  {
    "####",
    "#ss#",
    "LnnM",
    "LnnM",
  },

  elements =
  {
    -- niche
    n = { f_h=32, c_rel="switch_h", c_h=32,
          f_tex="frame_f", c_tex="frame_c", },

    -- switch
    s = { solid="switch_w", l_peg="top",
          [2] = { kind="kind", tag="tag",
                  x_offset="x_offset", y_offset="y_offset" }
        },

    -- sides
    L = { solid="wall", [6] = { l_tex="side_w" } },
    M = { solid="wall", [4] = { l_tex="side_w" } },
  },
},


------ Wall Stuff ------------------------------------

WALL_LAMP_NARROW =
{
  structure =
  {
    "####",
    "#ii#",
    "#ii#",
    "#ii#",
  },

  elements =
  {
    i = { f_rel="low_h", f_h=0, c_rel="high_h", c_h=0,
          light=224
        },
  },

  things =
  {
    { kind="lamp_t", x = 32, y = 24 },
  },
},

WALL_LAMP =
{
  structure =
  {
    "########",
    "##iiii##",
    "##iiii##",
    "##iiii##",
  },

  elements =
  {
    i = { f_rel="low_h", f_h=0, c_rel="high_h", c_h=0,
          light=224
        },
  },

  things =
  {
    { kind="lamp_t", x = 64, y = 24 },
  },
},

WALL_PIC =
{
  height_range={ 160,999 },

  structure =
  {
    "############",
    "##pppppppp##",
    "#LiiiiiiiiL#",
    "#LiiiiiiiiL#",
  },

  elements =
  {
    i = { f_rel="low_h", f_h=0, c_rel="low_h", c_h=128,
          light=192,
        },

    p = { solid="pic_w" },

    L = { solid="wall",
          [4] = { l_tex="lite_w" }, 
          [6] = { l_tex="lite_w" }, 
        },
  },
},

WALL_PIC_TWO_SIDED =
{
  copy="WALL_PIC",

  structure =
  {
    "#LiiiiiiiiL#",
    "##pppppppp##",
    "##pppppppp##",
    "#LiiiiiiiiL#",
  },
},

WALL_PIC_FOUR_SIDED =
{
  add_mode="island",
  height_range={ 192,999 },

  structure =
  {
    "#LiiiiiiiiL#",
    "MppppppppppM",
    "ippppppppppi",
    "ippppppppppi",
    "ippppppppppi",
    "ippppppppppi",
    "ippppppppppi",
    "ippppppppppi",
    "ippppppppppi",
    "ippppppppppi",
    "MppppppppppM",
    "#LiiiiiiiiL#",
  },

  elements =
  {
    i = { f_rel="high_h", f_h=-128, c_rel="high_h", c_h=0,
          light=192,
        },

    p = { solid="pic_w" },

    L = { solid="wall", [4] = { l_tex="lite_w" }, [6] = { l_tex="lite_w" }}, 
    M = { solid="wall", [2] = { l_tex="lite_w" }, [8] = { l_tex="lite_w" }}, 
  },
},


------ Decorative I ------------------------------------

TECH_PICKUP_SMALL =
{
  add_mode="island",
  environment="indoor",
  height_range={ 160,256 },

  structure =
  {
    "####aaaaaaaa####",
    "####bbbbbbbb####",
    "##LLccccccccLL##",
    "##L#dddddddd#L##",
    "abcdeeeeeeeedcba",
    "abcdeeeeeeeedcba",
    "abcdeeeeeeeedcba",
    "abcdeeeeeeeedcba",
    "abcdeeeeeeeedcba",
    "abcdeeeeeeeedcba",
    "abcdeeeeeeeedcba",
    "abcdeeeeeeeedcba",
    "##L#dddddddd#L##",
    "##LLccccccccLL##",
    "####bbbbbbbb####",
    "####aaaaaaaa####",
  },

  elements =
  {
    -- steps
    a = { l_tex="step_w", light=128, c_h=-48, l_peg="top" },

    b = { copy="a", f_h= -8, c_h=-56 },
    c = { copy="a", f_h=-16, c_h=-64, light=192 },
    d = { copy="a", f_h=-24, c_h=-56 },

    e = { copy="a", f_h=-32, c_h=0, light=160, f_tex="carpet_f", c_tex="sky_c" },

    -- light
    L = { solid="lite_w" },
  },

  pickup_pos = { x=128, y=128 }
},

TECH_PICKUP_LARGE =
{
  copy="TECH_PICKUP_SMALL",

  height_range={ 192,320 },

  structure =
  {
    "####aaaaaaaaaaaa####",
    "####bbbbbbbbbbbb####",
    "##LLccccccccccccLL##",
    "##L#dddddddddddd#L##",
    "abcdeeeeeeeeeeeedcba",
    "abcdeeeeeeeeeeeedcba",
    "abcdeeeeeeeeeeeedcba",
    "abcdeeeeeeeeeeeedcba",
    "abcdeeeeeeeeeeeedcba",
    "abcdeeeeeeeeeeeedcba",
    "abcdeeeeeeeeeeeedcba",
    "abcdeeeeeeeeeeeedcba",
    "abcdeeeeeeeeeeeedcba",
    "abcdeeeeeeeeeeeedcba",
    "abcdeeeeeeeeeeeedcba",
    "abcdeeeeeeeeeeeedcba",
    "##L#dddddddddddd#L##",
    "##LLccccccccccccLL##",
    "####bbbbbbbbbbbb####",
    "####aaaaaaaaaaaa####",
  },

  pickup_pos = { x=192, y=192 }
},


STATUE_TECH_1 =
{
  environment="indoor",
  height_range={ 176,248 },

  structure =
  {
    "....................",
    "....................",
    "..aaaaaaaaaaaaaaaa..",
    "..aaaaaaaaaaaaaaaa..",
    "..aabbbbccccbbbbaa..",
    "..aabbbbccccbbbbaa..",
    "..aabbbbccccbbbbaa..",
    "..aabbbbccccbbbbaa..",
    "..aaffffggggffffaa..",
    "..aaffffggggffffaa..",
    "..aaffffggggffffaa..",
    "..aaffffggggffffaa..",
    "..aabbbbccccbbbbaa..",
    "..aabbbbccccbbbbaa..",
    "..aabbbbccccbbbbaa..",
    "..aabbbbccccbbbbaa..",
    "..aaaaaaaaaaaaaaaa..",
    "..aaaaaaaaaaaaaaaa..",
    "....................",
    "....................",
  },

  elements =
  {
    a = { f_h=8, c_rel="floor_h", c_h=256,
          l_tex="step_w", l_peg="top"
        },

    b = { f_h=16, c_rel="floor_h", c_h=192,
          l_tex="step_w", f_tex="carpet_f",
          u_tex="span_w", c_tex="lite_c",
          light=192
        },

    c = { f_h=64, c_rel="floor_h", c_h=256,
          f_tex="comp_f", l_tex="comp_w",
        },

    f = { copy="c", f_h=128, l_tex="comp2_w", x_offset=128 },

    g = { copy="c", f_h=192, l_tex="wall" },
  },

  things =
  {
    { kind="lamp_t", x = 96, y = 96 },
    { kind="lamp_t", x =224, y = 96 },
    { kind="lamp_t", x = 96, y =224 },
    { kind="lamp_t", x =224, y =224 },
  },
},

STATUE_CHAIR_DUDE =
{
  region="floor",
  height_range={ 136,999 },

  structure =
  {
    "........",
    ".b....b.",
    ".bbbbbb.",
    "SSSHHSSS",
    ".aBBBBa.",
    ".aLccLa.",
    "..L..L..",
    "..F..F..",
  },

  elements =
  {
    -- chair seat, back, armrest
    c = { f_h=24, f_tex="chair_f", l_tex="chair_w" },
    b = { copy="c", f_h=96 },
    a = { copy="c", f_h=48 },

    -- body, head, shoulders
    B = { f_h=56, f_tex="body_f", l_tex="body_w" },
    H = { copy="B", f_h=108 },
    S = { copy="B", f_h=72 },

    -- legs, feet
    L = { copy="B", f_h=32 },
    F = { copy="B", f_h=12 },
  },
},

DRINKS_BAR =
{
  region="floor",
  height_range={ 64,512 },

  structure =
  {
    "............",
    "bbbbbbbbbbbb",
    "bbbbbbbbbbbb",
    "............",
  },

  elements =
  {
    b = { f_h=32, f_tex="bar_f", l_tex="bar_w", l_peg="top" },
  },

  things =
  {
    { kind="drink_t", x= 16, y=32 },
    { kind="drink_t", x= 36, y=32 },
    { kind="drink_t", x= 56, y=32 },
    { kind="drink_t", x= 76, y=32 },
    { kind="drink_t", x= 96, y=32 },
    { kind="drink_t", x=116, y=32 },
    { kind="drink_t", x=136, y=32 },
    { kind="drink_t", x=156, y=32 },
    { kind="drink_t", x=176, y=32 },
  },
},

GROUND_LIGHT =
{
  region="floor",
  environment="outdoor",
  height_range={ 96,999 },

  structure =
  {
    "aaaaaaa.",
    "abbbbba.",
    "abcccba.",
    "abcdcba.",
    "abcccba.",
    "abbbbba.",
    "aaaaaaa.",
    "........",
  },

  elements =
  {
    a = { f_h=0 },

    b = { f_h=8, l_tex="shawn_w", f_tex="shawn_f", l_peg="top", },

    c = { copy="b", f_h=40, light=192 },

    d = { f_h=64, l_tex="lite_w", f_tex="lite_f", light=200 },
  },
},


------ Skylights ------------------------------------

MEGA_SKYLIGHT_1 =
{
  region="ceil",
  add_mode="island",
  environment="indoor",
  height_range={ 96,304 },

  structure =
  {
    "ffffffffffffffffffff",
    "ffffffffffffffffffff",
    "ffssBBBBBBBBBBBBssff",
    "ffssBBBBBBBBBBBBssff",
    "ffssssCCssssCCssssff",
    "ffssssCCssssCCssssff",
    "ffssssCCssssCCssssff",
    "ffssssCCssssCCssssff",
    "ffssssCCssssCCssssff",
    "ffssssCCssssCCssssff",
    "ffssssCCssssCCssssff",
    "ffssssCCssssCCssssff",
    "ffssBBBBBBBBBBBBssff",
    "ffssBBBBBBBBBBBBssff",
    "ffffffffffffffffffff",
    "ffffffffffffffffffff",
  },

  elements =
  {
    s = { c_h=12, c_tex="sky_c", light=192 },

    f = { c_h=-20, c_tex="frame_c", u_tex="frame_w" },

    B = { c_h=-4, c_tex="beam_c", u_tex="beam_w" },

    C = { copy="B", c_h=4 },
  },
},

MEGA_SKYLIGHT_2 =
{
  copy="MEGA_SKYLIGHT_1",

  structure =
  {
    "ffffffffffffffff",
    "ffffffffffffffff",
    "ffsBssBssBssBsff",
    "ffsBssBssBssBsff",
    "ffsBssBssBssBsff",
    "ffBBBBBBBBBBBBff",
    "ffsBssBssBssBsff",
    "ffsBssBssBssBsff",
    "ffsBssBssBssBsff",
    "ffsBssBssBssBsff",
    "ffBBBBBBBBBBBBff",
    "ffsBssBssBssBsff",
    "ffsBssBssBssBsff",
    "ffsBssBssBssBsff",
    "ffffffffffffffff",
    "ffffffffffffffff",
  },
},

MEGA_SKYLIGHT_3 =
{
  copy="MEGA_SKYLIGHT_1",

  structure =
  {
    "ffffffffffffffff",
    "ffffffffffffffff",
    "ffssBssBBssBssff",
    "ffssBssBBssBssff",
    "ffBBBBBBBBBBBBff",
    "ffssBssBBssBssff",
    "ffssBssssssBssff",
    "ffBBBBssssBBBBff",
    "ffBBBBssssBBBBff",
    "ffssBssssssBssff",
    "ffssBssBBssBssff",
    "ffBBBBBBBBBBBBff",
    "ffssBssBBssBssff",
    "ffssBssBBssBssff",
    "ffffffffffffffff",
    "ffffffffffffffff",
  },
},


------ Decorative II ------------------------------------

BILLBOARD =
{
  region="floor",
  add_mode="wall",
  environment="outdoor",
  height_range={ 160,999 },

  structure =
  {
    "................",
    ".DCCssssssssCCE.",
    ".CCppppppppppCC.",
    ".CCCssssssssCCC.",
  },

  elements =
  {
    -- corner
    C = { f_h=0, f_rel="corn_h",
          l_tex="corner", f_tex="corn_f", l_peg="top", },

    D = { copy="C", [7] = { dx= 8, dy=-8 } },
    E = { copy="C", [9] = { dx=-8, dy=-8 } },

    -- pic
    p = { f_h=8, f_rel="pic_h",
          l_tex="pic_back", [2] = { l_tex="pic_w" },
          f_tex="pic_f", l_peg="top",
        },

    -- step
    s = { f_h=8, l_tex="step_w", f_tex="step_f", l_peg="top" },
  }
},

BILLBOARD_LIT =
{
  region="floor",
  add_mode="wall",
  environment="outdoor",
  height_range={ 160,999 },

  structure =
  {
    "................",
    ".CCC........DDD.",
    ".CLEppppppppELD.",
    ".CtEssssssssEtD.",
  },

  elements =
  {
    -- corner
    E = { f_h=0, f_rel="corn_h",
          l_tex="corn2", f_tex="corn_f", l_peg="top", },

    C = { copy="E",
          [4] = { l_tex="corner" },
          [8] = { l_tex="corner" },
        },

    D = { copy="E",
          [6] = { l_tex="corner" },
          [8] = { l_tex="corner" },
        },

    -- light
    L = { copy="E", [2] = { l_tex="lite_w" }, },

    -- pic
    p = { f_h=8, f_rel="pic_h",
          l_tex="pic_back", [2] = { l_tex="pic_w" },
          f_tex="pic_f", l_peg="top",
        },

    -- step
    s = { f_h=8, l_tex="step_w", f_tex="step_f", l_peg="top" },

    t = { copy="s", f_h=16, light=208 },
  },
},

BILLBOARD_ON_STILTS =
{
  environment="outdoor",
  height_range={ 144,999 },

  structure =
  {
    "............",
    ".C........C.",
    ".BppppppppB.",
    "............",
  },

  elements =
  {
    -- picture
    p = { mark = 1,
          [8] = { rail="pic_w", l_peg="bottom",
                  x_offset=8, y_offset="y_offset" },
        },

    -- beams
    B = { f_rel="pic_bottom", f_h=140,
          l_tex="beam_w", f_tex="beam_f", l_peg="top",
        },

    C = { copy="B",
          [1] = { dx=-8, dy=0 },
          [3] = { dx= 8, dy=0 },
        },
  },
},

BILLBOARD_STILTS_HUGE =
{
  add_mode="island",
  environment="outdoor",
  height_range={ 144,999 },

  structure =
  {
    ".C........C.",
    ".BppppppppB.",
    ".s.......s..",
    ".s.......s..",
    ".s.......s..",
    ".s.......s..",
    ".s.......s..",
    ".s.......s..",
    ".s.......s..",
    ".s.......s..",
    ".BqqqqqqqqB.",
    ".D........D.",
  },

  elements =
  {
    -- picture
    p = { mark = 1,
          [8] = { rail="pic_w", l_peg="bottom",
                  x_offset=8, y_offset="y_offset" },
        },

    q = { mark = 2,
          [2] = { rail="pic_w", l_peg="bottom",
                  x_offset=8, y_offset="y_offset" },
        },

    s = { mark = 3,
          [6] = { rail="pic_w", l_peg="bottom",
                  x_offset=0, y_offset="y_offset" },
        },

    -- beams
    B = { f_rel="pic_bottom", f_h=140,
          l_tex="beam_w", f_tex="beam_f", l_peg="top",
        },

    C = { copy="B",
          [1] = { dx=-8, dy=0 },
          [3] = { dx= 8, dy=0 },
        },

    D = { copy="B",
          [7] = { dx=-8, dy=0 },
          [9] = { dx= 8, dy=0 },
        },
  },
},


------ Crates ------------------------------------

CRATE =
{
  scale=64,
  region="floor",

  structure =
  {
    "c"
  },

  elements =
  {
    c = { f_rel="crate_h", f_h=0,
          f_tex="crate_f", l_tex="crate_w", l_peg="top" },
  },
},

CRATE_LONG =
{
  copy="CRATE",

  structure =
  {
    "cc",
  },
},

CRATE_BIG =
{
  copy="CRATE",

  structure =
  {
    "cc",
    "cc",
  },
},

CRATE_TWO_SIDED =
{
  copy="CRATE",

  elements =
  {
    c = { f_rel="crate_h", f_h=0,
          f_tex="crate_f", l_tex="crate_w", l_peg="top",
          [4] = { l_tex="crate2", x_offset=64 },
          [6] = { l_tex="crate2", x_offset=64 },
        },
  },
},

CRATE_ROTATE_NARROW =
{
  structure =
  {
    "....",
    "....",
    ".c..",
    "....",
  },

  elements =
  {
    c = { f_rel="crate_h", f_h=0,
          f_tex="crate_f", l_tex="crate_w", l_peg="top",

          [1] = { dx=-14, dy= 16 },
          [3] = { dx= 0,  dy=-14 },
          [7] = { dx= 16, dy= 30 },
          [9] = { dx= 30, dy= 0 },

          [2] = { x_offset=10 }, [4] = { x_offset=10 },
          [6] = { x_offset=10 }, [8] = { x_offset=10 },
        },
  },
},

CRATE_ROTATE =
{
  structure =
  {
    "........",
    "........",
    "........",
    "........",
    "...c....",
    "........",
    "........",
    "........",
  },

  elements =
  {
    c = { f_rel="crate_h", f_h=0,
          f_tex="crate_f", l_tex="crate_w", l_peg="top",

          [1] = { dx=-29, dy= 16 },
          [3] = { dx= 0,  dy=-29 },
          [7] = { dx= 16, dy= 45 },
          [9] = { dx= 45, dy= 0 },
        },
  },
},

CRATE_TRIPLE =
{
  add_mode="island",
  height_range={ 144,999 },

  structure =
  {
    "aaaacccc",
    "aaaacccc",
    "aaaacccc",
    "aaaaccdd",
    "bbbfee..",
    "bbbfee..",
    "bbbb....",
    "bbbb....",
  },

  elements =
  {
    a = { f_h=128, f_tex="crate_f1", l_tex="crate_w1", l_peg="top" },
    b = { f_h=64,  f_tex="crate_f2", l_tex="crate_w2", l_peg="top" },
    c = { f_h=64,  f_tex="crate_f3", l_tex="crate_w3", l_peg="top" },

    e = { f_h=32,  f_tex="small_f",  l_tex="small_w",  l_peg="top" },

    d = { copy="c", [2] = { x_offset=32 }},
    f = { copy="b", [6] = { x_offset=32 }},
  },
},

CRATE_JUMBLE =
{
  scale=64,
  add_mode="island",
  height_range={ 224,999 },

  structure =
  {
    ".Cd..",
    "BCTWX",
    "BTB.d",
    "eWe..",
    ".X...",
  },

  elements =
  {
    T = { f_h=192, f_tex="tall_f", l_tex="tall_w", l_peg="top" },
    W = { f_h=128, f_tex="wide_f", l_tex="wide_w", l_peg="top", [6] = { x_offset=64 } },
    X = { copy="W", [2] = { x_offset=64 }, [4] = { x_offset=64 }, [6] = {} },

    B = { f_h=128, f_tex="crate_f1", l_tex="crate_w1", l_peg="top" },
    C = { f_h=128, f_tex="crate_f2", l_tex="crate_w2", l_peg="top" },

    d = { f_h=64,  f_tex="crate_f1", l_tex="crate_w1", l_peg="top" },
    e = { f_h=64,  f_tex="crate_f2", l_tex="crate_w2", l_peg="top" },
  },
},


------ Cages ------------------------------------

CAGE_PILLAR =
{
  scale=64,
  add_mode="island",
  height_range={ 160,999 },

  structure = { "c" },

  elements =
  {
    c = { f_rel="cage_base_h", f_h=0, f_tex="cage_f", l_tex="cage_w",
          c_rel="cage_top_h",  c_h=0, c_tex="cage_c", u_tex="cage_w",
          u_peg="bottom", l_peg="bottom",

          [2] = { rail="rail_w", impassible=true },
          [4] = { rail="rail_w", impassible=true },
          [6] = { rail="rail_w", impassible=true },
          [8] = { rail="rail_w", impassible=true },
        },
  },
},

CAGE_SMALL =
{
  scale=64,
  add_mode="island",
  height_range={ 144,999 },

  structure = { "c" },

  elements =
  {
    c = { f_rel="cage_base_h", f_h=0,
          f_tex="cage_f", l_tex="cage_w", l_peg="bottom",

          [2] = { rail="rail_w", impassible=true },
          [4] = { rail="rail_w", impassible=true },
          [6] = { rail="rail_w", impassible=true },
          [8] = { rail="rail_w", impassible=true },
        },
  },
},

CAGE_MEDIUM =
{
  copy="CAGE_SMALL",

  structure =
  {
    "cc",
    "cc",
  },
},

CAGE_LARGE =
{
  copy="CAGE_SMALL",

  structure =
  {
    "ccc",
    "ccc",
    "ccc",
  },
},

CAGE_LARGE_W_LIQUID =
{
  scale=64,
  add_mode="island",
  height_range={ 256,999 },

  structure =
  {
    "MNNNO",
    "PLaLQ",
    "PcedQ",
    "PLbLQ",
    "STTTU",
  },

  elements =
  {
    -- liquid
    L = { f_h=-56, f_tex="liquid_f" },

    N = { copy="L", [8] = { rail="rail_w", impassible=true } },
    P = { copy="L", [4] = { rail="rail_w", impassible=true } },
    Q = { copy="L", [6] = { rail="rail_w", impassible=true } },
    T = { copy="L", [2] = { rail="rail_w", impassible=true } },

    M = { [2] = { rail="rail_w", impassible=true },
          [6] = { rail="rail_w", impassible=true },
          [3] = { VDEL=true }
        },
    O = { [2] = { rail="rail_w", impassible=true },
          [4] = { rail="rail_w", impassible=true },
          [1] = { VDEL=true }
        },
    S = { [8] = { rail="rail_w", impassible=true },
          [6] = { rail="rail_w", impassible=true },
          [9] = { VDEL=true }
        },
    U = { [8] = { rail="rail_w", impassible=true },
          [4] = { rail="rail_w", impassible=true },
          [7] = { VDEL=true }
        },

    -- pillar
    e = { f_h=168, f_tex="cage_f", l_tex="cage_w", l_peg="top" },

    a = { copy="e", f_h=104, [8] = { l_tex="cage_sign_w" },
          [7] = { dx=0,dy=-32 }, [9] = { dx=0,dy=-32 } },

    b = { copy="e", f_h=104, [2] = { l_tex="cage_sign_w" },
          [1] = { dx=0,dy= 32 }, [3] = { dx=0,dy= 32 } },

    c = { copy="e", f_h=104, [4] = { l_tex="cage_sign_w" },
          [1] = { dx= 32,dy=0 }, [7] = { dx= 32,dy=0 } },

    d = { copy="e", f_h=104, [6] = { l_tex="cage_sign_w" },
          [3] = { dx=-32,dy=0 }, [9] = { dx=-32,dy=0 } },
  },
},

CAGE_MEDIUM_W_LIQUID =
{
  scale=64,
  add_mode="island",
  height_range={ 160,999 },

  structure =
  {
    "MNNO",
    "PeeQ",
    "PeeQ",
    "STTU",
  },

  elements =
  {
    -- liquid
    L = { f_h=-32, f_tex="liquid_f" },

    N = { copy="L", [8] = { rail="rail_w", impassible=true } },
    P = { copy="L", [4] = { rail="rail_w", impassible=true } },
    Q = { copy="L", [6] = { rail="rail_w", impassible=true } },
    T = { copy="L", [2] = { rail="rail_w", impassible=true } },

    M = { copy="P", [8] = { rail="rail_w", impassible=true } },
    O = { copy="Q", [8] = { rail="rail_w", impassible=true } },
    S = { copy="P", [2] = { rail="rail_w", impassible=true } },
    U = { copy="Q", [2] = { rail="rail_w", impassible=true } },

    -- central pillar
    e = { f_h=96, f_tex="cage_f", l_tex="cage_w", l_peg="top" },
  },
},


------ Corners ------------------------------------

CORNER_BEAM =
{
  add_mode="corner",

  structure =
  {
    "BB..",
    "BB..",
    "....",
    "....",
  },

  elements =
  {
    B = { solid="beam_w" }
  },
},

CORNER_LIGHT =
{
  add_mode="corner",
  environment="indoor",

  structure =
  {
    "BBB.",
    "BLs.",
    "Bss.",
    "....",
  },

  elements =
  {
    B = { solid="beam_w"  },
    L = { solid="lite_w" },

    s = { f_h=16, c_h=-16, l_tex="beam_w", u_tex="beam_w",
          f_tex="beam_f", c_tex="beam_f",
          light=192
        }
  },
},

CORNER_DIAGONAL =
{
  add_mode="corner",

  structure =
  {
    "AAA.",
    "AAA.",
    "AAA.",
    "....",
  },

  elements =
  {
--# A = { solid="wall", [3] = {VDEL=true}, [9] = {VDEL=true} },
    A = { solid="wall", [3] = {VDEL=true} },
  },
},

CORNER_DIAG_BIG =
{
  copy="CORNER_DIAGONAL",

  structure =
  {
    "AAAAAAA.",
    "AAAAAAA.",
    "AAAAAAA.",
    "AAAAAAA.",
    "AAAAAAA.",
    "AAAAAAA.",
    "AAAAAAA.",
    "........",
  },
},

CORNER_DIAG_30DEG =
{
  copy="CORNER_DIAGONAL",

  structure =
  {
    "AAAAAAA.",
    "AAAAAAA.",
    "AAAAAAA.",
    "........",
  },
},

CORNER_CONCAVE =
{
  add_mode="corner",

  structure =
  {
    "##B.",
    "##B.",
    "AA..",
    "....",
  },

  elements =
  {
    A = { solid="wall", [3]={ dx=-27, dy=16 }, [9]={ dx=-16, dy=16 },
          [2] = { x_offset=0 }, [6] = { x_offset=17 },
        },

    B = { solid="wall", [3] = { dx=-16, dy=27 },
          [2] = { x_offset=36 }, [6] = { x_offset=55 },
        },
  },
},

CORNER_CONCAVE_BIG =
{
  add_mode="corner",

  structure =
  {
    "####BB..",
    "####BB..",
    "####BB..",
    "####BB..",
    "AAAA....",
    "AAAA....",
    "........",
    "........",
  },

  elements =
  {
    A = { solid="wall", [3]={ dx=-54, dy=32 }, [9]={ dx=-32, dy=32 },
          [2] = { x_offset=0 }, [6] = { x_offset=34 },
        },

    B = { solid="wall", [3] = { dx=-32, dy=54 },
          [2] = { x_offset=72 }, [6] = { x_offset=110 },
        },
  },
},

CORNER_CONVEX =
{
  add_mode="corner",

  structure =
  {
    "##B.",
    "##B.",
    "AA..",
    "....",
  },

  elements =
  {
    A = { solid="wall", [3] = { dx=-16, dy=5 },
          [2] = { x_offset=0 }, [6] = { x_offset=17 },
        },

    B = { solid="wall", [3] = { dx=-5, dy=16 },
          [2] = { x_offset=36 }, [6] = { x_offset=55 },
        },
  },
},


------ Pillars ------------------------------------

PILLAR_LIGHT1 =
{
  add_mode="island",
  environment="indoor",

  structure =
  {
    "BsB.",
    "sLs.",
    "BsB.",
    "....",
  },

  elements =
  {
    B = { solid="beam_w"  },
    L = { solid="lite_w" },

    s = { f_h=16, c_h=-16, l_tex="beam_w", u_tex="beam_w",
          f_tex="beam_f", c_tex="beam_f",
          light=192
        }
  },
},

PILLAR_LIGHT2 =
{
  copy="PILLAR_LIGHT1",

  structure =
  {
    "BssB",
    "sLLs",
    "sLLs",
    "BssB",
  },
},

PILLAR_LIGHT3 =
{
  add_mode="island",
  environment="indoor",

  structure =
  {
    "pppp",
    "pLLp",
    "pLLp",
    "pppp",
  },

  elements =
  {
    L = { solid="lite_w" },

    p = { f_h=48, c_h=-48, light=192, }
  },
},

PILLAR_ROUND_SMALL =
{
  add_mode="island",

  structure =
  {
    "....",
    ".ab.",
    ".cd.",
    "....",
  },

  elements =
  {
    a = { solid="wall", [7] = { dx=-6, dy= 6 }, [9] = { dx= 0, dy=14 },
          [8] = { x_offset= 96 }, [4] = { x_offset=120 },
        },
    b = { solid="wall", [9] = { dx= 6, dy= 6 }, [3] = { dx=14, dy= 0 },
          [6] = { x_offset= 48 }, [8] = { x_offset= 72 },
        },
    c = { solid="wall", [7] = { dx=-14,dy= 0 }, [1] = { dx=-6, dy=-6 },
          [4] = { x_offset=144 }, [2] = { x_offset=168 },
        },
    d = { solid="wall", [1] = { dx= 0, dy=-14}, [3] = { dx= 6, dy=-6 },
          [2] = { x_offset=  0 }, [6] = { x_offset= 24 },
        },
  },
},

PILLAR_ROUND_MEDIUM =
{
  add_mode="island",

  structure =
  {
    "........",
    "........",
    "..jihg..",
    "..k##f..",
    "..m##e..",
    "..abcd..",
    "........",
    "........",
  },

  elements =
  {
    a = { solid="wall",
          [1] = { dx=-12, dy=-12 }, [7] = { dx=-24, dy=-8 },
          [2] = { x_offset=336 }, [4] = { x_offset=313 },
        },
    b = { solid="wall",
          [1] = { dx=-8, dy=-24 },
          [2] = { x_offset=359 },
        },
    c = { solid="wall",
          [1] = { dx=  0, dy=-29 },
          [2] = { x_offset=  0 },
        },

    d = { solid="wall",
          [3] = { dx=12, dy=-12 }, [1] = { dx=8, dy=-24 },
          [6] = { x_offset= 48 }, [2] = { x_offset= 25 },
        },
    e = { solid="wall",
          [3] = { dx=24, dy=-8 },
          [6] = { x_offset= 71 },
        },
    f = { solid="wall",
          [3] = { dx=29, dy= 0 },
          [6] = { x_offset= 96 },
        },

    g = { solid="wall",
          [9] = { dx=12, dy=12 }, [3] = { dx=24, dy=8 },
          [8] = { x_offset=144 }, [6] = { x_offset=121 },
        },
    h = { solid="wall",
          [9] = { dx=8, dy=24 },
          [8] = { x_offset=167 },
        },
    i = { solid="wall",
          [9] = { dx= 0, dy=29 },
          [8] = { x_offset=192 },
        },

    j = { solid="wall",
          [7] = { dx=-12, dy=12 }, [9] = { dx=-8, dy=24 },
          [4] = { x_offset=240 }, [8] = { x_offset=217 },
        },
    k = { solid="wall",
          [7] = { dx=-24, dy=8 },
          [4] = { x_offset=263 },
        },
    m = { solid="wall",
          [7] = { dx=-29, dy= 0 },
          [4] = { x_offset=288 },
        },
  },
},

PILLAR_ROUND_LARGE =
{
  add_mode="island",

  structure =
  {
    "............",
    "............",
    "............",
    "............",
    "....jihg....",
    "....k##f....",
    "....m##e....",
    "....abcd....",
    "............",
    "............",
    "............",
    "............",
  },

  elements =
  {
    a = { solid="wall",
          [1] = { dx=-26, dy=-26 }, [7] = { dx=-42, dy=-16 },
          [2] = { x_offset=448 }, [4] = { x_offset=417 },
        },
    b = { solid="wall",
          [1] = { dx=-16, dy=-42 },
          [2] = { x_offset=479 },
        },
    c = { solid="wall",
          [1] = { dx=  0, dy=-49 },
          [2] = { x_offset=  0 },
        },

    d = { solid="wall",
          [3] = { dx=26, dy=-26 }, [1] = { dx=16, dy=-42 },
          [6] = { x_offset= 64 }, [2] = { x_offset= 33 },
        },
    e = { solid="wall",
          [3] = { dx=42, dy=-16 },
          [6] = { x_offset= 95 },
        },
    f = { solid="wall",
          [3] = { dx=49, dy= 0 },
          [6] = { x_offset=128 },
        },

    g = { solid="wall",
          [9] = { dx=26, dy=26 }, [3] = { dx=42, dy=16 },
          [8] = { x_offset=192 }, [6] = { x_offset=161 },
        },
    h = { solid="wall",
          [9] = { dx=16, dy=42 },
          [8] = { x_offset=223 },
        },
    i = { solid="wall",
          [9] = { dx= 0, dy=49 },
          [8] = { x_offset=256 },
        },

    j = { solid="wall",
          [7] = { dx=-26, dy=26 }, [9] = { dx=-16, dy=42 },
          [4] = { x_offset=320 }, [8] = { x_offset=289 },
        },
    k = { solid="wall",
          [7] = { dx=-42, dy=16 },
          [4] = { x_offset=351 },
        },
    m = { solid="wall",
          [7] = { dx=-49, dy= 0 },
          [4] = { x_offset=384 },
        },
  },
},


------ Pedestals ------------------------------------

PEDESTAL =
{
  scale=64,
  region="floor",

  structure =
  {
    "p",
  },

  elements =
  {
    p = { f_h=0, f_rel="ped_h",
          f_tex = "ped_f", l_tex = "ped_side",
          l_peg = "top",
        }
  },
},

PEDESTAL_PLUT =
{
  environment="outdoor",

  structure =
  {
    "pppp",
    "pppp",
    "pTpp",
    "pppp",
  },

  elements =
  {
    p = { f_h=16, f_tex="ped_f",
          l_tex="ped_w", l_peg="top",
          light=80,
        },

    T = { f_h=28, f_tex="ped_f2",
          l_tex="ped_w2", l_peg="top",
          light=255, glow=true, -- FIXME: proper glow (parm option)

          [1] = { dx=16, dy=-6 },
          [3] = { dx=22, dy=16 },
          [7] = { dx=-6, dy= 0 },
          [9] = { dx= 0, dy=22 },
        },
  }
},

PEDESTAL_PLUT_DOUBLE =
{
  copy="PEDESTAL_PLUT",

  environment="indoor",
  height_range={ 112,999 },

  -- FIXME: elements =
},


------ Overhangs ------------------------------------

OVERHANG_1 =
{
  structure =
  {
    "PooooooooooP",
    "oooooooooooo",
    "oooooooooooo",
    "oooooooooooo",
    "oooooooooooo",
    "oooooooooooo",
    "oooooooooooo",
    "oooooooooooo",
    "oooooooooooo",
    "oooooooooooo",
    "oooooooooooo",
    "PooooooooooP",
  },

  elements =
  {
    P = { solid = "hang_w" }, 

    o = { c_h = -24, c_tex = "hang_c", u_tex = "hang_u",
            light_add = -32,
          },
  },

  -- FIXME: double spot for monsters / objects
},

OVERHANG_2 =
{
  copy="OVERHANG_1",

  structure =
  {
    "PPooooooooPP",
    "PPooooooooPP",
    "oooooooooooo",
    "oooooooooooo",
    "oooooooooooo",
    "oooooooooooo",
    "oooooooooooo",
    "oooooooooooo",
    "oooooooooooo",
    "oooooooooooo",
    "PPooooooooPP",
    "PPooooooooPP",
  },

  -- FIXME: double spot for monsters / objects
},

OVERHANG_3 =
{
  copy="OVERHANG_1",

  structure =
  {
    "oooooooooooo",
    "oPPooooooPPo",
    "oPPooooooPPo",
    "oooooooooooo",
    "oooooooooooo",
    "oooooooooooo",
    "oooooooooooo",
    "oooooooooooo",
    "oooooooooooo",
    "oPPooooooPPo",
    "oPPooooooPPo",
    "oooooooooooo",
  },

  -- FIXME: double spot for monsters / objects
},


------ Wolfenstein ------------------------------------

WOLF_ELEVATOR =
{
  scale=64,

  structure =
  {
    "#E#",
    "E.E",
    "FdF",
  },

  elements =
  {
    E = { solid="elevator" },
    F = { solid="front"    },

    d = { kind="door_kind" },
  },
},

WOLF_PACMAN_BASE =
{
  scale=64,

  structure = { "#" }, -- dummy

  elements =
  {
    G = { solid="ghost_w" },

    B = { thing="blinky", angle=90  },
    C = { thing="clyde",  angle=90  },
    I = { thing="inky",   angle=270 },
    P = { thing="pinky",  angle=270 },

    d = { thing="dot_t" },
    t = { thing="treasure1" },
    u = { thing="treasure2" },
    m = { thing="first_aid" },
  },
},

WOLF_PACMAN_MID_1 =
{
  copy="WOLF_PACMAN_BASE",

  structure =
  {
    "##B.####.######.####C.##",
    "##d.####.######.####d.##",
    "##..##..d.d.d.d.d.##..##",
    "##d.##............##d.##",
    "##..##.dGGG..GGGd.##..##",
    "##d.##.dGGG..GGGd.##d.##",
    "#...##.dGG.tt.GGd.##...#",
    "d.G....dG.tttt.Gd....G.d",
    "..G.d..dGttttttGd..d.G..",
    "#...##.dGGttttGGd.##...#",
    "##d.##.dGGGuuGGGd.##d.##",
    "##..##.dGGGGGGGGd.##..##",
    "##d.##............##d.##",
    "##..##.d.d.d.d.d..##..##",
    "##d.####.######.####d.##",
    "##I.####.######.####P.##",
  },
},

WOLF_PACMAN_MID_2 =
{
  copy="WOLF_PACMAN_BASE",

  structure =
  {
    "##B.#######..#######.C##",
    "##d.#######.d#######.d##",
    "##d.###..........###.d##",
    "##d.##...d..d..d..##.d##",
    "##d.##d.GGGGGGGG.d##.d##",
    "###d....GGtt.GGG....d###",
    "######d.GGttt.GG.d######",
    "######..GGtutt....######",
    "######d.GGtutt...d######",
    "######..GGttt.GG..######",
    "###d..d.GGtt.GGG.d..d###",
    "##d.##..GGGGGGGG..##.d##",
    "##d.##.d..d..d..d.##.d##",
    "##d.###..........###.d##",
    "##d.#######d.#######.d##",
    "##I.#######..#######.P##",
  },
},

WOLF_PACMAN_MID_3 =
{
  copy="WOLF_PACMAN_BASE",

  structure =
  {
    "##B.####.######.####C.##",
    "##d.####d######.####d.##",
    "##..d.d.........d.d...##",
    "######..d.d.d.d...######",
    "dddddd..GGGGGGGGd.dddddd",
    "d#####.dGGtuutGG..#####d",
    "d#####..GttttttGd.#####d",
    "d#####.dG.tttt.G..#####d",
    "dddddd..GGGttGGGd.dddddd",
    "######.dGGGttGGG..######",
    "##...d..G......Gd.d.d.##",
    "##.d##.dG.GGGG.G..##..##",
    "##..##...d.d.d.d..##.d##",
    "##.d##............##..##",
    "##..#######d.#######.d##",
    "##Id#######..#######P.##",
  },
},

WOLF_PACMAN_CORN_1 =
{
  copy="WOLF_PACMAN_BASE",

  structure =
  {
    "#########...........",
    "#########d.d.d.d.d..",
    "#########.########.#",
    "####.d...d########d#",
    "####...m....##......",
    ".d.d.d####d.##..d.d.",
    ".........#..d.d.####",
    "d.#####..#####..d.d.",
    "..###tttuttt##......",
    "d.###t.###.t###d####",
    ".......###..###.####",
    ".d.d.d.###d.d.d.d.d.",
  },
},

WOLF_PACMAN_CORN_2 =
{
  copy="WOLF_PACMAN_BASE",

  structure =
  {
    "##########..####....",
    "t.d.d...d.d.####.d..",
    "t.###.d#########..##",
    "..###..#####.d.d.d##",
    "u.###d.d.d.d..######",
    "u.######..#####.d.d.",
    "..######m.d.###d####",
    "t.#########.###.####",
    "t.d.d.d.###d.d.d..##",
    "######..###.####d.##",
    "######d.d.d.####.d..",
    "##########..####..d.",
  },
},

WOLF_PACMAN_CORN_3 =
{
  copy="WOLF_PACMAN_BASE",

  structure =
  {
    "##########..####.##.",
    "u.d##d.d.d.d.d..d##d",
    "...##.........d#.##.",
    "d.d##d.######..#.d.d",
    "##.##..#tttt#.d##.##",
    "##.d.d.d.##t#..d.m##",
    "##.......##t#.d#####",
    "##d##d.#tttt#...d.d.",
    "d..##..######.d####d",
    "..d##d...........##.",
    "u..##..d.d.d.d.d.##d",
    "##########..####....",
  },
},


} -- PREFABS

