------------------------------------------------------------------------
--  CHEX1 THEMES
------------------------------------------------------------------------
--
--  Copyright (C) 2006-2017 Andrew Apted
--  Copyright (C)      2008 Sam Trenholme
--  Copyright (C) 2019-2020 MsrSgtShooterPerson
--
--  This program is free software; you can redistribute it and/or
--  modify it under the terms of the GNU General Public License
--  as published by the Free Software Foundation; either version 2
--  of the License, or (at your option) any later version.
--
------------------------------------------------------------------------

CHEX1.SINKS =
{
  -- sky holes --

  sky_plain =
  {
    mat   = "_SKY",
    dz    = 64,
    light = 16
  },

  -- liquid floor --

  liquid_plain =
  {
    mat = "FWATER1",
    dz  = -12
  },

  liquid_slime0 =
  {
    mat = "BLOOD1",
    dz = -12
  },

  liquid_slime1 =
  {
    mat = "NUKAGE1",
    dz  = -12
  },

  liquid_slime2 =
  {
    mat = "LAVA1",
    dz  = -12
  },

  -- street sink def, do not use for anything else
  floor_default_streets =
  {
    mat = "CEIL5_1",
    dz = 2,
  
    trim_mat = "GRAYTALL",
    trim_dz = 2,
  }

}


CHEX1.THEMES =
{
  DEFAULTS =
  {

    keys =
    {
      k_yellow = 50,
      k_red = 50,
      k_blue = 50
    },

    skyboxes =
    {

    },

    cage_lights = { 0, 8, 12, 13 },

    pool_depth = 24,

    street_sinks =
    {
      floor_default_streets = 1
    },

    streets_friendly = false,
    
    slump_config = 
    [[
      ;
      ; Sample SLIGE config file. (Semicolon starts a comment to end of line.)
      ;
      ; This is the SLIGE.CFG as shipped with SLIGE itself.  It contains a
      ; description of the default SLIGE configuration, as hardwired into
      ; the program.  So having this file in the current directory under the
      ; name SLIGE.CFG should produce exactly the same effect as not having
      ; any config file at all.  You can use this file as a base to build
      ; your own config files on (but if you do, you should change these
      ; comments; otherwise they'll be WRONG!).
      ;
      ; Dave Chess, dmchess@aol.com, chess@us.ibm.com

      ; The current implementation ignores everything before the
      ; [THEMES] line also, but that will change.

      [THEMES]        ; Anything after a ; is, remember, a comment

      ; We have three themes, one secret.  They should all be declared
      ; before any textures or flats or anything else.  The only valid
      ; modifier is "secret", which says that that theme should only be
      ; used on secret levels.  There should be at least one "secret"
      ; theme.

	  Theme LAB ; Chex labs
	  Theme BAZ ; Bazoik caves/E1M5 theme

      ; Flats and textures and constructs and stuff are also in the [THEMES] section

      ; Textures are described by "Texture NAME <attributes>".  Obvious
      ; attributes include "wall", "door", and so on.  Some subtler ones:
      ;
      ; "core <theme>" means that this texture should be common in that theme.
      ; "comp <theme>" means that this texture is compatible with that theme, but
      ;    not to be used all that often.
      ; "switch <texture>" means "the given texture is a good switch to use in
      ;    a room that has walls of the current texture"
      ; "isswitch" means "the current texture is a good switch to use on any
      ;    wall in a room with a compatible theme"
      ; "subtle <texture>" means "the given texture is a subtle variant of the
      ;    current texture, suitable for hinting at secrets"
      ; "yhint N" means "when using a vertical misalignment to hint at
      ;    a secret door in a wall of this texture, use a y-offset of N".  If
      ;    N is zero, it means "this wall is too visually complex to hint via a
      ;    y-misalignment at all; hint some other way".  If no "yhint" is given,
      ;    the value 5 is used.
      ;  "noDoom2" means that the texture does not exist in the usual DOOM II
      ;    IWAD.  "noDoom0" means it doesn't exist in the DOOM 1.2 IWAD, and
      ;    "noDoom1" means it's not in the DOOM 1.666 or 1.89 IWAD.  If none
      ;    of these are specified, the texture is assumed to be in all.
      ;  "size <width> <height>" gives the size of the texture.  You can leave
      ;    this out if the height is 128, and the width is some reasonable
      ;    divisor of 256 (except for doors, where you should give the real
      ;    width so SLIGE can make them look nice).

	  ; Lab walls
	  Texture SKIN2 size 128 128 wall core LAB
	  Texture STARG3 size 128 128 wall core LAB subtle CEMENT6
	  Texture TEKWALL2 size 128 128 wall core LAB subtle STONE2

	  ; Lab switches
	  Texture SW1STARG size 128 128 isswitch comp LAB
	  Texture SW1PIPE size 128 128 isswitch comp LAB

	  ; Bazoik walls
      Texture BIGDOOR2 size 128 128 wall core BAZ subtle STARGR1

      ; Bazoik switches
      Texture SW1BRCOM size 128 128 isswitch comp BAZ

      ; And the lift texture
      Texture COMPBLUE size 64 128 lift comp LAB comp BAZ

      ; Doors of all kinds.  "size" gives the width and height of the texture,
      ; and "locked" means that it's a good texture to use on a door that only
      ; opens with a switch, not a touch.
      Texture BIGDOOR4 size 128 128 door comp LAB
	  Texture BIGDOOR1 size 128 128 door comp LAB comp BAZ
      Texture SP_DUDE4 size 64 128 door comp LAB comp BAZ
	  Texture SKSNAKE1 size 64 128 door comp LAB comp BAZ

	  ; Lab exit switches
	  Texture SW1STARG size 128 128 exitswitch comp LAB
	  Texture SW1PIPE size 128 128 exitswitch comp LAB

      ; Bazoik exit switches
      Texture SW1BRCOM size 128 128 exitswitch comp BAZ

      ; Lights, suitable for lighting recesses and stuff.
      Texture LITEMET size 128 128 light comp LAB
	  Texture BLODRIP1 size 64 128 light comp BAZ

      ; "Plaques", suitable for wall consoles and paintings and pillars and stuff.
      ; "vtiles" means that it's OK to pile one on top of another, as when
      ;    making the big central pillar in an arena.
      ; "half_plaque" means that the upper half of this texture can be used
      ;    by itself, as well as the whole thing.
      Texture FIREWALL size 128 112 plaque vtiles comp LAB
	  Texture DOORTRAK size 128 128 plaque vtiles comp BAZ
      Texture FIREMAG1 size 128 128 plaque comp BAZ

      ; Gratings
      Texture MIDVINE1 size 256 128 grating comp LAB
	  Texture MIDVINE2 size 256 128 grating comp LAB
	  Texture SKSPINE1 size 64 128 grating comp BAZ

      ; Colors (suitable for marking key-locked things)
      Texture DOORRED size 8 128 red comp LAB comp BAZ
      Texture DOORYEL size 8 128 yellow comp LAB comp BAZ
      Texture DOORBLU size 8 128 blue comp LAB comp BAZ

      ; Step kickplates
      Texture STEP1 size 32 8 step comp LAB comp BAZ

      ; "Doorjambs"
      Texture COMPSTA1 size 8 128 jamb comp LAB comp BAZ

      ; Support textures, used in various places
      Texture SUPPORT2 size 64 128 support comp LAB
	  Texture NUKEDGE1 size 128 128 support comp BAZ

      ; Bunch of things for outside patios (no themes applied here)
	  Texture BIGDOOR3 size 128 128 outside

      ; Misc
      Texture LITEBLU1 size 128 128 error

      ; Now the flats.  Keywords should all be pretty obvious...   *8)

      ; Teleport-gate floors
      Flat GATE1 gate comp LAB comp BAZ

      ; Lab floors and ceilings
      Flat FLOOR4_1 ceiling light comp LAB
      Flat FLOOR4_1 ceiling outside comp LAB
      Flat FLOOR4_1 floor comp LAB
	  Flat STEP1 floor comp LAB
      Flat FLOOR4_1 ceiling comp LAB
      Flat FLOOR4_1 floor outside comp LAB

      ; Bazoik floors and ceilings
      Flat CEIL3_1 ceiling light comp BAZ
      Flat CEIL3_1 ceiling outside comp BAZ
      Flat CEIL3_1 floor comp BAZ
      Flat CEIL3_1 ceiling comp BAZ
      Flat CEIL3_1 floor outside comp BAZ

      ; and nukage
      Flat BLOOD1 nukage comp LAB comp BAZ
      Flat LAVA1 nukage red comp LAB comp BAZ

      ; Floors for outside areas not yet mentioned
      Flat CEIL3_1 outside

      ; These are the defaults, but we'll list them anyway.
      Flat FWATER1 water
      Flat F_SKY1 sky

      ; Constructs: computers and crates and stuff that stand around in rooms
      ; This is pretty complex!  Fool with it at your peril.

      ; Family 1 is crates of various sizes and kinds
      Construct family 1 height 128 comp LAB comp BAZ
        top CRATOP2
        Primary CRATE2 width 64

      ; Load the hardwired monster and object and so on data (required in
      ; this version of SLIGE; don't remove this!)
      Hardwired1

      ; Say which lamps we like in which themes, and where barrels are allowed
      ; Information like which Doom version each object is in, and which ones
      ; cast light, and which ones explode, is still hardwired.
      Thing 2028 comp LAB comp BAZ  ; floor lamp

      ; and that's it!
    ]]
  },

  -- Themes by Cubebert --

  bazoik =
  {

   style_list =
    {
      caves = { none=80, few=12, some=5, heaps=3 },
      outdoors = { none=80, few=18, some=2 },
      pictures = { few=80, some=20, heaps=30 },
      hallways = { none=30, few=80, some=15, heaps=10 },
      windows = { few=25, some=50, heaps=90 },
      cages = { none=60, few=20, some=10, heaps=10 },
      liquids = { none=45, few=30, some=20, heaps=5 },
      doors = { few=20, some=70, heaps=30 },
      steepness = { few=25, some=50, heaps=90 },
      big_rooms = { none=15, few=60, some=20, heaps=5 },
      ambushes = { none=5, few=50, some=45, heaps=30 },
      teleporters = { none=20, few=30, some=65, heaps=10 },
      keys = { none=15, few=50, some=50, heaps=20 },
      symmetry = { none=40, few=30, some=35, heaps=25 },
      switches = { none=20, few=60, some=40, heaps=10 },
      secrets = { few=5, some=80, heaps=25 },
      traps   = { none=10, few=40, some=70, heaps=25 },
      barrels = { none=80, few=10, some=10 }
    },

    liquids =
    {
      slime0 = 15,
      slime1 = 10
    },


    narrow_halls =
    {
      vent = 50
    },

    wide_halls =
    {
      curve = 50,
      deuce = 50,
    },

    floor_sinks =
    {
      liquid_slime0 = 50,
      liquid_slime1 = 25,
    },

    ceiling_sinks =
    {
      sky_plain = 50
    },

    fences =
    {
      FLOOR0_6 = 30,
    },

    cage_mats =
    {
      GRAY7 = 10,
      STARG3 = 30
    },

    facades =
    {
      STARG3 = 50,
      CEMENT5 = 10,
    },

    fence_groups =
    {
      PLAIN = 50,
      crenels = 12,
    },

    fence_posts =
    {
      Post = 50
    },

    beam_groups =
    {
      beam_metal = 50
    },

    window_groups = 
    {
      straddle = 70,
      tall   = 80,
      grate  = 45,
      barred = 10,
      supertall = 60,
      slits = 20,
      pillbox = 20,
      slumpish = 30,
      window_crossfire = 10,
    },

    wall_groups =
    {
      PLAIN = 0.01,
      mid_band = 10,
      lite1 = 20,
      lite2 = 20,
      torches1 = 12,
      torches2 = 12,
      high_gap = 25,
      vert_gap = 25,
      wallgutters = 10,
      lamptorch = 16,
      runic = 10,
    },

    cave_torches =
    {
      green_torch = 50,
      green_torch_sm = 50
    },

    outdoor_torches =
    {
      -- TODO
    },

    ceil_light_prob = 70,

    scenic_fences =
    {
      LITE4 = 30,
    },

    sink_style =
    {
      sharp = 1,
      curved = 0.1
    },

    steps_mat = "FLAT1_1",

    post_mat  = "FLOOR0_6",
	
	skyboxes =
    {

    },

  },
  
  spaceport =
  {
  
   style_list =
    {
      caves = { none=60, few=40, some=12, heaps=2 },
      outdoors = { none=10, few=35, some=90, heaps=30 },
      pictures = { few=20, some=80, heaps=30 },
      hallways = { none=30, few=80, some=15, heaps=10 },
      windows = { few=25, some=50, heaps=90 },
      cages = { none=30, few=50, some=20, heaps=10 },
      liquids = { none=45, few=30, some=20, heaps=5 },
      doors = { few=20, some=70, heaps=30 },
      steepness = { few=25, some=50, heaps=90 },
      big_rooms = { none=25, few=40, some=25, heaps=15 },
      ambushes = { none=5, few=20, some=75, heaps=30 },
      teleporters = { none=20, few=30, some=65, heaps=10 },
      keys = { none=15, few=50, some=50, heaps=20 },
      symmetry = { none=40, few=30, some=35, heaps=25 },
      switches = { none=20, few=60, some=40, heaps=10 },
      secrets = { few=5, some=80, heaps=25 },
      traps   = { none=10, few=40, some=70, heaps=25 },
      barrels = { none=10, few=50, some=20, heaps=5 }
    },

    liquids =
    {
      water = 50,
    },
	
    narrow_halls =
    {
      vent = 50
    },

    wide_halls =
    {
      curve = 50,
      deuce = 50,
    },

    floor_sinks =
    {
      liquid_plain = 50
    },

    ceiling_sinks =
    {
      sky_plain = 50
    },

    fences =
    {
      SP_DUDE1 = 30,
	    BROWNHUG = 5,
    },
	
    cage_mats =
    {
      SP_DUDE1 = 30,
      MUSEUM = 10
    },
	
    facades =
    {
      SP_DUDE1 = 30,
    },
	
    fence_groups =
    {
      PLAIN = 50,
      crenels = 12,
    },

    fence_posts =
    {
      Post = 50
    },

    beam_groups =
    {
      beam_metal = 50
    },

    window_groups = 
    {
      straddle = 70,
      tall   = 80,
      grate  = 45,
      barred = 10,
      supertall = 60,
      slits = 20,
      pillbox = 20,
      slumpish = 30,
      window_crossfire = 10,
    },

    wall_groups =
    {
      PLAIN = 0.01,
      mid_band = 10,
      lite1 = 20,
      lite2 = 20,
      torches1 = 12,
      torches2 = 12,
      high_gap = 25,
      vert_gap = 25,
      wallgutters = 10,
      lamptorch = 16,
      runic = 10,
    },

    cave_torches =
    {
      green_torch = 50,
      green_torch_sm = 50
    },

    outdoor_torches =
    {
      -- TODO
    },

    ceil_light_prob = 70,

    scenic_fences =
    {
      DOORSTOP = 80
    },
	
    sink_style =
    {
      sharp = 1,
      curved = 0.1
    },

    steps_mat = "CEIL5_1",

    post_mat  = "FLOOR0_6",
	
	  skyboxes =
    {

    },

    streets_friendly = true
  
  },
  
  villa =
  {

   style_list =
    {
      caves = { none=50, few=25, some=15, heaps=10 },
      outdoors = { none=60, few=31, some=9 },
      pictures = { few=50, some=40, heaps=30 },
      hallways = { none=30, few=60, some=25, heaps=20 },
      windows = { few=25, some=50, heaps=90 },
      cages = { none=70, few=15, some=5, heaps=10 },
      liquids = { none=45, few=30, some=20, heaps=5 },
      doors = { few=20, some=70, heaps=30 },
      steepness = { few=25, some=50, heaps=90 },
      big_rooms = { none=15, few=60, some=20, heaps=5 },
      ambushes = { none=5, few=50, some=45, heaps=30 },
      teleporters = { none=30, few=50, some=35, heaps=10 },
      keys = { none=15, few=50, some=50, heaps=20 },
      symmetry = { none=40, few=30, some=35, heaps=25 },
      switches = { none=20, few=60, some=40, heaps=10 },
      secrets = { few=5, some=80, heaps=25 },
      traps   = { none=10, few=40, some=60, heaps=35 },
      barrels = { none=10, few=40, some=30, heaps=10 }
    },

    liquids =
    {
      slime0 = 15,
      slime1 = 10,
	  water = 10,
    },


    narrow_halls =
    {
      vent = 50
    },

    wide_halls =
    {
      curve = 50,
      deuce = 50,
    },

    floor_sinks =
    {
      liquid_slime0 = 50,
      liquid_slime1 = 25,
    },

    ceiling_sinks =
    {
      sky_plain = 50
    },

    fences =
    {
      CJLODG01 = 30,
    },

    cage_mats =
    {
      CJVILL01 = 20,
    },

    facades =
    {
      SP_DUDE1 = 30,
    },

    fence_groups =
    {
      PLAIN = 50,
      crenels = 12,
    },

    fence_posts =
    {
      Post = 50
    },

    beam_groups =
    {
      beam_metal = 50
    },

    window_groups = 
    {
      straddle = 70,
      tall   = 80,
      grate  = 45,
      barred = 10,
      supertall = 60,
      slits = 20,
      pillbox = 20,
      slumpish = 30,
      window_crossfire = 10,
    },

    wall_groups =
    {
      PLAIN = 0.01,
      mid_band = 10,
      lite1 = 20,
      lite2 = 20,
      torches1 = 12,
      torches2 = 12,
      high_gap = 25,
      vert_gap = 25,
      wallgutters = 10,
      lamptorch = 16,
      runic = 10,
    },

    cave_torches =
    {
      green_torch = 50,
      green_torch_sm = 50
    },

    outdoor_torches =
    {
      -- TODO
    },

    ceil_light_prob = 70,

    scenic_fences =
    {
      LITE4 = 30,
    },

    sink_style =
    {
      sharp = 1,
      curved = 0.1
    },

    steps_mat = "FLAT1_1",

    post_mat  = "FLOOR0_6",
	
	skyboxes =
    {

    },
	
   },

}

CHEX1.ROOM_THEMES =
{

  ---- BAZOIK THEME --------------------------------

  bazoik_Generic =
  {
    env  = "building",
    prob = 50,
  
    walls =
    {
	  SP_DUDE2 = 25,
	  TEKWALL5 = 25,
	  BROWN = 25,
      STARG3  = 25,
    },
  
    floors =
    {
      FLAT1_1 = 50,
      FLAT1 = 50,
      FLAT14 = 50,
      FLOOR0_2 = 50
    },
  
    ceilings =
    {
      FLAT14 = 50,
      CJFCOMM3 = 50,
      CEIL5_1 = 50,
      FLOOR0_6 = 25
    }
  },
  
  bazoik_vent_Hallway =
  {
    env   = "hallway",
    group = "vent",
    prob  = 50,
  
    walls =
    {
      GRAY7 = 10,
      SW2SATYR = 25,
	  TEKWALL5 = 25,
	  BROWN = 25,
      STARG3  = 15,
    },
  
    floors =
    {
      FLAT1_1 = 50,
      FLAT1 = 50,
      FLAT14 = 50,
      FLOOR0_2 = 50
    },
  
    ceilings =
    {
      FLAT14 = 50,
      CJFCOMM3 = 50,
      CEIL5_1 = 50,
      FLOOR0_6 = 25
    }
  
  },
  
  bazoik_curve_Hallway =
  {
    env   = "hallway",
    group = "curve",
    prob  = 50,
  
    walls =
    {
      GRAY7 = 10,
	  SP_DUDE2 = 20,
	  TEKWALL5 = 25,
	  BROWN = 25,
      STARG3  = 20,
    },
  
    floors =
    {
      FLAT1_1 = 50,
      FLAT1 = 50,
      FLAT14 = 50,
      FLOOR0_2 = 50
    },
  
    ceilings =
    {
      FLAT14 = 50,
      CJFCOMM3 = 50,
      CEIL5_1 = 50,
      FLOOR0_6 = 25
    }
  
  },

  bazoik_deuce_Hallway =
  {
    env   = "hallway",
    group = "deuce",
    prob  = 50,
  
    walls =
    {
      GRAY7 = 10,
	  SP_DUDE2 = 20,
	  TEKWALL5 = 25,
	  BROWN = 25,
      STARG3  = 20,
    },
  
    floors =
    {
      FLAT1_1 = 50,
      FLAT1 = 50,
      FLAT14 = 50,
      FLOOR0_2 = 50
    },
  
    ceilings =
    {
      FLAT14 = 50,
      CJFCOMM3 = 50,
      CEIL5_1 = 50,
      FLOOR0_6 = 25
    }
  
  },
  
  bazoik_Outdoors =
  {
    env  = "outdoor",
    prob = 50,
  
    floors =
    {
      CEIL3_1 = 50,
    },
  
    naturals =
    {
      BIGDOOR2 = 50,
      BAZOIK1 = 50
    },
  
    porch_floors =
    {
      FLAT1_1 = 50,
      CJFCOMM5 = 50
    },
  
  },
  
  bazoik_Cave =
  {
    env  = "cave",
    prob = 50,
  
    floors =
    {
      CEIL3_1 = 50,
    },
  
    walls =
    {
      BIGDOOR2 = 50,
      BAZOIK1 = 50
    }
  
  },
  
  ---- SPACEPORT THEME --------------------------------

  spaceport_Generic =
  {
    env  = "building",
    prob = 50,
  
    walls =
    {
	  SW2SATYR = 25,
	  BROWN1 = 25,
      CITYWALL  = 50,
    },
  
    floors =
    {
      CEIL5_1 = 50,
      SW2SATYR = 50,
      MUSEUM = 50,
    },
  
    ceilings =
    {
      FLAT14 = 50,
      CJFCOMM3 = 50,
      CEIL5_1 = 50,
      FLOOR0_6 = 25
    }
  },
  
  spaceport_vent_Hallway =
  {
    env   = "hallway",
    group = "vent",
    prob  = 50,
  
    walls =
    {
	  SW2SATYR = 25,
	  BROWN1 = 25,
      CITYWALL  = 50,
    },
  
    floors =
    {
      CEIL5_1 = 50,
      SW2SATYR = 50,
      MUSEUM = 50,
    },
  
    ceilings =
    {
      FLAT14 = 50,
      CJFCOMM3 = 50,
      CEIL5_1 = 50,
      FLOOR0_6 = 25
    }
  
  },
  
  spaceport_curve_Hallway =
  {
    env   = "hallway",
    group = "curve",
    prob  = 50,
  
    walls =
    {
	  SW2SATYR = 25,
	  BROWN1 = 25,
      CITYWALL  = 50,
    },
  
    floors =
    {
      CEIL5_1 = 50,
      SW2SATYR = 50,
      MUSEUM = 50,
    },
  
    ceilings =
    {
      FLAT14 = 50,
      CJFCOMM3 = 50,
      CEIL5_1 = 50,
      FLOOR0_6 = 25
    }
  
  },

  spaceport_deuce_Hallway =
  {
    env   = "hallway",
    group = "deuce",
    prob  = 50,
  
    walls =
    {
	  SW2SATYR = 25,
	  BROWN1 = 25,
      CITYWALL = 50,
    },
  
    floors =
    {
      CEIL5_1 = 50,
      SW2SATYR = 50,
      MUSEUM = 50,
    },
  
    ceilings =
    {
      FLAT14 = 50,
      CJFCOMM3 = 50,
      CEIL5_1 = 50,
      FLOOR0_6 = 25
    }
  
  },
  
  spaceport_Outdoors =
  {
    env  = "outdoor",
    prob = 50,
  
    floors =
    {
      CJFGRAS1 = 50,
    },
  
    naturals =
    {
      CJCLIF01 = 50,
      CJFGRAS1 = 50
    },
  
    porch_floors =
    {
      SW2SATYR = 50,
      CJFCOMM3 = 50
    },
  
  },
  
  spaceport_Cave =
  {
    env  = "cave",
    prob = 50,
  
    floors =
    {
      ENDFLAT2 = 50,
    },
  
    walls =
    {
      SEWER1 = 50,
      SEWER2 = 50
    }
  
  },
  
  ---- VILLA THEME --------------------------------

  villa_Generic =
  {
    env  = "building",
    prob = 50,
  
    walls =
    {
	  SP_DUDE2 = 25,
	  TEKWALL5 = 25,
	  BROWN = 25,
      STARG3  = 25,
    },
  
    floors =
    {
      CJFVIL01 = 50,
      CJFVIL02 = 50,
      CJFLOD01 = 50
    },
  
    ceilings =
    {
      FLAT14 = 50,
      CJFCOMM3 = 50,
      CEIL5_1 = 50,
      FLOOR0_6 = 25
    }
  },
  
  villa_vent_Hallway =
  {
    env   = "hallway",
    group = "vent",
    prob  = 50,
  
    walls =
    {
      CJVILL01 = 50,
    },
  
    floors =
    {
      CJFVIL02 = 50,
      CJFVIL04 = 50,
    },
  
    ceilings =
    {
      FLAT14 = 50,
      CJFCOMM3 = 50,
      CEIL5_1 = 50,
      FLOOR0_6 = 25
    }
  
  },
  
  villa_curve_Hallway =
  {
    env   = "hallway",
    group = "curve",
    prob  = 50,
  
    walls =
    {
      CJVILL01 = 50,
    },
  
    floors =
    {
      CJFVIL02 = 50,
      CJFVIL04 = 50,
    },
  
    ceilings =
    {
      FLAT14 = 50,
      CJFCOMM3 = 50,
      CEIL5_1 = 50,
      FLOOR0_6 = 25
    }
  
  },

  villa_deuce_Hallway =
  {
    env   = "hallway",
    group = "deuce",
    prob  = 50,
  
    walls =
    {
      CJVILL01 = 50,
    },
  
    floors =
    {
      CJFVIL02 = 50,
      CJFVIL04 = 50,
    },
  
    ceilings =
    {
      FLAT14 = 50,
      CJFCOMM3 = 50,
      CEIL5_1 = 50,
      FLOOR0_6 = 25
    }
  
  },
  
  villa_Outdoors =
  {
    env  = "outdoor",
    prob = 50,
  
    floors =
    {
      CJFCRA03 = 50,
    },
  
    naturals =
    {
      CJMINE02 = 50,
      CJCLIF01 = 50
    },
  
    porch_floors =
    {
      CJFVIL01 = 50,
      CJFVIL02 = 50
    },
  
  },
  
  villa_Cave =
  {
    env  = "cave",
    prob = 50,
  
    floors =
    {
      CJFSHIP3 = 50,
	  CJFSHIP2 = 50,
    },
  
    walls =
    {
      CJSHIP02 = 50,
      CJSHIP05 = 50
    }
  
  },

}
------------------------------------------------------------------------


CHEX1.ROOMS =
{
  GENERIC =
  {
    env = "any"
  },

  OUTSIDE =
  {
    env = "outdoor",
    prob = 50
  },

}


function CHEX1.slump_setup()
  if ob_match_game({game = {chex1=1}}) then
    if OB_CONFIG.theme == "original" or OB_CONFIG.theme == "epi" then
      PARAM.slump_config = CHEX1.THEMES.DEFAULTS.slump_config
    elseif OB_CONFIG.theme == "jumble" or OB_CONFIG.theme == "bit_mixed" then
      local possible_configs = {}
      for _,tab in pairs(CHEX1.THEMES) do
        if tab.slump_config then
          table.insert(possible_configs, tab.slump_config)
        end
      end
      PARAM.slump_config = rand.pick(possible_configs)
    elseif CHEX1.THEMES[OB_CONFIG.theme].slump_config then
      PARAM.slump_config = CHEX1.THEMES[OB_CONFIG.theme].slump_config
    else
      PARAM.slump_config = CHEX1.THEMES.DEFAULTS.slump_config
    end
  end
end

------------------------------------------------------------------------

OB_THEMES["bazoik"] =
{
  label = _("Bazoik"),
  game = "chex1",
  name_class = "TECH",
  mixed_prob = 34
}

OB_THEMES["spaceport"] =
{
  label = _("Chextropolis"),
  game = "chex1",
  name_class = "URBAN",
  mixed_prob = 33
}

OB_THEMES["villa"] =
{
  label = _("Villa Chex"),
  game = "chex1",
  name_class = "URBAN",
  mixed_prob = 33
}