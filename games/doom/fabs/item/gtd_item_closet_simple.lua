PREFABS.Item_gtd_closet_simple_1 =
{
  file   = "item/gtd_item_closet_simple.wad",
  map    = "MAP01",

  prob   = 25,

  where  = "seeds",
  seed_w = 2,
  seed_h = 1,

  deep = 16,

  x_fit = "frame",
  y_fit = {40, 56},

  tex_MODWALL1 =
  {
    MODWALL1 = 1,
    BROWNPIP = 1,
    CEMENT9 = 1,
    PIPES = 1,
    PIPEWAL2 = 1,
    STONE = 1,
    STONE2 = 1,
    STONE3 = 1,
    TEKWALL1 = 1,
    TEKWALL4 = 1
  },

  tex_LITE3 =
  {
    LITE3 = 4,
    LITE5 = 4,
    LITEBLU4 = 1
  },

  flat_TLITE6_5 = 
  {
    TLITE6_5 = 1,
    TLITE6_6 = 1,
  },

  flat_CEIL3_3 =
  {
    CEIL3_3 = 4,
    CEIL3_5 = 4,
    CEIL4_1 = 1,
    CEIL4_2 = 1,
    CEIL4_3 = 1,
    CEIL5_1 = 4,
    CEIL5_2 = 4,

    FLAT1 = 4,
    FLAT3 = 4,
    FLAT4 = 4,
    FLAT5 = 4,
    FLOOR0_1 = 3,
    FLOOR0_2 = 3,
    FLOOR0_3 = 3,
    FLOOR0_5 = 3,
    FLOOR4_5 = 4,
    FLOOR4_6 = 4,
    FLOOR4_8 = 4,
    FLOOR5_3 = 4,
    FLOOR7_1 = 4,
    SLIME14 = 4,
    SLIME16 = 4
  },

  tex_COMPWERD =
  {
    COMPWERD = 2,
    PIPEWAL1 = 2,
    MODWALL2 = 1,
    MODWALL3 = 1,
    TEKLITE = 2,
    TEKLITE2 = 2,
    TEKWALL1 = 2,
    TEKWALL4 = 2
  }
}

PREFABS.Item_gtd_closet_simple_1_SW =
{
  template = "Item_gtd_closet_simple_1",
  map = "MAP02"
}

PREFABS.Item_gtd_closet_simple_2 =
{
  template = "Item_gtd_closet_simple_1",
  map = "MAP03",

  y_fit = "top",

  seed_h = 2
}

PREFABS.Item_gtd_closet_simple_2_SW =
{
  template = "Item_gtd_closet_simple_1",
  map = "MAP06",

  y_fit = "top",

  seed_h = 2
}

PREFABS.Item_gtd_closet_simple_3 =
{
  template = "Item_gtd_closet_simple_1",
  map = "MAP04",

  y_fit = "top",
  z_fit = {92,94},

  bound_z1 = 0,
  bound_z2 = 104
}

PREFABS.Item_gtd_closet_simple_4 =
{
  template = "Item_gtd_closet_simple_1",
  map = "MAP05",

  y_fit = "top",
  z_fit = {92,94},

  bound_z1 = 0,
  bound_z2 = 104
}

PREFABS.Item_gtd_closet_simple_5 =
{
  template = "Item_gtd_closet_simple_1",
  map = "MAP07",

  y_fit = "top",
  x_fit = {40,88 , 168,216},

  tex_LITE3 = "LITE3"
}

PREFABS.Item_gtd_closet_simple_6 =
{
  template = "Item_gtd_closet_simple_1",
  map = "MAP08",

  y_fit = "top",
  x_fit = {72,88 , 168,184},
}

PREFABS.Item_gtd_closet_simple_7 =
{
  template = "Item_gtd_closet_simple_1",
  map = "MAP09",

  y_fit = "top",
  x_fit = "frame"
}

PREFABS.Item_gtd_closet_simple_8 =
{
  template = "Item_gtd_closet_simple_1",
  map = "MAP10",

  y_fit = "top",
  x_fit = "frame",
}
