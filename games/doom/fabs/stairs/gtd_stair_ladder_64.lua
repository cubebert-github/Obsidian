PREFABS.Ladder_64_rustic =
{
  file = "stairs/gtd_stair_ladder_64.wad",
  map = "MAP01",

  prob = 10,
  style = "steepness",

  theme = "hell",

  filter = "stair_ladder",

  where = "seeds",
  shape = "I",

  seed_w = 1,
  seed_h = 1,

  x_fit = "frame",
  y_fit = "bottom",

  bound_z1 = 0,

  delta_h = 64,

  tex_STEPLAD1 = {STEPLAD1=50, STEP1=50, STEP3=50}
}

PREFABS.Ladder_64_industrial =
{
  template = "Ladder_64_rustic",
  map = "MAP01",

  theme = "!hell",

  tex_STEPLAD1 = "STEP1"
}

--

PREFABS.Ladder_64_rustic_simple =
{
  template = "Ladder_64_rustic",
  map = "MAP02",

  theme = "hell"
}
PREFABS.Ladder_64_industrial_simple =
{
  template = "Ladder_64_rustic",
  map = "MAP02",

  theme = "!hell",

  tex_STEPLAD1 = "STEP1"
}
