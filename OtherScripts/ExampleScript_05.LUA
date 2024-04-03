------------------------------------------------------------------------------
-- LUA-Script sets resources to ultra low                                   --
--                                                                          --
-- Author: Spikeone                                                         --
-- Change: This should set the wares to ultra low (1/2 of very low)         --
------------------------------------------------------------------------------

function getRequiredLuaVersion()
    return 1
end


function getAllowedChanges()
    return  {
        ["general"]     = true,
        ["addonsAll"]   = true,
        ["ownNation"]   = true,
        ["ownColor"]    = true,
        ["ownTeam"]     = true,
        ["aiNation"]    = true,
        ["aiColor"]     = true,
        ["aiTeam"]      = true,
        ["swapping"]    = true,
        ["playerState"] = true,
        ["aiNation"]    = true,
        ["aiColor"]     = true,
        ["aiTeam"]      = true
    }
end

function onStart(isFirstStart)
    if (isFirstStart) then
        addPlayerRes()
    end
end

function addPlayerRes()
    for p=0, rttr:GetNumPlayers() - 1 do
        local player = rttr:GetPlayer(p)

        -- player only
        if ((player:IsHuman() or player:IsAI()) and not player:IsClosed()) then
            player:ClearResources()

            player:AddWares({
                [GD_WOOD      ] = 3,
                [GD_BOARDS    ] = 5,
                [GD_STONES    ] = 8,
                [GD_MEAT      ] = 0,
                [GD_GRAIN     ] = 0,
                [GD_FLOUR     ] = 0,

                [GD_FISH      ] = 0,
                [GD_HAM       ] = 0,
                [GD_BREAD     ] = 1,
                [GD_WATER     ] = 0,
                [GD_BEER      ] = 0,
                [GD_COAL      ] = 2,

                [GD_IRONORE   ] = 2,
                [GD_GOLD      ] = 0,
                [GD_IRON      ] = 0,
                [GD_COINS     ] = 0,
                [GD_TONGS     ] = 1,
                [GD_AXE       ] = 0,

                [GD_SAW       ] = 0,
                [GD_PICKAXE   ] = 0,
                [GD_HAMMER    ] = 2,
                [GD_SHOVEL    ] = 0,
                [GD_CRUCIBLE  ] = 0,
                [GD_RODANDLINE] = 0,

                [GD_SCYTHE    ] = 1,
                [GD_CLEAVER   ] = 0,
                [GD_ROLLINGPIN] = 1,
                [GD_BOW       ] = 0,
                [GD_SWORD     ] = 0,
                [GD_SHIELD    ] = 0,

                [GD_BOAT      ] = 0
            })

            player:AddPeople({
                [JOB_HELPER             ] = 6,
                [JOB_BUILDER            ] = 1,
                [JOB_PLANER             ] = 1,
                [JOB_WOODCUTTER         ] = 1,
                [JOB_FORESTER           ] = 1,
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
                [JOB_MINER              ] = 1,
                [JOB_IRONFOUNDER        ] = 1,

                [JOB_ARMORER            ] = 0,
                [JOB_MINTER             ] = 0,
                [JOB_METALWORKER        ] = 0,
                [JOB_SHIPWRIGHT         ] = 0,
                [JOB_GEOLOGIST          ] = 1,
                [JOB_SCOUT              ] = 0,

                [JOB_PACKDONKEY         ] = 1,
                [JOB_CHARBURNER         ] = 0,

                [JOB_PRIVATE            ] = 6,
                [JOB_PRIVATEFIRSTCLASS  ] = 0,
                [JOB_SERGEANT           ] = 0,
                [JOB_OFFICER            ] = 0,
                [JOB_GENERAL            ] = 0
            })
        end
    end
end