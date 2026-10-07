PREFABS.Pic_industrial_ssg_assembler =
{
  file   = "picture/gtd_pic_manufacturing_machines.wad",
  map    = "MAP01",

  game = "doom2",

  port = "zdoom",

  prob   = 5, -- very rare
  theme = "!hell",

  where  = "seeds",
  height = 128,

  seed_w = 3,
  seed_h = 2,

  deep = 16,
  over = -16,

  bound_z1 = 0,
  bound_z2 = 128,

  x_fit = "frame",
  y_fit = "top",
}

PREFABS.Pic_industrial_medkit_filler =
{
  template = "Pic_industrial_ssg_assembler",
  map = "MAP02",

  prob = 3,

  seed_w = 2,
  seed_h = 1,

  x_fit = "frame",
  y_fit = "top"
}
