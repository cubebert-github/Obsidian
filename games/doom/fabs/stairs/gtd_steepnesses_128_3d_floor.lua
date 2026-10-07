PREFABS.Stair_gtd_lift_128_3d =
{
  file = "stairs/gtd_steepnesses_128_3d_floor.wad",
  map = "MAP01",

  prob = 7, --15

  engine = "zdoom",

  style = "steepness",

  where = "seeds",
  shape = "I",

  seed_w = 1,
  seed_h = 1,

  x_fit = { 28,32 , 64,68 , 96,100 },
  y_fit = { 30,32 , 48,49 },

  bound_z1 = 0,

  delta_h = 128
}

PREFABS.Stair_gtd_stairs_128_3d = -- requires 2 seed_h
{
  template = "Stair_gtd_lift_128_3d",
  map = "MAP02",

  prob = 10,

  x_fit = { 28,32 , 64,68 , 96,100 },
  y_fit = { 16,20 , 80,84 },

  seed_h = 2,

  bound_z1 = 0,

  delta_h = 128
}

PREFABS.Stair_gtd_ladder_128_3d =
{
  template = "Stair_gtd_lift_128_3d",
  map = "MAP03",

  x_fit = { 28,32 , 64,68 , 96,100 },
  y_fit = { 46,48 , 64,65 },

  bound_z1 = 0,

  delta_h = 128
}

--[[PREFABS.Stair_gtd_teleporter_128_3d =
{
  template = "Stair_gtd_lift_128_3d",
  map = "MAP04",

  x_fit = { 28,32 , 96,100 },
  y_fit = { 20,21 },

  bound_z1 = 0,

  delta_h = 128
}]]

PREFABS.Stair_gtd_ladder_bridge_128_3d =
{
  template = "Stair_gtd_lift_128_3d",
  map = "MAP05",

  x_fit = { 8,16 , 60,68 , 112,120 },
  y_fit = { 72,80 , 96,104 },

  bound_z1 = 0,

  delta_h = 128
}

PREFABS.Stair_gtd_lift_bridge_128_3d =
{
  template = "Stair_gtd_lift_128_3d",
  map = "MAP06",

  x_fit = { 16,17 , 111,112 },
  y_fit = { 64,65 },

  bound_z1 = 0,

  delta_h = 128
}

--

PREFABS.Stair_gtd_lift_96_3d =
{
  template = "Stair_gtd_lift_128_3d",
  map = "MAP10",

  style = "steepness",

  delta_h = 96
}

PREFABS.Stair_gtd_stair_96_3d = -- seed_h = 2
{
  template = "Stair_gtd_lift_128_3d",
  map = "MAP11",

  prob = 10,

  x_fit = { 28,32 , 64,68 , 96,100 },
  y_fit = { 16,20 , 80,84 },

  seed_h = 2,

  bound_z1 = 0,

  delta_h = 96
}

PREFABS.Stair_gtd_ladder_96_3d =
{
  template = "Stair_gtd_lift_128_3d",
  map = "MAP12",

  x_fit = { 28,32 , 64,68 , 96,100 },
  y_fit = { 46,48 , 64,65 },

  bound_z1 = 0,

  delta_h = 96
}

PREFABS.Stair_gtd_ladder_bridge_96_3d =
{
  template = "Stair_gtd_lift_128_3d",
  map = "MAP14",

  x_fit = { 8,16 , 60,68 , 112,120 },
  y_fit = { 72,80 , 96,104 },

  bound_z1 = 0,

  delta_h = 96
}

PREFABS.Stair_gtd_lift_bridge_96_3d =
{
  template = "Stair_gtd_lift_128_3d",
  map = "MAP15",

  x_fit = { 16,17 , 63,65 , 111,112 },
  y_fit = { 63,64 , 68,69 },

  bound_z1 = 0,

  delta_h = 96
}
