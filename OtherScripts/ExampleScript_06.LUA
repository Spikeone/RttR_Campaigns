------------------------------------------------------------------------------
-- LUA-Script sets resources to ultra low                                   --
--                                                                          --
-- Author: Spikeone                                                         --
-- Change: Accepts pacts for AI players                                     --
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

function onCancelPactRequest(pactType, fromPlayer, toPlayer)
    rttr:Chat(-1, "onCancelPactRequest: pactType = " ..pactType.. ", fromPlayer = " ..fromPlayer.. ", toPlayer = " ..toPlayer)
    return true;
end

function onSuggestPact(PactType, suggestedByPlayerId, targetPlayerId, duration)
    rttr:Chat(-1, "onSuggestPact: PactType = " ..PactType.. ", suggestedByPlayerId = " ..suggestedByPlayerId.. ", targetPlayerId = " ..targetPlayerId.. ", duration = " ..duration)
    return true;
end

function onPactCanceled(PactType, canceledByPlayerId, targetPlayerId)
    rttr:Chat(-1, "onPactCanceled: PactType = " ..PactType.. ", canceledByPlayerId = " ..canceledByPlayerId.. ", targetPlayerId = " ..targetPlayerId)
end

function onPactCreated(PactType, suggestedByPlayerId, targetPlayerId, duration)
    rttr:Chat(-1, "onPactCreated: PactType = " ..PactType.. ", suggestedByPlayerId = " ..suggestedByPlayerId.. ", targetPlayerId = " ..targetPlayerId.. ", duration = " ..duration)
end