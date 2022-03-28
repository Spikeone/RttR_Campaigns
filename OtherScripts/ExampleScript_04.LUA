------------------------------------------------------------------------------
-- LUA-Script which defeats players if they have no HQ left                 --
--                                                                          --
-- Author: Spikeone                                                         --
-- Change: enforceBuildingCount(player, building, limit, notify)            --
--         player: id of the player a limit is enforced                     --
--         building: building constant for the building limited             --
--         limit: numeric limit for given building                          --
--         notify: notify the player a new building is available?           --
------------------------------------------------------------------------------

function getRequiredLuaVersion()
    return 1
end

function onSettingsReady()
    rttr:Log("-----------------------\n Enforce Building Count \n-----------------------\n")
    rttr:SetGameSettings({
        ["objective"] = GO_TOTALDOMINATION
    })

end

function getAllowedChanges()    
    return { 
    ["general"] = true,
    ["addonsAll"] = true,
    ["swapping"] = true,
    ["playerState"] = true
    }
end


function onGameFrame(gf)
    enforceBuildingCount(0, BLD_BARRACKS, 2, false)
end

function enforceBuildingCount(player, building, limit, notify)
    local sumBuildings = rttr:GetPlayer(player):GetNumBuildings(building) + rttr:GetPlayer(player):GetNumBuildingSites(building)

    if (sumBuildings >= limit) then
        rttr:GetPlayer(player):DisableBuilding(building)
    else
        rttr:GetPlayer(player):EnableBuilding(building, notify)
    end
end