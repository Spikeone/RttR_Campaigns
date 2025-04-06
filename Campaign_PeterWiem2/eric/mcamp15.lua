function getRequiredLuaVersion()
    return 1
end

local requiredFeature = 4
function checkVersion()
    local featureLevel = rttr:GetFeatureLevel()
    if(featureLevel < requiredFeature) then
        rttr:MsgBox("LUA-Version Error", "Your Return to the Roots version is outdated. The required LUA-Feature level is " ..requiredFeature.. ", your version is "..featureLevel..". The script can possibly crash or run unexpectedly!\n\nPlease update the game!", true)
    end
end

-- Message-Window (mission statement and hints): 52 chars wide
eIdx = {1, 2, 3, 4, 5, 6, 7, 99}

local debugTexts = false;

rttr:RegisterTranslations(
{
    en =
    {
        title   = 'Eric, der König',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = '',
        msg2    = '',
        msg3    = '',
        msg4    = '',
        msg5    = '',
        msg6    = '',
        msg7    = '',
        msg99   = ''
    }
})

-- format mission texts
function MissionText(e, silent)
    local msg = _('msg' .. tostring(e))

    if(msg ~= ('msg' .. tostring(e))) then
        if not silent then
            rttr:MissionStatement(0, _('diary'), msg .. '\n\n\n\n\n\n\n', IM_AVATAR6, true)
        end
        rttr:SetMissionGoal(0, msg)
    else
        rttr:Log("Error: no Translation found!" .. _(msg))
    end
end

function isMapPreviewEnabled()
    return false;
end

function onSettingsReady()
    checkVersion()
    rttr:Log("-----------------------\n Mission Script loaded... \n-----------------------\n")

    rttr:ResetAddons()
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetAddon(ADDON_CATAPULT_GRAPHICS, true)
    rttr:SetAddon(ADDON_NUM_SCOUTS_EXPLORATION, 4)
    rttr:SetGameSettings({
        ["fow"] = EXP_CLASSIC,
        ["teamView"] = false,
        ["lockedTeams"] = true,
        ["startWares"] = SWR_NORMAL,
        ["objective"] = GO_TOTALDOMINATION
    })

    rttr:GetPlayer(0):SetNation(NAT_VIKINGS)
    rttr:GetPlayer(1):SetNation(NAT_JAPANESE)
    rttr:GetPlayer(2):SetNation(NAT_BABYLONIANS)
    rttr:GetPlayer(3):SetNation(NAT_BABYLONIANS)
    rttr:GetPlayer(4):SetNation(NAT_AFRICANS)
    rttr:GetPlayer(5):SetNation(NAT_ROMANS)
    rttr:GetPlayer(6):SetNation(NAT_ROMANS)
    rttr:GetPlayer(7):SetNation(NAT_VIKINGS)

    for p = 1, rttr:GetNumPlayers() - 1 do
        rttr:GetPlayer(p):SetTeam(TM_TEAM1)
        rttr:GetPlayer(p):SetAI(3)
        rttr:GetPlayer(p):SetName(_('name'))
    end
end

function getAllowedChanges()
    return {
        ["addonsAll"]   = false,
        ["addonsSome"]  = true,
        ["ownNation"]   = false,
        ["ownColor"]    = true,
        ["ownTeam"]     = false,
        ["aiNation"]    = false,
        ["aiColor"]     = true,
        ["aiTeam"]      = false
    }
end

function getAllowedAddons()
    return {
        ADDON_TOOL_ORDERING,
        ADDON_CATAPULT_GRAPHICS,
        ADDON_NO_COINS_DEFAULT,
        ADDON_MANUAL_ROAD_ENLARGEMENT,
        ADDON_METALWORKSBEHAVIORONZERO
    }
end

function onStart(isFirstStart)
    for p = 0, rttr:GetNumPlayers() - 1 do
        addPlayerRes(p, not isFirstStart)
    end
    rttr:GetPlayer(0):ModifyHQ(true)

    eState = {}
    for _, i in ipairs(eIdx) do
        eState[i] = 1
    end

    if not isFirstStart then
        for i = 1, eHist["n"] do
            MissionEvent(eHist[i], true)
        end
    else
        eHist = {["n"] = 0}
    end

    if(isFirstStart) then
        rttr:GetWorld():AddStaticObject(91, 59, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(77,  9, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(10, 48, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(31,105, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(47, 58, 560, 0xFFFF, 2)
    end
end

function onSave(saveGame)
    saveGame:PushInt(eHist["n"])
    for i = 1, eHist["n"] do
        saveGame:PushInt(eHist[i])
    end
    return true
end

-- load callback
function onLoad(saveGame)
    eHist = {["n"] = saveGame:PopInt()}
    for i = 1, eHist["n"] do
        eHist[i] = saveGame:PopInt()
    end
    return true
end

function addPlayerRes(p, onLoad)
    if(p ~= 0) then
        if onLoad then return end

        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 30,
            [GD_BOARDS    ] = 50,
            [GD_STONES    ] = 50,
            [GD_HAM       ] = 2,
            [GD_GRAIN     ] = 2,
            [GD_FLOUR     ] = 2,

            [GD_FISH      ] = 2,
            [GD_MEAT      ] = 2,
            [GD_BREAD     ] = 2,
            [GD_WATER     ] = 2,
            [GD_BEER      ] = 8,
            [GD_COAL      ] = 10,

            [GD_IRONORE   ] = 10,
            [GD_GOLD      ] = 5,
            [GD_IRON      ] = 10,
            [GD_COINS     ] = 5,
            [GD_TONGS     ] = 1,
            [GD_AXE       ] = 7,

            [GD_SAW       ] = 5,
            [GD_PICKAXE   ] = 7,
            [GD_HAMMER    ] = 20,
            [GD_SHOVEL    ] = 7,
            [GD_CRUCIBLE  ] = 7,
            [GD_RODANDLINE] = 7,

            [GD_SCYTHE    ] = 7,
            [GD_CLEAVER   ] = 3,
            [GD_ROLLINGPIN] = 3,
            [GD_BOW       ] = 7,
            [GD_SWORD     ] = 0,
            [GD_SHIELD    ] = 0,

            [GD_BOAT      ] = 8
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 80,
            [JOB_BUILDER            ] = 15,
            [JOB_PLANER             ] = 10,
            [JOB_WOODCUTTER         ] = 5,
            [JOB_FORESTER           ] = 5,
            [JOB_STONEMASON         ] = 5,

            [JOB_FISHER             ] = 5,
            [JOB_HUNTER             ] = 5,
            [JOB_CARPENTER          ] = 2,
            [JOB_FARMER             ] = 5,
            [JOB_PIGBREEDER         ] = 5,
            [JOB_DONKEYBREEDER      ] = 5,

            [JOB_MILLER             ] = 3,
            [JOB_BAKER              ] = 3,
            [JOB_BUTCHER            ] = 2,
            [JOB_BREWER             ] = 2,
            [JOB_MINER              ] = 10,
            [JOB_IRONFOUNDER        ] = 3,

            [JOB_ARMORER            ] = 3,
            [JOB_MINTER             ] = 3,
            [JOB_METALWORKER        ] = 2,
            [JOB_SHIPWRIGHT         ] = 2,
            [JOB_GEOLOGIST          ] = 8,
            [JOB_SCOUT              ] = 2,

            [JOB_PACKDONKEY         ] = 20,
            [JOB_CHARBURNER         ] = 0,

            [JOB_PRIVATE            ] = 40,
            [JOB_PRIVATEFIRSTCLASS  ] = 4,
            [JOB_SERGEANT           ] = 4,
            [JOB_OFFICER            ] = 4,
            [JOB_GENERAL            ] = 4
        })
    elseif (p == 0) then
        if onLoad then return end

        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 10,
            [GD_BOARDS    ] = 10,
            [GD_STONES    ] = 20,
            [GD_HAM       ] = 3,
            [GD_GRAIN     ] = 3,
            [GD_FLOUR     ] = 3,

            [GD_FISH      ] = 3,
            [GD_MEAT      ] = 3,
            [GD_BREAD     ] = 3,
            [GD_WATER     ] = 3,
            [GD_BEER      ] = 0,
            [GD_COAL      ] = 0,

            [GD_IRONORE   ] = 40,
            [GD_GOLD      ] = 4,
            [GD_IRON      ] = 40,
            [GD_COINS     ] = 4,
            [GD_TONGS     ] = 3,
            [GD_AXE       ] = 1,

            [GD_SAW       ] = 1,
            [GD_PICKAXE   ] = 2,
            [GD_HAMMER    ] = 5,
            [GD_SHOVEL    ] = 3,
            [GD_CRUCIBLE  ] = 1,
            [GD_RODANDLINE] = 1,

            [GD_SCYTHE    ] = 0,
            [GD_CLEAVER   ] = 0,
            [GD_ROLLINGPIN] = 0,
            [GD_BOW       ] = 0,
            [GD_SWORD     ] = 2,
            [GD_SHIELD    ] = 2,

            [GD_BOAT      ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 90,
            [JOB_BUILDER            ] = 20,
            [JOB_PLANER             ] = 10,
            [JOB_WOODCUTTER         ] = 2,
            [JOB_FORESTER           ] = 4,
            [JOB_STONEMASON         ] = 3,

            [JOB_FISHER             ] = 1,
            [JOB_HUNTER             ] = 3,
            [JOB_CARPENTER          ] = 1,
            [JOB_FARMER             ] = 1,
            [JOB_PIGBREEDER         ] = 1,
            [JOB_DONKEYBREEDER      ] = 1,

            [JOB_MILLER             ] = 1,
            [JOB_BAKER              ] = 1,
            [JOB_BUTCHER            ] = 1,
            [JOB_BREWER             ] = 1,
            [JOB_MINER              ] = 2,
            [JOB_IRONFOUNDER        ] = 1,

            [JOB_ARMORER            ] = 1,
            [JOB_MINTER             ] = 1,
            [JOB_METALWORKER        ] = 1,
            [JOB_SHIPWRIGHT         ] = 1,
            [JOB_GEOLOGIST          ] = 10,
            [JOB_SCOUT              ] = 4,

            [JOB_PACKDONKEY         ] = 50,
            [JOB_CHARBURNER         ] = 0,

            [JOB_PRIVATE            ] = 60,
            [JOB_PRIVATEFIRSTCLASS  ] = 1,
            [JOB_SERGEANT           ] = 1,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0
        })
    end
end

function onGameFrame(gf)
    if (gf == 10 and debugTexts) then
        for _, i in ipairs(eIdx) do
            MissionText(i, false)
        end
    end

    enforceBuildingCount(0, BLD_CATAPULT, 3, false)

    if((gf%20)~=0) then
        return
    end

    if(gf==60) then
        -- EVENT1
        MissionEvent(1, false)
    end

    if (eState[2] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_SAWMILL) > 0) then
        -- EVENT2
        MissionEvent(2, false)
    end

    if (eState[99] > 0 (GetNumStorage(1) + GetNumStorage(2) + GetNumStorage(3) + GetNumStorage(4) + GetNumStorage(5) + GetNumStorage(6) + GetNumStorage(7)) < 1) then
        -- EVENT8 (maps to 99)
        MissionEvent(99, false)
    end
end

function onOccupied(p, x, y)
    if(p ~= 0) then return end

    if(eState[3] > 0 and x == 94 and y == 110) then
        -- EVENT3
        MissionEvent(3, false)
    end

    if(eState[4] > 0 and x == 87 and y == 2) then
        -- EVENT4
        MissionEvent(4, false)
    end

    if(eState[5] > 0 and x == 80 and y == 4) then
        -- EVENT5
        MissionEvent(5, false)
    end

    if(eState[6] > 0 and x == 92 and y == 65) then
        -- EVENT6
        MissionEvent(6, false)
    end

    if(eState[7] > 0 and x == 23 and y == 36) then
        -- EVENT7
        MissionEvent(7, false)
    end
end

function MissionEvent(e, onLoad)
    -- event e is inactive
    if(eState[e] <= 0) then
        return
    end

    -- call side effects for active events, check "eState[e] == 1" for multiple call events!
    if(e == 1) then
        -- nothing

    elseif(e == 2) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                [GD_WOOD] = 20
            })
        end

    elseif(e == 3) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                [GD_AXE] = 2,
                [GD_PICKAXE] = 2
            })
        end

    elseif(e == 4) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddPeople({
                [JOB_HUNTER] = 2,
                [JOB_FISHER] = 2,
                [JOB_CARPENTER] = 2
            })
        end

    elseif(e == 5) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                [GD_IRONORE] = 10,
                [GD_BREAD] = 10,
                [GD_FISH] = 10,
                [GD_MEAT] = 10
            })
        end

    elseif(e == 6) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                [GD_AXE] = 5,
                [GD_PICKAXE] = 5,
                [GD_SCYTHE] = 5,
                [GD_ROLLINGPIN] = 2
            })
        end

    elseif(e == 7) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                [GD_COINS] = 20,
                [GD_SHIELD] = 10,
                [GD_SWORD] = 10
            })
        end

    elseif(e == 99) then
        -- TODO: EnableNextMissions()
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

function GetNumStorage(plr)
    return rttr:GetPlayer(plr):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(plr):GetNumBuildings(BLD_HARBORBUILDING) + rttr:GetPlayer(plr):GetNumBuildings(BLD_STOREHOUSE)
end

function GetNumMilitaryBuilding(plr, withHarbor)
    if(withHarbor) then
        return rttr:GetPlayer(plr):GetNumBuildings(BLD_HARBORBUILDING) + rttr:GetPlayer(plr):GetNumBuildings(BLD_BARRACKS) + rttr:GetPlayer(plr):GetNumBuildings(BLD_GUARDHOUSE) + rttr:GetPlayer(plr):GetNumBuildings(BLD_WATCHTOWER) + rttr:GetPlayer(plr):GetNumBuildings(BLD_FORTRESS)
    else
        return rttr:GetPlayer(plr):GetNumBuildings(BLD_BARRACKS) + rttr:GetPlayer(plr):GetNumBuildings(BLD_GUARDHOUSE) + rttr:GetPlayer(plr):GetNumBuildings(BLD_WATCHTOWER) + rttr:GetPlayer(plr):GetNumBuildings(BLD_FORTRESS)
    end
end

function enforceBuildingCount(player, building, limit, notify)
    local sumBuildings = rttr:GetPlayer(player):GetNumBuildings(building) + rttr:GetPlayer(player):GetNumBuildingSites(building)

    if (sumBuildings >= limit) then
        rttr:GetPlayer(player):DisableBuilding(building)
    else
        rttr:GetPlayer(player):EnableBuilding(building, notify)
    end
end

function addExtraBoards(plrId, amount)
    rttr:GetPlayer(plrId):AddWares({[GD_BOARDS] = amount})
end

function addExtraSoldiers(plrId, amount)
    rttr:GetPlayer(plrId):AddPeople({[JOB_PRIVATE] = amount})
end