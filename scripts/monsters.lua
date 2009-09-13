----------------------------------------------------------------
--  MONSTERS/HEALTH/AMMO
----------------------------------------------------------------
--
--  Oblige Level Maker
--
--  Copyright (C) 2008-2009 Andrew Apted
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


--[[

MONSTER SELECTION
=================

Main usages:
(a) free-range
(b) guarding something [keys]
(c) cages
(d) traps (triggered closets, teleport in)
(e) surprises (behind entry door, closests on back path)


IDEAS:

Free range monsters make up the bulk of the level, and are
subject to the palette.  The palette applies to a fair size
of a map, on "small" setting --> 1 palette only, upto 2 on
"regular", between 2-3 on "large" maps.

Trap and Surprise monsters can use any monster (actually
better when different from palette and different from
previous traps/surprises).

Cages and Guarding monsters should have a smaller and
longer-term palette, changing about 4 times less often
than the free-range palette.  MORE PRECISELY: palette
evolves about same rate IN TERMS OF # MONSTERS ADDED.

--------------------------------------------------------------]]

require 'defs'
require 'util'


function Player_init()
  LEVEL.hmodels = {}

  for _,SK in ipairs(SKILLS) do
    local hm_set = deep_copy(GAME.player_model)

    for CL,hmodel in pairs(hm_set) do
      hmodel.skill = SK
      hmodel.class = CL
    end -- for CL

    LEVEL.hmodels[SK] = hm_set
  end -- for SK
end

function Player_give_weapon(weapon, to_CL)
  gui.debugf("Giving weapon: %s\n", weapon)

  for _,SK in ipairs(SKILLS) do
    for CL,hmodel in pairs(LEVEL.hmodels[SK]) do
      if not to_CL or (to_CL == CL) then
        hmodel.weapons[weapon] = 1
      end
    end -- for CL
  end -- for SK
end

function Player_give_stuff(hmodel, give_list)
  for _,give in ipairs(give_list) do
    if give.health then
      gui.debugf("Giving [%s/%s] health: %d\n",
                 hmodel.class, hmodel.skill, give.health)
      hmodel.stats.health = hmodel.stats.health + give.health

    elseif give.ammo then
      gui.debugf("Giving [%s/%s] ammo: %dx %s\n",
                 hmodel.class, hmodel.skill, give.count, give.ammo)

      local count = assert(hmodel.stats[give.ammo])
      hmodel.stats[give.ammo] = count + give.count

    elseif give.weapon then
      gui.debugf("Giving [%s/%s] weapon: %s\n",
                 hmodel.class, hmodel.skill, give.weapon)

      hmodel.weapons[give.weapon] = 1
    else
      error("Bad give item : not health, ammo or weapon")
    end
  end
end

function Player_calc_firepower()
  -- The 'firepower' is (roughly) how much damage per second
  -- the player would normally do using their current set of
  -- weapons.
  --
  -- We assume all skills have the same weapons.
  --
  -- If there are different classes (Hexen) then the result
  -- will be an average of each class, as all classes face
  -- the same monsters.

  local function get_firepower(hmodel)
    local firepower = 0 
    local divisor   = 0

    for weapon,_ in pairs(hmodel.weapons) do
      local info = GAME.weapons[weapon]

      if not info then
        error("Missing weapon info for: " .. weapon)
      end

      local dm = info.damage * info.rate
      if info.splash then dm = dm + info.splash[1] end

      -- melee attacks are hard to use, and
      -- projectiles miss more often than hitscan
      if info.attack == "melee" then
        dm = dm / 3.0
      elseif info.attack == "missile" then
        dm = dm / 1.3
      end

      local pref = info.pref or 1

---   gui.debugf("  weapon:%s dm:%1.1f pref:%1.1f\n", weapon, dm, pref)

      firepower = firepower + dm * pref
      divisor   = divisor + pref
    end

    if divisor == 0 then
      error("Player_calc_firepower: no weapons???")
    end

    return firepower / divisor
  end

  ---| Player_calc_firepower |---

  local fp_total  = 0
  local class_num = 0

  local SK = SKILLS[1]

  for CL,hmodel in pairs(LEVEL.hmodels[SK]) do
    fp_total = fp_total + get_firepower(hmodel)
    class_num = class_num + 1
  end -- for CL

  assert(class_num > 0)

  return fp_total / class_num
end


function Monsters_init()
  name_it_up(GAME.monsters)
  name_it_up(GAME.weapons)
  name_it_up(GAME.pickups)

  for name,info in pairs(GAME.monsters) do
    info.thing = assert(GAME.things[name])
  end

  LEVEL.mon_stats = {}

  local low  = (MONSTER_QUANTITIES.scarce + MONSTER_QUANTITIES.less) / 2
  local high =  MONSTER_QUANTITIES.more

  LEVEL.prog_mons_qty    = low + LEVEL.ep_along * (high - low)
  LEVEL.mixed_mons_qty   = rand_range(low, high)

  -- build replacement table --

  LEVEL.mon_replacement = {}

  local dead_ones = {}

  for name,info in pairs(GAME.monsters) do
    local orig = info.replaces
    if orig then
      assert(info.replace_prob)
      if not GAME.monsters[orig] then
        dead_ones[name] = true
      else
        if not LEVEL.mon_replacement[orig] then
          -- the basic replacement table allows the monster to
          -- pick itself at the time of replacement.
          LEVEL.mon_replacement[orig] = { [orig]=70 }
        end
        LEVEL.mon_replacement[orig][name] = info.replace_prob
      end
    end
  end

  -- remove a replacement monster if the monster it replaces
  -- does not exist (e.g. stealth_gunner in DOOM 1 mode).
  for name,_ in pairs(dead_ones) do
    GAME.monsters[name] = nil
  end
end


function Monsters_global_palette()
  -- Decides which monsters we will use on this level.
  -- Easiest way is to pick some monsters NOT to use.

  if not LEVEL.monster_prefs then
    LEVEL.monster_prefs = {}
  end

  LEVEL.global_skip = {}

  local list = {}
  for name,info in pairs(GAME.monsters) do
    if info.prob and info.prob > 0 then
      table.insert(list, name)
    end
  end

  -- is there enough monsters to actually bother?
  if #list <= 2 then return end

  rand_shuffle(list)

  -- sometimes promote a particular monster
  if rand_odds(30) then
    local promote = list[#list]
    local M = GAME.monsters[promote]
    if not M.never_promote then
      gui.debugf("Promoting monster: %s\n", promote)
      LEVEL.monster_prefs[promote] = 3.5
      table.remove(list, #list)
    end
  end

  if PARAM.skip_monsters then
    local skip_list = {}
    local skip_total = 0

    for _,name in ipairs(list) do
      local M = GAME.monsters[name]
      local prob = M.skip_prob or 50
      if prob > 0 then
        -- adjust skip probability based on Strength setting
        local factor = math.min(M.health / 100, 9) ^ 0.5
        if OB_CONFIG.strength == "weak" then
          prob = prob * factor
        elseif OB_CONFIG.strength == "tough" then
          prob = prob / factor
        end

        -- adjust skip chance based on monster_prefs
        if LEVEL.monster_prefs then
          prob = prob / (LEVEL.monster_prefs[name] or 1)
        end
        if THEME.monster_prefs then
          prob = prob / (THEME.monster_prefs[name] or 1)
        end

        skip_list[name] = prob
gui.debugf("skip_list %s = %1.0f\n", name, prob)
        skip_total = skip_total + 1
      end
    end

    local perc  = rand_range(PARAM.skip_monsters[1], PARAM.skip_monsters[2])
    local count = int(#list * perc / 100 + gui.random())

    if count >= skip_total then count = skip_total - 1 end

    for i = 1,count do
      if table_empty(skip_list) then break; end

      local name = rand_key_by_probs(skip_list)
      skip_list[name] = nil

      gui.debugf("Skipping monster: %s\n", name)
      LEVEL.global_skip[name] = 1
    end
  end
end


function Monsters_do_pickups()

  local function distribute(R, qty, D)  -- Dest
    for _,SK in ipairs(SKILLS) do
      for CL,stats in pairs(R.fight_stats[SK]) do
        local dest_am = D.fight_stats[SK][CL]

        for stat,count in pairs(stats) do
          if count > 0 then
            dest_am[stat] = (dest_am[stat] or 0) + count * qty
            stats[stat]   = count * (1-qty)

            gui.debugf("Distributing %s:%1.1f  [%s/%s]  ROOM_%d --> ROOM_%d\n",
                       stat, count*qty,  CL, SK,  R.id, D.id)
          end
        end
      end -- for CL
    end -- for SK
  end

  local function get_storage_prefs(arena)
    local ratios = {}

    for i = 1, #arena.storage_rooms do
      ratios[i] = rand_irange(2,5)
    end

    return ratios, arena.storage_rooms
  end

  local function get_previous_prefs(R)
    local room_list = {}
    local ratios = {}

    local PREV = R

    while PREV.entry_conn and #room_list < 4 do
      PREV = PREV.entry_conn:neighbor(PREV)

      local qty = rand_irange(3,5) / (1 + #room_list)

      table.insert(room_list, PREV)
      table.insert(ratios, qty)
    end

    return ratios, room_list
  end

  local function distribute_to_list(R, qty, ratios, room_list)
    assert(#ratios == #room_list)

    local total = 0

    for i = 1,#ratios do
      total = total + ratios[i]
    end

    for i = 1,#ratios do
      distribute(R, qty * ratios[i] / total, room_list[i])
    end
  end

  local function distribute_fight_stats(R)
    if R.is_storage then return end

    do
      distribute_to_list(R, 0.40, get_previous_prefs(R))
      distribute_to_list(R, 0.30, get_storage_prefs(R.arena))
    end
  end


  local function add_big_spot(R, S, score)
    local mx, my = S:mid_point()
    table.insert(R.big_spots, { S=S, x=mx, y=my, score=score })
  end

  local function add_small_spots(R, S, side, count, score)
    local dist = 40

    for i = 1,count do
      local mx, my = S:mid_point()

      if side == 4 then mx = S.x1 + S.thick[4] + i*dist end
      if side == 6 then mx = S.x2 - S.thick[6] - i*dist end
      if side == 2 then my = S.y1 + S.thick[2] + i*dist end
      if side == 8 then my = S.y2 - S.thick[8] - i*dist end

      if side == 1 then mx, my = mx + i*dist, my + i*dist end
      if side == 3 then mx, my = mx - i*dist, my + i*dist end
      if side == 7 then mx, my = mx + i*dist, my - i*dist end
      if side == 9 then mx, my = mx - i*dist, my - i*dist end

      local dir = rotate_cw90(side)

      table.insert(R.small_spots, { S=S, x=mx, y=my, dir=dir, score=score })

      -- the rows further away from the wall should only be
      -- used when absolutely necessary.
      score = score - 100
    end
  end

  local function try_add_big_spot(R, S)
    local score = gui.random()

    if S.div_lev and S.div_lev >= 2 then score = score + 10 end

    if S.sx > (R.tx1 or R.sx1) and S.sx < (R.tx2 or R.sx2) then score = score + 2.4 end
    if S.sy > (R.ty1 or R.sy1) and S.sy < (R.ty2 or R.sy2) then score = score + 2.4 end

    if not S.content then score = score + 1 end

    add_big_spot(R, S, score)
  end

  local function try_add_small_spot(R, S)
    local score = gui.random()

    if R.entry_conn then
      local e_dist
      if is_vert(R.entry_conn.dir) then
        e_dist = math.abs(R.entry_conn.dest_S.sy - S.sy)
      else
        e_dist = math.abs(R.entry_conn.dest_S.sx - S.sx)
      end

      score = score + e_dist / 2.5
    end

    local walls = {}

    for side = 2,8,2 do
      local N = S:neighbor(side)
      if not N then
        walls[side] = 1
      elseif N.room ~= S.room then
        if not S.conn then walls[side] = 2 end
      elseif N.kind == "void" then
        walls[side] = 3
      elseif N.kind == "walk" and N.floor_h > S.floor_h then
        walls[side] = 4
      end
    end -- for side

    if table_empty(walls) then return end

    if walls[4] and walls[6] then
      add_small_spots(R, S, 4, 2, score)
      add_small_spots(R, S, 6, 2, score - 0.3)

    elseif walls[2] and walls[8] then
      add_small_spots(R, S, 2, 2, score)
      add_small_spots(R, S, 8, 2, score - 0.3)

    else
      for loop = 1,100 do
        local side = rand_irange(1,4) * 2
        if walls[side] then
          add_small_spots(R, S, side, 4, score)
          break;
        end
      end
    end
  end

  local function try_add_diagonal_spot(R, S)
    if S.diag_new_kind ~= "walk" then return end

    local score = 80 + gui.random()

    add_small_spots(R, S, S.stuckie_side, 2, score)
  end

  local function find_pickup_spots(R)
    -- Creates a map over the room of which seeds we can place
    -- pickup items in.  We distinguish two types: 'big' items
    -- (Mega Health or Blue Armor) and 'small' items:
    --
    -- 1. big items prefer to have a seed for itself, and
    --    somewhere near to the centre of the room.
    --
    -- 2. small items prefer to sit next to walls (or ledges)
    --    and be grouped in clusters.
    --
    -- To achieve this, our map will consist of two lists (big
    -- and small) of seeds, sorted into best --> worst order
    -- (with a healthy dose of randomness of course).

    gui.debugf("find_pickup_spots @ %s\n", R:tostr())

    R.big_spots = {}
    R.small_spots = {}

    local emerg_big
    local emerg_small

    for x = R.sx1,R.sx2 do for y = R.sy1,R.sy2 do
      local S = SEEDS[x][y][1]
      local score

      if S.room == R and S.kind == "walk" and
         (not S.content or S.content == "monster")
      then
        try_add_big_spot(R, S)
        try_add_small_spot(R, S)

        if not emerg_big then emerg_big = S end
        emerg_small = S
      end

      if S.room == R and S.kind == "diagonal" then
        try_add_diagonal_spot(R, S)
      end
    end end -- for x, y

    -- luckily this is very rare
    if not emerg_small then
      gui.printf("No spots for pickups in %s\n", R:tostr())
      return false
    end

    assert(emerg_big)

    if #R.big_spots == 0 then
      gui.debugf("No big spots found : using emergency\n")
      add_big_spot(R, emerg_big)
    end

    if #R.small_spots == 0 then
      gui.debugf("No small spots found : using emergency\n")
      add_small_spots(R, emerg_small, 2, 4, 0)
    end

    return true
  end

  local function sort_spots(R)
    table.sort(R.big_spots,   function(A,B) return A.score > B.score end)
    table.sort(R.small_spots, function(A,B) return A.score > B.score end)
  end

  local function decide_pickup(stat, qty)
    local item_tab = {}

    for name,info in pairs(GAME.pickups) do
      if info.prob and
         (stat == "health" and info.give[1].health) or
         (info.give[1].ammo == stat)
      then
        item_tab[name] = info.prob

---###    local each_qty = info.give[1].health or info.give[1].count
---###    local min_num  = (info.cluster and info.cluster[1]) or 1
---###    local max_num  = (info.cluster and info.cluster[2]) or 1
---###    if each_qty * max_num > qty then prob = prob / 20 end
      end
    end

    assert(not table_empty(item_tab))
    local name = rand_key_by_probs(item_tab)
    local info = GAME.pickups[name]

    local count = 1
    
    if info.cluster then
      local each_qty = info.give[1].health or info.give[1].count
      local min_num  = info.cluster[1]
      local max_num  = info.cluster[2]

      --- count = rand_irange(min_num, max_num)

      if min_num * each_qty >= qty then
        count = min_num
      elseif max_num * each_qty <= qty then
        count = max_num - rand_sel(20,1,0)
      else
        count = 1 + int(qty / each_qty)
      end
    end

    return GAME.pickups[name], count
  end

  local function select_pickups(R, item_list, stat, qty, hmodel)
gui.debugf("Initial = %s:%1.1f\n", stat, hmodel.stats[stat])

    -- subtract any previous gotten stuff
    qty = qty - hmodel.stats[stat]
    hmodel.stats[stat] = 0

    while qty > 0 do
      local item, count = decide_pickup(stat, qty)
      table.insert(item_list, { item=item, count=count, SK=hmodel.skill, rand=gui.random() })
      
      if stat == "health" then
        qty = qty - item.give[1].health * count
      else
        assert(item.give[1].ammo)
        qty = qty - item.give[1].count * count
      end
    end

    -- accumulate any excess quantity into the hmodel
    if qty < 0 then
gui.debugf("Excess = %s:%1.1f\n", stat, -qty)
      hmodel.stats[stat] = assert(hmodel.stats[stat]) - qty
    end
  end

  local function place_item(S, item_name, x, y, SK)
    local props

    if PARAM.format == "quake" then
      props = {}

      if SK == "easy" then
        props.spawnflags = 512+1024
      elseif SK == "medium" then
        props.spawnflags = 256+1024
      elseif SK == "hard" then
        props.spawnflags = 256+512
      end
    else
      props =
      {
        skill_hard   = sel(SK == "hard",   1, 0),
        skill_medium = sel(SK == "medium", 1, 0),
        skill_easy   = sel(SK == "easy",   1, 0),
      }
    end

    Trans_entity(item_name, x, y, S.floor_h, props)
  end

  local function place_big_item(spot, item, SK)
    local x, y = spot.x, spot.y

    -- assume big spots will sometimes run out (and be reused),
    -- so don't put multiple items at exactly the same place.
    x = x + rand_irange(-32, 32)
    y = y + rand_irange(-32, 32)

    place_item(spot.S, item, x, y, SK)
  end

  local function place_small_item(spot, item, count, SK)
    local x1, y1 = spot.x, spot.y
    local x2, y2 = spot.x, spot.y

    if count == 1 then
      place_item(spot.S, item, x1,y1, SK)
      return
    end

    local away = sel(count == 2, 20, 56)
    local dir  = spot.dir

    if is_vert(dir) then
      y1, y2 = y1-away, y2+away
    elseif is_horiz(dir) then
      x1, x2 = x1-away, x2+away
    elseif dir == 1 or dir == 9 then
      x1, y1 = x1-away, y1-away
      x2, y2 = x2+away, y2+away
    elseif dir == 3 or dir == 7 then
      x1, y1 = x1-away, y1+away
      x2, y2 = x2+away, y2-away
    else
      error("place_small_item: bad dir: " .. tostring(dir))
    end

    for i = 1,count do
      local x = x1 + (x2 - x1) * (i-1) / (count-1)
      local y = y1 + (y2 - y1) * (i-1) / (count-1)

      place_item(spot.S, item, x, y, SK)
    end
  end

  local function place_item_list(R, item_list, SK, CL)
    for _,pair in ipairs(item_list) do
      local item  = pair.item
      local count = pair.count
      local spot

      if item.big_item then
        spot = table.remove(R.big_spots, 1)
        spot.used = true
        table.insert(R.big_spots, spot)

        assert(count == 1)
        place_big_item(spot, item.name, SK, CL)
      else
        spot = table.remove(R.small_spots, 1)
        spot.used = true
        table.insert(R.small_spots, spot)

        place_small_item(spot, item.name, count, SK, CL)
      end
    end
  end

  local function pickups_for_hmodel(R, SK, CL, hmodel)
    if table_empty(GAME.pickups) then
      return
    end

    local item_list = {}

    local stats = R.fight_stats[SK][CL]

    for stat,qty in pairs(stats) do
      if qty > 0 then
        select_pickups(R, item_list, stat, qty, hmodel)

        gui.debugf("Item list for %s:%1.1f [%s/%s] @ %s\n", stat,qty, CL,SK, R:tostr())
        for _,pair in ipairs(item_list) do
          local item = pair.item
          gui.debugf("   %dx %s (%d) @ %s\n", pair.count, item.name,
                     item.give[1].health or item.give[1].count, SK)
        end
      end
    end

    sort_spots(R)

    -- place large clusters before small ones
    table.sort(item_list, function(A,B) return (A.count + A.rand) > (B.count + B.rand) end)

    place_item_list(R, item_list, SK, CL)
  end

  local function pickups_in_room(R)
    if find_pickup_spots(R) then
      for _,SK in ipairs(SKILLS) do
        for CL,hmodel in pairs(LEVEL.hmodels[SK]) do
          pickups_for_hmodel(R, SK, CL, hmodel)
        end -- for CL
      end -- for SK
    end
  end


  ---| Monsters_do_pickups |---

  for _,R in ipairs(LEVEL.all_rooms) do
    if not (R.kind == "stairwell" or R.kind == "smallexit") then
      distribute_fight_stats(R)
    end
  end

  for _,R in ipairs(LEVEL.all_rooms) do
    if not (R.kind == "stairwell" or R.kind == "smallexit") then
      pickups_in_room(R)
    end
  end
end


function Monsters_in_room(R)

  local function is_big(mon)
    return GAME.things[mon].r > 34
  end

  local function is_huge(mon)
    return GAME.things[mon].r > 66
  end

  local function calc_toughness()
    -- determine a "toughness" value, where 1.0 is normal and
    -- higher values (upto ~ 4.0) produces tougher monsters.

    -- each level gets progressively tougher
    local toughness = LEVEL.toughness or 
                      (0.5 + LEVEL.ep_along * 3.0)

    -- less emphasis within a level, since each arena naturally
    -- get tougher as the player picks up new weapons.
    if R.arena.id == 1 then
      toughness = toughness * 0.8
    elseif R.arena.id >= (#LEVEL.all_arenas - 1) then
      toughness = toughness * 1.2
    end

    -- factor in the user Strength setting
    toughness = toughness + (MONSTER_TOUGHNESS[OB_CONFIG.strength] or 0)

    if R.kind == "hallway" then
      toughness = toughness / 2
    end

    -- spice it up
    toughness = toughness + rand_range(0, 0.4)

    gui.debugf("Toughness = %1.3f\n", toughness)

    return toughness
  end

  local function calc_quantity()
    local qty

    if LEVEL.quantity then
      qty = LEVEL.quantity

    elseif OB_CONFIG.mons == "mixed" then
      qty = LEVEL.mixed_mons_qty

    elseif OB_CONFIG.mons == "prog" then
      qty = LEVEL.prog_mons_qty

    else
      qty = MONSTER_QUANTITIES[OB_CONFIG.mons]
    end

    assert(qty);
    gui.debugf("Quantity = %1.0f\n", qty)

    return qty
  end


  local function prob_for_mon(info, fp, toughness)
    local name = info.name
    local prob = info.prob

    if LEVEL.global_skip[name] then
      return 0
    end

    -- TODO: merge THEME.monster_prefs into LEVEL.monster_prefs
    if LEVEL.monster_prefs then
      prob = prob * (LEVEL.monster_prefs[name] or 1)
    end
    if THEME.monster_prefs then
      prob = prob * (THEME.monster_prefs[name] or 1)
    end

    if R.room_type and R.room_type.monster_prefs then
      prob = prob * (R.room_type.theme.monster_prefs[name] or 1)
    end

    if prob == 0 then return 0 end


    local time   = info.health / fp
    local damage = info.damage * time

    gui.debugf("  %s --> damage:%1.1f (%1.1f)  time:%1.2f\n", name, damage, damage/toughness, time)

    -- would the monster take too long to kill?
    local max_time = MONSTER_MAX_TIME[OB_CONFIG.strength] or 14

    if toughness > 1 then
      max_time = max_time / math.sqrt(toughness)
    end

    if PARAM.time_factor then
      max_time = max_time * PARAM.time_factor
    end

    if time >= max_time then return 0 end

    if time > max_time/2 then
      prob = prob * (max_time - time) / (max_time/2)
    end

    -- would the monster inflict too much damage on the player?
    local max_damage = MONSTER_MAX_DAMAGE[OB_CONFIG.strength] or 200
    local low_damage = MONSTER_LOW_DAMAGE[OB_CONFIG.strength] or 1

    damage = damage / toughness

    if PARAM.damage_factor then
      damage = damage * PARAM.damage_factor
    end

    if damage >= max_damage then return 0 end

    if damage > max_damage/2 then
      prob = prob * (max_damage - damage) / (max_damage/2)
    end

    if damage < low_damage then
      prob = prob * (damage / low_damage) ^ 1.2
    end

    if R.outdoor then
      prob = prob * (info.outdoor_factor or 1)
    end

    return prob
  end

  local function number_of_kinds(fp)
    local size = (R.tw or R.sw) + (R.th or R.sh)
    local num  = int(size / 5.0 + 0.55 + gui.random())

    if num < 1 then num = 1 end
    if num > 4 then num = 4 end

    local ONE_MORE_CHANCES = { normal=30, more=50, heaps=80 }

    local bump_prob = ONE_MORE_CHANCES[OB_CONFIG.mons] or 20

    if rand_odds(bump_prob) then
      num = num + 1
    end

    return num
  end

  local function crazy_palette()
    local size = (R.tw or R.sw) + (R.th or R.sh)
    local num_kinds = int(size / 2)

    local list = {}

    for name,info in pairs(GAME.monsters) do
      local prob = info.crazy_prob or info.prob or 0

      if LEVEL.global_skip[name] then
        prob = 0
      end

      if prob > 0 and LEVEL.monster_prefs then
        prob = prob * (LEVEL.monster_prefs[name] or 1)
        if info.replaces then
          prob = prob * (LEVEL.monster_prefs[info.replaces] or 1)
        end
      end

      if prob > 0 then
        list[name] = prob
      end
    end

    local palette = {}

    gui.debugf("Monster palette: (%d kinds, %d actual)\n", num_kinds, table_size(list))

    for i = 1,num_kinds do
      if table_empty(list) then break; end

      local mon = rand_key_by_probs(list)
      palette[mon] = list[mon]

      gui.debugf("  #%d %s\n", i, mon)
      LEVEL.mon_stats[mon] = (LEVEL.mon_stats[mon] or 0) + 1

      list[mon] = nil
    end

    return palette
  end

  local function select_monsters(toughness)
    if OB_CONFIG.strength == "crazy" then
      return crazy_palette()
    end

    local fp = Player_calc_firepower()
    gui.debugf("Firepower = %1.3f\n", fp)
    
    local list = {}
    gui.debugf("Monster list:\n")

    for name,info in pairs(GAME.monsters) do
      if info.prob then
        local prob = prob_for_mon(info, fp, toughness)

        if prob > 0 then
          list[name] = prob
          gui.debugf("  %s --> prob:%1.1f\n", name, prob)
        end
      end
    end

    local num_kinds = number_of_kinds(fp)

    local palette = {}

    gui.debugf("Monster palette: (%d kinds, %d actual)\n", num_kinds, table_size(list))

    for i = 1,num_kinds do
      if table_empty(list) then break; end

      local mon  = rand_key_by_probs(list)
      local prob = list[mon]
      list[mon] = nil

      -- sometimes replace it completely (e.g. all demons become spectres)
      if rand_odds(25) and LEVEL.mon_replacement[mon] then
        mon = rand_key_by_probs(LEVEL.mon_replacement[mon])
      end

      palette[mon] = prob

      gui.debugf("  #%d %s\n", i, mon)
      LEVEL.mon_stats[mon] = (LEVEL.mon_stats[mon] or 0) + 1
    end

    return palette
  end

  local function monster_fits(S, mon, info)
    if S.content or S.no_monster or not S.floor_h then
      return false
    end

    -- keep entryway clear
    if R.entry_conn and S.conn == R.entry_conn then
      return false
    end

    -- check seed kind
    -- (floating monsters can go in more places)
    if S.kind == "walk" or (S.kind == "liquid" and info.float) then
      -- OK
    else
      return false
    end

    -- check if fits vertically
    local ceil_h = S.ceil_h or R.ceil_h or SKY_H
    local thing  = assert(GAME.things[mon])

    if thing.h >= (ceil_h - S.floor_h - 1) then
      return false
    end

    if is_huge(mon) and S.solid_corner then
      return false
    end

    return true
  end

  local function add_mon_spot(S, x, y, mon, info)
    local SPOT =
    {
      S=S, x=x, y=y, monster=mon, info=info
    }
    table.insert(R.monster_spots, SPOT)
  end

  local function add_spot_group(S, mon, info)
    local sx, sy = S.sx, S.sy
    local mx, my = S:mid_point()

    if is_huge(mon) then
      add_mon_spot(S, S.x2, S.y2, mon, info)

      -- prevent other seeds in 2x2 group from being used
      SEEDS[sx+1][sy+0][1].no_monster = true
      SEEDS[sx+0][sy+1][1].no_monster = true
      SEEDS[sx+1][sy+1][1].no_monster = true

    elseif is_big(mon) then
      add_mon_spot(S, mx, my, mon, info)
    else
      add_mon_spot(S, mx-36, my-36, mon, info)
      add_mon_spot(S, mx-36, my+36, mon, info)
      add_mon_spot(S, mx+36, my-36, mon, info)
      add_mon_spot(S, mx+36, my+36, mon, info)
    end
  end

  local function try_occupy_seed(S, x, y, mon, totals)
    local info  = GAME.monsters[mon]
    local thing = GAME.things[mon]

    local sx2, sy2 = x, y
    if is_huge(mon) then
      sx2, sy2 = x+1, y+1
    end

    for sx = x,sx2 do for sy = y,sy2 do
      local S2 = SEEDS[sx][sy][1]
      if S2.room ~= S.room then
        return false
      end

      if not monster_fits(S2, mon, info) then
        return false
      end

      -- ensure no floor difference for huge monsters
      if sx > x or sy > y then
        local diff = math.abs((S.floor_h or 0) - (S2.floor_h or 0))
        if diff > 1 then return false end
      end
    end end -- sx, sy

    -- create spots
    add_spot_group(S, mon, info)

    totals[mon] = totals[mon] + 1

    return true
  end

  local function steal_a_seed(mon, totals)
    if is_huge(mon) then
      -- monster requires 2x2 seeds, but we cannot steal that
      return
    end

    local victim

    for name,count in pairs(totals) do
      if name ~= mon and (count >= 2) and (not victim or count > totals[victim]) then
        victim = name
      end
    end

    if not victim then
      gui.debugf("steal_a_seed(%s): nobody to steal from!\n", mon)
      return
    end

    gui.debugf("steal_a_seed(%s): stealing from %s\n", mon, victim)

    local new_info = GAME.monsters[mon]

    local qty = 1
    if totals[victim] >= 10 then qty = 2 end

    for loop = 1,qty do
      local victim_S

      -- recreate the spot list
      local old_list = R.monster_spots
      R.monster_spots = {}

      for _,spot in ipairs(old_list) do
        if victim_S and spot.S == victim_S then
          -- skip other spots in the same seed
        elseif not victim_S and spot.monster == victim and
               monster_fits(spot.S, mon, new_info)
        then
          add_spot_group(spot.S, mon, new_info)
          victim_S = spot.S

          totals[mon]    = totals[mon] + 1
          totals[victim] = totals[victim] - 1
        else
          table.insert(R.monster_spots, spot)
        end
      end

      -- may not have worked (different requirements)
      gui.debugf("  loop:%d %s\n", loop, sel(victim_S, "OK", "FAILED"))
      if not victim_S then break; end
    end

    rand_shuffle(R.monster_spots)
  end

  local function create_monster_map(palette)
    R.monster_spots = {}

    -- adjust probs in palette to account for monster size,
    -- i.e. we can fit 4 imps in a seed but only one mancubus,
    -- hence imps should occur less often (per seed).

    local pal_2  = {}
    local totals = {}

    for mon,prob in pairs(palette) do
      pal_2[mon]  = prob
      totals[mon] = 0

      if is_big(mon) and not is_huge(mon) then
        pal_2[mon] = pal_2[mon] * 3
      end
    end

    -- TODO: sometimes maintain symmetry

    for x = R.sx1,R.sx2 do for y = R.sy1,R.sy2 do
      local S = SEEDS[x][y][1]

      if S.room == R and S.floor_h and not S.no_monster then
        local try_pal = shallow_copy(pal_2)

        -- try other monsters if the first doesn't fit
        while not table_empty(try_pal) do
          local mon = rand_key_by_probs(try_pal)
          try_pal[mon] = nil

          if try_occupy_seed(S, x, y, mon, totals) then
            break;
          end
        end
      end
    end end -- for x, y

    rand_shuffle(R.monster_spots)
    
    -- make sure each monster has at least one seed
    for mon,_ in pairs(palette) do
      if totals[mon] == 0 then
        steal_a_seed(mon, totals)
      end
    end

    gui.debugf("Monster map totals:\n")
    for mon,count in pairs(totals) do
      gui.debugf("  %s = %d seeds\n", mon, count)
    end
  end

  local function how_many_dudes(mon, count, qty)
    local info = GAME.monsters[mon]

    if count <= 1 then return count end

    count = count * (qty / 100.0)

    -- adjust quantity based on monster's health
    if info.density then
      count = count * info.density
    end
 
    -- some random variation
    count = count * rand_range(MON_VARIATION_LOW, MON_VARIATION_HIGH)
    count = count + gui.random() ^ 2

    return math.max(1, int(count))
  end

  local function monster_angle(S)
    -- TODO: sometimes make all monsters (or a certain type) face
    --       the same direction, or look towards the entrance, or
    --       towards the guard_spot.

    if rand_odds(20) then
      return rand_irange(0,7) * 45
    end

    local delta = rand_irange(-1,1) * 45

    if R.sh > R.sw then
      if S.sy > (R.sy1 + R.sy2) / 2 then 
        return 270 + delta
      else
        return 90 + delta
      end
    else
      if S.sx > (R.sx1 + R.sx2) / 2 then 
        return 180 + delta
      else
        return sel(delta < 0, 315, delta)
      end
    end
  end

  local function add_to_list(SK, info)
    if not R.monster_list[SK] then
      R.monster_list[SK] = {}
    end

    table.insert(R.monster_list[SK], info)
  end

  local function place_monster(spot, index)
    local angle  = monster_angle(spot.S)
    local ambush = rand_sel(92, 1, 0)

    local mon  = spot.monster
    local info = spot.info

    -- handle replacements
    if LEVEL.mon_replacement[mon] and not R.no_replacement then
      mon  = rand_key_by_probs(LEVEL.mon_replacement[mon])
      info = assert(GAME.monsters[mon])
    end

    -- minimum skill needed for the monster to appear
    local skill

    if true then
      skill = 3 ; add_to_list(SKILLS[skill], info)
    end
    if (index % 3) >= 1 then
      skill = 2 ; add_to_list(SKILLS[skill], info)
    end
    if (index % 3) == 1 then
      skill = 1 ; add_to_list(SKILLS[skill], info)
    end

    local props = { angle = spot.angle or angle }

    if PARAM.format == "quake" then
      props.spawnflags = 0

      if props.ambush then props.spawnflags = props.spawnflags + 1 end

      if (skill > 1) then props.spawnflags = props.spawnflags + 256 end
      if (skill > 2) then props.spawnflags = props.spawnflags + 512 end
    else
      props.ambush = spot.ambush or ambush

      props.skill_hard   = 1
      props.skill_medium = sel(skill <= 2, 1, 0)
      props.skill_easy   = sel(skill <= 1, 1, 0)
    end
-- if (props.skill_medium ~= 1) then return end --!!!!!!!!!

    Trans_entity(mon, spot.x, spot.y, spot.S.floor_h, props)

    spot.S.content = "monster"
  end

  local function place_barrel(spot)
    if spot.S.conn or spot.S.kind ~= "walk" then
      return
    end

    Trans_entity("barrel", spot.x, spot.y, spot.S.floor_h)

    spot.S.content = "monster"  -- allow items to exist here
  end

  local function fill_monster_map(qty, barrel_chance)
    local totals  = {}
    local actuals = {}

    for _,spot in ipairs(R.monster_spots) do
      totals[spot.monster] = (totals[spot.monster] or 0) + 1
    end

    for mon,count in pairs(totals) do
      actuals[mon] = how_many_dudes(mon, count, qty)
    end

    for index,spot in ipairs(R.monster_spots) do
      if (actuals[spot.monster] or 0) >= 1 then
        place_monster(spot, actuals[spot.monster])
        actuals[spot.monster] = actuals[spot.monster] - 1
      elseif rand_odds(barrel_chance) then
        place_barrel(spot)
      end
    end
  end

  local function add_monsters()
    local toughness = calc_toughness()

    local qty = calc_quantity()

    local palette = select_monsters(toughness)

    local barrel_chance = sel(R.outdoor, 2, 20)
    if R.kind == "hallway" then barrel_chance = 5 end
    if STYLE.barrels == "heaps" or rand_odds(10) then barrel_chance = barrel_chance * 3 + 10 end
    if STYLE.barrels == "few"   or rand_odds(30) then barrel_chance = barrel_chance / 4 end

    -- sometimes prevent monster replacements
    if rand_odds(40) or OB_CONFIG.strength == "crazy" then
      R.no_replacement = true
    end

    -- FIXME: add barrels even when no monsters in room

    if not table_empty(palette) then
      create_monster_map(palette)
      fill_monster_map(qty, barrel_chance)
    end
  end


  local function make_empty_stats()
    local stats = {}

    for _,SK in ipairs(SKILLS) do
      stats[SK] = {}
      for CL,_ in pairs(GAME.player_model) do
        stats[SK][CL] = {}
      end
    end

    return stats
  end

  local function collect_weapons(hmodel)
    local list = {}

    for name,_ in pairs(hmodel.weapons) do
      local info = assert(GAME.weapons[name])
      if info.pref then
        table.insert(list, info)
      end
    end

    if #list == 0 then
      error("No usable weapons???")
    end

    return list
  end

  local function give_monster_drops(mon_list, hmodel)
    for _,info in ipairs(mon_list) do
      if info.give then
        Player_give_stuff(hmodel, info.give)
      end
    end
  end

  local function user_adjust_result(stats)
    -- apply the user's health/ammo adjustments here

    local heal_mul = HEALTH_AMMO_ADJUSTS[OB_CONFIG.health]
    local ammo_mul = HEALTH_AMMO_ADJUSTS[OB_CONFIG.ammo]

    heal_mul = heal_mul * (PARAM.health_factor or 1)
    ammo_mul = ammo_mul * (PARAM.ammo_factor or 1)

    for name,qty in pairs(stats) do
      stats[name] = qty * sel(name == "health", heal_mul, ammo_mul)
    end
  end

  local function subtract_gotten_stuff(stats, hmodel)
    for name,got_qty in pairs(hmodel.stats) do
      local st_qty = stats[name] or 0
      if st_qty > 0 and got_qty > 0 then
        local min_q = math.min(st_qty, got_qty)

        hmodel.stats[name] = hmodel.stats[name] - min_q
               stats[name] =        stats[name] - min_q
      end
    end
  end


  ---| Monsters_in_room |---

  gui.debugf("Monsters_in_room @ %s\n", R:tostr())

  R.monster_list = {}
  R.fight_stats  = make_empty_stats()

  if OB_CONFIG.mons == "none" then
    return
  end

  if R.purpose == "START" and not R.has_raising_start then
    return
  end

  if R.kind == "stairwell" or R.kind == "smallexit" then
    return
  end

  assert(R.kind ~= "scenic")


  add_monsters()


  -- simulate the battle!!

  for _,SK in ipairs(SKILLS) do
    local mon_list = R.monster_list[SK]
    if mon_list and #mon_list >= 1 then

      for CL,hmodel in pairs(LEVEL.hmodels[SK]) do
        local weap_list = collect_weapons(hmodel)
        local stats = R.fight_stats[SK][CL]

        gui.debugf("Fight simulator @ %s  SK:%s\n", R:tostr(), SK)
        gui.debugf("weapons = \n")
        for _,info in ipairs(weap_list) do
          gui.debugf("  %s\n", info.name)
        end

        local weap_prefs = LEVEL.weap_prefs or LEVEL.theme.weap_prefs or {}

        Fight_simulator(mon_list, weap_list, weap_prefs, SK, stats)
        gui.debugf("raw result = \n%s\n", table_to_str(stats,1))

        user_adjust_result(stats)
        gui.debugf("adjusted result = \n%s\n", table_to_str(stats,1))

        give_monster_drops(mon_list, hmodel)

        subtract_gotten_stuff(stats, hmodel)

        gui.debugf("final result = \n%s\n", table_to_str(stats,1))
      end -- for CL

    end
  end -- for SK
end


function Monsters_show_stats()
  local total = 0
  for _,count in pairs(LEVEL.mon_stats) do
    total = total + count
  end

  local function get_stat(mon)
    local num = LEVEL.mon_stats[mon] or 0
    local div = int(num * 99.8 / total)
    if div == 0 and num > 0 then div = 1 end
    return string.format("%02d", div)
  end

  if total == 0 then
    gui.debugf("STATS  no monsters at all\n")
  else
    gui.debugf("STATS  zsi:%s,%s,%s  crk:%s,%s,%s  mvb:%s,%s,%s  gap:%s,%s,%s\n",
               get_stat("zombie"), get_stat("shooter"), get_stat("imp"),
               get_stat("caco"), get_stat("revenant"), get_stat("knight"),
               get_stat("mancubus"), get_stat("vile"), get_stat("baron"),
               get_stat("gunner"), get_stat("arach"), get_stat("pain"))
  end
end


function Monsters_make_battles()
  
  gui.printf("\n--==| Monsters_make_battles |==--\n\n")

  Player_init()

  Monsters_init()
  Monsters_global_palette()

  local cur_arena = -1

  -- Rooms have been sorted into a visitation order, so we
  -- simply visit them one-by-one and insert some monsters
  -- and simulate each battle.

  for _,R in ipairs(LEVEL.all_rooms) do
    if R.arena.weapon and (R.arena.id > cur_arena) then
      Player_give_weapon(R.arena.weapon)
      cur_arena = R.arena.id
    end

    Monsters_in_room(R)
  end -- for R

  Monsters_show_stats()

  -- Once all monsters have been chosen and all battles
  -- (including cages and traps) have been simulated, then
  -- we can decide what pickups to add (the easy part) and
  -- _where_ to place them (the hard part).

  Monsters_do_pickups()
end

