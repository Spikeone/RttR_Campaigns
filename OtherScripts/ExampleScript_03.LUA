------------------------------------------------------------------------------
-- LUA-Script for detecting gamespeed changes                               --
--                                                                          --
-- Author: Spikeone                                                         --
-- Change:                                                                  --
--                                                                          --
------------------------------------------------------------------------------

local gameSpeed = 0

function getRequiredLuaVersion()
    return 1.3
end

function onSettingsReady()
    rttr:Log("-----------------------\n Mission Script loaded... \n-----------------------\n")
end

function onGameFrame(gf)
    -- need a "hook" - 100 gf seems fair
    if (gf % 100 == 0) then checkGameSpeed(gf) end
end

-- formats the current gf as if it was formatted by rttr
function getFormatGamespeed(gf, speed)
    -- implementation taken from rttr
    local returnString = "00:00"
    local numSeconds = gf * speed * 0.001
    local numHours = math.floor(numSeconds / 3600)
    local numMinutes = math.floor((numSeconds - numHours * 3600) / 60)
    numSeconds = math.floor(numSeconds - (numHours * 3600 + numMinutes * 60))
    
    if(numHours > 0) then
        returnString = string.format("%02u:%02u:%02u", numHours, numMinutes, numSeconds)
    else
        returnString = string.format("%02u:%02u", numMinutes, numSeconds)
    end
    
    return returnString;
end

-- checks the current gamespeed by given gameframe
function checkGameSpeed(gf)
    local rttrTime = rttr:FormatNumGFs(gf)
    
    for i=10,70,10 do
        local ownTime = getFormatGamespeed(gf, i)
        
        -- we found the correct speed
        if (rttrTime == ownTime) then
            -- and it is neither the initial speed nor the original
            if (gameSpeed ~= 0 and gameSpeed ~= i) then
                -- emit event
                onSpeedChange(gameSpeed, i)
            end
            
            gameSpeed = i
            
            return
        end
    end
end

-- event for updating timed messages
function onSpeedChange(old, new)
    rttr:Log("onSpeedChange(" ..old.. ", " ..new.. ")")
end
