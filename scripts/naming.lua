------------------------------------------------------------------------
--  Name Generator
------------------------------------------------------------------------
--
--  // Obsidian //
--
--  Copyright (C) 2008-2018 Andrew Apted
--  Copyright (C) 2008-2009 Jon Vail
--  Copyright (C)      2009 Enhas
--  Copyright (C) 2010-2022 Reisal
--  Copyright (C) 2010-2022 MsrSgtShooterPerson
--  Copyright (C) 2020 EpicTyphlosion
--
--  This program is free software; you can redistribute it and/or
--  modify it under the terms of the GNU General Public License
--  as published by the Free Software Foundation; either version 2,
--  of the License, or (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
------------------------------------------------------------------------
--
--  Thanks to Jon Vail (a.k.a JohnnyRancid/40oz) who contributed
--  many of the complete level names and lots of cool words.
--
--  Thanks to Enhas and Reisal for their additions.
--
------------------------------------------------------------------------

namelib = {}


namelib.NAMES = {}


----------------------------------------------------------------


namelib.IGNORE_WORDS =
{
  ["the"]=1, ["a"]=1,  ["an"]=1, ["of"]=1, ["s"]=1,
  ["for"]=1, ["in"]=1, ["on"]=1, ["to"]=1
}

namelib.COMMUNITY_MEMBERS =
{

  -- Core Obsidian or regular(ish) contributors.
  contributors =
  {
    "Reisal", -- Used to be known as Glaice
    "Beed 28",
    "Caligari", --Caligari87,
    "Craneo",
    "Dasho", --dashodanger
    "Demios",
    "EpicTyphlosion",
    "Frozsoul",
    "Garrett",
    "MogWaltz",
    "Josh Seven", --josh771,
    "Phytolizer",
    "Sgt. Shooter", --MsrSgtShooterPerson
    "Simon Vee", --Simon-v
    "Scionox",
    "Swedra",
    "Tapwave",
  },

  -- These people helped out OBLIGE and how they contributed.
  oblige_folks =
  {
    "Andrew Apted", -- THE developer of OBLIGE. Obsidian would not exist without him!
    "Dittohead", -- Made some prefabs
    "Doctor Nick", -- The Makefile MacOS file
    "Enhas", -- Lots of stuff. Modules, Psychedelic names, a boss map, feedback, fixes/tweaks
    "blackjar", -- Hexen theming
    "40oz", -- Tons of work on this very file, Cyberdemon arena map, some Doom prefabs
    "LakiSoft", -- Made a Heretic boss map
    "SylandroProbopas", -- Doom1 boss map
    "DoomJedi", -- Older V2/V3(?) Wolf3D testing, graphics and listing of Wolfenstein mods
    "esselfortium", -- General encouragement and detailed feedback
    "gggmork", -- Beta testing WIP versions and detailed feedback
    "flyingdeath", -- Lots of feedback and suggestions, namely seen on the forums
    "leilei", -- Base Amulets & Armor definition and general feedback
    "Maxim Samoylenko", -- General encouragement and testing
    "thesleeve", -- Monster placement analysis
    "Samiam" -- Mr. ObHack!
  },

  regulars =
  {
    "Brad Man X",
    "Mr. Liden",
    "Magpie",

    -- following folks have not been active since 2025, but that's fine
    "Dan the Noob",
    "Monika",
    "TTBNC"
  }
}

namelib.HUMAN_NAMES =
{
  f =
  {
    ["A."] = 14,
    ["J."] = 11,
    ["M."] = 7,
    ["C."] = 6,
    ["E."] = 6,
    ["L."] = 6,
    ["K."] = 6,
    ["S."] = 5,
    ["B."] = 5,
    ["D."] = 4,
    ["R."] = 4,
    ["T."] = 3,
    ["N."] = 3,
    ["G."] = 3,
    ["H."] = 3,
    ["I."] = 3,
    ["P."] = 2,
    ["Z."] = 2,
    ["O."] = 2,
    ["W."] = 2,
    ["V."] = 2,
    ["F."] = 2,
    ["Y."] = 2,
    ["X."] = 1,
    ["Q."] = 1,
    ["U."] = 1
  },

  l =
  {
    Smith     = 1,
    Johnson     = 1,
    Williams     = 1,
    Jones     = 1,
    Brown     = 1,
    Davis     = 1,
    Miller     = 1,
    Wilson     = 1,
    Moore     = 1,
    Taylor     = 1,
    Anderson     = 1,
    Thomas     = 1,
    Jackson     = 1,
    White     = 1,
    Harris     = 1,
    Martin     = 1,
    Thompson     = 1,
    Garcia     = 1,
    Martinez     = 1,
    Robinson     = 1,
    Clark     = 1,
    Rodriguez     = 1,
    Lewis     = 1,
    Lee     = 1,
    Walker     = 1,
    Hall     = 1,
    Allen     = 1,
    Young     = 1,
    Hernandez     = 1,
    King     = 1,
    Wright     = 1,
    Lopez     = 1,
    Hill     = 1,
    Scott     = 1,
    Green     = 1,
    Adams     = 1,
    Baker     = 1,
    Gonzalez     = 1,
    Nelson     = 1,
    Carter     = 1,
    Mitchell     = 1,
    Perez     = 1,
    Roberts     = 1,
    Turner     = 1,
    Phillips     = 1,
    Campbell     = 1,
    Parker     = 1,
    Evans     = 1,
    Edwards     = 1,
    Collins     = 1,
    Stewart     = 1,
    Sanchez     = 1,
    Morris     = 1,
    Rogers     = 1,
    Reed     = 1,
    Cook     = 1,
    Morgan     = 1,
    Bell     = 1,
    Murphy     = 1,
    Bailey     = 1,
    Rivera     = 1,
    Cooper     = 1,
    Richardson     = 1,
    Cox     = 1,
    Howard     = 1,
    Ward     = 1,
    Torres     = 1,
    Peterson     = 1,
    Gray     = 1,
    Ramirez     = 1,
    James     = 1,
    Watson     = 1,
    Brooks     = 1,
    Kelly     = 1,
    Sanders     = 1,
    Price     = 1,
    Bennett     = 1,
    Wood     = 1,
    Barnes     = 1,
    Ross     = 1,
    Henderson     = 1,
    Coleman     = 1,
    Jenkins     = 1,
    Perry     = 1,
    Powell     = 1,
    Long     = 1,
    Patterson     = 1,
    Hughes     = 1,
    Flores     = 1,
    Washington     = 1,
    Butler     = 1,
    Simmons     = 1,
    Foster     = 1,
    Gonzales     = 1,
    Bryant     = 1,
    Alexander     = 1,
    Russell     = 1,
    Griffin     = 1,
    Diaz     = 1,
    Hayes     = 1,
    Myers     = 1,
    Ford     = 1,
    Hamilton     = 1,
    Graham     = 1,
    Sullivan     = 1,
    Wallace     = 1,
    Woods     = 1,
    Cole     = 1,
    West     = 1,
    Jordan     = 1,
    Owens     = 1,
    Reynolds     = 1,
    Fisher     = 1,
    Ellis     = 1,
    Harrison     = 1,
    Gibson     = 1,
    Mcdonald     = 1,
    Cruz     = 1,
    Marshall     = 1,
    Ortiz     = 1,
    Gomez     = 1,
    Murray     = 1,
    Freeman     = 1,
    Wells     = 1,
    Webb     = 1,
    Simpson     = 1,
    Stevens     = 1,
    Tucker     = 1,
    Porter     = 1,
    Hunter     = 1,
    Hicks     = 1,
    Crawford     = 1,
    Henry     = 1,
    Boyd     = 1,
    Mason     = 1,
    Morales     = 1,
    Kennedy     = 1,
    Warren     = 1,
    Dixon     = 1,
    Ramos     = 1,
    Reyes     = 1,
    Burns     = 1,
    Gordon     = 1,
    Shaw     = 1,
    Holmes     = 1,
    Rice     = 1,
    Robertson     = 1,
    Hunt     = 1,
    Black     = 1,
    Daniels     = 1,
    Palmer     = 1,
    Mills     = 1,
    Nichols     = 1,
    Grant     = 1,
    Knight     = 1,
    Ferguson     = 1,
    Rose     = 1,
    Stone     = 1,
    Hawkins     = 1,
    Dunn     = 1,
    Perkins     = 1,
    Hudson     = 1,
    Spencer     = 1,
    Gardner     = 1,
    Stephens     = 1,
    Payne     = 1,
    Pierce     = 1,
    Berry     = 1,
    Matthews     = 1,
    Arnold     = 1,
    Wagner     = 1,
    Willis     = 1,
    Ray     = 1,
    Watkins     = 1,
    Olson     = 1,
    Carroll     = 1,
    Duncan     = 1,
    Snyder     = 1,
    Hart     = 1,
    Cunningham     = 1,
    Bradley     = 1,
    Lane     = 1,
    Andrews     = 1,
    Ruiz     = 1,
    Harper     = 1,
    Fox     = 1,
    Riley     = 1,
    Armstrong     = 1,
    Carpenter     = 1,
    Weaver     = 1,
    Greene     = 1,
    Lawrence     = 1,
    Elliott     = 1,
    Chavez     = 1,
    Sims     = 1,
    Austin     = 1,
    Peters     = 1,
    Kelley     = 1,
    Franklin     = 1,
    Lawson     = 1,
    Fields     = 1,
    Gutierrez     = 1,
    Ryan     = 1,
    Schmidt     = 1,
    Carr     = 1,
    Vasquez     = 1,
    Castillo     = 1,
    Wheeler     = 1,
    Chapman     = 1,
    Oliver     = 1,
    Montgomery     = 1,
    Richards     = 1,
    Williamson     = 1,
    Johnston     = 1,
    Banks     = 1,
    Meyer     = 1,
    Bishop     = 1,
    Mccoy     = 1,
    Howell     = 1,
    Alvarez     = 1,
    Morrison     = 1,
    Hansen     = 1,
    Fernandez     = 1,
    Garza     = 1,
    Harvey     = 1,
    Little     = 1,
    Burton     = 1,
    Stanley     = 1,
    Nguyen     = 1,
    George     = 1,
    Jacobs     = 1,
    Reid     = 1,
    Kim     = 1,
    Fuller     = 1,
    Lynch     = 1,
    Dean     = 1,
    Gilbert     = 1,
    Garrett     = 1,
    Romero     = 1,
    Welch     = 1,
    Larson     = 1,
    Frazier     = 1,
    Burke     = 1,
    Hanson     = 1,
    Day     = 1,
    Mendoza     = 1,
    Moreno     = 1,
    Bowman     = 1,
    Medina     = 1,
    Fowler     = 1,
    Brewer     = 1,
    Hoffman     = 1,
    Carlson     = 1,
    Silva     = 1,
    Pearson     = 1,
    Holland     = 1,
    Douglas     = 1,
    Fleming     = 1,
    Jensen     = 1,
    Vargas     = 1,
    Byrd     = 1,
    Davidson     = 1,
    Hopkins     = 1,
    May     = 1,
    Terry     = 1,
    Herrera     = 1,
    Wade     = 1,
    Soto     = 1,
    Walters     = 1,
    Curtis     = 1,
    Neal     = 1,
    Caldwell     = 1,
    Lowe     = 1,
    Jennings     = 1,
    Barnett     = 1,
    Graves     = 1,
    Jimenez     = 1,
    Horton     = 1,
    Shelton     = 1,
    Barrett     = 1,
    Obrien     = 1,
    Castro     = 1,
    Sutton     = 1,
    Gregory     = 1,
    Mckinney     = 1,
    Lucas     = 1,
    Miles     = 1,
    Craig     = 1,
    Rodriquez     = 1,
    Chambers     = 1,
    Holt     = 1,
    Lambert     = 1,
    Fletcher     = 1,
    Watts     = 1,
    Bates     = 1,
    Hale     = 1,
    Rhodes     = 1,
    Pena     = 1,
    Beck     = 1,
    Newman     = 1,
    Haynes     = 1,
    Mcdaniel     = 1,
    Mendez     = 1,
    Bush     = 1,
    Vaughn     = 1,
    Parks     = 1,
    Dawson     = 1,
    Santiago     = 1,
    Norris     = 1,
    Hardy     = 1,
    Love     = 1,
    Steele     = 1,
    Curry     = 1,
    Powers     = 1,
    Schultz     = 1,
    Barker     = 1,
    Guzman     = 1,
    Page     = 1,
    Munoz     = 1,
    Ball     = 1,
    Keller     = 1,
    Chandler     = 1,
    Weber     = 1,
    Leonard     = 1,
    Walsh     = 1,
    Lyons     = 1,
    Ramsey     = 1,
    Wolfe     = 1,
    Schneider     = 1,
    Mullins     = 1,
    Benson     = 1,
    Sharp     = 1,
    Bowen     = 1,
    Daniel     = 1,
    Barber     = 1,
    Cummings     = 1,
    Hines     = 1,
    Baldwin     = 1,
    Griffith     = 1,
    Valdez     = 1,
    Hubbard     = 1,
    Salazar     = 1,
    Reeves     = 1,
    Warner     = 1,
    Stevenson     = 1,
    Burgess     = 1,
    Santos     = 1,
    Tate     = 1,
    Cross     = 1,
    Garner     = 1,
    Mann     = 1,
    Mack     = 1,
    Moss     = 1,
    Thornton     = 1,
    Dennis     = 1,
    Mcgee     = 1,
    Farmer     = 1,
    Delgado     = 1,
    Aguilar     = 1,
    Vega     = 1,
    Glover     = 1,
    Manning     = 1,
    Cohen     = 1,
    Harmon     = 1,
    Rodgers     = 1,
    Robbins     = 1,
    Newton     = 1,
    Todd     = 1,
    Blair     = 1,
    Higgins     = 1,
    Ingram     = 1,
    Reese     = 1,
    Cannon     = 1,
    Strickland     = 1,
    Townsend     = 1,
    Potter     = 1,
    Goodwin     = 1,
    Walton     = 1,
    Rowe     = 1,
    Hampton     = 1,
    Ortega     = 1,
    Patton     = 1,
    Swanson     = 1,
    Joseph     = 1,
    Francis     = 1,
    Goodman     = 1,
    Maldonado     = 1,
    Yates     = 1,
    Becker     = 1,
    Erickson     = 1,
    Hodges     = 1,
    Rios     = 1,
    Conner     = 1,
    Adkins     = 1,
    Webster     = 1,
    Norman     = 1,
    Malone     = 1,
    Hammond     = 1,
    Flowers     = 1,
    Cobb     = 1,
    Moody     = 1,
    Quinn     = 1,
    Blake     = 1,
    Maxwell     = 1,
    Pope     = 1,
    Floyd     = 1,
    Osborne     = 1,
    Paul     = 1,
    Mccarthy     = 1,
    Guerrero     = 1,
    Lindsey     = 1,
    Estrada     = 1,
    Sandoval     = 1,
    Gibbs     = 1,
    Tyler     = 1,
    Gross     = 1,
    Fitzgerald     = 1,
    Stokes     = 1,
    Doyle     = 1,
    Sherman     = 1,
    Saunders     = 1,
    Wise     = 1,
    Colon     = 1,
    Gill     = 1,
    Alvarado     = 1,
    Greer     = 1,
    Padilla     = 1,
    Simon     = 1,
    Waters     = 1,
    Nunez     = 1,
    Ballard     = 1,
    Schwartz     = 1,
    Mcbride     = 1,
    Houston     = 1,
    Christensen     = 1,
    Klein     = 1,
    Pratt     = 1,
    Briggs     = 1,
    Parsons     = 1,
    Mclaughlin     = 1,
    Zimmerman     = 1,
    French     = 1,
    Buchanan     = 1,
    Moran     = 1,
    Copeland     = 1,
    Roy     = 1,
    Pittman     = 1,
    Brady     = 1,
    Mccormick     = 1,
    Holloway     = 1,
    Brock     = 1,
    Poole     = 1,
    Frank     = 1,
    Logan     = 1,
    Owen     = 1,
    Bass     = 1,
    Marsh     = 1,
    Drake     = 1,
    Wong     = 1,
    Jefferson     = 1,
    Park     = 1,
    Morton     = 1,
    Abbott     = 1,
    Sparks     = 1,
    Patrick     = 1,
    Norton     = 1,
    Huff     = 1,
    Clayton     = 1,
    Massey     = 1,
    Lloyd     = 1,
    Figueroa     = 1,
    Carson     = 1,
    Bowers     = 1,
    Roberson     = 1,
    Barton     = 1,
    Tran     = 1,
    Lamb     = 1,
    Harrington     = 1,
    Casey     = 1,
    Boone     = 1,
    Cortez     = 1,
    Clarke     = 1,
    Mathis     = 1,
    Singleton     = 1,
    Wilkins     = 1,
    Cain     = 1,
    Bryan     = 1,
    Underwood     = 1,
    Hogan     = 1,
    Mckenzie     = 1,
    Collier     = 1,
    Luna     = 1,
    Phelps     = 1,
    Mcguire     = 1,
    Allison     = 1,
    Bridges     = 1,
    Wilkerson     = 1,
    Nash     = 1,
    Summers     = 1,
    Atkins     = 1,
    Wilcox     = 1,
    Pitts     = 1,
    Conley     = 1,
    Marquez     = 1,
    Burnett     = 1,
    Richard     = 1,
    Cochran     = 1,
    Chase     = 1,
    Davenport     = 1,
    Hood     = 1,
    Gates     = 1,
    Clay     = 1,
    Ayala     = 1,
    Sawyer     = 1,
    Roman     = 1,
    Vazquez     = 1,
    Dickerson     = 1,
    Hodge     = 1,
    Acosta     = 1,
    Flynn     = 1,
    Espinoza     = 1,
    Nicholson     = 1,
    Monroe     = 1,
    Wolf     = 1,
    Morrow     = 1,
    Kirk     = 1,
    Randall     = 1,
    Anthony     = 1,
    Whitaker     = 1,
    Oconnor     = 1,
    Skinner     = 1,
    Ware     = 1,
    Molina     = 1,
    Kirby     = 1,
    Huffman     = 1,
    Bradford     = 1,
    Charles     = 1,
    Gilmore     = 1,
    Dominguez     = 1,
    Oneal     = 1,
    Bruce     = 1,
    Lang     = 1,
    Combs     = 1,
    Kramer     = 1,
    Heath     = 1,
    Hancock     = 1,
    Gallagher     = 1,
    Gaines     = 1,
    Shaffer     = 1,
    Short     = 1,
    Wiggins     = 1,
    Mathews     = 1,
    Mcclain     = 1,
    Fischer     = 1,
    Wall     = 1,
    Small     = 1,
    Melton     = 1,
    Hensley     = 1,
    Bond     = 1,
    Dyer     = 1,
    Cameron     = 1,
    Grimes     = 1,
    Contreras     = 1,
    Christian     = 1,
    Wyatt     = 1,
    Baxter     = 1,
    Snow     = 1,
    Mosley     = 1,
    Shepherd     = 1,
    Larsen     = 1,
    Hoover     = 1,
    Beasley     = 1,
    Glenn     = 1,
    Petersen     = 1,
    Whitehead     = 1,
    Meyers     = 1,
    Keith     = 1,
    Garrison     = 1,
    Vincent     = 1,
    Shields     = 1,
    Horn     = 1,
    Savage     = 1,
    Olsen     = 1,
    Schroeder     = 1,
    Hartman     = 1,
    Woodard     = 1,
    Mueller     = 1,
    Kemp     = 1,
    Deleon     = 1,
    Booth     = 1,
    Patel     = 1,
    Calhoun     = 1,
    Wiley     = 1,
    Eaton     = 1,
    Cline     = 1,
    Navarro     = 1,
    Harrell     = 1,
    Lester     = 1,
    Humphrey     = 1,
    Parrish     = 1,
    Duran     = 1,
    Hutchinson     = 1,
    Hess     = 1,
    Dorsey     = 1,
    Bullock     = 1,
    Robles     = 1,
    Beard     = 1,
    Dalton     = 1,
    Avila     = 1,
    Vance     = 1,
    Rich     = 1,
    Blackwell     = 1,
    York     = 1,
    Johns     = 1,
    Blankenship     = 1,
    Trevino     = 1,
    Salinas     = 1,
    Campos     = 1,
    Pruitt     = 1,
    Moses     = 1,
    Callahan     = 1,
    Golden     = 1,
    Montoya     = 1,
    Hardin     = 1,
    Guerra     = 1,
    Mcdowell     = 1,
    Carey     = 1,
    Stafford     = 1,
    Gallegos     = 1,
    Henson     = 1,
    Wilkinson     = 1,
    Booker     = 1,
    Merritt     = 1,
    Miranda     = 1,
    Atkinson     = 1,
    Orr     = 1,
    Decker     = 1,
    Hobbs     = 1,
    Preston     = 1,
    Tanner     = 1,
    Knox     = 1,
    Pacheco     = 1,
    Stephenson     = 1,
    Glass     = 1,
    Rojas     = 1,
    Serrano     = 1,
    Marks     = 1,
    Hickman     = 1,
    English     = 1,
    Sweeney     = 1,
    Strong     = 1,
    Prince     = 1,
    Mcclure     = 1,
    Conway     = 1,
    Walter     = 1,
    Roth     = 1,
    Maynard     = 1,
    Farrell     = 1,
    Lowery     = 1,
    Hurst     = 1,
    Nixon     = 1,
    Weiss     = 1,
    Trujillo     = 1,
    Ellison     = 1,
    Sloan     = 1,
    Juarez     = 1,
    Winters     = 1,
    Mclean     = 1,
    Randolph     = 1,
    Leon     = 1,
    Boyer     = 1,
    Villarreal     = 1,
    Mccall     = 1,
    Gentry     = 1,
    Carrillo     = 1,
    Kent     = 1,
    Ayers     = 1,
    Lara     = 1,
    Shannon     = 1,
    Sexton     = 1,
    Pace     = 1,
    Hull     = 1,
    Leblanc     = 1,
    Browning     = 1,
    Velasquez     = 1,
    Leach     = 1,
    Chang     = 1,
    House     = 1,
    Sellers     = 1,
    Herring     = 1,
    Noble     = 1,
    Foley     = 1,
    Bartlett     = 1,
    Mercado     = 1,
    Landry     = 1,
    Durham     = 1,
    Walls     = 1,
    Barr     = 1,
    Mckee     = 1,
    Bauer     = 1,
    Rivers     = 1,
    Everett     = 1,
    Bradshaw     = 1,
    Pugh     = 1,
    Velez     = 1,
    Rush     = 1,
    Estes     = 1,
    Dodson     = 1,
    Morse     = 1,
    Sheppard     = 1,
    Weeks     = 1,
    Camacho     = 1,
    Bean     = 1,
    Barron     = 1,
    Livingston     = 1,
    Middleton     = 1,
    Spears     = 1,
    Branch     = 1,
    Blevins     = 1,
    Chen     = 1,
    Kerr     = 1,
    Mcconnell     = 1,
    Hatfield     = 1,
    Harding     = 1,
    Ashley     = 1,
    Solis     = 1,
    Herman     = 1,
    Frost     = 1,
    Giles     = 1,
    Blackburn     = 1,
    William     = 1,
    Pennington     = 1,
    Woodward     = 1,
    Finley     = 1,
    Mcintosh     = 1,
    Koch     = 1,
    Best     = 1,
    Solomon     = 1,
    Mccullough     = 1,
    Dudley     = 1,
    Nolan     = 1,
    Blanchard     = 1,
    Rivas     = 1,
    Brennan     = 1,
    Mejia     = 1,
    Kane     = 1,
    Benton     = 1,
    Joyce     = 1,
    Buckley     = 1,
    Haley     = 1,
    Valentine     = 1,
    Maddox     = 1,
    Russo     = 1,
    Mcknight     = 1,
    Buck     = 1,
    Moon     = 1,
    Mcmillan     = 1,
    Crosby     = 1,
    Berg     = 1,
    Dotson     = 1,
    Mays     = 1,
    Roach     = 1,
    Church     = 1,
    Chan     = 1,
    Richmond     = 1,
    Meadows     = 1,
    Faulkner     = 1,
    Oneill     = 1,
    Knapp     = 1,
    Kline     = 1,
    Barry     = 1,
    Ochoa     = 1,
    Jacobson     = 1,
    Gay     = 1,
    Avery     = 1,
    Hendricks     = 1,
    Horne     = 1,
    Shepard     = 1,
    Hebert     = 1,
    Cherry     = 1,
    Cardenas     = 1,
    Mcintyre     = 1,
    Whitney     = 1,
    Waller     = 1,
    Holman     = 1,
    Donaldson     = 1,
    Cantu     = 1,
    Terrell     = 1,
    Morin     = 1,
    Gillespie     = 1,
    Fuentes     = 1,
    Tillman     = 1,
    Sanford     = 1,
    Bentley     = 1,
    Peck     = 1,
    Key     = 1,
    Salas     = 1,
    Rollins     = 1,
    Gamble     = 1,
    Dickson     = 1,
    Battle     = 1,
    Santana     = 1,
    Cabrera     = 1,
    Cervantes     = 1,
    Howe     = 1,
    Hinton     = 1,
    Hurley     = 1,
    Spence     = 1,
    Zamora     = 1,
    Yang     = 1,
    Mcneil     = 1,
    Suarez     = 1,
    Case     = 1,
    Petty     = 1,
    Gould     = 1,
    Mcfarland     = 1,
    Sampson     = 1,
    Carver     = 1,
    Bray     = 1,
    Rosario     = 1,
    Macdonald     = 1,
    Stout     = 1,
    Hester     = 1,
    Melendez     = 1,
    Dillon     = 1,
    Farley     = 1,
    Hopper     = 1,
    Galloway     = 1,
    Potts     = 1,
    Bernard     = 1,
    Joyner     = 1,
    Stein     = 1,
    Aguirre     = 1,
    Osborn     = 1,
    Mercer     = 1,
    Bender     = 1,
    Franco     = 1,
    Rowland     = 1,
    Sykes     = 1,
    Benjamin     = 1,
    Travis     = 1,
    Pickett     = 1,
    Crane     = 1,
    Sears     = 1,
    Mayo     = 1,
    Dunlap     = 1,
    Hayden     = 1,
    Wilder     = 1,
    Mckay     = 1,
    Coffey     = 1,
    Mccarty     = 1,
    Ewing     = 1,
    Cooley     = 1,
    Vaughan     = 1,
    Bonner     = 1,
    Cotton     = 1,
    Holder     = 1,
    Stark     = 1,
    Ferrell     = 1,
    Cantrell     = 1,
    Fulton     = 1,
    Lynn     = 1,
    Lott     = 1,
    Calderon     = 1,
    Rosa     = 1,
    Pollard     = 1,
    Hooper     = 1,
    Burch     = 1,
    Mullen     = 1,
    Fry     = 1,
    Riddle     = 1,
    Levy     = 1,
    David     = 1,
    Duke     = 1,
    Odonnell     = 1,
    Guy     = 1,
    Michael     = 1,
    Britt     = 1,
    Frederick     = 1,
    Daugherty     = 1,
    Berger     = 1,
    Dillard     = 1,
    Alston     = 1,
    Jarvis     = 1,
    Frye     = 1,
    Riggs     = 1,
    Chaney     = 1,
    Odom     = 1,
    Duffy     = 1,
    Fitzpatrick     = 1,
    Valenzuela     = 1,
    Merrill     = 1,
    Mayer     = 1,
    Alford     = 1,
    Mcpherson     = 1,
    Acevedo     = 1,
    Donovan     = 1,
    Barrera     = 1,
    Albert     = 1,
    Cote     = 1,
    Reilly     = 1,
    Compton     = 1,
    Raymond     = 1,
    Mooney     = 1,
    Mcgowan     = 1,
    Craft     = 1,
    Cleveland     = 1,
    Clemons     = 1,
    Wynn     = 1,
    Nielsen     = 1,
    Baird     = 1,
    Stanton     = 1,
    Snider     = 1,
    Rosales     = 1,
    Bright     = 1,
    Witt     = 1,
    Stuart     = 1,
    Hays     = 1,
    Holden     = 1,
    Rutledge     = 1,
    Kinney     = 1,
    Clements     = 1,
    Castaneda     = 1,
    Slater     = 1,
    Hahn     = 1,
    Emerson     = 1,
    Conrad     = 1,
    Burks     = 1,
    Delaney     = 1,
    Pate     = 1,
    Lancaster     = 1,
    Sweet     = 1,
    Justice     = 1,
    Tyson     = 1,
    Sharpe     = 1,
    Whitfield     = 1,
    Talley     = 1,
    Macias     = 1,
    Irwin     = 1,
    Burris     = 1,
    Ratliff     = 1,
    Mccray     = 1,
    Madden     = 1,
    Kaufman     = 1,
    Beach     = 1,
    Goff     = 1,
    Cash     = 1,
    Bolton     = 1,
    Mcfadden     = 1,
    Levine     = 1,
    Good     = 1,
    Byers     = 1,
    Kirkland     = 1,
    Kidd     = 1,
    Workman     = 1,
    Carney     = 1,
    Dale     = 1,
    Mcleod     = 1,
    Holcomb     = 1,
    England     = 1,
    Finch     = 1,
    Head     = 1,
    Burt     = 1,
    Hendrix     = 1,
    Sosa     = 1,
    Haney     = 1,
    Franks     = 1,
    Sargent     = 1,
    Nieves     = 1,
    Downs     = 1,
    Rasmussen     = 1,
    Bird     = 1,
    Hewitt     = 1,
    Lindsay     = 1,
    Le     = 1,
    Foreman     = 1,
    Valencia     = 1,
    Oneil     = 1,
    Delacruz     = 1,
    Vinson     = 1,
    Dejesus     = 1,
    Hyde     = 1,
    Forbes     = 1,
    Gilliam     = 1,
    Guthrie     = 1,
    Wooten     = 1,
    Huber     = 1,
    Barlow     = 1,
    Boyle     = 1,
    Mcmahon     = 1,
    Buckner     = 1,
    Rocha     = 1,
    Puckett     = 1,
    Langley     = 1,
    Knowles     = 1,
    Cooke     = 1,
    Velazquez     = 1,
    Whitley     = 1,
    Noel     = 1,
    Vang     = 1
  },

  t =
  {
    AFK = 1,
    ALF = 1,
    Ace = 1,
    Adultman = 1,
    Alpha = 1,
    Android = 1,
    Angel = 1,
    Apex = 1,
    Apollo = 1,
    Arcade = 1,
    Atlas = 1,
    Axle = 1,
    Babe = 1,
    Babyface = 1,
    Ballsy = 1,
    Bananas = 1,
    Baron = 1,
    Beaks = 1,
    Beast = 1,
    Bebop = 1,
    Beef = 1,
    Beerhead = 1,
    Beetle = 1,
    Bishop = 1,
    Blinker = 1,
    Blitz = 1,
    Bobcat = 1,
    Bolts = 1,
    Bomber = 1,
    Bonus = 1,
    Bonzai = 1,
    Boogers = 1,
    Boomer = 1,
    Boots = 1,
    Bounce = 1,
    Brains = 1,
    Branch = 1,
    Breaker = 1,
    Brick = 1,
    Brute = 1,
    Buck = 1,
    Buddy = 1,
    Bug = 1,
    Bull = 1,
    Bully = 1,
    Bunnyhop = 1,
    Bush = 1,
    Buster = 1,
    Butcher = 1,
    Buzz = 1,
    Cake = 1,
    Caliban = 1,
    Cancelled = 1,
    Caper = 1,
    Cargo = 1,
    Cash = 1,
    Casino = 1,
    Caveman = 1,
    Chalk = 1,
    Checkmate = 1,
    Cheese = 1,
    Chef = 1,
    Chip = 1,
    Chips = 1,
    Chops = 1,
    Chum = 1,
    Civvy = 1,
    Clank = 1,
    Claymore = 1,
    Clopper = 1,
    Cobra = 1,
    Coffee = 1,
    Collateral = 1,
    Coma = 1,
    Combo = 1,
    Coney = 1,
    Congo = 1,
    Cook = 1,
    Cooties = 1,
    Cowboy = 1,
    Crash = 1,
    Crater = 1,
    Cub = 1,
    Cyclone = 1,
    Cyclops = 1,
    DJ = 1,
    ["Dadd'o'three"] = 1,
    Data = 1,
    Deacon = 1,
    Deadbolt = 1,
    Demon = 1,
    Desperado = 1,
    Dice = 1,
    Dicky = 1,
    Diesel = 1,
    Dinger = 1,
    Dino = 1,
    Disco = 1,
    Dizzy = 1,
    Doc = 1,
    Dog = 1,
    Doomsday = 1,
    Doot = 1,
    Double = 1,
    Dozer = 1,
    Drifter = 1,
    Dropout = 1,
    Dudebro = 1,
    Duke = 1,
    Dumpster = 1,
    Dutch = 1,
    Eagle = 1,
    Echo = 1,
    Egghead = 1,
    Electroviking = 1,
    Emo = 1,
    Enigma = 1,
    Ensign = 1,
    Expendable = 1,
    Eyebags = 1,
    Familyman = 1,
    FPS = 1,
    Fixer = 1,
    Flash = 1,
    Forklift = 1,
    Fox = 1,
    Freud = 1,
    Friendly = 1,
    Frog = 1,
    Fuzzyface = 1,
    Gangbanger = 1,
    Garrote = 1,
    Gassy = 1,
    Geronimo = 1,
    Ghost = 1,
    Gin = 1,
    Ginger = 1,
    Glasses = 1,
    Godfather = 1,
    Golem = 1,
    Gonzo = 1,
    Goose = 1,
    Granite = 1,
    Granny = 1,
    Gravedigger = 1,
    Grumble = 1,
    Gucci = 1,
    Gunner = 1,
    Guts = 1,
    Ham = 1,
    Hammer = 1,
    Hammerfist = 1,
    Hammerhead = 1,
    Hamster = 1,
    Hardcore = 1,
    Hazard = 1,
    Heaps = 1,
    Heartbreak = 1,
    Hex = 1,
    Hitch = 1,
    Hopps = 1,
    Horse = 1,
    Hotshot = 1,
    House = 1,
    Hulk = 1,
    Hutch = 1,
    Ice = 1,
    Icetea = 1,
    Inch = 1,
    Influencer = 1,
    Jabroni = 1,
    Jackhammer = 1,
    Jarhead = 1,
    Jaws = 1,
    Jock = 1,
    Joe = 1,
    Joker = 1,
    Jostler = 1,
    Judge = 1,
    Jughead = 1,
    Jumbo = 1,
    Jumper = 1,
    Junior = 1,
    Kickout = 1,
    Kingpin = 1,
    Knockout = 1,
    Kong = 1,
    Lacey = 1,
    Lance = 1,
    Lanky = 1,
    Lasagna = 1,
    Leather = 1,
    Leggy = 1,
    Lightning = 1,
    Lionheart = 1,
    Lockdown = 1,
    Loco = 1,
    Loki = 1,
    Longbow = 1,
    Lucky = 1,
    Lynch = 1,
    Mack = 1,
    Magic = 1,
    Marble = 1,
    Margarita = 1,
    Marvin = 1,
    Master = 1,
    Maverick = 1,
    Mayor = 1,
    Memelord = 1,
    Memer = 1,
    Missionary = 1,
    Money = 1,
    Moneyshot = 1,
    Mongol = 1,
    Monk = 1,
    Moon = 1,
    Moose = 1,
    Mouth = 1,
    Munchkin = 1,
    Murphy = 1,
    Mush = 1,
    Mustang = 1,
    Nasty = 1,
    Nemo = 1,
    Nero = 1,
    Newb = 1,
    Night= 1,
    Nitro = 1,
    Nix = 1,
    Nobby = 1,
    Noob = 1,
    Nova = 1,
    Nugget = 1,
    Nuke = 1,
    Nuts = 1,
    Odin = 1,
    Olivaw = 1,
    Omega = 1,
    Omelet = 1,
    Ouija = 1,
    Pacman = 1,
    Pathfinder = 1,
    Peso = 1,
    Pharaoh = 1,
    Pillbox = 1,
    Pinky = 1,
    Pipes = 1,
    Pitbull = 1,
    Player = 1,
    Plumber = 1,
    Pod = 1,
    Potato = 1,
    Pox = 1,
    President = 1,
    Price = 1,
    Priest = 1,
    Prince = 1,
    Professor = 1,
    Prophet = 1,
    Prototype = 1,
    Psycho = 1,
    Pugilist = 1,
    Puppy = 1,
    Pyro = 1,
    Quitter = 1,
    Radio = 1,
    Radiohead = 1,
    Rabbit = 1,
    Ragequit = 1,
    Rambo = 1,
    Ranger = 1,
    Rascal = 1,
    Rebel = 1,
    Rebound = 1,
    Red = 1,
    Redditor = 1,
    Regular = 1,
    Rhino = 1,
    Richter = 1,
    Rider = 1,
    Roach = 1,
    Roast = 1,
    Robby = 1,
    Rogue = 1,
    Rollback = 1,
    Romeo = 1,
    Rook = 1,
    Rookie = 1,
    Rotor = 1,
    Roundhouse = 1,
    Rubber = 1,
    Rum = 1,
    Ryle = 1,
    Sailor = 1,
    Saint = 1,
    Salsa = 1,
    Sandman = 1,
    Santa = 1,
    Saturn = 1,
    Scales = 1,
    Scambait = 1,
    Scarecrow = 1,
    Scat = 1,
    Scotch = 1,
    Sentinel = 1,
    Septic = 1,
    Shades = 1,
    Shadow = 1,
    Shady = 1,
    Sheriff = 1,
    Shield = 1,
    Shocker = 1,
    Shorty = 1,
    Shotsy = 1,
    Showboat = 1,
    Showoff = 1,
    Shrek = 1,
    Shy = 1,
    Siesta = 1,
    Silverback = 1,
    Skinner = 1,
    Sledge = 1,
    Slim = 1,
    Slugger = 1,
    Smallfoot = 1,
    Smarts = 1,
    Smash = 1,
    Smelly = 1,
    Smokes = 1,
    Smokey = 1,
    Smoothie = 1,
    Snake = 1,
    Snoopy = 1,
    Snow = 1,
    Snowflake = 1,
    Soap = 1,
    Socks = 1,
    Solo = 1,
    Spaced = 1,
    Sparky = 1,
    Specter = 1,
    Spewy = 1,
    Spider = 1,
    Spike = 1,
    Spitfire = 1,
    Splash = 1,
    Spoon = 1,
    Sportsman = 1,
    Springer = 1,
    Spuds = 1,
    Stacks = 1,
    Stag = 1,
    Stalker = 1,
    Steak = 1,
    Stick = 1,
    Strafer = 1,
    Streamer = 1,
    Strings = 1,
    Strobe = 1,
    Subscribe = 1,
    Superman = 1,
    Supreme = 1,
    Swallow = 1,
    Swampy = 1,
    Swanky = 1,
    Talos = 1,
    Tank = 1,
    Tectonic = 1,
    Tenacious = 1,
    Thrombo = 1,
    Thug = 1,
    Thunder = 1,
    Tictac = 1,
    Tiger = 1,
    Tombstone = 1,
    Toothpaste = 1,
    Trips = 1,
    Tubes = 1,
    Tug = 1,
    Twitch = 1,
    Vampire = 1,
    Vandal = 1,
    Viking = 1,
    Vita = 1,
    Vodka = 1,
    Voodoo = 1,
    Vulcan = 1,
    Walker = 1,
    Wardog = 1,
    Warlock = 1,
    Weab = 1,
    Weegee = 1,
    Werewolf = 1,
    Whiskey = 1,
    Wildchild = 1,
    Wolverine = 1,
    Woodchuck = 1,
    Wrestler = 1,
    Xeno = 1,
    Yeti = 1,
    Yoda = 1,
    YouTuber = 1,
    Zed = 1,
    Zen = 1,
    Zero = 1,
    Zeus = 1,
    Zilch = 1,
    Zulu = 1,
    ["Bad Hand"] = 1,
    ["Black Jack"] = 1,
    ["Can't See Me"] = 1,
    ["Can't Shoot Me"] = 1,
    ["Cat's Eyes"] = 1,
    ["Check Out My Channel"] = 1,
    ["Corporate Commander"] = 1,
    ["Cotton-eye"] = 1,
    ["Da Rappa"] = 1,
    ["Dead Inside"] = 1,
    ["Desert Fox"] = 1,
    ["Don't Need No Man"] = 1,
    ["Don't Shoot"] = 1,
    ["I Got Nothing"] = 1,
    ["I'm Alive"] = 1,
    ["IT Guy"] = 1,
    ["Ice Cube"] = 1,
    ["Iron Maiden"] = 1,
    ["Jack-booted"] = 1,
    ["Jimmie Rustler"] = 1,
    ["Kick Me"] = 1,
    ["Long Shot"] = 1,
    ["Low Rider"] = 1,
    ["Mad Dog"] = 1,
    ["Mad Lad"] = 1,
    ["Mad Man"] = 1,
    ["Man Down"] = 1,
    ["Moon-Moon"] = 1,
    ["Nice Guy"] = 1,
    ["Ninja Turtle"] = 1,
    ["Not Dead Yet"] = 1,
    ["Not a Zombie"] = 1,
    ["Oh Man"] = 1,
    ["One-Eyed"] = 1,
    ["Pays in Exposure"] = 1,
    ["Plan B"] = 1,
    ["Road Block"] = 1,
    ["Swamp Fox"] = 1,
    ["That Guy"] = 1,
    ["The Bear"] = 1,
    ["The Terror"] = 1,
    ["True Gamer"]=1,
    ["Turkey Neck"] = 1,
    ["Uh-oh"] = 1,
    ["Vanilla Ice"] = 1,
    ["War Horse"] = 1,
    ["White Death"] = 1,

    ["Hear no Evil"] = 1,
    ["See no Evil"] = 1,
    ["Do no Evil"] = 1
  }
}

namelib.MARKOV_DB =
{
  ANGEL_DEMON_NAMES =
  {
    order = {2}, -- Refers to the memory of the Markov chain. 
                 -- A number too low means gibberish, a number too high means outputting just the same words.

    max_len = {8,8,8,9,9,10,10}, -- rand.pick() range of how long the name should be. 
                                       -- Not recomended to go really long. 
    min_len = {5,6,6,6,6},             -- rand.pick() range of how short the name can be. 
                                       -- Too short results in easy collisions with common words... like "Meth" or "Cunt"

    words =
    {
      "Michael","Gabriel","Raphael","Uriel","Azrael","Sariel","Remiel","Zadkiel","Jophiel","Haniel",
      "Raguel","Phanuel","Metatron","Sandalphon","Raziel","Cassiel","Barachiel","Jeremiel","Adriel","Anael",
      "Zuriel","Othniel","Ithuriel","Ezekiel","Camael","Seraphiel","Tzaphkiel","Israfel","Kemuel","Ramiel",
      "Gadreel","Castiel","Arael","Zerachiel","Lumiel","Thamiel","Oriphiel","Caelion","Azael","Nerathiel",
      "Zaphiel","Eremiel","Kalziel","Morael","Azmiel","Tariel","Zadriel","Ormael","Selaphiel","Arkael",
      "Beliel","Zamael","Rathiel","Damael","Keziel","Lumael","Tzarael","Ophiel","Mikael","Razael",
      "Abriel","Samael","Zeriel","Thuriel","Amriel","Bariel","Carziel","Dariel","Eshmael","Farael",
      "Gariel","Harael","Ishariel","Jariel","Karael","Larael","Marael","Narael","Oarael","Pariel",
      "Qarael","Rarael","Sarael","Tarael","Uraiel","Varael","Warael","Xarael","Yarael","Zarael",

      "Baal","Belial","Asmodeus","Beelzebub","Astaroth","Abaddon","Mammon","Moloch","Leviathan","Azazel",
      "Samael","Lucifer","Belphegor","Lilith","Naamah","Baphomet","Dagon","Amon","Phenex","Forneus",
      "Marchosias","Andras","Valefar","Sitri","Berith","Stolas","Furfur","Halphas","Malphas","Vepar",
      "Zagan","Allocer","Shax","Vassago","Orobas","Barael","Zoroth","Malzeth","Korvax","Threxal",
      "Velkior","Zamreth","Ormazel","Draugoth","Xerath","Balreth","Morvion","Zethar","Khalzor","Azgoth",
      "Belzoth","Karvax","Morzak","Thalzor","Zarveth","Xalzor","Velrax","Korveth","Zalreth","Balthor",
      "Morath","Zeroth","Karnax","Velthor","Xarneth","Zolgar","Threxor","Balzeth","Korzan","Zarnok",
      "Velzoth","Morvax","Thalrex","Zarvok","Xelthor","Korzeth","Balneth","Morzel","Zarxoth","Velnax",

      -- synthetic blend (angel/demon hybrid style)
      "Zariel","Malachiel","Belthiel","Azrion","Zerathiel","Malzoriel","Balathiel","Thamziel","Koriel",
      "Zaraelion","Velachiel","Morathiel","Zethiel","Barachor","Thraelion","Zamiel","Koraelion","Velariel",
      "Moriel","Zaniel","Thariel","Baliel","Koriel","Zoriel","Veliel","Maliel","Zethiel","Xariel",
      "Zorathiel","Velkariel","Morxiel","Balzriel","Thamriel","Korathiel","Zarviel","Velthoriel",
      "Morathor","Zethoriel","Balxiel","Threxiel","Korviel","Zamthoriel","Velzriel","Morielion",

      -- expand with patterned generation-like entries
      "Arzoth","Belzior","Calreth","Dorvax","Erzoth","Falzor","Galreth","Harvax","Irzoth","Jalzor",
      "Kalreth","Lorvax","Marzoth","Nalzor","Orvax","Palreth","Qarzoth","Ralzor","Sarvax","Talreth",
      "Urzoth","Valzor","Warvax","Xarzoth","Yalzor","Zarvax",

      -- repeated structured variations to reach ~500
      "Azraelion","Barzoth","Calzeth","Darvion","Elzior","Farveth","Garzoth","Harzeth","Irzion","Jarveth",
      "Karzoth","Larveth","Marzeth","Narvion","Orzoth","Parveth","Qarzeth","Rarvion","Sarveth","Tarzoth",
      "Urveth","Varzoth","Warveth","Xarzeth","Yarvion","Zarveth",

      "Belzor","Malzor","Korzor","Velzor","Zarzor","Thalzor","Xalzor","Morzor","Balzor","Kelzor",
      "Nelzor","Pelzor","Selzor","Telzor","Velzor","Welzor","Xelzor","Yelzor","Zelzor",

      "Azmoth","Belmoth","Cormoth","Darmoth","Elmoth","Felmoth","Galmoth","Harmoth","Irmoth","Jalmoth",
      "Kelmoth","Larmoth","Marmoth","Nelmoth","Ormath","Palmoth","Qelmoth","Rarmoth","Sarmoth","Tarmoth",
      "Ulmoth","Varmoth","Welmoth","Xarmoth","Yelmoth","Zarmoth",

      "Zethion","Morion","Balion","Korion","Velion","Thalion","Xalion","Zalion","Malion","Belion",
      "Kelion","Nelion","Pelion","Selion","Telion","Velion","Welion","Xelion","Yelion","Zelion"
    },

    -- Explicitly unused for ANGEL_DEMON_NAMES set, but is a host of common suffix repairs
    -- In the case of the COUNTY_TOWN_NAMES, for example, "Kentvie" will be auto-completed as "Kentview"
    --[[suffix_fixes =
    {

    }]]
  },

  COUNTY_TOWN_NAMES = {
    order = {2,3,3},

    max_len = {8,8,8,8,9,9},
    min_len = {5,6,6,6,6},

    words =
    {
      "Springfield","Riverton","Fairview","Franklin","Greenville","Bristol","Clinton","Georgetown","Salem","Madison",
      "Arlington","Ashland","Oxford","Jackson","Milton","Dayton","Clayton","Hudson","Kingston","Lancaster",
      "Winchester","Farmington","Centerville","Lexington","Burlington","Manchester","Oakland","Newport","Dover","Somerset",
      "Norwood","Danville","Cleveland","Plymouth","Canton","Bedford","Carlisle","Shelbyville","Harrison","Jefferson",

      "New Haven","New London","New Albany","New Bedford","New Richmond","New Carlisle","New Hartford","New Brighton","New Franklin","New Salem",
      "Fort Worth","Fort Wayne","Fort Smith","Fort Scott","Fort Dodge","Fort Benton","Fort Mason","Fort Grayson","Fort Caldwell","Fort Redfield",
      "Port Arthur","Port Clinton","Port Townsend","Port Angeles","Port Gibson","Port Madison","Port Raleigh","Port Kingston","Port Mason","Port Sterling",
      "Lakewood","Lakeland","Lakeview","Lakeport","Lakefield","Lakehurst","Lakeside","Lakehaven","Lakewood Hills","Lake Briar",
      "Mount Vernon","Mount Pleasant","Mount Holly","Mount Sterling","Mount Carmel","Mount Zion","Mount Auburn","Mount Hope","Mount Olive","Mount Dora",

      "San Marcos","San Angelo","San Rafael","San Mateo","San Bruno","San Leandro","San Ramon","San Jacinto","San Benito","San Gabriel",
      "Santa Clara","Santa Rosa","Santa Fe","Santa Cruz","Santa Barbara","Santa Maria","Santa Paula","Santa Monica","Santa Teresa","Santa Lucia",

      "Redwood","Oak Grove","Pine Hill","Cedar Falls","Maple Grove","Willow Creek","Birchwood","Elmwood","Cottonwood","Dogwood",
      "Silver Creek","Clearwater","Blue Ridge","Green Valley","Golden Valley","White Plains","Black River","Rocky Ford","Dry Creek","Cold Spring",

      "Ridgefield","Brookfield","Plainfield","Springdale","Rosedale","Greendale","Hillcrest","Fairmont","Westfield","Eastwood",
      "Northfield","Southport","Westbrook","Easton","Northwood","Southdale","Westhaven","Easthaven","Northbrook","Southridge",

      "Brighton","Claymont","Fairfax","Oakmont","Rosemont","Belmont","Richmond","Edgemont","Ashmont","Beaumont",
      "Fairmont Heights","Oakwood Hills","Riverbend","Stonebridge","Woodland Park","Highland Park","Meadowbrook","Sunnyvale","Pleasant Hill","Rolling Hills",

      "Kingsport","Clarksville","Huntsville","Jacksonville","Danville Heights","Greenville Junction","Farmville","Oakville","Roseville","Pineville",
      "Lakeville","Brookville","Fairville","Grantville","Hopeville","Smithville","Clarkton","Brighton Falls","Cedarville","Elmville",

      "Rockford","Hartford","Milford","Stratford","Ashford","Clifford","Bedford Falls","Kingsford","Langford","Redford",
      "Oakford","Pineford","Rexford","Sanford","Whitford","Brentford","Glenford","Crawford","Stanford","Wolford",

      "Greenburg","Harrisburg","Pittsburg","Gettysburg","Williamsburg","Fredericksburg","Leesburg","Jonesburg","Hendersonburg","Ellisburg",
      "Kingsburg","Marlborough","Northburg","Southburg","Westburg","Eastburg","Stoneburg","Riverburg","Oakburg","Lakeburg",

      "Fairton","Clayton","Brighton","Charleston","Princeton","Kingston Heights","Riverton Falls","Summerton","Chesterton","Fullerton",
      "Silverton","Millerton","Georgetown Heights","Allentown","Beaverton","Jamestown","Harrison Heights","Edgerton","Bloomington","Lexington Falls",

      -- Indigenous-inspired / phonetic blends
      "Wakanda","Chillicothe","Tallulah","Catawba","Tuscaloosa","Yazoo","Kennebunk","Skowhegan","Massapequa","Patchogue",
      "Shenandoah","Susquehanna","Allegheny","Potomac","Monongahela","Kalamazoo","Okeechobee","Apalachicola","Chattahoochee","Tallahassee",

      "Wakarusa","Talawanda","Chesunka","Nokomis","Wabasha","Minnewaska","Onalaska","Kewanee","Kenosha","Winnebago",
      "Shawano","Manitowoc","Oconto","Waupaca","Wausau","Menasha","Neenah","Ashwaubenon","Sheboygan","Kewaunee",

      -- synthetic fillers with realistic structure
      "Oakridge","Pineridge","Mapleridge","Cedaridge","Stone Ridge","River Ridge","Lake Ridge","Hill Ridge","North Ridge","South Ridge",
      "West Ridge","East Ridge","Green Ridge","Blue Ridge Falls","Silver Ridge","Golden Ridge","Red Ridge","White Ridge","Black Ridge","Iron Ridge",

      "Riverdale","Greendale Heights","Brookdale","Oakdale","Pinedale","Mapledale","Cedar Dale","Stone Dale","Hilldale","Northdale",
      "Southdale Heights","Westdale","Eastdale","Greendale Park","Rosedale Heights","Fairdale","Sunnydale","Shadowdale","Wooddale","Parkdale",

      "Meadowfield","Brookfield Heights","Oakfield","Pinefield","Maplefield","Cedarfield","Stonefield","Hillfield","Northfield Heights",
      "Southfield","Westfield Park","Eastfield","Greenfield Heights","Bluefield","Fairfield Park","Sunnyfield","Shadowfield","Woodfield","Parkfield",

      "Clearview","Grandview","Hillview","Lakeview Heights","Ridgeview","Brookview","Oakview","Pineview","Mapleview","Cedarview",
      "Stoneview","Northview","Southview","Westview","Eastview","Greenview","Blueview","Fairview Heights","Sunnyview","Shadowview",

      "Rockport","Bridgeport","Kingsport Heights","Lakeport Falls","Riverport","Northport","Southport Heights","Westport","Eastport",
      "Greenport","Blueport","Fairport","Sunnyport","Shadowport","Woodport","Parkport","Stoneport","Ironport","Goldport","Silverport"
    },

    suffix_fixes =
    {
      "mount","view","ville","ton","burg","field","dale",
      "port","wood","ridge","ranch","heights","mont","wark",
      "falls","hill","plain","bend","cumb","brook","creek",
      "green"
    }
  },

  LATIN =
  {
    order = {2,3,3},

    max_len = {8,8,8,8,8,8,8,8,9,9,9,9,10},
    min_len = {6},

    words =
    {
      -- Continents & Regions
      "Europa", "Asia", "Africa", "America", "Australis", "Antarctica", "Atlantica",
      "Occidens", "Orientalis", "Septentrio", "Meridies", "Mediterranea", "Transalpina",
      "Caucasia", "Sarmatia", "Scythia", "Hesperia", "Hyperborea", "Aethiopia",

      -- Oceans & Seas
      "Atlanticus", "Pacificus", "Indicus", "Australis",
      "Borealis", "Arcticus", "Antarcticus",
      "Mediterraneum", "Aegaeum", "Adriaticum", "Tyrrhenum",
      "Ionium", "Balticum", "Caspium", "Rubrum", "Nigra",
      "Japonicum", "Philippinum", "Caribicum", "Nordicum",

      -- Rivers & Lakes
      "Nilus", "Danubius", "Rhenus", "Tiberis", "Sequanus", "Amazonia Fluvius",
      "Mississippus", "Gangis", "Indus", "Volga", "Lacus Superior", "Lacus Victoria",
      "Lacus Baikal", "Lacus Titicaca", "Lacus Ontario", "Lacus Geneva",

      -- Solar System Entities
      "Sol", "Luna", "Terra", "Mars", "Venus", "Mercurius", "Iuppiter", "Saturnus",
      "Uranus", "Neptunus", "Pluto", "Ceres", "Vesta", "Pallas", "Eris",
      "Titan", "Europa Luna", "Ganymedes", "Callisto", "Io", "Enceladus",
      "Rhea", "Dione", "Tethys", "Hyperion", "Phoebe", "Charon",

      -- Synthetic Variants (Markov tempering)
      "Boreoatlanticus", "Indoatlanticus", "Transpacificus",
      "Austrinigrum", "Boreotyrrhenum", "Hyperionis",
      "Novaeuropa", "Austrinova", "Boreoafrica",
      "Novalis", "Ultima", "Incognita", "Australis Obscura",
      "Lunaris", "Solaria", "Saturnalia", "Joviana",
      "Martiana", "Venerea", "Mercurialis",

      -- Mythic/Poetic Expansions
      "Primordialis", "Caelestis", "Infernum",
      "Aeternum", "Stellatum", "Ignis", "Ventorum",
      "Tenebrarum", "Lucis", "Somniorum", "Novum",
      "Arcadia", "Eldoria", "Valeria",
      "Aurelia", "Obscuria", "Borealis Magna",

      -- Extra synthetic fillers
      "Boreopacificus", "Austrinovus", "Transindicus",
      "Boreophilippinum", "Austricaribicum", "Hyperboreum",
      "Solaris", "Lunaris", "Neptunia", "Uranica",
      "Plutonia", "Eridania", "Cimmeria", "Tharsis",
      "Boreomagna", "Austrinova", "Transmarina",
      "Ultima Thule", "Arcana", "Mystica",

      -- More expansions for density
      "Boreoatlanticus Magnus", "Australis Magnus",
      "Mediterraneum Novum", "Caspium Antiquum", "Rubrum Novum",
      "Novae Terrae", "Boreoamerica", "Australis Nova",
      "Nova Borealis", "Nova Australis", "Nova Orientalis",
      "Solaris Magna", "Lunaris Magna", "Joviana Magna",
      "Saturnalia Magna", "Venerea Magna", "Mercurialis Magna",

      -- Synthetic planetary seas
      "Titanis", "Europae", "Ganymedis", "Callisti",
      "Ioensis", "Enceladi", "Rheae", "Dionis",
      "Tethyos", "Hyperionis", "Phoebis", "Charoni",

      -- Closing fillers
      "Ultimus", "Novissimus", "Eternus",
      "Ultimum", "Novissimum", "Eternum",
      "Ultima Borealis", "Ultima Australis", "Ultima Orientalis",
      "Ultima Borealis", "Ultima Australis", "Ultima Orientalis",
      "Terra", "Terrae", "Terranius"
    },
  },
}

-- noun generator, creates nouns from syllables
-- currently two modes:
-- "exotic" - syllables come from country names
--            and solar system body names
-- "anglican" - syllables come from US and UK towns
--              and places, usually emphasizes whole
--              words as syllables

-- Now uses Markov chains!
function namelib.generate_unique_noun(mode)

  -- build Markov chain
  local function build_chain(names, order)
    local chain = {}
    local start_token = string.rep("^", order)

    for _, name in ipairs(names) do
      local clean = name:lower()
      clean = clean:gsub("[^a-z%s]", "")
      clean = clean:gsub("%s+", "_")

      local padded = start_token .. clean .. "$"

      for i = 1, #padded - order do
        local key = padded:sub(i, i + order - 1)
        local next_char = padded:sub(i + order, i + order)

        chain[key] = chain[key] or {}
        table.insert(chain[key], next_char)
      end
    end

    return chain
  end

  -- weak word detection
  local function is_weak_word(word)
    if #word > 3 then return false end

    local vowels = 0
    for c in word:gmatch(".") do
      if c:match("[aeiou]") then vowels = vowels + 1 end
    end

    return vowels >= #word - 1
  end

  -- auto-fix short junk words
  local function auto_fix_words(name)

    local function is_unpronounceable(word)
      local len = #word
      if len <= 1 then return false end

      local vowels = 0
      for c in word:gmatch(".") do
        if c:match("[aeiou]") then
          vowels = vowels + 1
        end
      end

      -- no vowels OR extremely consonant-heavy
      return (vowels == 0) or (vowels / len < 0.25)
    end

    local words = {}
    for w in name:lower():gmatch("%S+") do
      table.insert(words, w)
    end

    local result = {}
    local i = 1

    while i <= #words do
      local word = words[i]

      if is_weak_word(word) or is_unpronounceable(word) then
        local next_word = words[i + 1]
        local prev_word = result[#result]

        if next_word then
          words[i + 1] = word .. next_word
        elseif prev_word then
          result[#result] = prev_word .. word
        end
        -- skip
      else
        table.insert(result, word)
      end

      i = i + 1
    end

    return table.concat(result, " ")
  end

  local function fix_bad_start(name)
    -- insert vowel if starts with harsh cluster
    if name:match("^[^aeiou][^aeiou]") then
      return name:sub(1,1) .. "a" .. name:sub(2)
    end
    return name
  end

  local function soften_clusters(name)
    -- break 3+ consonant clusters
    return name:gsub("([^aeiou])([^aeiou])([^aeiou])", function(a,b,c)
      return a .. "a" .. b .. c
    end)
  end

  local function ensure_vowels(name)
    local count = 0
    for c in name:gmatch("[aeiou]") do count = count + 1 end

    if count < 2 then
      -- inject a vowel near the middle
      local mid = math.floor(#name / 2)
      name = name:sub(1, mid) .. "a" .. name:sub(mid + 1)
    end

    return name
  end

  -- aggressive suffix completion
  local function complete_suffix(name, suffix_fixes)
    local suffixes = suffix_fixes
    if not suffixes or table.empty(suffixes) then return name end

    local lower = name:lower()
    local best_suffix, best_overlap = nil, 0

    for _, s in ipairs(suffixes) do
      local max_overlap = math.min(#s, #lower)
      for i = max_overlap, 1, -1 do
        if lower:sub(-i) == s:sub(1, i) then
          if i > best_overlap then
            best_overlap = i
            best_suffix = s
          end
          break
        end
      end
    end

    if best_suffix then
      return name .. best_suffix:sub(best_overlap + 1)
    end

    return name
  end

  -- core markov generator
  local function generate_markov(chain, order, min_len, max_len)
    local start = string.rep("^", order)
    local current = start
    local result = ""

    while true do
      local options = chain[current]
      if not options then break end

      local next_char = options[math.random(#options)]

      if next_char == "$" then
        if #result >= min_len then break end
        current = start
        result = ""
      else
        result = result .. next_char
        current = current:sub(2) .. next_char
      end

      if #result >= max_len then break end
    end

    return result
  end


  -- formatting
  local function format_name(name, suffix_fixes)
    name = name:gsub("_", " ")

    name = complete_suffix(name, suffix_fixes)
    name = auto_fix_words(name)

    name = fix_bad_start(name)
    name = soften_clusters(name)
    name = ensure_vowels(name)

    -- Title case
    name = name:gsub("(%a)([%w']*)", function(a,b)
      return a:upper() .. b
    end)

    return name
  end


  -- Markov mode
  local function generate_markov_mode()
    local tab

    if mode == "anglican" then
      tab = rand.pick({
        namelib.MARKOV_DB["LATIN"],
        namelib.MARKOV_DB["COUNTY_TOWN_NAMES"]
      })
    else
      tab = namelib.MARKOV_DB["ANGEL_DEMON_NAMES"]
    end

    local order = rand.key_by_probs(tab.order)
    local chain = build_chain(tab.words, order)

    local min_len = rand.pick(tab.min_len)
    local max_len = rand.pick(tab.max_len)

    local name
    repeat
      name = generate_markov(chain, order, min_len, max_len)
      name = format_name(name, tab.suffix_fixes)
    until #name <= max_len + 2 and #name >= min_len

    return name
  end


  -- number mode
  local function generate_number()
    local len = rand.pick({1,2,3,3,4,4,5,6})
    local result = tostring(rand.irange(1,9))

    for i = 2, len do
      result = result .. tostring(rand.irange(0,9))
    end

    return result
  end


  -- serial mode
  local function generate_serial()
    local len = rand.pick({3,4,4,5,5,5,6,7,8})
    local result = ""

    for i = 0, len - 1 do
      if i > 0 and rand.odds(20) then
        result = result .. "-"
      end

      if rand.odds(75) then
        result = result .. tostring(rand.irange(0,9))
      else
        result = result .. string.char(rand.irange(65,90))
      end
    end

    return result
  end


  -- community mode
  local function generate_community()
    local choice = rand.key_by_probs({c=6, r=2, o=2})

    if choice == "c" then
      return rand.pick(namelib.COMMUNITY_MEMBERS.contributors)
    elseif choice == "r" then
      return rand.pick(namelib.COMMUNITY_MEMBERS.regulars)
    else
      return rand.pick(namelib.COMMUNITY_MEMBERS.oblige_folks)
    end
  end

  --| generate_unique_noun |--
  if mode == "number" then
    return generate_number()

  elseif mode == "serial" then
    return generate_serial()

  elseif mode == "community_members" then
    return generate_community()

  else
    --[[str = ""
    mode = "anglican"
    for i=1, 90 do
      str = str .. "'" .. generate_markov_mode() .. "' "
      if i%5 == 0 then str = str .. "\n" end
    end
    error(str)]]
    return generate_markov_mode()
  end

end


function namelib.fix_up(name)
  -- convert "_" to "-",
  name = string.gsub(name, "_ ", "-")
  name = string.gsub(name, "_",  "-")

  -- convert "A" to "AN" where necessary
  name = string.gsub(name, "^[aA] ([aAeEiIoOuU])", "An %1")

  -- the "+s" means to add "S" to a word (pluralize it)
  name = string.gsub(name, "s%+s", "s")
  name = string.gsub(name, "x%+s", "xes")
  name = string.gsub(name, "z%+s", "zes")
  name = string.gsub(name, "ay%+s", "ays")
  name = string.gsub(name, "oy%+s", "ays")
  name = string.gsub(name, "y%+s", "ies")
  name = string.gsub(name, "%+s", "s")

  -- the "/s" means to remove a trailing "S" from a word
  name = string.gsub(name, "ies/s", "y")
  name = string.gsub(name, "s/s", "")
  name = string.gsub(name, "/s", "")

  name = string.gsub(name, "NOUNGENANGLICAN", namelib.generate_unique_noun("anglican"))
  name = string.gsub(name, "NOUNGENEXOTIC", namelib.generate_unique_noun("exotic"))
  name = string.gsub(name, "NOUNMEMBERS", namelib.generate_unique_noun("community_members"))

  name = string.gsub(name, "NOUNNUMBER", namelib.generate_unique_noun("number"))
  name = string.gsub(name, "NOUNSERIAL", namelib.generate_unique_noun("serial"))
  return name
end


function namelib.split_word(tab, word)
  for w in string.gmatch(word, "%a+") do
    local low = string.lower(w)

    if not namelib.IGNORE_WORDS[low] then
      -- truncate to 4 letters
      if #low > 4 then
        low = string.sub(low, 1, 4)
      end

      tab[low] = (tab[low] or 0) + 1
    end
  end
end


function namelib.match_parts(word, parts)
  for p,_ in pairs(parts) do
    for w in string.gmatch(word, "%a+") do
      local low = string.lower(w)

      -- truncate to 4 letters
      if #low > 4 then
        low = string.sub(low, 1, 4)
      end

      if p == low then
        return true
      end
    end
  end

  return false
end


function namelib.one_from_pattern(DEF)
  local name = ""
  local words = {}

  local pattern = rand.key_by_probs(DEF.patterns)
  local pos = 1

  while pos <= #pattern do

    local c = string.sub(pattern, pos, pos)
    pos = pos + 1

    if c ~= '%' then
      name = name .. c
    else
      assert(pos <= #pattern)
      c = string.sub(pattern, pos, pos)
      pos = pos + 1

      if not string.match(c, "%a") then
        error("Bad naming pattern: expected letter after %")
      end

      local lex = DEF.lexicon[c]
      if not lex then
        error("Naming theme is missing letter: " .. c)
      end

      local w = rand.key_by_probs(lex)
      name = name .. w

      namelib.split_word(words, w)
    end
  end

  return name, words
end


function namelib.choose_one(DEF, max_len)
  if PARAM.float_name_generator_mode and rand.odds(PARAM.float_name_generator_mode) then
    if DEF.lexicon.s then
      return rand.key_by_probs(DEF.lexicon.s)
    end
  end

  local name, parts

  repeat
    name, parts = namelib.one_from_pattern(DEF)
  until #name <= max_len

  -- adjust probabilities
  for c,word_tab in pairs(DEF.lexicon) do
    local divisor = DEF.divisors[c] or 10

    for w,prob in pairs(word_tab) do
      if namelib.match_parts(w, parts) then
        DEF.lexicon[c][w] = prob / divisor
      end
    end
  end

  return namelib.fix_up(name)
end


function namelib.merge_theme(theme_name)
  -- verify the theme name
  if not namelib.NAMES[theme_name] then
    error("namelib.generate: unknown theme: " .. tostring(theme_name))
  end

  local theme = {}

  local sources = { namelib.NAMES, GAME.NAMES or {} }

  -- always merge in the "COMMON" theme before the main one
  for _,S in pairs(sources) do
    if S["COMMON"] then
      table.deep_merge(theme, S["COMMON"])
    end
  end

  -- now merge in the actual specific theme
  for _,S in pairs(sources) do
    if S[theme_name] then
      table.deep_merge(theme, S[theme_name])
    end
  end

  return theme
end


function namelib.generate(theme_name, count, max_len)
  local DEF = namelib.merge_theme(theme_name)

  local list = {}

  for i = 1, count do
    local name
    ::tryagain::
    name = namelib.choose_one(DEF, max_len)

    if table.has_elem(list, name) then goto tryagain end

    table.insert(list, name)
  end

  return list
end


function Naming_init(name_table)
  namelib.cache = {}
  namelib.NAMES = {}
  table.merge_w_copy(namelib.NAMES, name_table)
end


function Naming_grab_one(theme)
  local cache = namelib.cache
  assert(cache)

  if not cache[theme] or table.empty(cache[theme]) then
    cache[theme] = namelib.generate(theme, 30, 40)
  end

  return table.remove(namelib.cache[theme], 1)
end