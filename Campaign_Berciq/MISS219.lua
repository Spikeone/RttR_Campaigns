------------------------------------------------------------------------------
-- LUA-Script for MISS219.WLD (mission 10 of the Berciq "Roman Campaign II" --
--                                                                          --
-- Author: (basing on CrazyL (v0.4)) by Berciq                              --
------------------------------------------------------------------------------

-------------------------------- TODO -----------------------------------------
-- EnableNextMissions()
-- Set Portraits
-- Set AI Agression Level -> enemy should attach first
-------------------------------------------------------------------------------

-------------------------------- Lua Version used -----------------------------
function getRequiredLuaVersion()
    return 1.0
end

-------------------------------- mission events and texts ---------------------
-- Message-Window (mission statement and hints): 52 chars wide
eIdx = {1, 2, 3, 4, 5, 6, 7, 98, 99} -- don't forget to add here all event's you've created

rttr:RegisterTranslations(
{
    en =
    {
        Diary   = 'Diary',

        msg1    = 'We\'ve managed to take all we need and even more through the gateway. \n\nWhat a pity that gateway always colapses. We could build our new empire between two worlds. \n\nOur people are getting tired of constantly building country and then abandoning it. It\'s been another 10 years.. should we give up on returning to Rome? Maybe gateways will never take us back to our times. \n\nI\'ve been thinking about this for a long time now but people kept pushing on me to go forward hoping to see their families again. So did I. \n\nWhat have I become after slaying all this tribes which crossed our path.. not only hostiles.. almost all of them.. Were they true enemy? Or rather we were enemy taking up their lands? I’ve stopped even considering alignments years ago. \n\nMaybe it is time to settle down, just ensure safety of our people, creating calm and happy society?',
        msgh1   = 'I\'ve become old and uncertain.. I don\'t know what to do anymore..',
		
		msg2    = 'Well, theres a water in this well',
		
		msg3    = 'Japanese are dangerous enemy, especially their skilled assasins',
		
		msg4    = 'I\'ve never met, people with such a strange culture and buildings. Their roofs are used as a gardens',

		msg5    = 'Vikings. Their armors are weak but their axes are sharp',

		msg6    = 'Ow someone lives here, but doesn\'t want to take part in this war... Well we nood no more enemies',

		msg7    = 'Gateway. If we are already here then let\'s find a way to take it!',

		msg99   = 'Gateway... I was thinking abut it for all this time, Let\'s destroy it! Give me pickax...', -- message starts from to \npushes text to next line
        msgh99  = '.. \n\nPortal has opened. Chapter XXI is calling You...', -- message shown at bottom of page and as diary message
},
    pl =
    {
        Diary   = 'Dziennik',

        msg1    = 'We\'ve managed to take all we need and even more through the gateway. \n\nWhat a pity that gateway always colapses. We could build our new empire between two worlds. \n\nOur people are getting tired of constantly building country and then abandoning it. It\'s been another 10 years.. should we give up on returning to Rome? Maybe gateways will never take us back to our times. \n\nI’ve been thinking about this for a long time now but people kept pushing on me to go forward hoping to see their families again. So did I. \n\nWhat have I become after slaying all this tribes which crossed our path.. not only hostiles.. almost all of them.. Were they true enemy? Or rather we were enemy taking up their lands? I’ve stopped even considering alignments years ago. \n\nMaybe it is time to settle down, just ensure safety of our people, creating calm and happy society?',
        msgh1   = 'I\'ve become old and uncertain.. I don\'t know what to do anymore..',
		
		msg2    = 'Woda mineralna to taki kompot z kamieni.. no nie?',
		
		msg3    = 'Japończycy są groźnym wrogiem, zwłaszcz ich wyszkoleni zabójcy',
		
		msg4    = 'Do tej pory nigdy nie spotkałem ludzi o tak dziwnej kulturze i architekturze. Dachy ich domów wykorzystywane sa jako ogrody!',

		msg5    = 'Wikingowie na południu. Może i mają cienkie zbroje ale za to bardzo ostre topory',

		msg6    = 'Ktoś tu sobie żyje, i nie chce się mieszać w wojnę. Tym lepiej dla nas, nie trzeba nam kolejnego wroga',

		msg7    = 'Portal, jeśli już tu dotarliśmy, czemu by go nie zająć?',		

		msg99   = 'Portal.. myślałem już o tym, pora go zniszczyć, podajcie mi kilo..', -- message starts from to \npushes text to next line
        msgh99  = '.. \n\nPortal otworzył się, Rozdział XXI wzywa...', -- message shown at bottom of page and as diary message
} -- dont forget to erase "," here and check if all lines are ending with ',       if you want to have   '  in text then you simply use \ before it, like that  \' 
})

-- format mission texts
function MissionText(e)
    local msg = _('msg' .. tostring(e))
    local msgh = _('msgh'.. tostring(e))

    if(msg ~= ('msg' .. tostring(e)) and msgh ~= ('msgh'.. tostring(e))) then
        rttr:MissionStatement(0, _('Diary'), msg .. '\n\n\n\n\n\n\n' ..msgh.. '\n\n\n\n\n\n\n', IM_SWORDSMAN, true) -- IM_SWORDSMAN can be replaced with IM_RIDER, IM_READER, IM_AVATAR1 - 12
        rttr:SetMissionGoal(0, msgh)
    elseif(msg ~= ('msg' .. tostring(e))) then
        rttr:MissionStatement(0, _('Diary'), msg .. '\n\n\n\n\n\n\n', IM_SWORDSMAN, true) --same here
    end

end

-------------------------------- general settings -----------------------------
function onSettingsReady()
    rttr:Log("-----------------------\n MISS219.lua loaded... \n-----------------------\n") -- changed filename? I hope so
    rttr:ResetAddons()                          -- S2-settings
    rttr:SetAddon(ADDON_MILITARY_HITPOINTS, true)	
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetAddon(ADDON_CATAPULT_GRAPHICS, true)
	rttr:SetAddon(ADDON_MILITARY_AID, true)		
	rttr:SetAddon(ADDON_REFUND_MATERIALS, 3) -- parametr 3 is third option. Just open game, start new unlimited map, open desired addon, check value and if third value is good for you, then write here 3 
    rttr:SetAddon(ADDON_TOOL_ORDERING, true)	
    rttr:SetAddon(ADDON_METALWORKSBEHAVIORONZERO, true)	
	rttr:SetAddon(ADDON_DEMOLITION_PROHIBITION, true)
    rttr:SetAddon(ADDON_MILITARY_CONTROL, true)	
    rttr:SetAddon(ADDON_MORE_ANIMALS, true)
    rttr:SetAddon(ADDON_CHARBURNER, true)	
    rttr:SetAddon(ADDON_BURN_DURATION, 3)	
	rttr:SetAddon(ADDON_EXHAUSTIBLE_WATER, 2)
    rttr:SetAddon(ADDON_DEMOLISH_BLD_WO_RES, true)
    rttr:SetAddon(ADDON_SEA_ATTACK, true)	
	
	--ALL ADDONS LIST:
		--REFUND_MATERIALS 		EXHAUSTIBLE_WATER		REFUND_ON_EMERGENCY 			MANUAL_ROAD_ENLARGEMENT 	CATAPULT_GRAPHICS		
		--CHARBURNER			TRADE					CHANGE_GOLD_DEPOSITS			MAX_WATERWAY_LENGTH			CUSTOM_BUILD_SEQUENCE	
		--NO_COINS_DEFAULT		TOOL_ORDERING			ADJUST_MILITARY_STRENGTH		MILITARY_AID				MAX_RANK				
		--BURN_DURATION			NO_ALLIED_PUSH			BATTLEFIELD_PROMOTION			HALF_COST_MIL_EQUIP			MILITARY_CONTROL		
		--LIMIT_CATAPULTS		INEXHAUSTIBLE_MINES 	FRONTIER_DISTANCE_REACHABLE		COINS_CAPTURED_BLD			DEMOLISH_BLD_WO_RES		
		--PEACEFULMODE			DEFENDER_BEHAVIOR		AI_DEBUG_WINDOW					NUM_SCOUTS_EXPLORATION		STATISTICS_VISIBILITY
		--SEA_ATTACK			INEXHAUSTIBLE_FISH		MORE_ANIMALS					SHIP_SPEED					MILITARY_HITPOINTS			
		--DURABLE_GEOLOGIST_SIGNS						ECONOMY_MODE_GAME_LENGTH		METALWORKSBEHAVIORONZERO	DEMOLITION_PROHIBITION 	
	
    rttr:SetGameSettings({
        ["fow"] = EXP_CLASSIC,
        ["teamView"] = false,
        ["lockedTeams"] = false
    })

    rttr:GetPlayer(0):SetNation(NAT_ROMANS)     -- nation romans, vikings, babylonians, africans, japanese
    rttr:GetPlayer(0):SetColor(0)               -- color 0:blue, 1:yellow, 2:red, 3:purple, 4:grey, 5:green, 6:orange, 7:cyan, 8:white, 9:brown
    rttr:GetPlayer(0):SetName('Octavian') 
	
    rttr:GetPlayer(1):SetAI(3)                  -- hard AI, making decision quickly
    rttr:GetPlayer(1):SetNation(NAT_JAPANESE)   -- nation
    rttr:GetPlayer(1):SetColor(1)               -- yellow
    rttr:GetPlayer(1):SetName('Japanese')       -- Enemy Name		
	
    rttr:GetPlayer(2):SetAI(3)                  -- hard AI
    rttr:GetPlayer(2):SetNation(NAT_BABYLONIANS)-- nation
    rttr:GetPlayer(2):SetColor(7)               -- cyan
    rttr:GetPlayer(2):SetName('Babylonians')    -- Enemy Name	
	
    rttr:GetPlayer(3):SetAI(3)                  -- hard AI
    rttr:GetPlayer(3):SetNation(NAT_VIKINGS)    -- nation
    rttr:GetPlayer(3):SetColor(4)               -- grey
    rttr:GetPlayer(3):SetName('Vikings')        -- Enemy Name
	
    rttr:GetPlayer(1):SetTeam(TM_TEAM1)			-- You can assign enemies to teams, but it may not work as you desire
    rttr:GetPlayer(2):SetTeam(TM_TEAM1)	
    rttr:GetPlayer(3):SetTeam(TM_TEAM1)		
end

function getAllowedChanges()    				-- You can choose if the player may change sometking before game starts
    return  { 
        ["addonsAll"]   = false,
        ["ownNation"]   = false,
        ["ownColor"]    = false,
        ["ownTeam"]     = false,
        ["aiNation"]    = false, 
        ["aiColor"]     = false,
        ["aiTeam"]      = false
            }    
end

-- start callback
function onStart(isFirstStart)
    for i = 0, (rttr:GetPlayerCount() - 1) do   -- set resources
        addPlayerRes(i, not isFirstStart)
        addPlayerBld(i, not isFirstStart)
    end

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
        MissionEvent(1)                         -- initial event / start screen
    end
    
    if isFirstStart then
        -- type 8 == 7 in rttr	  OTHERANIMALS LIST:	SPEC_RABBITWHITE 	SPEC_RABBITGREY  	SPEC_POLARBEAR	SPEC_STAG 	SPEC_DEER 	SPEC_SHEEP 	SPEC_DUCK 	SPEC_FOX 				
        rttr:GetWorld():AddAnimal( 69,  43, SPEC_FOX)
    end
end

-- save callback
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

-------------------------------- set buildings --------------------------------
function addPlayerBld(p, onLoad)
    -- set buildings for all players
    rttr:GetPlayer(p):EnableAllBuildings()	
		
    if(p ~= 0) then
        rttr:GetPlayer(p):SetRestrictedArea(
            nil, nil,       -- enable the whole map
                0,   0,		-- X, Y, 				You put cordinates of all 4 corners of your map here. First is always 0,0 as every map starts in that point
                0,   143,	-- 0, last Y point, 	last Y is 1 less than map dimension so my map dimensions here are 160x144
                159,  143,	-- last X, Last Y 		you can also chech them manually on map by opening it in map editor or playing it surrender, and hit F3 to se x,y
                159,  0,	-- Last X, first Y
            nil, nil
        )
	end
end

-------------------------------- set resources --------------------------------
-- Don't add goods/people onLoad!
function addPlayerRes(p, onLoad)
    if onLoad then return end
    rttr:GetPlayer(p):ClearResources()
    if(p >= 0) then			-- To have specific resources for each player simply copy and past below changing (p >= 0) to (p == 0) [and ware people list] then another one for (p ~= 0) or for (p == 1) [list] (P == 2) etc
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  80,
            [GD_BOARDS      ] =  80,
            [GD_STONES      ] =  80,
            [GD_HAM         ] =  20,
            [GD_GRAIN       ] =  40,		
            [GD_FLOUR       ] =  20,			
            [GD_FISH        ] =  20,			
            [GD_MEAT        ] =  20,			
            [GD_BREAD       ] =  20,		
            [GD_WATER       ] =  60,
            [GD_BEER        ] =  40,
            [GD_COAL        ] =  60,
            [GD_IRONORE     ] =  20,
            [GD_GOLD        ] =  20,
            [GD_IRON        ] =  10,		
            [GD_COINS       ] =  10,		
            [GD_TONGS       ] =  2,	
            [GD_AXE         ] =  10,
            [GD_SAW         ] =  4,
            [GD_PICKAXE     ] =  10,
            [GD_HAMMER      ] =  20,
            [GD_SHOVEL      ] =  10,
            [GD_CRUCIBLE    ] =  4,
            [GD_RODANDLINE  ] =  10,
            [GD_SCYTHE      ] =  10,
	        [GD_CLEAVER     ] =  4,
            [GD_ROLLINGPIN  ] =  4,			
            [GD_BOW         ] =  10,
            [GD_SWORD       ] =  20,
            [GD_SHIELD      ] =  20,
            [GD_BOAT        ] =  20
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  100,
            [JOB_WOODCUTTER         ] =  12,
            [JOB_FISHER             ] =   6,
            [JOB_FORESTER           ] =   4,
            [JOB_CARPENTER          ] =   4,
            [JOB_STONEMASON         ] =  12,
            [JOB_HUNTER             ] =   6,
            [JOB_FARMER             ] =  20,
            [JOB_MILLER             ] =   4,
            [JOB_BAKER              ] =   4,
            [JOB_BUTCHER            ] =   4,
            [JOB_MINER              ] =  20,
            [JOB_BREWER             ] =   4,
            [JOB_PIGBREEDER         ] =   4,
            [JOB_DONKEYBREEDER      ] =   4,
            [JOB_IRONFOUNDER        ] =   4,
            [JOB_MINTER             ] =   4,
            [JOB_METALWORKER        ] =   4,
            [JOB_ARMORER            ] =   4,
            [JOB_BUILDER            ] =  20,
            [JOB_PLANER             ] =  20,
            [JOB_GEOLOGIST          ] =  20,
            [JOB_PRIVATE            ] =  45,
            [JOB_PRIVATEFIRSTCLASS  ] =  33,
            [JOB_SERGEANT           ] =  17,
            [JOB_OFFICER            ] =   9,
            [JOB_GENERAL            ] =   5,
            [JOB_SCOUT              ] =  20,
            [JOB_SHIPWRIGHT         ] =   4,
            [JOB_PACKDONKEY         ] =  20,
            [JOB_CHARBURNER         ] =   4
        })
    end
end


-------------------------------- mission events -------------------------------

function onResourceFound(p, x, y, rIdx, q)
    -- only check human player
    if(p ~= 0) then
        return
    end

    if(rIdx == RES_WATER) then           MissionEvent(2)	-- on first water found others are: RES_COAL, RES_IRON, RES_GRANITE, RES_GOLD
    end
end

function onExplored(p, x, y, o)
    -- onContact events
    if(     	((p == 0) and (o == 1)) or ((p == 1) and (o == 0)) ) then MissionEvent(3)	-- when player 0 meets player 1 or player 1 meets player 0
    elseif(     ((p == 0) and (o == 2)) or ((p == 2) and (o == 0)) ) then MissionEvent(4)	
    elseif(     ((p == 0) and (o == 3)) or ((p == 3) and (o == 0)) ) then MissionEvent(5)
    end	
	
    -- onExplored events only check human player, You could erase following and then when enemy reach xy message will also be shown
    if(p ~= 0) then
        return
    end
	
    if(     (x == 111) and (y == 73) ) then MissionEvent(6)
    elseif(  (x == 83) and (y == 18) ) then MissionEvent(7)		
	end
end

function onOccupied(p, x, y)
    -- only check human player
    if(p ~= 0) then
        return
    end

    if( (x == 83) and (y == 19) ) then MissionEvent(99)		-- when player reaches X and Y event will run
    end
    
	if(not rttr:GetPlayer(1):IsInRestrictedArea(x, y)) then 
        MissionEvent(98) -- for lifting restrictions
    end	
end

-- execute mission events, e == 1 is initial event, e == 99 is final event
function MissionEvent(e, onLoad)
    -- event e is inactive
    if(eState[e] <= 0) then
        return
    end

    -- call side effects for active events, check "eState[e] == 1" for multiple call events!

    if(e == 1) then
        rttr:GetWorld():AddStaticObject(83, 19, 560, 0xFFFF, 2)        -- Show arc (X,Y,ID,dunno,size) place should be empty, without any object
    end
	
    if(e == 99) then
        rttr:GetWorld():AddStaticObject(83, 19, 561, 0xFFFF, 2)        -- Open arc ID 561
    end

    -- update event state
    eState[e] = eState[e] - 1

    -- no history update or mission texts while loading
    if not onLoad then
        rttr:Log(">> Event: " .. e .. ",\teState[" .. e .. "] = " .. eState[e])         -- TEST
        eHist["n"] = eHist["n"] + 1
        eHist[eHist["n"]] = e
        MissionText(e)
    end
end
