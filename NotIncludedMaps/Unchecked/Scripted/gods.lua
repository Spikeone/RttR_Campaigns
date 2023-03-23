function getRequiredLuaVersion()
    return 1
end

rttr:RegisterTranslations(
{
    en =
    {
        title   = 'Gods are watching',
        name    = '\'s people',

        msg1    = 'bla bla\n\n- send your people goods by trading\n-they have nothing in the beginning\n-they can only build: Quarry, Woodcutter, Barracks, Guardhouse, Watchtower\n-god who first loses his ally HQ loses',
        msgh1   = 'Your people may only build: Quarry, Woodcutter, Barracks, Guardhouse, Watchtower!',

        hosttitle = 'Important',
        hosthint = 'Please keep the following settings:\nGoals: Total domination\nLock teams: enabled\nShared team view: enabled\nRandom start locations: disabled\n\nThis is required for this mission to work!\n\nFeel free to change any other setting for your liking. Some addons are locked.'
    }
})

-- format mission texts
function MissionText(e)
    local msg = _('msg' .. tostring(e))
    local msgh = _('msgh'.. tostring(e))

    if(msg ~= ('msg' .. tostring(e)) and msgh ~= ('msgh'.. tostring(e))) then
        rttr:MissionStatement(0, _('title'), msg .. '\n\n\n\n\n\n\n' ..msgh.. '\n\n\n\n\n\n\n', IM_SWORDSMAN, true)
        rttr:SetMissionGoal(0, msgh)
        rttr:MissionStatement(1, _('title'), msg .. '\n\n\n\n\n\n\n' ..msgh.. '\n\n\n\n\n\n\n', IM_SWORDSMAN, true)
        rttr:SetMissionGoal(1, msgh)
    elseif(msg ~= ('msg' .. tostring(e))) then
        rttr:MissionStatement(0, _('title'), msg .. '\n\n\n\n\n\n\n', IM_SWORDSMAN, true)
        rttr:MissionStatement(1, _('title'), msg .. '\n\n\n\n\n\n\n', IM_SWORDSMAN, true)
    end
end

function onSettingsReady()
    rttr:Log("-----------------------\n Mission Script loaded... \n-----------------------\n")
   -- rttr:MsgBox('Information', 'You can change some addons. They have been set to the original intention, so keep that in mind.', false)

    rttr:SetAddon(ADDON_TRADE, true)
    rttr:SetAddon(ADDON_AI_DEBUG_WINDOW, false)
    rttr:SetAddon(ADDON_STATISTICS_VISIBILITY, 1)
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetAddon(ADDON_PEACEFULMODE, false)
    rttr:SetGameSettings({
        ["teamView"] = true,
        ["lockedTeams"] = true,
        ["objective"] = GO_TOTALDOMINATION
    })

    -- fake host joining
    onPlayerJoined(0)
    
    rttr:MsgBox(_('hosttitle'), _('hosthint'), true)
end

function getAllowedChanges()
    return  {
        ["general"]     = true,
        ["addonsAll"]   = false,
        ["addonsSome"]  = true,
        ["ownNation"]   = true,
        ["ownColor"]    = true,
        ["ownTeam"]     = false,
        ["aiNation"]    = true,
        ["aiColor"]     = true,
        ["aiTeam"]      = false,
        ["swapping"]    = false
    }
end

function getAllowedAddons()
    return {
        ADDON_LIMIT_CATAPULTS,
        ADDON_INEXHAUSTIBLE_MINES,
        ADDON_REFUND_MATERIALS,
        ADDON_EXHAUSTIBLE_WATER,
        ADDON_REFUND_ON_EMERGENCY,
        ADDON_MANUAL_ROAD_ENLARGEMENT,
        ADDON_CATAPULT_GRAPHICS,
        ADDON_METALWORKSBEHAVIORONZERO,
        ADDON_DEMOLITION_PROHIBITION,
        ADDON_CHARBURNER,
        ADDON_CHANGE_GOLD_DEPOSITS,
        ADDON_MAX_WATERWAY_LENGTH,
        ADDON_CUSTOM_BUILD_SEQUENCE,
        ADDON_DEFENDER_BEHAVIOR,
        ADDON_NO_COINS_DEFAULT,
        ADDON_ADJUST_MILITARY_STRENGTH,
        ADDON_TOOL_ORDERING,
        ADDON_MILITARY_AID,
        ADDON_INEXHAUSTIBLE_GRANITEMINES,
        ADDON_MAX_RANK,
        ADDON_SEA_ATTACK,
        ADDON_INEXHAUSTIBLE_FISH,
        ADDON_MORE_ANIMALS,
        ADDON_BURN_DURATION,
        ADDON_NO_ALLIED_PUSH,
        ADDON_BATTLEFIELD_PROMOTION,
        ADDON_HALF_COST_MIL_EQUIP,
        ADDON_MILITARY_CONTROL,
        ADDON_SHIP_SPEED,
        ADDON_MILITARY_HITPOINTS,
        ADDON_NUM_SCOUTS_EXPLORATION,
        ADDON_COINS_CAPTURED_BLD,
        ADDON_DEMOLISH_BLD_WO_RES,
        ADDON_DURABLE_GEOLOGIST_SIGNS
    }
end

function onPlayerJoined(playerIdx)
    rttr:Log("idx: " ..playerIdx)
    if (playerIdx == 0 or playerIdx == 1) then
        local name = rttr:GetPlayer(playerIdx):GetName()
    
        rttr:GetPlayer(playerIdx + 2):Close()
        rttr:GetPlayer(playerIdx + 2):SetAI(3)
        rttr:GetPlayer(playerIdx + 2):SetName(name .. _('name'))
    
        if (playerIdx == 0) then
            rttr:GetPlayer(playerIdx):SetTeam(TM_TEAM1)
            rttr:GetPlayer(playerIdx + 2):SetTeam(TM_TEAM1)
        else
            rttr:GetPlayer(playerIdx):SetTeam(TM_TEAM2)
            rttr:GetPlayer(playerIdx + 2):SetTeam(TM_TEAM2)
        end
    
    end
end

function onPlayerLeft(playerIdx)
    if (playerIdx ~= 1) then return end

    rttr:GetPlayer(playerIdx):Close()
    rttr:GetPlayer(playerIdx + 2):Close()
end

function onStart(isFirstStart)
    

    if (isFirstStart) then
        addPlayerRes()
    end

    for p=0, 1 do
        rttr:GetPlayer(p):DisableBuilding(BLD_FORTRESS)
        rttr:GetPlayer(p):DisableBuilding(BLD_WATCHTOWER)
        rttr:GetPlayer(p):DisableBuilding(BLD_GUARDHOUSE)
    end
    
    for p=2, 3 do
        rttr:GetPlayer(p):DisableAllBuildings()
        rttr:GetPlayer(p):EnableBuilding(BLD_WATCHTOWER, false)
        rttr:GetPlayer(p):EnableBuilding(BLD_GUARDHOUSE, false)
        rttr:GetPlayer(p):EnableBuilding(BLD_BARRACKS, false)
        rttr:GetPlayer(p):EnableBuilding(BLD_WOODCUTTER, false)
        rttr:GetPlayer(p):EnableBuilding(BLD_QUARRY, false)
        rttr:GetPlayer(p):ModifyHQ(true)
    end
end

function addPlayerRes()

    -- keep start wares but remove donkeys and cap soldiers to 10
    local hostPlr = rttr:GetPlayer(0)

    local wood = hostPlr:GetNumWares(GD_WOOD)
    local boards = hostPlr:GetNumWares(GD_BOARDS)
    local stones = hostPlr:GetNumWares(GD_STONES)
    local meat = hostPlr:GetNumWares(GD_MEAT)
    local grain = hostPlr:GetNumWares(GD_GRAIN)
    local flour = hostPlr:GetNumWares(GD_FLOUR)
    
    local fish = hostPlr:GetNumWares(GD_FISH)
    local ham = hostPlr:GetNumWares(GD_HAM)
    local bread = hostPlr:GetNumWares(GD_BREAD)
    local coal = hostPlr:GetNumWares(GD_COAL)
    
    local ironore = hostPlr:GetNumWares(GD_IRONORE)
    local tongs = hostPlr:GetNumWares(GD_TONGS)
    local axe = hostPlr:GetNumWares(GD_AXE)
    
    local saw = hostPlr:GetNumWares(GD_SAW)
    local pickaxe = hostPlr:GetNumWares(GD_PICKAXE)
    local hammer = hostPlr:GetNumWares(GD_HAMMER)
    local shovel = hostPlr:GetNumWares(GD_SHOVEL)
    local crucible = hostPlr:GetNumWares(GD_CRUCIBLE)
    
    local scythe = hostPlr:GetNumWares(GD_SCYTHE)
    local cleaver = hostPlr:GetNumWares(GD_CLEAVER)
    local rollingpin = hostPlr:GetNumWares(GD_ROLLINGPIN)
    local bow = hostPlr:GetNumWares(GD_BOW)

    local helper = hostPlr:GetNumPeople(JOB_HELPER)
    local builder = hostPlr:GetNumPeople(JOB_BUILDER)
    local planer = hostPlr:GetNumPeople(JOB_PLANER)
    local woodcutter = hostPlr:GetNumPeople(JOB_WOODCUTTER)
    local forester = hostPlr:GetNumPeople(JOB_FORESTER)
    local stonemason = hostPlr:GetNumPeople(JOB_STONEMASON)

    local hunter = hostPlr:GetNumPeople(JOB_HUNTER)
    local carpenter = hostPlr:GetNumPeople(JOB_CARPENTER)
    local farmer = hostPlr:GetNumPeople(JOB_FARMER)

    local baker = hostPlr:GetNumPeople(JOB_BAKER)
    local butcher = hostPlr:GetNumPeople(JOB_BUTCHER)
    local miner = hostPlr:GetNumPeople(JOB_MINER)
    local ironfunder = hostPlr:GetNumPeople(JOB_IRONFOUNDER)

    local armorer = hostPlr:GetNumPeople(JOB_ARMORER)
    local minter = hostPlr:GetNumPeople(JOB_MINTER)
    local metalworker = hostPlr:GetNumPeople(JOB_METALWORKER)
    local shipwright = hostPlr:GetNumPeople(JOB_SHIPWRIGHT)
    local geologist = hostPlr:GetNumPeople(JOB_GEOLOGIST)
    local scout = hostPlr:GetNumPeople(JOB_SCOUT)

    for p=0,3 do
        rttr:GetPlayer(p):ClearResources()

        -- player only
        if (p < 2) then
            rttr:GetPlayer(p):AddWares({
                [GD_WOOD      ] = wood,
                [GD_BOARDS    ] = boards,
                [GD_STONES    ] = stones,
                [GD_MEAT      ] = meat,
                [GD_GRAIN     ] = grain,
                [GD_FLOUR     ] = flour,

                [GD_FISH      ] = fish,
                [GD_HAM       ] = ham,
                [GD_BREAD     ] = bread,
                [GD_WATER     ] = 0,
                [GD_BEER      ] = 0,
                [GD_COAL      ] = coal,

                [GD_IRONORE   ] = ironore,
                [GD_GOLD      ] = 0,
                [GD_IRON      ] = 0,
                [GD_COINS     ] = 0,
                [GD_TONGS     ] = tongs,
                [GD_AXE       ] = axe,

                [GD_SAW       ] = saw,
                [GD_PICKAXE   ] = pickaxe,
                [GD_HAMMER    ] = hammer,
                [GD_SHOVEL    ] = shovel,
                [GD_CRUCIBLE  ] = crucible,
                [GD_RODANDLINE] = 0,

                [GD_SCYTHE    ] = scythe,
                [GD_CLEAVER   ] = cleaver,
                [GD_ROLLINGPIN] = rollingpin,
                [GD_BOW       ] = bow,
                [GD_SWORD     ] = 0,
                [GD_SHIELD    ] = 0,

                [GD_BOAT      ] = 0
            })
       
            rttr:GetPlayer(p):AddPeople({
                [JOB_HELPER             ] = helper,
                [JOB_BUILDER            ] = builder,
                [JOB_PLANER             ] = planer,
                [JOB_WOODCUTTER         ] = woodcutter,
                [JOB_FORESTER           ] = forester,
                [JOB_STONEMASON         ] = stonemason,

                [JOB_FISHER             ] = 0,
                [JOB_HUNTER             ] = hunter,
                [JOB_CARPENTER          ] = carpenter,
                [JOB_FARMER             ] = farmer,
                [JOB_PIGBREEDER         ] = 0,
                [JOB_DONKEYBREEDER      ] = 0,

                [JOB_MILLER             ] = 0,
                [JOB_BAKER              ] = baker,
                [JOB_BUTCHER            ] = butcher,
                [JOB_BREWER             ] = 0,
                [JOB_MINER              ] = miner,
                [JOB_IRONFOUNDER        ] = ironfunder,

                [JOB_ARMORER            ] = armorer,
                [JOB_MINTER             ] = minter,
                [JOB_METALWORKER        ] = metalworker,
                [JOB_SHIPWRIGHT         ] = shipwright,
                [JOB_GEOLOGIST          ] = geologist,
                [JOB_SCOUT              ] = scout,

                [JOB_PACKDONKEY         ] = 0,
                [JOB_CHARBURNER         ] = 0,

                [JOB_PRIVATE            ] = 10,
                [JOB_PRIVATEFIRSTCLASS  ] = 0,
                [JOB_SERGEANT           ] = 0,
                [JOB_OFFICER            ] = 0,
                [JOB_GENERAL            ] = 0
            })
        else
            rttr:GetPlayer(p):AddPeople({
                [JOB_PRIVATE            ] = 1,
                [JOB_PRIVATEFIRSTCLASS  ] = 1,
                [JOB_SERGEANT           ] = 1,
                [JOB_OFFICER            ] = 1,
                [JOB_GENERAL            ] = 1
            })
        end
    end
end

function onGameFrame(gf)
    if((gf%20)~=0) then
        return
    end

    if(gf==60) then
        MissionText(1)
    end

    if (rttr:GetPlayer(2):GetNumBuildings(BLD_HEADQUARTERS) < 1 and not rttr:GetPlayer(0):IsDefeated()) then
        rttr:GetPlayer(0):Surrender(true)
        rttr:GetPlayer(2):Surrender(true)
    elseif (rttr:GetPlayer(3):GetNumBuildings(BLD_HEADQUARTERS) < 1 and not rttr:GetPlayer(1):IsDefeated()) then
        rttr:GetPlayer(1):Surrender(true)
        rttr:GetPlayer(3):Surrender(true)
    end
end