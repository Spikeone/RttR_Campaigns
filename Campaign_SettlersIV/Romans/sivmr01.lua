function getRequiredLuaVersion()
    return 1.3
end

rttr:RegisterTranslations(
{
    en =
    {
        name    = 'Viking Tribe',
    
        title   = 'Threat from the North',
        msg1    = 'We have been too complacent. Our discipline has dissipated\nwith the absence of any serious rivals. This cannot and will\nnot continue. Our spies have become aware that the Vikings\nhave established a colony on the island. A fierce and\nproud tribe. They have apparently been industrous for they\nhave built up thriving mining operations and flourishing\nfarms. We will need more reconnaissance. We must know their\nweaknesses, not only their strengths.\nOur priests are disquited. They speak anxously of a dream\nthat has visited not one but several of them - and identical\ndream. The she-wolf of the Tiber appears, her head lowered\nand snarling. It is not yet clear what this portends. But\nfirst we must prepare for meeting the threat of the Vikings.',
        chat1   = 'Viking Tribe: These Romans are crazy!',
        chat2   = 'Viking Tribe: Crush those silly Romans!',
        msg2    = 'We conquered the island and found a strange relict. Our priests may know\nwhat it is for!\n\nYou completed this scenario.',
        chat3   = 'Viking Tribe: ...'

    }
})

function onSettingsReady()
    rttr:Log("-----------------------\n Mission Script loaded... \n-----------------------\n")
    rttr:MsgBox('Information', 'You can change some addons. They have been set to the original intention, so keep that in mind.', false)
    
    rttr:ResetAddons()                          -- S2-settings
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetAddon(ADDON_CATAPULT_GRAPHICS, true)
    rttr:SetGameSettings({
        ["fow"] = EXP_FOGOFWAR,
        ["teamView"] = false,
        ["lockedTeams"] = false
    })

    rttr:GetPlayer(0):SetNation(NAT_ROMANS)
    rttr:GetPlayer(0):SetColor(1)
    
    rttr:GetPlayer(1):SetNation(NAT_VIKINGS)
    rttr:GetPlayer(1):SetColor(0)
    rttr:GetPlayer(1):SetAI(3)
    rttr:GetPlayer(1):SetName(_('name'))
end

function getAllowedChanges()
    return  { 
        ["addonsAll"]   = false,
        ["addonsSome"]  = true,
        ["ownNation"]   = false,
        ["ownColor"]    = false,
        ["ownTeam"]     = false,
        ["aiNation"]    = false,
        ["aiColor"]     = false,
        ["aiTeam"]      = false
    }
end

function getAllowedAddons()
    return {
        ADDON_INEXHAUSTIBLE_MINES,
        ADDON_TOOL_ORDERING,
        ADDON_CATAPULT_GRAPHICS,
        ADDON_NO_COINS_DEFAULT,
        ADDON_MANUAL_ROAD_ENLARGEMENT,
        ADDON_METALWORKSBEHAVIORONZERO
    }
end

function onStart(isFirstStart)
    rttr:GetPlayer(1):SetRestrictedArea(33,4,47,38,1,84,7,10)

    rttr:GetPlayer(1):AIConstructionOrder(23,51,BLD_WATCHTOWER)
    rttr:GetPlayer(1):AIConstructionOrder(31,42,BLD_WATCHTOWER)
    rttr:GetPlayer(1):AIConstructionOrder(37,37,BLD_WATCHTOWER)
    rttr:GetPlayer(1):AIConstructionOrder(27,17,BLD_GOLDMINE)
    rttr:GetPlayer(1):AIConstructionOrder(26,21,BLD_GUARDHOUSE)
    rttr:GetPlayer(1):AIConstructionOrder(25,22,BLD_QUARRY)

    rttr:GetPlayer(1):DisableBuilding(BLD_FORTRESS)
    rttr:GetPlayer(1):DisableBuilding(BLD_CATAPULT)
    rttr:GetPlayer(1):DisableBuilding(BLD_SHIPYARD)
    rttr:GetPlayer(1):DisableBuilding(BLD_HARBORBUILDING)

    addPlayerRes(0, not isFirstStart)
    addPlayerRes(1, not isFirstStart)
end

function addPlayerRes(p, onLoad)
    if onLoad then return end

    if(p == 0) then                 -- Map activates 7 players!
        -- goods
        rttr:GetPlayer(p):ClearResources()

        rttr:GetPlayer(p):AddWares({
            [GD_BEER      ] = 12,
            [GD_TONGS     ] = 0,
            [GD_HAMMER    ] = 8,
            [GD_AXE       ] = 3,
            [GD_SAW       ] = 2,
            [GD_PICKAXE   ] = 2,
            [GD_SHOVEL    ] = 0,
            [GD_CRUCIBLE  ] = 0,
            [GD_RODANDLINE] = 2,
            [GD_SCYTHE    ] = 6,
            [GD_WATER     ] = 12,
            [GD_CLEAVER   ] = 2,
            [GD_ROLLINGPIN] = 1,
            [GD_BOW       ] = 1,
            [GD_BOAT      ] = 4,
            [GD_SWORD     ] = 12,
            [GD_IRON      ] = 0,
            [GD_FLOUR     ] = 0,
            [GD_FISH      ] = 8,
            [GD_BREAD     ] = 8,
            [GD_SHIELD    ] = 12,
            [GD_WOOD      ] = 12,
            [GD_BOARDS    ] = 22,
            [GD_STONES    ] = 30,
            [GD_GRAIN     ] = 12,
            [GD_COINS     ] = 5,
            [GD_GOLD      ] = 0,
            [GD_IRONORE   ] = 8,
            [GD_COAL      ] = 8,
            [GD_MEAT      ] = 0,
            [GD_HAM       ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
        [JOB_HELPER             ] = 20,
        [JOB_WOODCUTTER         ] = 6,
        [JOB_FISHER             ] = 0,
        [JOB_FORESTER           ] = 2,
        [JOB_CARPENTER          ] = 2,
        [JOB_STONEMASON         ] = 3,
        [JOB_HUNTER             ] = 1,
        [JOB_FARMER             ] = 6,
        [JOB_MILLER             ] = 3,
        [JOB_BAKER              ] = 3,
        [JOB_BUTCHER            ] = 3,
        [JOB_MINER              ] = 6,
        [JOB_BREWER             ] = 1,
        [JOB_PIGBREEDER         ] = 4,
        [JOB_DONKEYBREEDER      ] = 0,
        [JOB_IRONFOUNDER        ] = 2,
        [JOB_MINTER             ] = 1,
        [JOB_METALWORKER        ] = 1,
        [JOB_ARMORER            ] = 2,
        [JOB_BUILDER            ] = 10,
        [JOB_PLANER             ] = 5,
        [JOB_GEOLOGIST          ] = 6,
        [JOB_PRIVATE            ] = 8,
        [JOB_PRIVATEFIRSTCLASS  ] = 4,
        [JOB_SERGEANT           ] = 2,
        [JOB_OFFICER            ] = 1,
        [JOB_GENERAL            ] = 0,
        [JOB_SCOUT              ] = 3,
        [JOB_SHIPWRIGHT         ] = 1,
        [JOB_PACKDONKEY         ] = 0,
        [JOB_CHARBURNER         ] = 0
        })
    elseif (p == 1) then
        rttr:GetPlayer(p):ClearResources()

        rttr:GetPlayer(p):AddWares({
            [GD_BEER      ] = 12,
            [GD_TONGS     ] = 0,
            [GD_HAMMER    ] = 12,
            [GD_AXE       ] = 6,
            [GD_SAW       ] = 2,
            [GD_PICKAXE   ] = 4,
            [GD_SHOVEL    ] = 0,
            [GD_CRUCIBLE  ] = 0,
            [GD_RODANDLINE] = 6,
            [GD_SCYTHE    ] = 10,
            [GD_WATER     ] = 12,
            [GD_CLEAVER   ] = 3,
            [GD_ROLLINGPIN] = 3,
            [GD_BOW       ] = 2,
            [GD_BOAT      ] = 0,
            [GD_SWORD     ] = 0,
            [GD_IRON      ] = 0,
            [GD_FLOUR     ] = 0,
            [GD_FISH      ] = 20,
            [GD_BREAD     ] = 10,
            [GD_SHIELD    ] = 0,
            [GD_WOOD      ] = 30,
            [GD_BOARDS    ] = 40,
            [GD_STONES    ] = 50,
            [GD_GRAIN     ] = 0,
            [GD_COINS     ] = 15,
            [GD_GOLD      ] = 10,
            [GD_IRONORE   ] = 20,
            [GD_COAL      ] = 30,
            [GD_MEAT      ] = 5,
            [GD_HAM       ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
        [JOB_HELPER             ] = 60,
        [JOB_WOODCUTTER         ] = 10,
        [JOB_FISHER             ] = 0,
        [JOB_FORESTER           ] = 6,
        [JOB_CARPENTER          ] = 4,
        [JOB_STONEMASON         ] = 6,
        [JOB_HUNTER             ] = 4,
        [JOB_FARMER             ] = 4,
        [JOB_MILLER             ] = 2,
        [JOB_BAKER              ] = 2,
        [JOB_BUTCHER            ] = 2,
        [JOB_MINER              ] = 10,
        [JOB_BREWER             ] = 1,
        [JOB_PIGBREEDER         ] = 2,
        [JOB_DONKEYBREEDER      ] = 0,
        [JOB_IRONFOUNDER        ] = 3,
        [JOB_MINTER             ] = 1,
        [JOB_METALWORKER        ] = 2,
        [JOB_ARMORER            ] = 2,
        [JOB_BUILDER            ] = 12,
        [JOB_PLANER             ] = 6,
        [JOB_GEOLOGIST          ] = 10,
        [JOB_PRIVATE            ] = 32,
        [JOB_PRIVATEFIRSTCLASS  ] = 16,
        [JOB_SERGEANT           ] = 8,
        [JOB_OFFICER            ] = 4,
        [JOB_GENERAL            ] = 2,
        [JOB_SCOUT              ] = 5,
        [JOB_SHIPWRIGHT         ] = 0,
        [JOB_PACKDONKEY         ] = 20,
        [JOB_CHARBURNER         ] = 0
        })
    end
end

function onGameFrame(gf)
    if((gf%20)~=0) then
        return
    end

    if(gf==60) then
        rttr:MissionStatement(0, _('title'), _('msg1'))
    end
end

function onOccupied(p,x,y)
    if(p~=0) then
        return
    end

    if(x==37 and y==11) then
        rttr:GetPlayer(1):SetRestrictedArea()
        rttr:Chat(0, _('chat1'))
    elseif(x==37 and y==53) then
        rttr:GetPlayer(1):SetRestrictedArea()
        rttr:Chat(0, _('chat2'))
    elseif(x==24 and y==16) then
        rttr:MissionStatement(0, _('title'), _('msg2'))
        rttr:Chat(0, _('chat3'))
        --rttr:GetWorld():AddStaticObject(24, 16, 561, 0xFFFF, 2)
    end
end