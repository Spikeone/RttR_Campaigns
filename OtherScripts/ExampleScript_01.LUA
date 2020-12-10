function getRequiredLuaVersion()
    return 1.3
end

function onSettingsReady()
    rttr:Log("-----------------------\n Mission Script loaded... \n-----------------------\n")
end

function onStart(isFirstStart)
    -- ** iterate over all players **
    for i = 0, rttr:GetNumPlayers() do  
        -- ** CUSTOM function for adding resources **
        addPlayerRes(i, not isFirstStart)
        -- ** CUSTOM function for setting building restrictions **
        addPlayerBld(i, not isFirstStart)
    end
end

function addPlayerBld(p, onLoad)
    -- ** player 1 **
    if(p == 0) then
        rttr:GetPlayer(p):DisableBuilding(BLD_SAWMILL)
    -- ** player 2 ** 
    elseif (p == 1) then
        rttr:GetPlayer(p):DisableBuilding(BLD_WATCHTOWER)
    end
end

function getAllowedChanges()    
    return  { 
        ["addonsAll"]   = true,
        ["ownNation"]   = true,
        ["ownColor"]    = true,
        ["ownTeam"]     = true,
        ["aiNation"]    = true, 
        ["aiColor"]     = true,
        ["aiTeam"]      = true
            }    
end

function addPlayerRes(p, onLoad)
    if onLoad then return end

    -- ** player 1 **
    if (p == 0) then
        -- goods
        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_BEER      ] = 1000,
            [GD_TONGS     ] = 0,
            [GD_HAMMER    ] = 0,
            [GD_AXE       ] = 0,
            [GD_SAW       ] = 0,
            [GD_PICKAXE   ] = 0,
            [GD_SHOVEL    ] = 0,
            [GD_CRUCIBLE  ] = 0,
            [GD_RODANDLINE] = 0,
            [GD_SCYTHE    ] = 0,
            [GD_WATER     ] = 12,
            [GD_CLEAVER   ] = 0,
            [GD_ROLLINGPIN] = 0,
            [GD_BOW       ] = 0,
            [GD_BOAT      ] = 0,
            [GD_SWORD     ] = 0,
            [GD_IRON      ] = 0,
            [GD_FLOUR     ] = 0,
            [GD_FISH      ] = 2,
            [GD_BREAD     ] = 4,
            [GD_SHIELD    ] = 0,
            [GD_WOOD      ] = 0,
            [GD_BOARDS    ] = 15,
            [GD_STONES    ] = 12,
            [GD_GRAIN     ] = 0,
            [GD_COINS     ] = 0,
            [GD_GOLD      ] = 0,
            [GD_IRONORE   ] = 0,
            [GD_COAL      ] = 20,
            [GD_MEAT      ] = 2,
            [GD_HAM       ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
        [JOB_HELPER             ] = 40,
        [JOB_WOODCUTTER         ] = 8,
        [JOB_FISHER             ] = 4,
        [JOB_FORESTER           ] = 4,
        [JOB_CARPENTER          ] = 3,
        [JOB_STONEMASON         ] = 4,
        [JOB_HUNTER             ] = 4,
        [JOB_FARMER             ] = 6,
        [JOB_MILLER             ] = 3,
        [JOB_BAKER              ] = 3,
        [JOB_BUTCHER            ] = 3,
        [JOB_MINER              ] = 8,
        [JOB_BREWER             ] = 0,
        [JOB_PIGBREEDER         ] = 4,
        [JOB_DONKEYBREEDER      ] = 0,
        [JOB_IRONFOUNDER        ] = 4,
        [JOB_MINTER             ] = 4,
        [JOB_METALWORKER        ] = 4,
        [JOB_ARMORER            ] = 4,
        [JOB_BUILDER            ] = 4,
        [JOB_PLANER             ] = 4,
        [JOB_GEOLOGIST          ] = 4,
        [JOB_PRIVATE            ] = 8,
        [JOB_PRIVATEFIRSTCLASS  ] = 0,
        [JOB_SERGEANT           ] = 0,
        [JOB_OFFICER            ] = 0,
        [JOB_GENERAL            ] = 0,
        [JOB_SCOUT              ] = 8,
        [JOB_SHIPWRIGHT         ] = 0,
        [JOB_PACKDONKEY         ] = 15,
        [JOB_CHARBURNER         ] = 0
        })
    -- ** player 2 **
    elseif (p == 1) then
        -- goods
        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_BEER      ] = 12,
            [GD_TONGS     ] = 0,
            [GD_HAMMER    ] = 0,
            [GD_AXE       ] = 0,
            [GD_SAW       ] = 0,
            [GD_PICKAXE   ] = 0,
            [GD_SHOVEL    ] = 0,
            [GD_CRUCIBLE  ] = 0,
            [GD_RODANDLINE] = 0,
            [GD_SCYTHE    ] = 0,
            [GD_WATER     ] = 12,
            [GD_CLEAVER   ] = 0,
            [GD_ROLLINGPIN] = 0,
            [GD_BOW       ] = 0,
            [GD_BOAT      ] = 0,
            [GD_SWORD     ] = 0,
            [GD_IRON      ] = 0,
            [GD_FLOUR     ] = 0,
            [GD_FISH      ] = 2,
            [GD_BREAD     ] = 4,
            [GD_SHIELD    ] = 0,
            [GD_WOOD      ] = 0,
            [GD_BOARDS    ] = 15,
            [GD_STONES    ] = 12,
            [GD_GRAIN     ] = 0,
            [GD_COINS     ] = 0,
            [GD_GOLD      ] = 1000,
            [GD_IRONORE   ] = 0,
            [GD_COAL      ] = 20,
            [GD_MEAT      ] = 2,
            [GD_HAM       ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
        [JOB_HELPER             ] = 40,
        [JOB_WOODCUTTER         ] = 8,
        [JOB_FISHER             ] = 4,
        [JOB_FORESTER           ] = 4,
        [JOB_CARPENTER          ] = 3,
        [JOB_STONEMASON         ] = 4,
        [JOB_HUNTER             ] = 4,
        [JOB_FARMER             ] = 6,
        [JOB_MILLER             ] = 3,
        [JOB_BAKER              ] = 3,
        [JOB_BUTCHER            ] = 3,
        [JOB_MINER              ] = 8,
        [JOB_BREWER             ] = 0,
        [JOB_PIGBREEDER         ] = 4,
        [JOB_DONKEYBREEDER      ] = 0,
        [JOB_IRONFOUNDER        ] = 4,
        [JOB_MINTER             ] = 4,
        [JOB_METALWORKER        ] = 4,
        [JOB_ARMORER            ] = 4,
        [JOB_BUILDER            ] = 4,
        [JOB_PLANER             ] = 4,
        [JOB_GEOLOGIST          ] = 4,
        [JOB_PRIVATE            ] = 8,
        [JOB_PRIVATEFIRSTCLASS  ] = 0,
        [JOB_SERGEANT           ] = 0,
        [JOB_OFFICER            ] = 0,
        [JOB_GENERAL            ] = 0,
        [JOB_SCOUT              ] = 8,
        [JOB_SHIPWRIGHT         ] = 0,
        [JOB_PACKDONKEY         ] = 15,
        [JOB_CHARBURNER         ] = 0
        })
    end
end