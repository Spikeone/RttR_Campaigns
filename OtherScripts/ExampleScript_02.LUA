------------------------------------------------------------------------------
-- LUA-Script which defeats players if they have no HQ left                 --
--                                                                          --
-- Author: Spikeone                                                         --
-- Change: objPlayer:Surrender(true) to objPlayer:Surrender(false) if       --
--         Buildings shouldn't be destroyed                                 --
------------------------------------------------------------------------------

function getRequiredLuaVersion()
    return 1.3
end

function onSettingsReady()
    rttr:Log("-----------------------\n Headquarter Wars... \n-----------------------\n")
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
    if ((gf % 100) ~= 0) then return end

    for plrID = 0, (rttr:GetNumPlayers() - 1) do
    
        local objPlayer = rttr:GetPlayer(plrID)
        
        if (not objPlayer:IsDefeated()) then
            if (objPlayer:GetNumBuildings(BLD_HEADQUARTERS) < 1) then
                objPlayer:Surrender(true)
            end
        end
    end
end