--
-- Wall with gap at bottom
--

----------- TECH THEME -------------------------


PREFABS.Wall_lowgap =
{
  file   = "wall/low_gap.wad",
  map    = "MAP01",

  prob   = 50,
  group  = "low_gap",
  theme  = "tech",

  where  = "edge",
  deep   = 16,
  height = 64,

  bound_z1 = 0,
  bound_z2 = 64,

  z_fit  = "top",
}


PREFABS.Wall_lowgap_diag =
{
  file   = "wall/low_gap.wad",
  map    = "MAP02",

  prob   = 50,
  group  = "low_gap",
  theme  = "tech",

  where  = "diagonal",
  height = 64,

  bound_z1 = 0,
  bound_z2 = 64,

  z_fit  = "top",
}


PREFABS.Wall_lowgap_innerdiag =
{
  file = "wall/low_gap.wad",
  map = "MAP04",

  prob = 50,
  group = "low_gap",
  theme = "tech",

  where = "inner_diagonal",
  height = 64,

  bound_z1 = 0,
  bound_z2 = 64,

  z_fit = "top",
}


PREFABS.Wall_lowgap2 =
{
  template = "Wall_lowgap",

  group = "low_gap2",

  tex_TEKWALL4 = "TEKBRON2",
}

PREFABS.Wall_lowgap2_diag =
{
  template = "Wall_lowgap_diag",
  map = "MAP03",

  group = "low_gap2",

  tex_TEKWALL4 = "TEKBRON2",
}


PREFABS.Wall_lowgap3 =
{
  template = "Wall_lowgap",

  group = "low_gap3",

  tex_TEKWALL4 = "METAL6",
}

PREFABS.Wall_lowgap3_diag =
{
  template = "Wall_lowgap_diag",
  map = "MAP03",

  group = "low_gap3",

  tex_TEKWALL4 = "METAL6",
}

PREFABS.Wall_techgap =
{
  template = "Wall_lowgap",

  group = "low_gap4",

  theme = "tech",

  tex_TEKWALL4 = "TEKWALL1",
}


PREFABS.Wall_techgap_diag =
{
  template = "Wall_lowgap_diag",

  group = "low_gap4",

  theme = "tech",

  tex_TEKWALL4 = "TEKWALL1",
}

PREFABS.Wall_techgap2 =
{
  template = "Wall_lowgap",

  group = "low_gap5",

  theme = "tech",

  tex_TEKWALL4 = "LITE5",
}


PREFABS.Wall_techgap_diag2 =
{
  template = "Wall_lowgap_diag",

  group = "low_gap5",

  theme = "tech",

  tex_TEKWALL4 = "LITE5",
}

----------- HELL THEME -------------------------

PREFABS.Wall_hellgap =
{
  template = "Wall_lowgap",

  theme = "hell",

  group = "lowhell3",

  tex_TEKWALL4 = "FIREWALL",
}


PREFABS.Wall_hellgap_diag =
{
  template = "Wall_lowgap_diag",

  theme = "hell",

  group = "lowhell3",

  tex_TEKWALL4 = "FIREWALL",
}

PREFABS.Wall_hellgap2 =
{
  template = "Wall_lowgap",

  group = "lowhell1",

  theme = "hell",

  tex_TEKWALL4 = "SP_FACE2",
}


PREFABS.Wall_hellgap_diag2 =
{
  template = "Wall_lowgap_diag",

  theme = "hell",

  group = "lowhell1",

  tex_TEKWALL4 = "SP_FACE2",
}

PREFABS.Wall_hellgap3 =
{
  template = "Wall_lowgap",

  group = "lowhell2",

  theme = "hell",

  tex_TEKWALL4 = "SP_FACE1",
}


PREFABS.Wall_hellgap_diag3 =
{
  template = "Wall_lowgap_diag",

  group = "lowhell2",

  theme = "hell",

  tex_TEKWALL4 = "SP_FACE1",
}

--

PREFABS.Wall_lowgap_EPIC =
{
  file   = "wall/low_gap.wad",
  map    = "MAP10",

  prob   = 50,
  group  = "low_gap_EPIC",
  theme  = "tech",
  rank = 2,

  where  = "edge",
  deep   = 16,
  height = 64,

  bound_z1 = 0,
  bound_z2 = 64,

  z_fit  = "top",
}

PREFABS.Wall_lowgap_EPIC_gothic =
{
  template = "Wall_lowgap_EPIC",

  theme  = "!tech",
  rank = 1,

  tex_T_HLITEB = "T_HLITEY"
}

PREFABS.Wall_lowgap_EPIC_diag  =
{
  template = "Wall_lowgap_EPIC",
  map = "MAP11",

  theme  = "tech",
  rank = 2,

  where = "diagonal",
}

PREFABS.Wall_lowgap_EPIC_gothic_diag =
{
  template = "Wall_lowgap_EPIC",
  map = "MAP11",

  theme  = "!tech",
  rank = 1,

  where = "diagonal",

  tex_T_HLITEB = "T_HLITEY"
}

--

PREFABS.Wall_lowgap_alt_EPIC =
{
  template = "Wall_lowgap_EPIC",

  theme  = "tech",
  group  = "low_gap_EPIC_alt",
  rank = 1,

  tex_T_HLITEB = "T_HLITEY"
}

PREFABS.Wall_lowgap_EPIC_alt_gothic =
{
  template = "Wall_lowgap_EPIC",

  theme  = "!tech",
  group  = "low_gap_EPIC_alt",
  rank = 2,

  tex_T_HLITEB = "T_HLITER"
}

PREFABS.Wall_lowgap_EPIC_alt_diag  =
{
  template = "Wall_lowgap_EPIC",
  map = "MAP11",

  theme  = "tech",
  group  = "low_gap_EPIC_alt",
  rank = 1,

  where = "diagonal",

  tex_T_HLITEB = "T_HLITEY"
}

PREFABS.Wall_lowgap_EPIC_gothic_alt_diag =
{
  template = "Wall_lowgap_EPIC",
  map = "MAP11",

  theme  = "!tech",
  group  = "low_gap_EPIC_alt",
  rank = 2,

  where = "diagonal",

  tex_T_HLITEB = "T_HLITER"
}
