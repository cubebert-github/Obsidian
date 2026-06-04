PREFABS.Pic_gtd_mall_store_1 =
{
  file = "picture/gtd_pic_urban_mall_set.wad",
  map = "MAP01",

  prob = 50,
  theme = "urban",

  group = "gtd_shopping_mall",

  where = "seeds",
  height = 128,

  seed_w = 2,
  seed_h = 1,

  deep = 16,

  bound_z1 = 0,
  bound_z2 = 128,

  x_fit = { 60,68 , 124,132 , 188,196 },
  y_fit = "top",

  tex_METAL1 =
  {
    METAL1 = 1, BRONZE6 = 1, ASHWALL6 = 1,
    BRICK11 = 0.5, BRICK12 = 0.5, BRICK2 = 1,
    GRAY1 = 1, GSTONE1 = 1, STARG3 = 1,
    STUCCO = 0.5, STUCCO1 = 0.5, TANROCK2 = 1,
    SLADWALL = 1
  },

  tex_MODWALL4 =
  {
    MODWALL4 = 1, MODWALL3 = 1
  },

  tex_LITE5 =
  {
    LITE3 = 1, LITE5 = 1, LITEBLU4 = 1
  }
}

PREFABS.Pic_gtd_mall_store_2 =
{
  template = "Pic_gtd_mall_store_1",
  map = "MAP02",

  tex_MODWALL3 =
  {
    MODWALL3 = 1, MODWALL4 = 1,
    STEP1 = 1, STEP2 = 1, STEP3 = 1, STEP4 = 1,
    STEP5 = 1, STEPLAD = 1, STEPTOP = 1
  }
}

PREFABS.Pic_gtd_mall_store_3 =
{
  template = "Pic_gtd_mall_store_1",
  map = "MAP03",

  tex_MODWALL3 =
  {
    MODWALL3 = 1, MODWALL4 = 1,
    STEP1 = 1, STEP2 = 1, STEP3 = 1, STEP4 = 1,
    STEP5 = 1, STEPLAD = 1, STEPTOP = 1
  }
}

PREFABS.Pic_gtd_mall_store_EPIC =
{
  template = "Pic_gtd_mall_store_1",
  map = "MAP04",

  texture_pack = "armaetus",

  tex_DNSTOR01 =
  {
    MODWALL3 = 1, MODWALL4 = 1,
    STEP1 = 1, STEP2 = 1, STEP3 = 1, STEP4 = 1,
    STEP5 = 1, STEPLAD = 1, STEPTOP = 1,

    DNSTOR01 = 2, DNSTOR02 = 2,
    DNSTOR03 = 2, DNSTOR04 = 2,
    DNSTOR05 = 2, DNSTOR06 = 2,
    DNSTOR07 = 2, DNSTOR08 = 2,
    DNSTOR12 = 2, DNSTOR13 = 2,
    DNSTOR20 = 2
  }
}
