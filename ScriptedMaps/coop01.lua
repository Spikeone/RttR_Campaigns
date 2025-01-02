function getRequiredLuaVersion()
    return 1
end

function isMapPreviewEnabled()
    return false;
end

local debugEvents = false

AnimatedObjectTable = {
    [1]  = {x = 48  ,y = 69 ,speed = 8  ,id = 1 ,length = 8 ,enabled = true ,static = true  ,size = 1   ,file = 0xFFFF  ,graphics = {2530, 2531, 2532, 2533, 2534, 2535, 2536, 2537}},
    [2]  = {x = 50  ,y = 68 ,speed = 8  ,id = 1 ,length = 8 ,enabled = true ,static = true  ,size = 1   ,file = 0xFFFF  ,graphics = {724, 725, 726, 727, 728, 729, 730, 731}},
    [3]  = {x = 72  ,y = 32 ,speed = 8  ,id = 1 ,length = 8 ,enabled = true ,static = true  ,size = 1   ,file = 0xFFFF  ,graphics = {2530, 2531, 2532, 2533, 2534, 2535, 2536, 2537}},
    [4]  = {x = 50  ,y = 70 ,speed = 8  ,id = 1 ,length = 8 ,enabled = true ,static = true  ,size = 1   ,file = 0xFFFF  ,graphics = {2530, 2531, 2532, 2533, 2534, 2535, 2536, 2537}}
}

rttr:RegisterTranslations(
{
    en =
    {
        tasks_main = "Main objective(s):",
        tasks_sub = "Secondary objective(s):",
        tasks_hint = "[?] = Hidden or undiscovered objective\n[ ] = Objective not yet completed\n[+] = Objective was completed",
        tasks_legend = "Legend:",

        namePirates = 'Pirates',
        nameDefensiveLine = 'Defensive Line',
        nameTraders = 'Shady Traders',
        
        hostMessageTile = 'Information on settings',
        hostMessageText = 'Please note:\n\nYou can change some addon settings - this might increase or decrease the overall difficulty. Any testing has been done with the given addon settings!',
        errorSetupWrong = 'Wrong player setup',
        errorHumanAI = 'You set either player 1 or 2 to an AI, they MUST be human!',
        errorAIHuman = 'you set either player 3, 4, 5 or 6 to a human, they MUST be an AI!',

        msg100  = 'message: start exploring',
        -- 15, 104
        msg101  = 'message: maybe we should scout (build lookout tower)',
        -- 41, 74
        msg102  = 'message: dialogue harbor should be attacked',
        -- 51, 88
        msg103  = 'message: maybe we should build a harbor and a ship, we should salvage that wreck',
        -- 20, 56
        msg104  = 'message: quite long road, lets build something to store goods nearby',
        msg105  = 'message: salvaged some boards from that ship, should build a new one',
        -- 20, 56
        msg106  = 'message: beautiful island, finally some farming and better wood production',
        -- 13, 36
        msg107  = 'message: dialogue good work, maybe you can find resources',
        -- 66, 69
        msg108  = 'message: looks like we found some others, we should be wary',
        -- 47, 33
        msg109  = 'message: dialogue great fight',
        msg110  = 'message: dialogue seems like they are throwing rocks at me!',
        -- 57, 53
        msg111  = 'message: dialogue there, attack them',
        -- 64, 69
        msg112  = 'message: dialogue great fight, the next should be together',
        msg113  = 'message: old defense line, maybe should build fortress too',
        -- 77, 53
        msg114  = 'message: dialogue im going to attack',
        msg115  = 'message: dialogue show them',
        msg116  = 'message: dialogue we won',

        msg200  = 'message: start exploring',
        -- 21, 129
        msg201  = 'message: maybe we should build a harbor and a ship',
        -- 52, 108 -- harbor
        -- 43, 116 -- shipyard
        msg202  = 'message: bad feeling, something wrong about these seas, we should scout',
        -- 48, 101
        msg203  = 'message: dialogue harbor should be attacked',
        -- 51, 88
        msg204  = 'message: thanks for the scouting, captured some fisher',
        -- 48, 87
        msg205  = 'message: maybe we should build a harbor and a ship',
        -- 76, 83
        msg206  = 'message: sad that I couldnt participate',
        msg207  = 'message: dialogue scout for me and I will help',
        -- 66, 69
        msg208  = 'message: dialogue they wont see it coming',
        msg209  = 'message: dialogue yeah, let me find a way around',
        msg210  = 'message: maybe we can backstab them',
        -- 110, 59
        msg211  = 'message: dialogue show them',
        msg212  = 'message: dialogue im going to attack',
        msg213  = 'message: dialogue we won',

        hint100 = 'text hint100',
        hint200 = 'text hint200',
    }
})

eIdx =
{
    100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116,
    200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213,
    20,
    30, 31, 32, 33, 34, 35,
    40, 41, 42,
    50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66
}

function getAllowedChanges()
    return  {
        ["general"]     = true, -- TODO: false
        ["addonsAll"]   = false,
        ["addonsSome"]  = true,
        ["ownNation"]   = false,
        ["ownColor"]    = true,
        ["ownTeam"]     = false,
        ["aiNation"]    = false,
        ["aiColor"]     = true,
        ["aiTeam"]      = false,
        ["swapping"]    = true,
        ["playerState"] = false,
        ["aiNation"]    = false
    }
end

function getAllowedAddons()
    return {
        ADDON_EXHAUSTIBLE_WATER,
        ADDON_REFUND_ON_EMERGENCY,
        ADDON_MANUAL_ROAD_ENLARGEMENT,
        ADDON_CATAPULT_GRAPHICS,
        ADDON_METALWORKSBEHAVIORONZERO,
        ADDON_CUSTOM_BUILD_SEQUENCE,
        ADDON_STATISTICS_VISIBILITY,
        ADDON_DEFENDER_BEHAVIOR,
        ADDON_NO_COINS_DEFAULT,
        ADDON_ADJUST_MILITARY_STRENGTH,
        ADDON_TOOL_ORDERING,
        ADDON_MILITARY_AID,
        ADDON_MAX_RANK,
        ADDON_MORE_ANIMALS,
        ADDON_BURN_DURATION,
        ADDON_MILITARY_CONTROL,
        ADDON_SHIP_SPEED,
        ADDON_MILITARY_HITPOINTS,
        ADDON_COINS_CAPTURED_BLD,
        ADDON_DEMOLISH_BLD_WO_RES,
        ADDON_DURABLE_GEOLOGIST_SIGNS,
        ADDON_AUTOFLAGS
    }
end

function onSettingsReady()
    rttr:MsgBoxEx(_('hostMessageTile'), _('hostMessageText'), 'io', 196, 12 + 16 + 8, 15 + 24 + 8)

    rttr:SetAddon(ADDON_LIMIT_CATAPULTS, 0)
    rttr:SetAddon(ADDON_INEXHAUSTIBLE_MINES, true)
    rttr:SetAddon(ADDON_REFUND_MATERIALS, 0)
    rttr:SetAddon(ADDON_EXHAUSTIBLE_WATER, 0)
    rttr:SetAddon(ADDON_REFUND_ON_EMERGENCY, false)
    rttr:SetAddon(ADDON_MANUAL_ROAD_ENLARGEMENT, false)
    rttr:SetAddon(ADDON_CATAPULT_GRAPHICS, true)
    rttr:SetAddon(ADDON_METALWORKSBEHAVIORONZERO, 0)
    rttr:SetAddon(ADDON_DEMOLITION_PROHIBITION, 1)
    rttr:SetAddon(ADDON_CHARBURNER, false)
    rttr:SetAddon(ADDON_TRADE, false)
    rttr:SetAddon(ADDON_CHANGE_GOLD_DEPOSITS, 0)
    rttr:SetAddon(ADDON_MAX_WATERWAY_LENGTH, 1)
    rttr:SetAddon(ADDON_CUSTOM_BUILD_SEQUENCE, false)
    rttr:SetAddon(ADDON_STATISTICS_VISIBILITY, 1)
    rttr:SetAddon(ADDON_DEFENDER_BEHAVIOR, 2)
    rttr:SetAddon(ADDON_AI_DEBUG_WINDOW, false)
    rttr:SetAddon(ADDON_NO_COINS_DEFAULT, false)
    rttr:SetAddon(ADDON_ADJUST_MILITARY_STRENGTH, 1)
    rttr:SetAddon(ADDON_TOOL_ORDERING, false)
    rttr:SetAddon(ADDON_MILITARY_AID, false)
    rttr:SetAddon(ADDON_INEXHAUSTIBLE_GRANITEMINES, true)
    rttr:SetAddon(ADDON_MAX_RANK, 0)
    rttr:SetAddon(ADDON_SEA_ATTACK, 0)
    rttr:SetAddon(ADDON_INEXHAUSTIBLE_FISH, false)
    rttr:SetAddon(ADDON_MORE_ANIMALS, 0)
    rttr:SetAddon(ADDON_BURN_DURATION, 0)
    rttr:SetAddon(ADDON_NO_ALLIED_PUSH, false)
    rttr:SetAddon(ADDON_BATTLEFIELD_PROMOTION, false)
    rttr:SetAddon(ADDON_HALF_COST_MIL_EQUIP, false)
    rttr:SetAddon(ADDON_MILITARY_CONTROL, 0)
    rttr:SetAddon(ADDON_SHIP_SPEED, 2)
    rttr:SetAddon(ADDON_MILITARY_HITPOINTS, false)
    rttr:SetAddon(ADDON_NUM_SCOUTS_EXPLORATION, 4)
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetAddon(ADDON_COINS_CAPTURED_BLD, 0)
    rttr:SetAddon(ADDON_DEMOLISH_BLD_WO_RES, false)
    rttr:SetAddon(ADDON_PEACEFULMODE, false)
    rttr:SetAddon(ADDON_DURABLE_GEOLOGIST_SIGNS, 0)
    rttr:SetAddon(ADDON_ECONOMY_MODE_GAME_LENGTH, 0)
    rttr:SetAddon(ADDON_AUTOFLAGS, false)

    rttr:SetGameSettings({
        ["teamView"] = true,
        ["lockedTeams"] = true,
        ["objective"] = GO_TOTALDOMINATION,
        ["fow"] = EXP_CLASSIC,
        ["startWares"] = SWR_VLOW
    })

    rttr:GetPlayer(0):SetTeam(TM_TEAM1)
    rttr:GetPlayer(1):SetTeam(TM_TEAM1)

    rttr:GetPlayer(2):SetAI(3)
    rttr:GetPlayer(2):SetName(_('namePirates'))
    rttr:GetPlayer(2):SetNation(NAT_VIKINGS)

    rttr:GetPlayer(3):SetAI(3)
    rttr:GetPlayer(3):SetName(_('namePirates'))
    rttr:GetPlayer(3):SetNation(NAT_VIKINGS)

    rttr:GetPlayer(4):SetAI(3)
    rttr:GetPlayer(4):SetName(_('nameDefensiveLine'))
    rttr:GetPlayer(4):SetNation(NAT_VIKINGS)

    rttr:GetPlayer(5):SetAI(3)
    rttr:GetPlayer(5):SetName(_('nameTraders'))
    rttr:GetPlayer(5):SetNation(NAT_VIKINGS)
end

function onStart(isFirstStart)
    -- ValidatePlayersIngame() -- TODO: Enable

    -- Objects
    if(isFirstStart) then
        -- Blockers
        rttr:GetWorld():AddStaticObject(52, 108, 2525, 0xFFFF, 1)
        --rttr:GetWorld():AddEnvObject(52, 108, 552, 0xFFFF)
        rttr:GetWorld():AddStaticObject(76, 83, 2525, 0xFFFF, 1)
        --rttr:GetWorld():AddEnvObject(76, 83, 552, 0xFFFF)
        rttr:GetWorld():AddStaticObject(114, 78, 2525, 0xFFFF, 1)
        --rttr:GetWorld():AddEnvObject(114, 78, 552, 0xFFFF)

        -- Spiky Spikes
        rttr:GetWorld():AddStaticObject(12, 116, 4, 1, 1)
        rttr:GetWorld():AddStaticObject(13, 118, 6, 1, 1)
        rttr:GetWorld():AddStaticObject(12, 118, 0, 1, 1)
        rttr:GetWorld():AddStaticObject(10, 115, 4, 1, 1)
        rttr:GetWorld():AddStaticObject(12, 121, 0, 1, 1)
        rttr:GetWorld():AddStaticObject(16, 117, 0, 1, 1)
        rttr:GetWorld():AddStaticObject(19, 117, 6, 1, 1)
        rttr:GetWorld():AddStaticObject(11, 119, 4, 1, 1)

        -- broken ships
        rttr:GetWorld():AddStaticObject(10, 109, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(15, 125, 0, 0, 1)
        
        -- broken ship (salvage)
        rttr:GetWorld():AddStaticObject(20, 56, 0, 0, 1)

        -- guardhouses
        rttr:GetWorld():AddEnvObject(15, 104, 2, 2) --
        rttr:GetWorld():AddEnvObject(14, 96, 2, 2) --
        --rttr:GetWorld():AddEnvObject(15, 90, 2, 2) --o
        rttr:GetWorld():AddEnvObject(17, 88, 2, 2) -- n
        --rttr:GetWorld():AddEnvObject(20, 84, 2, 2) --o
        rttr:GetWorld():AddEnvObject(22, 83, 2, 2) -- n
        --rttr:GetWorld():AddEnvObject(25, 80, 2, 2) --o
        rttr:GetWorld():AddEnvObject(28, 78, 2, 2) -- n
        --rttr:GetWorld():AddEnvObject(31, 77, 2, 2) --o
        rttr:GetWorld():AddEnvObject(33, 75, 2, 2) -- n
        --rttr:GetWorld():AddEnvObject(36, 72, 2, 2) -- or
        -- rttr:GetWorld():AddEnvObject(34, 66, 2, 2) --o
        rttr:GetWorld():AddEnvObject(35, 67, 2, 2) -- n
        --rttr:GetWorld():AddEnvObject(38, 65, 2, 2) --or
        --rttr:GetWorld():AddEnvObject(40, 75, 2, 2) --or
        rttr:GetWorld():AddEnvObject(30, 63, 2, 2) -- nn
        rttr:GetWorld():AddEnvObject(24, 59, 2, 2) -- nn

        -- fortresses
        rttr:GetWorld():AddEnvObject(77, 50, 6, 2)
        rttr:GetWorld():AddEnvObject(78, 57, 6, 2)

        -- hut
        rttr:GetWorld():AddStaticObject(20, 51, 0, 2, 1)
    end

    -- Player 0
    addPlayerRes(0, not isFirstStart)
    rttr:GetPlayer(0):DisableAllBuildings()
    rttr:GetPlayer(0):EnableBuilding(BLD_GUARDHOUSE, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_GRANITEMINE, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_COALMINE, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_IRONMINE, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_GOLDMINE, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_WOODCUTTER, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_QUARRY, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_FORESTER, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_SLAUGHTERHOUSE, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_HUNTER, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_BREWERY, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_ARMORY, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_IRONSMELTER, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_PIGFARM, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_MILL, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_BAKERY, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_SAWMILL, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_MINT, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_WELL, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_FARM, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_DONKEYBREEDER, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_METALWORKS, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_FISHERY, false)

    -- Player 1
    addPlayerRes(1, not isFirstStart)
    rttr:GetPlayer(1):DisableAllBuildings()
    rttr:GetPlayer(1):EnableBuilding(BLD_BARRACKS, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_GRANITEMINE, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_COALMINE, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_IRONMINE, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_GOLDMINE, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_WOODCUTTER, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_QUARRY, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_FORESTER, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_SLAUGHTERHOUSE, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_HUNTER, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_BREWERY, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_ARMORY, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_IRONSMELTER, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_PIGFARM, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_MILL, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_BAKERY, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_SAWMILL, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_MINT, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_WELL, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_FARM, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_DONKEYBREEDER, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_METALWORKS, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_FISHERY, false)

    -- AI 2 (Pirates)
    addPlayerRes(2, not isFirstStart)
    rttr:GetPlayer(2):DisableAllBuildings()
    rttr:GetPlayer(2):EnableBuilding(BLD_LOOKOUTTOWER, false)
    rttr:GetPlayer(2):EnableBuilding(BLD_HARBORBUILDING, false)
    rttr:GetPlayer(2):EnableBuilding(BLD_SHIPYARD, false)
    rttr:GetPlayer(2):EnableBuilding(BLD_GUARDHOUSE, false)
    if (isFirstStart) then
        rttr:GetPlayer(2):AIConstructionOrder(43,89,BLD_LOOKOUTTOWER)
        rttr:GetPlayer(2):AIConstructionOrder(51,88,BLD_HARBORBUILDING)
        rttr:GetPlayer(2):AIConstructionOrder(49,86,BLD_SHIPYARD)
        rttr:GetPlayer(2):AIConstructionOrder(51,82,BLD_GUARDHOUSE)
    end

    -- AI 3 (Pirates II)
    addPlayerRes(3, not isFirstStart)
    rttr:GetPlayer(3):DisableAllBuildings()
    rttr:GetPlayer(3):EnableBuilding(BLD_GUARDHOUSE, false)
    rttr:GetPlayer(3):AIConstructionOrder(49,13,BLD_GUARDHOUSE)
    rttr:GetPlayer(3):AIConstructionOrder(55,9,BLD_GUARDHOUSE)

    -- AI 4 (Defensive Line)
    addPlayerRes(4, not isFirstStart)
    rttr:GetPlayer(4):DisableAllBuildings()
    rttr:GetPlayer(4):EnableBuilding(BLD_WATCHTOWER, false)
    rttr:GetPlayer(4):EnableBuilding(BLD_HARBORBUILDING, false)
    rttr:GetPlayer(4):EnableBuilding(BLD_LOOKOUTTOWER, false)
    rttr:GetPlayer(4):EnableBuilding(BLD_CATAPULT, false)
    if (isFirstStart) then
        rttr:GetPlayer(4):AIConstructionOrder(61,69,BLD_WATCHTOWER)
        rttr:GetPlayer(4):AIConstructionOrder(70,69,BLD_HARBORBUILDING)
        rttr:GetPlayer(4):AIConstructionOrder(60,66,BLD_LOOKOUTTOWER)
        rttr:GetPlayer(4):AIConstructionOrder(61,63,BLD_CATAPULT)
        rttr:GetPlayer(4):AIConstructionOrder(64,63,BLD_CATAPULT)
        rttr:GetPlayer(4):AIConstructionOrder(66,65,BLD_CATAPULT)
        rttr:GetPlayer(4):AIConstructionOrder(69,66,BLD_CATAPULT)
    end

    -- AI 5 (Shady traders)
    addPlayerRes(5, not isFirstStart)
    rttr:GetPlayer(5):DisableAllBuildings()
    rttr:GetPlayer(5):EnableBuilding(BLD_BARRACKS, false)
    rttr:GetPlayer(5):EnableBuilding(BLD_WATCHTOWER, false)
    rttr:GetPlayer(5):EnableBuilding(BLD_GUARDHOUSE, false)
    rttr:GetPlayer(5):AIConstructionOrder(105,18,BLD_BARRACKS)
    rttr:GetPlayer(5):AIConstructionOrder(116,25,BLD_GUARDHOUSE)
    rttr:GetPlayer(5):AIConstructionOrder(102,25,BLD_BARRACKS)
    rttr:GetPlayer(5):AIConstructionOrder(112,16,BLD_WATCHTOWER)

    -- Event initialization (after own functionality)
    eState = {}
    for _, i in ipairs(eIdx) do
        rttr:Log("Init Event " ..i.. " to 1")
        eState[i] = 1
    end

    if not isFirstStart then
        rttr:Log("Loading")
        for i = 1, eHist["n"] do
            rttr:Log("Loading eHist: " ..eHist[i])
            MissionEvent(eHist[i], true)
        end
    else
        eHist = {["n"] = 0}
    end
end

function onExplored(p, x, y, owner)
    if(p ~= 0 and p ~= 1) then
        return
    end
    
    --if(eState[101] > 0 and p == 0 and owner == 2) then
    --    MissionEvent(101, false)
    --elseif(eState[102] > 0 and eState[203] > 0 and x == 51 and y == 89) then
    if(eState[102] > 0 and eState[203] > 0 and x == 51 and y == 89) then
        MissionEvent(102, false)
        MissionEvent(203, false)
    elseif(eState[106] > 0 and p == 0 and x == 13 and y == 36) then
        MissionEvent(106, false)
    elseif(eState[108] > 0 and p == 0 and owner == 3) then
        MissionEvent(108, false)
    elseif(eState[111] > 0 and eState[208] > 0 and x == 62 and y == 70) then
        MissionEvent(111, false)
        MissionEvent(208, false)
    elseif(eState[108] > 0 and p == 0 and owner == 3) then
        MissionEvent(108, false)
    elseif(eState[210] > 0 and p == 1 and x == 114 and y == 78) then
        MissionEvent(210, false)
    end
end

function onOccupied(p, x, y)
    if(p == 0) then
        if(eState[103] > 0 and x == 19 and y == 59) then
            MissionEvent(103, false)
        elseif(eState[104] > 0 and x == 31 and y == 77) then
            MissionEvent(104, false)
        elseif(eState[113] > 0 and ((x == 77 and y == 50) or (x == 78 and y == 57))) then
            MissionEvent(113, false)
        elseif(eState[66] > 0 and x == 101 and y == 45) then
            MissionEvent(66, false)
        end
    elseif(p == 1) then
        if(eState[201] > 0 and x == 52 and y == 108) then
            MissionEvent(201, false)
        elseif(eState[205] > 0 and x == 76 and y == 83) then
            MissionEvent(205, false)
        elseif(eState[66] > 0 and x == 114 and y == 54) then
            MissionEvent(66, false)
        end
    elseif(p == 3) then
        if(eState[30] > 0 and x == 60 and y == 13) then
            MissionEvent(30, false)
        elseif(eState[31] > 0 and x == 49 and y == 20) then
            MissionEvent(31, false)
        elseif(eState[32] > 0 and x == 64 and y == 17) then
            MissionEvent(32, false)
        elseif(eState[33] > 0 and x == 47 and y == 27) then
            MissionEvent(33, false)
        elseif(eState[34] > 0 and x == 44 and y == 33) then
            MissionEvent(34, false)
        end
    elseif(p == 5) then
        if(eState[50] > 0 and x == 104 and y == 13) then
            MissionEvent(50, false)
        elseif(eState[51] > 0 and x == 97 and y == 26) then
            MissionEvent(51, false)
        elseif(eState[52] > 0 and x == 99 and y == 38) then
            MissionEvent(52, false)
        elseif(eState[53] > 0 and x == 123 and y == 25) then
            MissionEvent(53, false)
        elseif(eState[54] > 0 and x == 112 and y == 8) then
            MissionEvent(54, false)
        elseif(eState[55] > 0 and x == 97 and y == 45) then
            MissionEvent(55, false)
        elseif(eState[56] > 0 and x == 116 and y == 38) then
            MissionEvent(56, false)
        elseif(eState[57] > 0 and x == 91 and y == 48) then
            MissionEvent(57, false)
        elseif(eState[58] > 0 and x == 116 and y == 44) then
            MissionEvent(58, false)
        elseif(eState[59] > 0 and x == 115 and y == 51) then
            MissionEvent(59, false)
        elseif(eState[60] > 0 and x == 92 and y == 55) then
            MissionEvent(60, false)
        elseif(eState[61] > 0 and x == 100 and y == 60) then
            MissionEvent(61, false)
        elseif(eState[62] > 0 and x == 113 and y == 59) then
            MissionEvent(62, false)
        elseif(eState[63] > 0 and x == 113 and y == 64) then
            MissionEvent(63, false)
        elseif(eState[64] > 0 and x == 93 and y == 63) then
            MissionEvent(64, false)
        end
    end
end

function onAttack(attackerPlayerId, defenderPlayerId, attackerCount)
    if(defenderPlayerId == 1) then
        if(eState[202] > 0) then
            MissionEvent(101, false)
            MissionEvent(202, false)
        end
    elseif(defenderPlayerId == 5) then
        if(eState[114] > 0 and eState[212] > 0 and eState[115] > 0 and attackerPlayerId == 0) then
            MissionEvent(114, false)
            MissionEvent(211, false)
            MissionEvent(65, false)
        elseif(eState[115] > 0 and eState[213] > 0 and eState[114] > 0 and attackerPlayerId == 1) then
            MissionEvent(115, false)
            MissionEvent(213, false)
            MissionEvent(65, false)
        end
    elseif(eState[35] > 0 and ((attackerPlayerId == 0 and defenderPlayerId == 3) or (defenderPlayerId == 0 and attackerPlayerId == 3))) then
        MissionEvent(35)
    end
end

function onGameFrame(gf)
    if((gf%8)==0)then
        AnimateObjects(gf)
    end

    if((gf%20)~=0) then
        return
    end

    if(gf == 20) then
        if(debugEvents) then
            for _, i in ipairs(eIdx) do
                MissionEvent(i, false)
            end
        end
    end

    if(eState[105] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_SHIPYARD) > 0) then
        MissionEvent(105, false)
    end

    if(eState[107] > 0 and eState[204] > 0 and GetNumMilitaryBuilding(2) < 1) then
        MissionEvent(107, false)
        MissionEvent(204, false)
    end

    if(eState[109] > 0 and eState[206] > 0 and GetNumMilitaryBuilding(3) < 1) then
        MissionEvent(109, false)
        MissionEvent(206, false)
    end

    if(eState[112] > 0 and eState[209] > 0 and GetNumMilitaryBuilding(4) < 1) then
        MissionEvent(112, false)
        MissionEvent(209, false)
    end

    if(eState[116] > 0 and eState[213] > 0 and GetNumMilitaryBuilding(5) < 1) then
        MissionEvent(116, false)
        MissionEvent(213, false)
    end

    if(eState[41] > 0 and (gf%20000) == 0) then
        MissionEvent(41, false)
    end
    
    if(eState[41] < 1 and eState[42] > 0 and (gf%1000) == 0) then
        if(rttr:GetPlayer(4):GetNumWares(GD_STONES) < 50 and rttr:GetPlayer(4):GetNumBuildings(BLD_HEADQUARTERS)) then
            MissionEvent(42, false)
            MissionEvent(110, false)
            MissionEvent(207, false)
        end
    end

    if((gf%1000) == 0) then
        -- DEBUG
        -- EnsureMinimumWareAmount(0, GD_STONES, 50)
        -- EnsureMinimumWareAmount(0, GD_BOARDS, 50)
        -- EnsureMinimumWareAmount(1, GD_STONES, 50)
        -- EnsureMinimumWareAmount(1, GD_BOARDS, 50)
        -- rttr:GetPlayer(0):EnableBuilding(BLD_LOOKOUTTOWER, false)
    
        -- AI 3 (Pirates II)
        EnsureMinimumWareAmount(3, GD_STONES, 50)
        EnsureMinimumWareAmount(3, GD_BOARDS, 50)
        -- give food with a threshold of 10%
        --local soldiersPlayer0 = GetNumPlainSoldiers(0)
        --local soldiersPlayer3 = GetNumPlainSoldiers(3)
        --if (soldiersPlayer3 < soldiersPlayer0 * 1.1) then
        --    rttr:Log("3: " ..soldiersPlayer3.. " 0*1.1:" ..(soldiersPlayer0 * 1.1))
        --    EnsureMinimumWareAmount(3, GD_FISH, 6)
        --    EnsureMinimumWareAmount(3, GD_BREAD, 6)
        --    EnsureMinimumWareAmount(3, GD_HAM, 6)
        --end

        -- make sure pirates II is nearly as strong as the player when coming into contact
        if(eState[35] > 0) then
            local soldiersPlayer0 = rttr:GetPlayer(0):GetNumPeople(JOB_PRIVATE)
            local soldiersPlayer3 = rttr:GetPlayer(3):GetNumPeople(JOB_PRIVATE)

            rttr:Log("P3: " ..soldiersPlayer3.. ", P0: " ..soldiersPlayer0.. ", P0*0.9: " ..(soldiersPlayer0 * 0.9))

            if(soldiersPlayer3 <= soldiersPlayer0 * 0.9) then 
                local addSoldiersPlayer3 = math.floor((soldiersPlayer0 * 0.9) - soldiersPlayer3)
                rttr:Log("P3 add: " ..addSoldiersPlayer3)
                rttr:GetPlayer(3):AddPeople({[JOB_PRIVATE] = addSoldiersPlayer3})
            end
        end
    
        -- AI 4 (Defensive Line)
        EnsureMinimumWareAmount(4, GD_BOARDS, 25)
        EnsureMinimumWareAmount(4, GD_STONES, 50)

        -- AI 5
        EnsureMinimumWareAmount(5, GD_STONES, 50)
        EnsureMinimumWareAmount(5, GD_BOARDS, 50)
        --local soldiersPlayerTeam = GetNumPlainSoldiers(0) + GetNumPlainSoldiers(1)
        --local soldiersPlayer5 = GetNumPlainSoldiers(5)
        --if (soldiersPlayer5 < soldiersPlayerTeam * 1.1) then
        --    rttr:Log("5: " ..soldiersPlayer5.. " T*1.1:" ..(soldiersPlayerTeam * 1.1))
        --    EnsureMinimumWareAmount(5, GD_FISH, 12)
        --    EnsureMinimumWareAmount(5, GD_BREAD, 12)
        --    EnsureMinimumWareAmount(5, GD_HAM, 12)
        --end
        
        -- Event 65
        if(eState[65] > 0) then
            local generalsPlayerTeam = rttr:GetPlayer(0):GetNumPeople(JOB_GENERAL) + rttr:GetPlayer(1):GetNumPeople(JOB_GENERAL)
            local generalsPlayer5 = rttr:GetPlayer(5):GetNumPeople(JOB_GENERAL)

            rttr:Log("P5: " ..generalsPlayer5.. ", T: " ..generalsPlayerTeam.. ", T*0.9: " ..(generalsPlayerTeam * 0.9))
            if(generalsPlayer5 <= generalsPlayerTeam * 0.9) then 
                local addGeneralsPlayer5 = math.floor((generalsPlayerTeam * 0.9) - generalsPlayer5)
                rttr:Log("P5 add: " ..addGeneralsPlayer5)
                rttr:GetPlayer(5):AddPeople({[JOB_GENERAL] = addGeneralsPlayer5})
            end
        end
    end

    if(gf == 20) then
        MissionEvent(100, false)
        MissionEvent(200, false)
    end

    if(gf == 200) then
        MissionEvent(20, false)
        MissionEvent(40, false)
    end
end

function onSave(saveGame)
    saveGame:PushInt(eHist["n"])

    for i = 1, eHist["n"] do
        saveGame:PushInt(eHist[i])
    end

    return true
end

function onLoad(saveGame)
    eHist = {["n"] = saveGame:PopInt()}

    for i = 1, eHist["n"] do
        eHist[i] = saveGame:PopInt()
    end

    return true
end

function addPlayerRes(p, onLoad)
    if onLoad then return end

    rttr:GetPlayer(p):ClearResources()

    if (p == 0) then
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD        ] = 4,
            [GD_BOARDS      ] = 12,
            [GD_STONES      ] = 8,
            [GD_HAM         ] = 6,
            [GD_GRAIN       ] = 0,
            [GD_FLOUR       ] = 0,
            [GD_FISH        ] = 3,
            [GD_MEAT        ] = 3,
            [GD_BREAD       ] = 0,
            [GD_WATER       ] = 0,
            [GD_BEER        ] = 0,
            [GD_COAL        ] = 0,
            [GD_IRONORE     ] = 0,
            [GD_GOLD        ] = 0,
            [GD_IRON        ] = 0,
            [GD_COINS       ] = 0,
            [GD_TONGS       ] = 0,
            [GD_AXE         ] = 0,
            [GD_SAW         ] = 0,
            [GD_PICKAXE     ] = 0,
            [GD_HAMMER      ] = 0,
            [GD_SHOVEL      ] = 0,
            [GD_CRUCIBLE    ] = 0,
            [GD_RODANDLINE  ] = 0,
            [GD_SCYTHE      ] = 0,
            [GD_CLEAVER     ] = 0,
            [GD_ROLLINGPIN  ] = 0,
            [GD_BOW         ] = 0,
            [GD_SWORD       ] = 0,
            [GD_SHIELD      ] = 0,
            [GD_BOAT        ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 10,
            [JOB_WOODCUTTER         ] = 4,
            [JOB_FISHER             ] = 0,
            [JOB_FORESTER           ] = 2,
            [JOB_CARPENTER          ] = 2,
            [JOB_STONEMASON         ] = 8,
            [JOB_HUNTER             ] = 0,
            [JOB_FARMER             ] = 1,
            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 2,
            [JOB_MINER              ] = 6,
            [JOB_BREWER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,
            [JOB_IRONFOUNDER        ] = 2,
            [JOB_MINTER             ] = 1,
            [JOB_METALWORKER        ] = 1,
            [JOB_ARMORER            ] = 2,
            [JOB_BUILDER            ] = 6,
            [JOB_PLANER             ] = 6,
            [JOB_GEOLOGIST          ] = 4,
            [JOB_PRIVATE            ] = 16,
            [JOB_PRIVATEFIRSTCLASS  ] = 0,
            [JOB_SERGEANT           ] = 0,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0,
            [JOB_SCOUT              ] = 1,
            [JOB_SHIPWRIGHT         ] = 1,
            [JOB_PACKDONKEY         ] = 0,
            [JOB_BOATCARRIER        ] = 0,
            [JOB_CHARBURNER         ] = 0
        })
    elseif (p == 1) then
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD        ] = 4,
            [GD_BOARDS      ] = 8,
            [GD_STONES      ] = 4,
            [GD_HAM         ] = 6,
            [GD_GRAIN       ] = 0,
            [GD_FLOUR       ] = 0,
            [GD_FISH        ] = 3,
            [GD_MEAT        ] = 3,
            [GD_BREAD       ] = 0,
            [GD_WATER       ] = 0,
            [GD_BEER        ] = 0,
            [GD_COAL        ] = 0,
            [GD_IRONORE     ] = 0,
            [GD_GOLD        ] = 0,
            [GD_IRON        ] = 0,
            [GD_COINS       ] = 0,
            [GD_TONGS       ] = 0,
            [GD_AXE         ] = 0,
            [GD_SAW         ] = 0,
            [GD_PICKAXE     ] = 0,
            [GD_HAMMER      ] = 0,
            [GD_SHOVEL      ] = 0,
            [GD_CRUCIBLE    ] = 0,
            [GD_RODANDLINE  ] = 0,
            [GD_SCYTHE      ] = 0,
            [GD_CLEAVER     ] = 0,
            [GD_ROLLINGPIN  ] = 0,
            [GD_BOW         ] = 0,
            [GD_SWORD       ] = 0,
            [GD_SHIELD      ] = 0,
            [GD_BOAT        ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 10,
            [JOB_WOODCUTTER         ] = 8,
            [JOB_FISHER             ] = 0,
            [JOB_FORESTER           ] = 2,
            [JOB_CARPENTER          ] = 2,
            [JOB_STONEMASON         ] = 4,
            [JOB_HUNTER             ] = 1,
            [JOB_FARMER             ] = 4,
            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 2,
            [JOB_MINER              ] = 6,
            [JOB_BREWER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,
            [JOB_IRONFOUNDER        ] = 2,
            [JOB_MINTER             ] = 1,
            [JOB_METALWORKER        ] = 0,
            [JOB_ARMORER            ] = 2,
            [JOB_BUILDER            ] = 6,
            [JOB_PLANER             ] = 6,
            [JOB_GEOLOGIST          ] = 4,
            [JOB_PRIVATE            ] = 16,
            [JOB_PRIVATEFIRSTCLASS  ] = 0,
            [JOB_SERGEANT           ] = 0,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0,
            [JOB_SCOUT              ] = 0,
            [JOB_SHIPWRIGHT         ] = 2,
            [JOB_PACKDONKEY         ] = 0,
            [JOB_BOATCARRIER        ] = 0,
            [JOB_CHARBURNER         ] = 0
        })
    elseif (p == 2) then
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD        ] = 0,
            [GD_BOARDS      ] = 32,
            [GD_STONES      ] = 23,
            [GD_HAM         ] = 0,
            [GD_GRAIN       ] = 0,
            [GD_FLOUR       ] = 0,
            [GD_FISH        ] = 0,
            [GD_MEAT        ] = 0,
            [GD_BREAD       ] = 0,
            [GD_WATER       ] = 0,
            [GD_BEER        ] = 0,
            [GD_COAL        ] = 0,
            [GD_IRONORE     ] = 0,
            [GD_GOLD        ] = 0,
            [GD_IRON        ] = 0,
            [GD_COINS       ] = 0,
            [GD_TONGS       ] = 0,
            [GD_AXE         ] = 0,
            [GD_SAW         ] = 0,
            [GD_PICKAXE     ] = 0,
            [GD_HAMMER      ] = 0,
            [GD_SHOVEL      ] = 0,
            [GD_CRUCIBLE    ] = 0,
            [GD_RODANDLINE  ] = 0,
            [GD_SCYTHE      ] = 0,
            [GD_CLEAVER     ] = 0,
            [GD_ROLLINGPIN  ] = 0,
            [GD_BOW         ] = 0,
            [GD_SWORD       ] = 0,
            [GD_SHIELD      ] = 0,
            [GD_BOAT        ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 20,
            [JOB_WOODCUTTER         ] = 0,
            [JOB_FISHER             ] = 0,
            [JOB_FORESTER           ] = 0,
            [JOB_CARPENTER          ] = 0,
            [JOB_STONEMASON         ] = 0,
            [JOB_HUNTER             ] = 0,
            [JOB_FARMER             ] = 0,
            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 0,
            [JOB_MINER              ] = 0,
            [JOB_BREWER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,
            [JOB_IRONFOUNDER        ] = 0,
            [JOB_MINTER             ] = 0,
            [JOB_METALWORKER        ] = 0,
            [JOB_ARMORER            ] = 0,
            [JOB_BUILDER            ] = 4,
            [JOB_PLANER             ] = 2,
            [JOB_GEOLOGIST          ] = 0,
            [JOB_PRIVATE            ] = 3,
            [JOB_PRIVATEFIRSTCLASS  ] = 0,
            [JOB_SERGEANT           ] = 0,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0,
            [JOB_SCOUT              ] = 1,
            [JOB_SHIPWRIGHT         ] = 1,
            [JOB_PACKDONKEY         ] = 0,
            [JOB_BOATCARRIER        ] = 0,
            [JOB_CHARBURNER         ] = 0
        })
    elseif (p == 3) then
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD        ] = 0,
            [GD_BOARDS      ] = 50,
            [GD_STONES      ] = 50,
            [GD_HAM         ] = 0,
            [GD_GRAIN       ] = 0,
            [GD_FLOUR       ] = 0,
            [GD_FISH        ] = 0,
            [GD_MEAT        ] = 0,
            [GD_BREAD       ] = 0,
            [GD_WATER       ] = 0,
            [GD_BEER        ] = 0,
            [GD_COAL        ] = 0,
            [GD_IRONORE     ] = 0,
            [GD_GOLD        ] = 0,
            [GD_IRON        ] = 0,
            [GD_COINS       ] = 0,
            [GD_TONGS       ] = 0,
            [GD_AXE         ] = 0,
            [GD_SAW         ] = 0,
            [GD_PICKAXE     ] = 0,
            [GD_HAMMER      ] = 0,
            [GD_SHOVEL      ] = 0,
            [GD_CRUCIBLE    ] = 0,
            [GD_RODANDLINE  ] = 0,
            [GD_SCYTHE      ] = 0,
            [GD_CLEAVER     ] = 0,
            [GD_ROLLINGPIN  ] = 0,
            [GD_BOW         ] = 0,
            [GD_SWORD       ] = 0,
            [GD_SHIELD      ] = 0,
            [GD_BOAT        ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 30,
            [JOB_WOODCUTTER         ] = 0,
            [JOB_FISHER             ] = 0,
            [JOB_FORESTER           ] = 0,
            [JOB_CARPENTER          ] = 0,
            [JOB_STONEMASON         ] = 0,
            [JOB_HUNTER             ] = 0,
            [JOB_FARMER             ] = 4,
            [JOB_MILLER             ] = 2,
            [JOB_BAKER              ] = 2,
            [JOB_BUTCHER            ] = 0,
            [JOB_MINER              ] = 4,
            [JOB_BREWER             ] = 1,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,
            [JOB_IRONFOUNDER        ] = 1,
            [JOB_MINTER             ] = 0,
            [JOB_METALWORKER        ] = 0,
            [JOB_ARMORER            ] = 1,
            [JOB_BUILDER            ] = 8,
            [JOB_PLANER             ] = 8,
            [JOB_GEOLOGIST          ] = 4,
            [JOB_PRIVATE            ] = 9,
            [JOB_PRIVATEFIRSTCLASS  ] = 2,
            [JOB_SERGEANT           ] = 2,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0,
            [JOB_SCOUT              ] = 0,
            [JOB_SHIPWRIGHT         ] = 0,
            [JOB_PACKDONKEY         ] = 0,
            [JOB_BOATCARRIER        ] = 0,
            [JOB_CHARBURNER         ] = 0
        })
    elseif (p == 4) then
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD        ] = 0,
            [GD_BOARDS      ] = 37 + 10,
            [GD_STONES      ] = 50,
            [GD_HAM         ] = 0,
            [GD_GRAIN       ] = 0,
            [GD_FLOUR       ] = 0,
            [GD_FISH        ] = 0,
            [GD_MEAT        ] = 0,
            [GD_BREAD       ] = 0,
            [GD_WATER       ] = 0,
            [GD_BEER        ] = 0,
            [GD_COAL        ] = 0,
            [GD_IRONORE     ] = 0,
            [GD_GOLD        ] = 0,
            [GD_IRON        ] = 0,
            [GD_COINS       ] = 0,
            [GD_TONGS       ] = 0,
            [GD_AXE         ] = 0,
            [GD_SAW         ] = 0,
            [GD_PICKAXE     ] = 0,
            [GD_HAMMER      ] = 0,
            [GD_SHOVEL      ] = 0,
            [GD_CRUCIBLE    ] = 0,
            [GD_RODANDLINE  ] = 0,
            [GD_SCYTHE      ] = 0,
            [GD_CLEAVER     ] = 0,
            [GD_ROLLINGPIN  ] = 0,
            [GD_BOW         ] = 0,
            [GD_SWORD       ] = 0,
            [GD_SHIELD      ] = 0,
            [GD_BOAT        ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 20,
            [JOB_WOODCUTTER         ] = 0,
            [JOB_FISHER             ] = 0,
            [JOB_FORESTER           ] = 0,
            [JOB_CARPENTER          ] = 0,
            [JOB_STONEMASON         ] = 0,
            [JOB_HUNTER             ] = 0,
            [JOB_FARMER             ] = 0,
            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 0,
            [JOB_MINER              ] = 0,
            [JOB_BREWER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,
            [JOB_IRONFOUNDER        ] = 0,
            [JOB_MINTER             ] = 0,
            [JOB_METALWORKER        ] = 0,
            [JOB_ARMORER            ] = 0,
            [JOB_BUILDER            ] = 7,
            [JOB_PLANER             ] = 6,
            [JOB_GEOLOGIST          ] = 0,
            [JOB_PRIVATE            ] = 8,
            [JOB_PRIVATEFIRSTCLASS  ] = 6,
            [JOB_SERGEANT           ] = 0,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0,
            [JOB_SCOUT              ] = 1,
            [JOB_SHIPWRIGHT         ] = 0,
            [JOB_PACKDONKEY         ] = 0,
            [JOB_BOATCARRIER        ] = 0,
            [JOB_CHARBURNER         ] = 0
        })
    elseif (p == 5) then
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD        ] = 0,
            [GD_BOARDS      ] = 50,
            [GD_STONES      ] = 50,
            [GD_HAM         ] = 0,
            [GD_GRAIN       ] = 0,
            [GD_FLOUR       ] = 0,
            [GD_FISH        ] = 0,
            [GD_MEAT        ] = 0,
            [GD_BREAD       ] = 0,
            [GD_WATER       ] = 0,
            [GD_BEER        ] = 0,
            [GD_COAL        ] = 0,
            [GD_IRONORE     ] = 0,
            [GD_GOLD        ] = 0,
            [GD_IRON        ] = 0,
            [GD_COINS       ] = 0,
            [GD_TONGS       ] = 0,
            [GD_AXE         ] = 0,
            [GD_SAW         ] = 0,
            [GD_PICKAXE     ] = 0,
            [GD_HAMMER      ] = 0,
            [GD_SHOVEL      ] = 0,
            [GD_CRUCIBLE    ] = 0,
            [GD_RODANDLINE  ] = 0,
            [GD_SCYTHE      ] = 0,
            [GD_CLEAVER     ] = 0,
            [GD_ROLLINGPIN  ] = 0,
            [GD_BOW         ] = 0,
            [GD_SWORD       ] = 0,
            [GD_SHIELD      ] = 0,
            [GD_BOAT        ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 50,
            [JOB_WOODCUTTER         ] = 0,
            [JOB_FISHER             ] = 0,
            [JOB_FORESTER           ] = 0,
            [JOB_CARPENTER          ] = 0,
            [JOB_STONEMASON         ] = 0,
            [JOB_HUNTER             ] = 0,
            [JOB_FARMER             ] = 10,
            [JOB_MILLER             ] = 2,
            [JOB_BAKER              ] = 2,
            [JOB_BUTCHER            ] = 0,
            [JOB_MINER              ] = 20,
            [JOB_BREWER             ] = 2,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,
            [JOB_IRONFOUNDER        ] = 2,
            [JOB_MINTER             ] = 1,
            [JOB_METALWORKER        ] = 0,
            [JOB_ARMORER            ] = 2,
            [JOB_BUILDER            ] = 20,
            [JOB_PLANER             ] = 20,
            [JOB_GEOLOGIST          ] = 10,
            [JOB_PRIVATE            ] = 20,
            [JOB_PRIVATEFIRSTCLASS  ] = 0,
            [JOB_SERGEANT           ] = 0,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0,
            [JOB_SCOUT              ] = 0,
            [JOB_SHIPWRIGHT         ] = 0,
            [JOB_PACKDONKEY         ] = 100,
            [JOB_BOATCARRIER        ] = 0,
            [JOB_CHARBURNER         ] = 0
        })
    end
end

function EnsureMinimumWareAmount(playerId, wareId, targetAmount)
    if(rttr:GetPlayer(playerId):GetNumBuildings(BLD_HEADQUARTERS) < 1) then
        return
    end

    local currentAmount = rttr:GetPlayer(playerId):GetNumWares(wareId)

    if  (currentAmount < targetAmount) then
        local requiredAmount = targetAmount - currentAmount

        rttr:GetPlayer(playerId):AddWares({[wareId] = requiredAmount})
    end
end

function AnimateObjects(gameFrame)
    for index, ObjectTable in pairs(AnimatedObjectTable) do
        if (ObjectTable.enabled) then
            if (gameFrame%ObjectTable.speed == 0) then
                -- increase display ID, reset to 1 if length reached
                ObjectTable.id = ObjectTable.id + 1;
                if  (ObjectTable.id > ObjectTable.length) then
                    ObjectTable.id = 1;
                end

                local displayId = ObjectTable.graphics[ObjectTable.id]

                if (ObjectTable.static) then
                    rttr:GetWorld():AddStaticObject(ObjectTable.x, ObjectTable.y, displayId, ObjectTable.file, ObjectTable.size)
                else
                    rttr:GetWorld():AddEnvObject(ObjectTable.x, ObjectTable.y, displayId, ObjectTable.file)
                end
            end
        end
    end
end

function ValidatePlayersIngame()
    local humanIsAI = false
    local AIIsHuman = false
    for plrID = 0, (rttr:GetNumPlayers() - 1) do

        local objPlayer = rttr:GetPlayer(plrID)

        -- TODO: Validate Team?
        if((plrID == 0 or plrID == 1) and objPlayer:IsAI()) then
            -- error => player is AI
            humanIsAI = true
        elseif(plrID > 1 and objPlayer:IsHuman()) then
            -- error => should be AI
            AIIsHuman = true
        end
    end

    if(humanIsAI or AIIsHuman) then
        local errorMessage = ''
        
        if(humanIsAI) then
            errorMessage = errorMessage .. _('errorHumanAI')
        end
        
        if(AIIsHuman) then
            if(errorMessage == '') then
                errorMessage = errorMessage .. _('errorAIHuman')
            else
                errorMessage = errorMessage .. '\n\n' .. _('errorAIHuman')
            end
        end

        rttr:MsgBoxEx(_('errorSetupWrong'), errorMessage, 'io', 75, 15 + 16 + 8, 15 + 24 + 8)

        for plrID = 0, (rttr:GetNumPlayers() - 1) do

            local objPlayer = rttr:GetPlayer(plrID)

            if(objPlayer:IsHuman()) then
                objPlayer:Surrender(true)
            end
        end
    end
end

function MissionEvent(e, onLoad)
    -- rttr:Log("MissionEvent("..e..", "..tostring(onLoad)..")")
    -- rttr:Log("State: " ..eState[e])

    -- event e is inactive
    if(eState[e] <= 0) then
        return
    end

    -- call side effects for active events, check "eState[e] == 1" for multiple call events!
    if(e == 100) then
        -- text only
        BuildTaskText(0)
    elseif(e == 101) then
        rttr:GetPlayer(0):EnableBuilding(BLD_LOOKOUTTOWER, not onLoad)
    elseif(e == 102) then
        -- text only
    elseif(e == 103) then
        rttr:GetPlayer(0):EnableBuilding(BLD_SHIPYARD, not onLoad)
        rttr:GetPlayer(0):EnableBuilding(BLD_HARBORBUILDING, not onLoad)
    elseif(e == 104) then
        rttr:GetPlayer(0):EnableBuilding(BLD_STOREHOUSE, not onLoad)
    elseif(e == 105) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_BOARDS] = 12})
            rttr:GetWorld():AddEnvObject(20, 56, 555, 0xFFFF)
        end
    elseif(e == 106) then
        -- text only
    elseif(e == 107) then
        -- text only
    elseif(e == 108) then
        -- text only
    elseif(e == 109) then
        rttr:GetPlayer(0):EnableBuilding(BLD_WATCHTOWER, not onLoad)
    elseif(e == 110) then
        -- text only
    elseif(e == 111) then
        -- text only
    elseif(e == 112) then
        -- text only
    elseif(e == 113) then
        rttr:GetPlayer(0):EnableBuilding(BLD_FORTRESS, not onLoad)
    elseif(e == 114) then
        -- text only
    elseif(e == 115) then
        -- text only
    elseif(e == 116) then
        -- text only
    elseif(e == 200) then
        -- text only
        BuildTaskText(1)
    elseif(e == 201) then
        rttr:GetPlayer(1):EnableBuilding(BLD_SHIPYARD, not onLoad)
        rttr:GetPlayer(1):EnableBuilding(BLD_HARBORBUILDING, not onLoad)

        if(not onLoad) then
            rttr:GetWorld():AddEnvObject(52, 108, 2525, 0xFFFF)
        end
    elseif(e == 202) then
        -- text only
    elseif(e == 203) then
        -- text only
    elseif(e == 204) then
        rttr:GetPlayer(1):EnableBuilding(BLD_GUARDHOUSE, false)
        if(not onLoad) then
            rttr:GetPlayer(1):AddPeople({[JOB_FISHER] = 2})
        end
    elseif(e == 205) then
        -- text only
        if(not onLoad) then
            rttr:GetWorld():AddEnvObject(76, 83, 2525, 0xFFFF)
        end
    elseif(e == 206) then
        -- text only
    elseif(e == 207) then
        -- text only
    elseif(e == 208) then
        -- text only
    elseif(e == 209) then
        rttr:GetPlayer(1):EnableBuilding(BLD_LOOKOUTTOWER, not onLoad)
        rttr:GetPlayer(1):EnableBuilding(BLD_WATCHTOWER, not onLoad)
        if(not onLoad) then
            rttr:GetPlayer(1):AddPeople({[JOB_METALWORKER] = 1})
            rttr:GetPlayer(1):AddPeople({[JOB_SCOUT] = 1})
            rttr:GetWorld():AddEnvObject(114, 78, 2525, 0xFFFF)
        end
    elseif(e == 210) then
        -- text only
    elseif(e == 211) then
        -- text only
    elseif(e == 212) then
        -- text only
    elseif(e == 213) then
        -- text only
    elseif(e == 20) then
        rttr:GetPlayer(2):DisableAllBuildings()
    elseif(e == 30) then
        if(not onLoad) then
            rttr:GetPlayer(3):AIConstructionOrder(60,13,BLD_GUARDHOUSE)
        end
    elseif(e == 31) then
        if(not onLoad) then
            rttr:GetPlayer(3):AIConstructionOrder(49,20,BLD_GUARDHOUSE)
        end
    elseif(e == 32) then
        rttr:GetPlayer(3):AIConstructionOrder(59,19,BLD_GOLDMINE)

        if(not onLoad) then
            rttr:GetPlayer(3):EnableBuilding(BLD_GOLDMINE, false)
        end
    elseif(e == 33) then
        rttr:GetPlayer(3):EnableBuilding(BLD_WATCHTOWER, false)
        rttr:GetPlayer(3):EnableBuilding(BLD_IRONMINE, false)

        if(not onLoad) then
            rttr:GetPlayer(3):AIConstructionOrder(44,24,BLD_WATCHTOWER)
            rttr:GetPlayer(3):AIConstructionOrder(48,27,BLD_WATCHTOWER)
            rttr:GetPlayer(3):AIConstructionOrder(52,24,BLD_WATCHTOWER)
            rttr:GetPlayer(3):AIConstructionOrder(52,27,BLD_IRONMINE)
        end
    elseif(e == 34) then
        rttr:GetPlayer(3):EnableBuilding(BLD_COALMINE, false)
        rttr:GetPlayer(3):EnableBuilding(BLD_ARMORY, false)
        rttr:GetPlayer(3):EnableBuilding(BLD_IRONSMELTER, false)
        rttr:GetPlayer(3):EnableBuilding(BLD_BREWERY, false)
        rttr:GetPlayer(3):EnableBuilding(BLD_WELL, false)
        rttr:GetPlayer(3):EnableBuilding(BLD_FARM, false)
        rttr:GetPlayer(3):EnableBuilding(BLD_MINT, false)
        rttr:GetPlayer(3):EnableBuilding(BLD_MILL, false)
        rttr:GetPlayer(3):EnableBuilding(BLD_BAKERY, false)

        if(not onLoad) then
            rttr:GetPlayer(3):AIConstructionOrder(42,29,BLD_COALMINE)
            rttr:GetPlayer(3):AIConstructionOrder(44,33,BLD_COALMINE)
            rttr:GetPlayer(3):AIConstructionOrder(44,22,BLD_ARMORY)
            rttr:GetPlayer(3):AIConstructionOrder(44,21,BLD_IRONSMELTER)
            rttr:GetPlayer(3):AIConstructionOrder(46,27,BLD_BREWERY)
            rttr:GetPlayer(3):AIConstructionOrder(51,26,BLD_WELL)
            rttr:GetPlayer(3):AIConstructionOrder(63,14,BLD_FARM)
            rttr:GetPlayer(3):AIConstructionOrder(52,11,BLD_MINT)
        end
    elseif(e == 35) then
        -- nothing
    elseif(e == 40) then
        rttr:GetPlayer(4):DisableAllBuildings()
    elseif(e == 41) then
        -- nothing
    elseif(e == 42) then
        -- nothing
    elseif(e == 50) then
        rttr:GetPlayer(5):EnableBuilding(BLD_IRONMINE, false)
        rttr:GetPlayer(5):DisableBuilding(BLD_BARRACKS)

        if(not onLoad) then
            rttr:GetPlayer(5):AIConstructionOrder(104,13,BLD_IRONMINE)
            rttr:GetPlayer(5):AIConstructionOrder(102,15,BLD_IRONMINE)
        end
    elseif(e == 51) then
        rttr:GetPlayer(5):EnableBuilding(BLD_IRONMINE, false)
        rttr:GetPlayer(5):DisableBuilding(BLD_BARRACKS)

        if(not onLoad) then
            rttr:GetPlayer(5):AIConstructionOrder(99,20,BLD_IRONMINE)
            rttr:GetPlayer(5):AIConstructionOrder(98,23,BLD_IRONMINE)
            rttr:GetPlayer(5):AIConstructionOrder(99,31,BLD_GUARDHOUSE)
        end
    elseif(e == 52) then
        rttr:GetPlayer(5):EnableBuilding(BLD_COALMINE, false)
        rttr:GetPlayer(5):DisableBuilding(BLD_BARRACKS)

        if(not onLoad) then
            rttr:GetPlayer(5):AIConstructionOrder(96,32,BLD_COALMINE)
            rttr:GetPlayer(5):AIConstructionOrder(99,38,BLD_GUARDHOUSE)
        end
    elseif(e == 53) then
        rttr:GetPlayer(5):EnableBuilding(BLD_IRONMINE, false)
        rttr:GetPlayer(5):EnableBuilding(BLD_COALMINE, false)
        rttr:GetPlayer(5):EnableBuilding(BLD_BARRACKS, false)

        if(not onLoad) then
            rttr:GetPlayer(5):AIConstructionOrder(119,18,BLD_IRONMINE)
            rttr:GetPlayer(5):AIConstructionOrder(122,24,BLD_COALMINE)
            rttr:GetPlayer(5):AIConstructionOrder(123,25,BLD_COALMINE)
            rttr:GetPlayer(5):AIConstructionOrder(116,32,BLD_BARRACKS)
        end
    elseif(e == 54) then
        rttr:GetPlayer(5):EnableBuilding(BLD_COALMINE, false)

        if(not onLoad) then
            rttr:GetPlayer(5):AIConstructionOrder(115,11,BLD_COALMINE)
            rttr:GetPlayer(5):AIConstructionOrder(107,8,BLD_COALMINE)
            rttr:GetPlayer(5):AIConstructionOrder(108,7,BLD_COALMINE)
            rttr:GetPlayer(5):AIConstructionOrder(110,7,BLD_COALMINE)
            rttr:GetPlayer(5):AIConstructionOrder(111,9,BLD_COALMINE)
        end
    elseif(e == 55) then
        rttr:GetPlayer(5):DisableBuilding(BLD_BARRACKS)

        if(not onLoad) then
            rttr:GetPlayer(5):AIConstructionOrder(97,45,BLD_GUARDHOUSE)
        end
    elseif(e == 56) then
        rttr:GetPlayer(5):EnableBuilding(BLD_BARRACKS, false)

        if(not onLoad) then
            rttr:GetPlayer(5):AIConstructionOrder(116,38,BLD_BARRACKS)
        end
    elseif(e == 57) then
        rttr:GetPlayer(5):EnableBuilding(BLD_WATCHTOWER, false)
        rttr:GetPlayer(5):EnableBuilding(BLD_FORTRESS, false)

        if(not onLoad) then
            rttr:GetPlayer(5):AIConstructionOrder(98,52,BLD_WATCHTOWER)
            rttr:GetPlayer(5):AIConstructionOrder(91,48,BLD_FORTRESS)
        end
    elseif(e == 58) then
        rttr:GetPlayer(5):DisableBuilding(BLD_BARRACKS)

        if(not onLoad) then
            rttr:GetPlayer(5):AIConstructionOrder(116,44,BLD_GUARDHOUSE)
        end
    elseif(e == 59) then
        rttr:GetPlayer(5):DisableBuilding(BLD_BARRACKS)
        rttr:GetPlayer(5):EnableBuilding(BLD_WATCHTOWER, false)

        if(not onLoad) then
            rttr:GetPlayer(5):AIConstructionOrder(115,51,BLD_WATCHTOWER)
        end
    elseif(e == 60) then
        rttr:GetPlayer(5):DisableBuilding(BLD_BARRACKS)
        rttr:GetPlayer(5):EnableBuilding(BLD_FORTRESS, false)
    
        if(not onLoad) then
            rttr:GetPlayer(5):AIConstructionOrder(92,55,BLD_FORTRESS)
        end
    elseif(e == 61) then
        rttr:GetPlayer(5):DisableBuilding(BLD_BARRACKS)
        rttr:GetPlayer(5):EnableBuilding(BLD_WATCHTOWER, false)

        if(not onLoad) then
            rttr:GetPlayer(5):AIConstructionOrder(100,60,BLD_WATCHTOWER)
        end
    elseif(e == 62) then
        rttr:GetPlayer(5):EnableBuilding(BLD_FORTRESS, false)
        rttr:GetPlayer(5):EnableBuilding(BLD_GOLDMINE, false)

        if(not onLoad) then
            rttr:GetPlayer(5):AIConstructionOrder(110,59,BLD_FORTRESS)
            rttr:GetPlayer(5):AIConstructionOrder(113,59,BLD_GOLDMINE)
        end
    elseif(e == 63) then
        rttr:GetPlayer(5):EnableBuilding(BLD_GOLDMINE, false)
        rttr:GetPlayer(5):EnableBuilding(BLD_MINT, false)

        if(not onLoad) then
            rttr:GetPlayer(5):AIConstructionOrder(113,64,BLD_GOLDMINE)
            rttr:GetPlayer(5):AIConstructionOrder(116,55,BLD_MINT)
            rttr:GetPlayer(5):AIConstructionOrder(118,53,BLD_MINT)
        end
    elseif(e == 64) then
        rttr:GetPlayer(5):EnableBuilding(BLD_FORTRESS, false)
        rttr:GetPlayer(5):EnableBuilding(BLD_BREWERY, false)
        rttr:GetPlayer(5):EnableBuilding(BLD_WELL, false)
        rttr:GetPlayer(5):EnableBuilding(BLD_FARM, false)
        rttr:GetPlayer(5):EnableBuilding(BLD_ARMORY, false)
        rttr:GetPlayer(5):EnableBuilding(BLD_IRONSMELTER, false)
        rttr:GetPlayer(5):EnableBuilding(BLD_MILL, false)
        rttr:GetPlayer(5):EnableBuilding(BLD_BAKERY, false)

        if(not onLoad) then
            rttr:GetPlayer(5):AIConstructionOrder(93,63,BLD_FORTRESS)
            rttr:GetPlayer(5):AIConstructionOrder(100,65,BLD_BREWERY)
            rttr:GetPlayer(5):AIConstructionOrder(99,66,BLD_WELL)
            rttr:GetPlayer(5):AIConstructionOrder(104,58,BLD_FARM)
            rttr:GetPlayer(5):AIConstructionOrder(103,53,BLD_FARM)
            rttr:GetPlayer(5):AIConstructionOrder(102,45,BLD_FARM)
            rttr:GetPlayer(5):AIConstructionOrder(109,13,BLD_ARMORY)
            rttr:GetPlayer(5):AIConstructionOrder(109,18,BLD_ARMORY)
            rttr:GetPlayer(5):AIConstructionOrder(106,28,BLD_ARMORY)
            rttr:GetPlayer(5):AIConstructionOrder(119,30,BLD_ARMORY)
            rttr:GetPlayer(5):AIConstructionOrder(113,28,BLD_ARMORY)
            rttr:GetPlayer(5):AIConstructionOrder(112,19,BLD_IRONSMELTER)
            rttr:GetPlayer(5):AIConstructionOrder(113,16,BLD_IRONSMELTER)
            rttr:GetPlayer(5):AIConstructionOrder(105,31,BLD_IRONSMELTER)
            rttr:GetPlayer(5):AIConstructionOrder(118,32,BLD_IRONSMELTER)
            rttr:GetPlayer(5):AIConstructionOrder(112,30,BLD_IRONSMELTER)
            rttr:GetPlayer(5):AIConstructionOrder(100,55,BLD_MILL)
            rttr:GetPlayer(5):AIConstructionOrder(98,57,BLD_MILL)
            rttr:GetPlayer(5):AIConstructionOrder(117,47,BLD_BAKERY)
            rttr:GetPlayer(5):AIConstructionOrder(101,51,BLD_BAKERY)
            rttr:GetPlayer(5):AIConstructionOrder(118,46,BLD_WELL)
            rttr:GetPlayer(5):AIConstructionOrder(114,54,BLD_WELL)
        end
    elseif(e == 65) then
        -- nothing
    elseif(e == 66) then
        -- add some generals so the AI can make a last stand
        if(not onLoad) then
            local generalsPlayerTeam = rttr:GetPlayer(0):GetNumPeople(JOB_GENERAL) + rttr:GetPlayer(1):GetNumPeople(JOB_GENERAL)
            local generalsPlayer5 = rttr:GetPlayer(5):GetNumPeople(JOB_GENERAL)

            rttr:Log("66 P5: " ..generalsPlayer5.. ", T: " ..generalsPlayerTeam.. ", T*1.25: " ..(generalsPlayerTeam * 1.25))
            -- this check should be true anyway
            if(generalsPlayer5 <= generalsPlayerTeam * 1.25) then 
                local addGeneralsPlayer5 = math.floor((generalsPlayerTeam * 1.25) - generalsPlayer5)
                rttr:Log("66 P5 add: " + addGeneralsPlayer5)
                rttr:GetPlayer(5):AddPeople({[JOB_GENERAL] = addGeneralsPlayer5})
            end
        end
    end

    -- update event state
    eState[e] = eState[e] - 1

    -- no history update or mission texts while loading
    if not onLoad then
        rttr:Log(">> Event: " .. e .. ",\teState[" .. e .. "] = " .. eState[e])
        eHist["n"] = eHist["n"] + 1
        eHist[eHist["n"]] = e
    end

    MissionText(e, onLoad)
end

function MissionText(e, silent)
    -- texts only for player related events
    if(e < 100) then
        return
    end

    local playerIndex = math.floor(e / 100) - 1

    local msg = _('msg' .. tostring(e))

    local playerName = rttr:GetPlayer(playerIndex):GetName()
    local playerReplaceName = ("player" ..playerIndex)

    if(msg ~= ('msg' .. tostring(e))) then
        msg = string.gsub(msg, playerReplaceName, playerName)
        if not silent then
            rttr:MissionStatement(playerIndex, _('diary'), msg .. '\n\n', IM_NONE, true)
        end
    else
        rttr:Log("Error: no Translation found!" .. _(msg))
    end
end

-- playerId = which player this event is for, -1 for any player
-- taskType = 1 == main, 2 == secondary
-- textId = the hint text id
-- state = 0 == disabled, 1 == enabled

-- TODO: Tasks
TasksTable = {
    {playerId = 0, taskType = 1, textId = 'hint100', state = 1}
}

function BuildTaskText(playerIndex)
    -- buid header for the main goals
    local taskText = _('tasks_main')
    taskText = taskText .. '\n------------------------------------------------------------------------'

    -- build spacer between main goals and sub goals
    local taskSub = '\n\n\n' .. _('tasks_sub')
    taskSub = taskSub .. '\n------------------------------------------------------------------------'

    local playerName = rttr:GetPlayer(playerIndex):GetName()
    local playerReplaceName = ("player" ..playerIndex)

    for i = 1, #TasksTable do
        -- ignore inactive tasks
        if(TasksTable[i].state ~= 0 and (TasksTable[i].playerId == playerIndex or TasksTable[i].playerId == -1)) then
            -- build textfield 'task<ID>_<state>'
            local textField = TasksTable[i].textId
            -- get text by field
            local text = _(TasksTable[i].textId)
            -- if text equals textfield it does not exist
            if(text ~= textField) then
                text = string.gsub(text, playerReplaceName, playerName)

                if(TasksTable[i].taskType == 2) then
                    taskSub = taskSub .. "\n" .. text
                else
                    taskText = taskText .. "\n" .. text
                end
            else
                rttr:Log("Task: '" ..i.. "' tried to load text '" ..textField.. "' which does not exist!")
            end
        end
    end

    taskText = taskText .. taskSub

    taskText = taskText .. '\n\n\n\n\n' .. _('tasks_legend')
    taskText = taskText .. '\n------------------------------------------------------------------------'
    taskText = taskText .. _('tasks_hint') .. '\n\n'

    rttr:SetMissionGoal(playerIndex, taskText)
end

function GetNumMilitaryBuilding(plr)
    return rttr:GetPlayer(plr):GetNumBuildings(BLD_BARRACKS) + rttr:GetPlayer(plr):GetNumBuildings(BLD_GUARDHOUSE) + rttr:GetPlayer(plr):GetNumBuildings(BLD_WATCHTOWER) + rttr:GetPlayer(plr):GetNumBuildings(BLD_FORTRESS) + rttr:GetPlayer(plr):GetNumBuildings(BLD_HARBORBUILDING) + rttr:GetPlayer(plr):GetNumBuildings(BLD_HEADQUARTERS)
end

function GetNumPlainSoldiers(plr)
    return rttr:GetPlayer(plr):GetNumPeople(JOB_PRIVATE) + rttr:GetPlayer(plr):GetNumPeople(JOB_PRIVATEFIRSTCLASS) + rttr:GetPlayer(plr):GetNumPeople(JOB_SERGEANT) + rttr:GetPlayer(plr):GetNumPeople(JOB_OFFICER) + rttr:GetPlayer(plr):GetNumPeople(JOB_GENERAL)
end