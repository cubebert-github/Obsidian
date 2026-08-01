PREFABS.Decor_urban_storage_huge_boxes =
{
  file   = "decor/gtd_decor_urban_storage_set.wad",
  map    = "MAP01",

  prob   = 5000,

  group = "gtd_wall_urban_storage",

  where  = "point",
  size   = 96,
  height = 129,

  bound_z1 = 0,
  bound_z2 = 128,

  tex_CRATE2 =
  {
    CRATE2 = 2,
    CRATE3 = 1,
    CRATELIT = 1,
  }
}

PREFABS.Decor_urban_storage_huge_boxes_all_brown =
{
  template = "Decor_urban_storage_huge_boxes",

  prob = 1250,

  tex_CRATE2 = "CRATE1",
  flat_CRATOP2 = "CRATOP1",
}

PREFABS.Decor_urban_storage_huge_boxes_all_grey =
{
  template = "Decor_urban_storage_huge_boxes",

  prob = 2000,

  flat_CRATOP2 = "CRATOP1",
  tex_CRATE1 =
  {
    CRATE2 = 2,
    CRATE3 = 1,
    CRATELIT = 1,
  }
}

--

PREFABS.Decor_urban_storage_huge_boxes_wide =
{
  template = "Decor_urban_storage_huge_boxes",
  map = "MAP02",

  prob = 2500,
}

PREFABS.Decor_urban_storage_huge_boxes_wide_2x1 =
{
  template = "Decor_urban_storage_huge_boxes",
  map = "MAP03",

  prob = 3500,
}

--

PREFABS.Decor_urban_storage_single_box =
{
  template = "Decor_urban_storage_huge_boxes",
  file   = "decor/crates1.wad",
  map    = "MAP01",

  prob = 2500,

  height = 64,

  size = 64,
}

PREFABS.Decor_urban_storage_single_box_tall =
{
  template = "Decor_urban_storage_huge_boxes",
  file   = "decor/crates1.wad",
  map    = "MAP02",

  prob = 2500,

  height = 129,

  size = 64,
}

PREFABS.Decor_urban_storage_collection =
{
  template = "Decor_urban_storage_huge_boxes",
  file   = "decor/crates1.wad",
  map    = "MAP04",

  prob = 6500,
}

--

PREFABS.Decor_urban_storage_wood_huge_boxes_1 =
{
  file = "decor/gtd_decor_urban_storage_set.wad",
  map = "MAP04",

  prob = 5000,

  group = "gtd_storage_wood",

  where = "point",
  size = 96,
  height = 129,

  bound_z1 = 0,
  bound_z2 = 128,
}

PREFABS.Decor_urban_storage_wood_huge_boxes_2 =
{
  template = "Decor_urban_storage_wood_huge_boxes_1",
  map = "MAP05"
}

PREFABS.Decor_urban_storage_wood_huge_boxes_3 =
{
  template = "Decor_urban_storage_wood_huge_boxes_1",
  map = "MAP06"
}

PREFABS.Decor_road_clutter_boxes_alt_storage_wood_grouped =
{
  template = "Decor_road_clutter_boxes",

  theme = "any",
  group = "gtd_storage_wood",

  flat_CRATOP1 = "FLAT5_2",
  flat_CRATOP2 = "FLAT5_2",

  tex_CRATE2 = "WOODMET1",
  tex_CRATINY = "WOOD10",
}

PREFABS.Crate_large_wooden_storage_wood_grouped =
{
  template = "Crate_large_wooden",

  theme = "any",
  group = "gtd_storage_wood",

  prob = 5000
}
