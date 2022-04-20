function getRequiredLuaVersion()
    return 1
end

-- Message-Window (mission statement and hints): 52 chars wide
eIdx = {1, 2, 3, 4, 5, 6, 7, 8, 9, 99}

rttr:RegisterTranslations(
{
    en =
    {
        title   = 'Return of the Vikings',
        name    = 'Unknown Tribe',

        msg1    = 'PH: Event 1 (Event = Start)',
        msgh1   = 'PH: Hint 1',

        msg2    = 'PH: Event 2 (Event = Sawmill >= 1)',
        msgh2   = 'PH: Hint 2 (Action = Add 4 Hunter)',

        msg3    = 'PH: Event 3 (Event = Barracks >= 1)',
        msgh3   = 'PH: Hint 3 (Action = None)',

        msg4    = 'PH: Event 4 (Event = (x == 3 and y == 51))',
        msgh4   = 'PH: Hint 4 (Action = Add 4 Fisher, Add 1 Shipbuilder)',

        msg5    = 'PH: Event 5 (Event = Harborbuilding >= 1)',
        msgh5   = 'PH: Hint 5 (Action = Add 1 Minter',

        msg6    = 'PH: Event 6 (Event = Barracks >= 3)',
        msgh6   = 'PH: Hint 6 (Action = Add 10 Hammer, Axe, Pickaxe and 5 Bows, Rodandlinen)',

        msg7    = 'PH: Event 7 (Event = Impossible)',
        msgh7   = 'PH: Hint 7 (Action = None)',

        msg8    = 'PH: Event 8 (Event = x == 91 and y == 75))',
        msgh8   = 'PH: Hint 8 (Action = Enable Guardhouse and Watchtower)',

        msg9    = 'PH: Event 9 (Event = Watchtower >= 1)',
        msgh9   = 'PH: Hint 9 (Action = None)',

        msg99   = 'PH: Event 99 (Event = Enemy HQ + Storehouse + Harborbuilding == 0)',
        msgh99  = 'PH: Hint 99 (Action = None)',
    }
})

-- format mission texts
function MissionText(e)
    local msg = _('msg' .. tostring(e))
    local msgh = _('msgh'.. tostring(e))

    if(msg ~= ('msg' .. tostring(e)) and msgh ~= ('msgh'.. tostring(e))) then
        rttr:MissionStatement(0, _('Diary'), msg .. '\n\n\n\n\n\n\n' ..msgh.. '\n\n\n\n\n\n\n', IM_SWORDSMAN, true)
        rttr:SetMissionGoal(0, msgh)
    elseif(msg ~= ('msg' .. tostring(e))) then
        rttr:MissionStatement(0, _('Diary'), msg .. '\n\n\n\n\n\n\n', IM_SWORDSMAN, true)
    end
end

function onSettingsReady()
    rttr:Log("-----------------------\n Mission Script loaded... \n-----------------------\n")
   -- rttr:MsgBox('Information', 'You can change some addons. They have been set to the original intention, so keep that in mind.', false)

    rttr:ResetAddons()                          -- S2-settings
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetAddon(ADDON_CATAPULT_GRAPHICS, true)
    rttr:SetGameSettings({
        ["fow"] = EXP_CLASSIC,
        ["teamView"] = false,
        ["lockedTeams"] = true,
        ["startWares"] = SWR_NORMAL,
        ["objective"] = GO_TOTALDOMINATION
    })

    rttr:GetPlayer(0):SetNation(NAT_VIKINGS)
    --rttr:GetPlayer(0):SetNation(NAT_ROMANS)
    --rttr:GetPlayer(0):ModifyHQ(true)
    --rttr:GetPlayer(0):SetColor(1)

    for p = 1, 1 do
        rttr:GetPlayer(p):SetNation(NAT_BABYLONIANS)
        rttr:GetPlayer(p):SetTeam(TM_TEAM1)
        rttr:GetPlayer(p):SetAI(3)
        rttr:GetPlayer(p):SetName(_('name'))
    end

    --rttr:GetPlayer(1):SetNation(NAT_VIKINGS)
    ----rttr:GetPlayer(1):SetColor(0)
    --rttr:GetPlayer(1):SetAI(3)
    --rttr:GetPlayer(1):SetName(_('name'))
end

function getAllowedChanges()
    return  { 
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
    rttr:GetPlayer(0):ModifyHQ(true)

    addPlayerRes(0, not isFirstStart)
    addPlayerRes(1, not isFirstStart)

    eState = {}                                 -- enable all events
    for _, i in ipairs(eIdx) do
        eState[i] = 1
    end

    if not isFirstStart then                    -- initialize history of all called events, event counter at ["n"]
        for i = 1, eHist["n"] do
            MissionEvent(eHist[i], true)        -- call events without mission text to activate all achievements
        end
    else
        eHist = {["n"] = 0}
        --MissionEvent(1)                         -- initial event / start screen
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
    if onLoad then return end

    if(p ~= 0) then                 -- Map activates 7 players!
        -- goods
        rttr:GetPlayer(p):ClearResources()

        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 24,
            [GD_BOARDS    ] = 44,
            [GD_STONES    ] = 68,
            [GD_MEAT      ] = 1,
            [GD_GRAIN     ] = 1,
            [GD_FLOUR     ] = 1,

            [GD_FISH      ] = 4,
            [GD_HAM       ] = 6,
            [GD_BREAD     ] = 8,
            [GD_WATER     ] = 2,
            [GD_BEER      ] = 6,
            [GD_COAL      ] = 20,

            [GD_IRONORE   ] = 20,
            [GD_GOLD      ] = 4,
            [GD_IRON      ] = 4,
            [GD_COINS     ] = 4,
            [GD_TONGS     ] = 1,
            [GD_AXE       ] = 6,

            [GD_SAW       ] = 4,
            [GD_PICKAXE   ] = 4,
            [GD_HAMMER    ] = 16,
            [GD_SHOVEL    ] = 4,
            [GD_CRUCIBLE  ] = 4,
            [GD_RODANDLINE] = 6,

            [GD_SCYTHE    ] = 8,
            [GD_CLEAVER   ] = 2,
            [GD_ROLLINGPIN] = 2,
            [GD_BOW       ] = 2,
            [GD_SWORD     ] = 6,
            [GD_SHIELD    ] = 6,

            [GD_BOAT      ] = 8
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 52,
            [JOB_BUILDER            ] = 10,
            [JOB_PLANER             ] = 6,
            [JOB_WOODCUTTER         ] = 8,
            [JOB_FORESTER           ] = 4,
            [JOB_STONEMASON         ] = 6,

            [JOB_FISHER             ] = 2,
            [JOB_HUNTER             ] = 4,
            [JOB_CARPENTER          ] = 4,
            [JOB_FARMER             ] = 2,
            [JOB_PIGBREEDER         ] = 2,
            [JOB_DONKEYBREEDER      ] = 2,

            [JOB_MILLER             ] = 2,
            [JOB_BAKER              ] = 2,
            [JOB_BUTCHER            ] = 2,
            [JOB_BREWER             ] = 2,
            [JOB_MINER              ] = 10,
            [JOB_IRONFOUNDER        ] = 2,

            [JOB_ARMORER            ] = 4,
            [JOB_MINTER             ] = 1,
            [JOB_METALWORKER        ] = 2,
            [JOB_SHIPWRIGHT         ] = 2,
            [JOB_GEOLOGIST          ] = 6,
            [JOB_SCOUT              ] = 2,

            [JOB_PACKDONKEY         ] = 12,
            [JOB_CHARBURNER         ] = 0,

            [JOB_PRIVATE            ] = 40,
            [JOB_PRIVATEFIRSTCLASS  ] = 6,
            [JOB_SERGEANT           ] = 0,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0
        })
    elseif (p == 0) then
        rttr:GetPlayer(p):ClearResources()

        rttr:GetPlayer(p):DisableBuilding(BLD_GUARDHOUSE)
        rttr:GetPlayer(p):DisableBuilding(BLD_WATCHTOWER)
        rttr:GetPlayer(p):DisableBuilding(BLD_FORTRESS)
        rttr:GetPlayer(p):DisableBuilding(BLD_CATAPULT)
        rttr:GetPlayer(p):DisableBuilding(BLD_LOOKOUTTOWER)

        rttr:GetPlayer(p):DisableBuilding(BLD_WELL)
        rttr:GetPlayer(p):DisableBuilding(BLD_MILL)
        rttr:GetPlayer(p):DisableBuilding(BLD_BAKERY)
        rttr:GetPlayer(p):DisableBuilding(BLD_FARM)
        rttr:GetPlayer(p):DisableBuilding(BLD_DONKEYBREEDER)
        rttr:GetPlayer(p):DisableBuilding(BLD_IRONSMELTER)
        rttr:GetPlayer(p):DisableBuilding(BLD_METALWORKS)
        rttr:GetPlayer(p):DisableBuilding(BLD_BREWERY)
        rttr:GetPlayer(p):DisableBuilding(BLD_SLAUGHTERHOUSE)
        rttr:GetPlayer(p):DisableBuilding(BLD_IRONMINE)
        rttr:GetPlayer(p):DisableBuilding(BLD_GRANITEMINE)
        rttr:GetPlayer(p):DisableBuilding(BLD_PIGFARM)
        rttr:GetPlayer(p):DisableBuilding(BLD_ARMORY)

        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 6,
            [GD_BOARDS    ] = 11,
            [GD_STONES    ] = 17,
            [GD_MEAT      ] = 0,
            [GD_GRAIN     ] = 0,
            [GD_FLOUR     ] = 0,

            [GD_FISH      ] = 1,
            [GD_HAM       ] = 0,
            [GD_BREAD     ] = 0,
            [GD_WATER     ] = 0,
            [GD_BEER      ] = 0,
            [GD_COAL      ] = 4,

            [GD_IRONORE   ] = 0,
            [GD_GOLD      ] = 1,
            [GD_IRON      ] = 0,
            [GD_COINS     ] = 0,
            [GD_TONGS     ] = 0,
            [GD_AXE       ] = 1,

            [GD_SAW       ] = 1,
            [GD_PICKAXE   ] = 1,
            [GD_HAMMER    ] = 4,
            [GD_SHOVEL    ] = 1,
            [GD_CRUCIBLE  ] = 0,
            [GD_RODANDLINE] = 0,

            [GD_SCYTHE    ] = 0,
            [GD_CLEAVER   ] = 0,
            [GD_ROLLINGPIN] = 0,
            [GD_BOW       ] = 0,
            [GD_SWORD     ] = 0,
            [GD_SHIELD    ] = 0,

            [GD_BOAT      ] = 4
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 13,
            [JOB_BUILDER            ] = 2,
            [JOB_PLANER             ] = 1,
            [JOB_WOODCUTTER         ] = 2,
            [JOB_FORESTER           ] = 0,
            [JOB_STONEMASON         ] = 1,

            [JOB_FISHER             ] = 0,
            [JOB_HUNTER             ] = 0,
            [JOB_CARPENTER          ] = 1,
            [JOB_FARMER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,

            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 0,
            [JOB_BREWER             ] = 0,
            [JOB_MINER              ] = 2,
            [JOB_IRONFOUNDER        ] = 0,

            [JOB_ARMORER            ] = 0,
            [JOB_MINTER             ] = 0,
            [JOB_METALWORKER        ] = 0,
            [JOB_SHIPWRIGHT         ] = 0,
            [JOB_GEOLOGIST          ] = 2,
            [JOB_SCOUT              ] = 0,

            [JOB_PACKDONKEY         ] = 2,
            [JOB_CHARBURNER         ] = 0,
    

            [JOB_PRIVATE            ] = 30,
            [JOB_PRIVATEFIRSTCLASS  ] = 15,
            [JOB_SERGEANT           ] = 5,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0
        })
    end
end

function onExplored(playerIdx, x, y, owner)
    if(playerIdx ~= 0) then
        return
    end

    if (x == 6 and y == 53) then
        MissionEvent(4, false)
    end
end

function onOccupied(playerIdx, x, y)
    if(playerIdx ~= 0) then
        return
    end

    if (x == 91 and y == 75) then
        MissionEvent(8, false)
    end
end

function onGameFrame(gf)
    if((gf%20)~=0) then
        return
    end

    if(gf==60) then
        --rttr:MissionStatement(0, _('title'), _('msg'))
        MissionEvent(1, false)
    end
    
    if (rttr:GetPlayer(0):GetNumBuildings(BLD_SAWMILL) > 0) then
        -- Sawmill count > 0
        MissionEvent(2, false)
    end

    if (rttr:GetPlayer(0):GetNumBuildings(BLD_BARRACKS) > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_BARRACKS) < 3) then
        -- Barracks > 0 < 3
        MissionEvent(3, false)

    end

    if (rttr:GetPlayer(0):GetNumBuildings(BLD_HARBORBUILDING) > 0) then
        -- harbor building
        MissionEvent(5, false)
    end

    if (rttr:GetPlayer(0):GetNumBuildings(BLD_BARRACKS) > 2) then
        -- barracks >= 3
        MissionEvent(6, false)

        -- Event currently invalid, trigger here
        MissionEvent(7, false)
    end

    --if (rttr:GetPlayer(0):GetNumWares(GD_COINS) > 49) then
    --    -- coins >= 50
    --    MissionEvent(8, false)
    --end

    if (rttr:GetPlayer(0):GetNumBuildings(BLD_WATCHTOWER) > 0) then
        -- watchtower done
        MissionEvent(9, false)
    end

    if ((rttr:GetPlayer(1):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(1):GetNumBuildings(BLD_HARBORBUILDING) + rttr:GetPlayer(1):GetNumBuildings(BLD_STOREHOUSE)) < 1) then
        -- enemy defeated
        MissionEvent(99, false)
    end
end

function MissionEvent(e, onLoad)
    -- event e is inactive
    if(eState[e] <= 0) then
        return
    end

    --rttr:MissionStatement(e, _('title'), _('msg'))
    --MissionText(e)

    -- call side effects for active events, check "eState[e] == 1" for multiple call events!
    if(e == 2 and not onLoad) then
        rttr:GetPlayer(0):AddPeople({[JOB_HUNTER] = 4})

    elseif(e == 4 and not onLoad) then
        rttr:GetPlayer(0):AddPeople({[JOB_FISHER] = 4, [JOB_SHIPWRIGHT] = 1})

    elseif(e == 5 and not onLoad) then
        rttr:GetPlayer(0):AddPeople({[JOB_MINTER] = 1})

    elseif(e == 6 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_HAMMER] = 10,
            [GD_AXE] = 10,
            [GD_PICKAXE] = 10,
            [GD_BOW] = 5,
            [GD_RODANDLINE] = 5
            })

    elseif(e == 8) then
        rttr:GetPlayer(0):EnableBuilding(BLD_GUARDHOUSE, not onLoad)
        rttr:GetPlayer(0):EnableBuilding(BLD_WATCHTOWER, not onLoad)

    elseif(e == 99) then
        -- TODO: EnableNextMissions()
        -- Show opened arc
        --rttr:GetWorld():AddStaticObject(97, 68, 561, 0xFFFF, 2)
    end

    -- update event state
    eState[e] = eState[e] - 1

    -- no history update or mission texts while loading
    if not onLoad then
        rttr:Log(">> Event: " .. e .. ",\teState[" .. e .. "] = " .. eState[e])
        eHist["n"] = eHist["n"] + 1
        eHist[eHist["n"]] = e
        MissionText(e)
    end
end