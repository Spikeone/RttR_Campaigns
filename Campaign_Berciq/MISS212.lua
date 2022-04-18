------------------------------------------------------------------------------
-- LUA-Script for MISS212.WLD (mission 3 of the Berciq "Roman Campaign II"  --
--                                                                          --
-- Author: (basing on CrazyL (v0.4)) by Berciq                              --
------------------------------------------------------------------------------

-------------------------------- TODO -----------------------------------------
-- EnableNextMissions()
-- Set Portraits
-------------------------------------------------------------------------------

-------------------------------- Lua Version used -----------------------------
function getRequiredLuaVersion()
    return 1.0
end

-------------------------------- mission events and texts ---------------------
-- Message-Window (mission statement and hints): 52 chars wide
eIdx = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 98, 99}

rttr:RegisterTranslations(
{
    en = -- story by Berciq --
    {
        Diary   = 'Diary',

        msg1    = 'Despite their poor tactic reinforcements joined them and we lost our position in mountains. Plans of our deadly machine.. I cannot find them anywhere.. Anyway snow has melted and even stronger army is approaching, we have no other choice than to run away, leaving all behind. After creating real army I will come back, but now let\'s head to the west, along this mountain valley. If we will be lucky we will find place to build harbor and ship to run away.',
        msgh1   = 'Move westwards.',

        msg2    = 'Geologists have finally found some coal, but one of them claims that this is one and only layer of coal in this whole mountain range, we have to use it wisely.',

        msg3    = 'Iron ore can be mined here. But I don\'t know if we will find time to train new soldiers..',

        msg4    = 'Well granite shortage will not be a problem here...',

        msg5    = 'Few gold nuggets were reported to be on that hill. We\'ll do our best to send as many soldiers as possible on each training.',

		msg6	= 'Situation is terrible! They also have camp to the north! ',
		msgh6	= 'Run!',	

		msg7	= 'They are already here!',
		msgh7	= 'Run or die!',
		
		msg8    = 'Vikings!? They burned our previous settlement and slaughtered all the people! There is no time for revenge, they will attack us also, we are surrounded. We must quickly escape, I see the coastline to the West! There is still hope!',
        msgh8   = 'No chance for reinforcements',

		msg9	= 'Sea! Our destination!',
		msgh9 	= 'Secure the coastline!',
		
		msg10	= 'This island.. \n\n\nLet\'s take a closer look!',
		
		msg11	= 'There is a portal! \n\nIt\'s always been there! \n\nI forgot about it, but now I know how to open it! \n\nAll stay on board!',

		msg12	= 'There is good place for the castle by this swamps however will we have time to build it? \n\nIt would give us better chance to hold position...',

		msg13	= 'Perfect place for harbor! Looks like shipwright has emptied our beer barrels...  \n\nI must keep an eye on him, otherwise he will build small boats \n\n...or what is worse he will start building ship by the lake, not a sea shore! ',

		msg14	= 'Our resources and people must be moved to safe place!',		

        msg99   = 'Just in time! Their fleet is coming!',
        msgh99  = 'Portal pulled in whole ship! \n\nYou have sucesfully run away! \nThe Chapter XIV awaits you...'
},
   pl = -- translated by: Berciq --
    {
        Diary   = 'Dziennik',

        msg1    = 'Pomimo kiepskiej taktyki posiłki ostatecznie dołączyły do obozów i utraciliśmy nasze pozycje w górach. Plany konstrukcji katapulty przepadły gdzieś podczas przenosin. W każdym razie śnieg na przełączach stopniał i jeszcze silniejsza armia się zbliża.. nie widzę innego wyjścia jak porzucenie wszystkiego i ucieczkę na zachód. Gdzy zbierzemy więcej ludzi spróbujemy ponownie. Narazie idźmy wzdłuż doliny a być może nad brzegiem morza będziemy w stanie zbudować okręt.',
        msgh1   = 'Podążaj na zachód',

        msg2    = 'Geolodzy nareszcie odneleźli jakieś złoża węgla, powiadają że więcej węgla nie znajdziemy, trzeba go mądrze wykorzystać.',

        msg3    = 'Możemy pozyskać rudę żelaza ale nie wiem czy wystarczy czasu na trening',

        msg4    = 'Brak kamienia do budowy napewno nam tu nie grozi',

        msg5    = 'Kilka złotych samorodków, zróbmy co w naszej mocy żeby posłać jak najwięcej żołnieży na trening',

		msg6	= 'Beznadziejna sytuacjia, mają obóz na północy',
		msgh6	= 'Uciekaj!',	

		msg7	= 'Już tu są!',
		msgh7	= 'Uciekaj i żyj, lub zostań i zgiń',
		
		msg8    = 'Vikingowie? Tutaj?! Osada którą zbudowaliśmy przestała istnieć, ludzie najprawdopodbniej zamordowani.. Nie ma czasu na zemstę, z dodatkowym wrogiem jesteśmy otoczeni. musimy uceic póki czas, widzę wybrzeże, nie możemy stracić nadziei.',
        msgh8   = 'Żadne posiłki z wioski nam nie pomogą',

		msg9	= 'Morze! Cel naszej ucieczki!',
		msgh9 	= 'Zabezpiecz wybrzeże',
		
		msg10	= 'Ta wysepka.. \n\n\nPrzyjrzyjmy się jej!',
		
		msg11	= 'Portal! \n\nOd zawsze tu był! \n\nCałkowicie o nim zapomniałem! \n\nZostańcie na pokładzie spróbuję go otworzyć!',

		msg12	= 'Doskonałe miejsce na warownie otoczone bagnami, ale czy wystarczy nam czasu na budowę? \n\nŁatwiej byłoby się bronić...',

		msg13	= 'Doskonałe miejsce na port! Wygląda na to że szkutnik opróżnił część beczek. \n\nMuszę mieć na niego oko inaczej zamiast budować okęt będzie dłubał malutkie łupiny... \n\nalbo co gorsza wybuduje statek nad jeziorem.',

		msg14	= 'Musimy się wynieść z głównej, stoi zbyt blisko wroga!',		

        msg99   = 'W samą porę! Widać wrogą flotę na horyzoncie!',
        msgh99  = 'Portal wciągnął cały statek! \n\nUdało Ci się uciec!! \nMisja XIV czeka...'
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


-------------------------------- general settings -----------------------------
function onSettingsReady()
    rttr:Log("-----------------------\n MISS212.lua loaded... \n-----------------------\n")
    rttr:ResetAddons()                          -- S2-settings
    rttr:SetAddon(ADDON_MILITARY_HITPOINTS, true)	
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetAddon(ADDON_CATAPULT_GRAPHICS, true)
	--rttr:SetAddon(ADDON_MILITARY_AID, true)		
    --rttr:SetAddon(ADDON_TOOL_ORDERING, true)	
    --rttr:SetAddon(ADDON_METALWORKSBEHAVIORONZERO, true)	
	--rttr:SetAddon(ADDON_DEMOLITION_PROHIBITION, true)
    --rttr:SetAddon(ADDON_MILITARY_CONTROL, true)	
    --rttr:SetAddon(ADDON_MORE_ANIMALS, true)
    --rttr:SetAddon(ADDON_CHARBURNER, true)	
    --rttr:SetAddon(ADDON_EXHAUSTIBLE_WATER, true)	
	--rttr:SetAddon(ADDON_REFUND_MATERIALS, true)	
    --rttr:SetAddon(ADDON_DEMOLISH_BLD_WO_RES, true)
    --rttr:SetAddon(ADDON_SEA_ATTACK, true)	

    rttr:SetGameSettings({                      -- TEST
        ["fow"] = EXP_FOGOFWAR,
        ["teamView"] = false,
        ["lockedTeams"] = false
    })

    rttr:GetPlayer(0):SetNation(NAT_ROMANS)     -- nation romans, vikings, babylonians, africans, japanese
    rttr:GetPlayer(0):SetColor(0)               -- color 0:blue, 1:yellow, 2:red, 3:purple, 4:grey, 5:green, 6:orange, 7:cyan, 8:white, 9:brown
    rttr:GetPlayer(0):SetName('Octavian') 

    rttr:GetPlayer(1):SetAI(3)                  -- hard AI 3, easy 1
    rttr:GetPlayer(1):SetNation(NAT_ROMANS)     -- nation
    rttr:GetPlayer(1):SetColor(1)               -- yellow
    rttr:GetPlayer(1):SetName('Laudanum')       -- Enemy Name
	
    rttr:GetPlayer(2):SetAI(3)                  -- hard AI
    rttr:GetPlayer(2):SetNation(NAT_ROMANS)     -- nation
    rttr:GetPlayer(2):SetColor(2)               -- red
    rttr:GetPlayer(2):SetName('Julius')         -- Enemy Name

    rttr:GetPlayer(3):SetAI(2)                  -- medium AI
    rttr:GetPlayer(3):SetNation(NAT_VIKINGS)    -- nation
    rttr:GetPlayer(3):SetColor(3)               -- grey
    rttr:GetPlayer(3):SetName('Bjorn')          -- Enemy Name	

    rttr:GetPlayer(1):SetTeam(TM_TEAM1)         -- TEST
    rttr:GetPlayer(2):SetTeam(TM_TEAM1)
end

function getAllowedChanges()    
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
    for i = 0, 2 do                             -- set resources
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
        -- type 8 == 7 in rttr					-- SPEC_RABBITWHITE 	SPEC_RABBITGREY  	SPEC_POLARBEAR	SPEC_STAG 	SPEC_DEER 	SPEC_SHEEP 	SPEC_DUCK 	SPEC_FOX 
        rttr:GetWorld():AddAnimal( 69,  43, SPEC_FOX)
        rttr:GetWorld():AddAnimal( 63,  40, SPEC_RABBITGREY)
        rttr:GetWorld():AddAnimal( 50,  42, SPEC_STAG)		
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
    rttr:GetPlayer(p):DisableBuilding(BLD_CATAPULT, false)			-- is disabled only for me :(!

    if(p == 3) then
        rttr:GetPlayer(p):DisableBuilding(BLD_SHIPYARD, false)		-- those vikings don't know what is forbidden and restricted that is why i killed their shipwright! and metalworker, just for sure... =D
	end	
	
    if(p == 0) then
        rttr:GetPlayer(p):DisableBuilding(BLD_CHARBURNER, false)
		
    else
        rttr:GetPlayer(p):SetRestrictedArea(
            nil, nil,       -- enable the whole map
                0,   0,
                0,   127,
                127, 127,
                127, 0,
            nil, nil
        )
		
        if(p == 1) then
            if onLoad then return end

            rttr:GetPlayer(p):AIConstructionOrder(87, 46, BLD_BARRACKS)
        end
        if(p == 2) then
            if onLoad then return end

            rttr:GetPlayer(p):AIConstructionOrder(76, 21, BLD_FORTRESS)
        end
        if(p == 3) then
            if onLoad then return end

            rttr:GetPlayer(p):AIConstructionOrder(19, 33, BLD_FORTRESS)
            rttr:GetPlayer(p):AIConstructionOrder(14, 34, BLD_FISHERY)			
        end		
    end
end


-------------------------------- set resources --------------------------------
-- Don't add goods/people onLoad!
function addPlayerRes(p, onLoad)
    if onLoad then return end
    rttr:GetPlayer(p):ClearResources()
    if(p == 0) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  5,
            [GD_BOARDS      ] =  20,
            [GD_STONES      ] =  20,
            [GD_HAM         ] =  3,
            [GD_GRAIN       ] =  6,		
            [GD_FLOUR       ] =  3,			
            [GD_FISH        ] =  3,			
            [GD_MEAT        ] =  2,			
            [GD_BREAD       ] =  4,		
            [GD_WATER       ] =  4,
            [GD_BEER        ] =  0,
            [GD_COAL        ] =  0,
            [GD_IRONORE     ] =  0,
            [GD_GOLD        ] =  0,
            [GD_IRON        ] =  0,		
            [GD_COINS       ] =  0,		
            [GD_TONGS       ] =  0,	
            [GD_AXE         ] =  0,
            [GD_SAW         ] =  0,
            [GD_PICKAXE     ] =  0,
            [GD_HAMMER      ] =  0,
            [GD_SHOVEL      ] =  0,
            [GD_CRUCIBLE    ] =  0,
            [GD_RODANDLINE  ] =  0,
            [GD_SCYTHE      ] =  0,
	        [GD_CLEAVER     ] =  0,
            [GD_ROLLINGPIN  ] =  0,			
            [GD_BOW         ] =  0,
            [GD_SWORD       ] =  0,
            [GD_SHIELD      ] =  1,
            [GD_BOAT        ] =  0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  40,
            [JOB_WOODCUTTER         ] =   4,
            [JOB_FISHER             ] =   2,
            [JOB_FORESTER           ] =   2,
            [JOB_CARPENTER          ] =   2,
            [JOB_STONEMASON         ] =   4,
            [JOB_HUNTER             ] =   2,
            [JOB_FARMER             ] =   4,
            [JOB_MILLER             ] =   2,
            [JOB_BAKER              ] =   2,
            [JOB_BUTCHER            ] =   2,
            [JOB_MINER              ] =   6,
            [JOB_BREWER             ] =   1,
            [JOB_PIGBREEDER         ] =   2,
            [JOB_DONKEYBREEDER      ] =   1,
            [JOB_IRONFOUNDER        ] =   1,
            [JOB_MINTER             ] =   1,
            [JOB_METALWORKER        ] =   1,
            [JOB_ARMORER            ] =   1,
            [JOB_BUILDER            ] =   6,
            [JOB_PLANER             ] =   6,
            [JOB_GEOLOGIST          ] =   6,
            [JOB_PRIVATE            ] =   15,
            [JOB_PRIVATEFIRSTCLASS  ] =   3,
            [JOB_SERGEANT           ] =   2,
            [JOB_OFFICER            ] =   1,
            [JOB_GENERAL            ] =   1,
            [JOB_SCOUT              ] =   4,
            [JOB_SHIPWRIGHT         ] =   2,
            [JOB_PACKDONKEY         ] =   10,
            [JOB_CHARBURNER         ] =   0
        })

    elseif(p == 1) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  5,
            [GD_BOARDS      ] =  20,
            [GD_STONES      ] =  20,
            [GD_HAM         ] =  3,
            [GD_GRAIN       ] =  20,		
            [GD_FLOUR       ] =  0,			
            [GD_FISH        ] =  3,			
            [GD_MEAT        ] =  2,			
            [GD_BREAD       ] =  4,		
            [GD_WATER       ] =  3,
            [GD_BEER        ] =  10,
            [GD_COAL        ] =  3,
            [GD_IRONORE     ] =  2,
            [GD_GOLD        ] =  0,
            [GD_IRON        ] =  1,		
            [GD_COINS       ] =  0,		
            [GD_TONGS       ] =  0,	
            [GD_AXE         ] =  0,
            [GD_SAW         ] =  0,
            [GD_PICKAXE     ] =  0,
            [GD_HAMMER      ] =  0,
            [GD_SHOVEL      ] =  0,
            [GD_CRUCIBLE    ] =  0,
            [GD_RODANDLINE  ] =  0,
            [GD_SCYTHE      ] =  0,
	        [GD_CLEAVER     ] =  0,
            [GD_ROLLINGPIN  ] =  0,			
            [GD_BOW         ] =  0,
            [GD_SWORD       ] =  30,
            [GD_SHIELD      ] =  30,
            [GD_BOAT        ] =  0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  40,
            [JOB_WOODCUTTER         ] =   4,
            [JOB_FISHER             ] =   2,
            [JOB_FORESTER           ] =   2,
            [JOB_CARPENTER          ] =   2,
            [JOB_STONEMASON         ] =   4,
            [JOB_HUNTER             ] =   2,
            [JOB_FARMER             ] =   4,
            [JOB_MILLER             ] =   2,
            [JOB_BAKER              ] =   2,
            [JOB_BUTCHER            ] =   2,
            [JOB_MINER              ] =   6,
            [JOB_BREWER             ] =   1,
            [JOB_PIGBREEDER         ] =   2,
            [JOB_DONKEYBREEDER      ] =   1,
            [JOB_IRONFOUNDER        ] =   1,
            [JOB_MINTER             ] =   1,
            [JOB_METALWORKER        ] =   1,
            [JOB_ARMORER            ] =   1,
            [JOB_BUILDER            ] =   6,
            [JOB_PLANER             ] =   6,
            [JOB_GEOLOGIST          ] =   6,
            [JOB_PRIVATE            ] =   15,
            [JOB_PRIVATEFIRSTCLASS  ] =   15,
            [JOB_SERGEANT           ] =   1,
            [JOB_OFFICER            ] =   1,
            [JOB_GENERAL            ] =   1,
            [JOB_SCOUT              ] =   4,
            [JOB_SHIPWRIGHT         ] =   2,
            [JOB_PACKDONKEY         ] =   10,
            [JOB_CHARBURNER         ] =   0
        })
		
    elseif(p == 2) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  10,
            [GD_BOARDS      ] =  20,
            [GD_STONES      ] =  20,
            [GD_HAM         ] =  3,
            [GD_GRAIN       ] =  20,		
            [GD_FLOUR       ] =  0,			
            [GD_FISH        ] =  3,			
            [GD_MEAT        ] =  2,			
            [GD_BREAD       ] =  4,		
            [GD_WATER       ] =  30,
            [GD_BEER        ] =  10,
            [GD_COAL        ] =  3,
            [GD_IRONORE     ] =  2,
            [GD_GOLD        ] =  0,
            [GD_IRON        ] =  1,		
            [GD_COINS       ] =  0,		
            [GD_TONGS       ] =  0,	
            [GD_AXE         ] =  0,
            [GD_SAW         ] =  0,
            [GD_PICKAXE     ] =  0,
            [GD_HAMMER      ] =  0,
            [GD_SHOVEL      ] =  0,
            [GD_CRUCIBLE    ] =  0,
            [GD_RODANDLINE  ] =  0,
            [GD_SCYTHE      ] =  0,
	        [GD_CLEAVER     ] =  0,
            [GD_ROLLINGPIN  ] =  0,			
            [GD_BOW         ] =  0,
            [GD_SWORD       ] =  30,
            [GD_SHIELD      ] =  30,
            [GD_BOAT        ] =  10
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  40,
            [JOB_WOODCUTTER         ] =   4,
            [JOB_FISHER             ] =   2,
            [JOB_FORESTER           ] =   2,
            [JOB_CARPENTER          ] =   2,
            [JOB_STONEMASON         ] =   4,
            [JOB_HUNTER             ] =   2,
            [JOB_FARMER             ] =   4,
            [JOB_MILLER             ] =   2,
            [JOB_BAKER              ] =   2,
            [JOB_BUTCHER            ] =   2,
            [JOB_MINER              ] =   6,
            [JOB_BREWER             ] =   1,
            [JOB_PIGBREEDER         ] =   2,
            [JOB_DONKEYBREEDER      ] =   1,
            [JOB_IRONFOUNDER        ] =   1,
            [JOB_MINTER             ] =   1,
            [JOB_METALWORKER        ] =   1,
            [JOB_ARMORER            ] =   1,
            [JOB_BUILDER            ] =   6,
            [JOB_PLANER             ] =   6,
            [JOB_GEOLOGIST          ] =   6,
            [JOB_PRIVATE            ] =   1,
            [JOB_PRIVATEFIRSTCLASS  ] =   20,
            [JOB_SERGEANT           ] =   1,
            [JOB_OFFICER            ] =   1,
            [JOB_GENERAL            ] =   1,
            [JOB_SCOUT              ] =   4,
            [JOB_SHIPWRIGHT         ] =   0,
            [JOB_PACKDONKEY         ] =   10,
            [JOB_CHARBURNER         ] =   0
        })
		
    elseif(p == 3) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  5,
            [GD_BOARDS      ] =  20,
            [GD_STONES      ] =  20,
            [GD_HAM         ] =  3,
            [GD_GRAIN       ] =  20,		
            [GD_FLOUR       ] =  0,			
            [GD_FISH        ] =  3,			
            [GD_MEAT        ] =  2,			
            [GD_BREAD       ] =  4,		
            [GD_WATER       ] =  3,
            [GD_BEER        ] =  0,
            [GD_COAL        ] =  3,
            [GD_IRONORE     ] =  2,
            [GD_GOLD        ] =  0,
            [GD_IRON        ] =  1,		
            [GD_COINS       ] =  0,		
            [GD_TONGS       ] =  0,	
            [GD_AXE         ] =  0,
            [GD_SAW         ] =  0,
            [GD_PICKAXE     ] =  0,
            [GD_HAMMER      ] =  0,
            [GD_SHOVEL      ] =  0,
            [GD_CRUCIBLE    ] =  0,
            [GD_RODANDLINE  ] =  0,
            [GD_SCYTHE      ] =  0,
	        [GD_CLEAVER     ] =  0,
            [GD_ROLLINGPIN  ] =  0,			
            [GD_BOW         ] =  0,
            [GD_SWORD       ] =  30,
            [GD_SHIELD      ] =  30,
            [GD_BOAT        ] =  10
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  40,
            [JOB_WOODCUTTER         ] =   4,
            [JOB_FISHER             ] =   2,
            [JOB_FORESTER           ] =   2,
            [JOB_CARPENTER          ] =   2,
            [JOB_STONEMASON         ] =   4,
            [JOB_HUNTER             ] =   2,
            [JOB_FARMER             ] =   4,
            [JOB_MILLER             ] =   2,
            [JOB_BAKER              ] =   2,
            [JOB_BUTCHER            ] =   2,
            [JOB_MINER              ] =   6,
            [JOB_BREWER             ] =   1,
            [JOB_PIGBREEDER         ] =   2,
            [JOB_DONKEYBREEDER      ] =   1,
            [JOB_IRONFOUNDER        ] =   1,
            [JOB_MINTER             ] =   1,
            [JOB_METALWORKER        ] =   0,
            [JOB_ARMORER            ] =   1,
            [JOB_BUILDER            ] =   6,
            [JOB_PLANER             ] =   6,
            [JOB_GEOLOGIST          ] =   6,
            [JOB_PRIVATE            ] =   1,
            [JOB_PRIVATEFIRSTCLASS  ] =   15,
            [JOB_SERGEANT           ] =   1,
            [JOB_OFFICER            ] =   1,
            [JOB_GENERAL            ] =   1,
            [JOB_SCOUT              ] =   4,
            [JOB_SHIPWRIGHT         ] =   0,
            [JOB_PACKDONKEY         ] =   10,
            [JOB_CHARBURNER         ] =   0
        })		
    end
end


-------------------------------- mission events -------------------------------
function onOccupied(p, x, y)
    -- only check human player
    if(p ~= 0) then
        return
    end

    if( (x == 9) and (y == 55) ) then MissionEvent(99)
    end
    
    if(not rttr:GetPlayer(1):IsInRestrictedArea(x, y)) then 
        MissionEvent(98) -- for lifting restrictions
    end
	
    if(not rttr:GetPlayer(2):IsInRestrictedArea(x, y)) then 
        MissionEvent(98) -- for lifting restrictions
    end	
    
    if(not rttr:GetPlayer(3):IsInRestrictedArea(x, y)) then 
        MissionEvent(98) -- for lifting restrictions
    end		
	
end

function onResourceFound(p, x, y, rIdx, q)
    -- only check human player
    if(p ~= 0) then
        return
    end

    if(rIdx == RES_COAL) then           MissionEvent(2)
    elseif(rIdx == RES_IRON) then       MissionEvent(3)
    elseif(rIdx == RES_GRANITE) then    MissionEvent(4)
    elseif(rIdx == RES_GOLD) then       MissionEvent(5)
    end
end

function onExplored(p, x, y, o)
    -- onContact events
    if(     ((p == 0) and (o == 1)) or ((p == 1) and (o == 0)) ) then MissionEvent(6)
    end
	
    if(     ((p == 0) and (o == 2)) or ((p == 2) and (o == 0)) ) then MissionEvent(7)
    end	
	
    if(     ((p == 0) and (o == 3)) or ((p == 3) and (o == 0)) ) then MissionEvent(8)
    end		
	
    -- onExplored events only check human player, You could erase following and then when enemy reach xy message will also be shown
    if(p ~= 0) then
        return
    end
	
    if(     (x == 31) and (y == 52) ) then MissionEvent(9)
    elseif( (x == 12) and (y == 56) ) then MissionEvent(10)
    elseif( (x == 9) and (y == 55) ) then MissionEvent(11)
    elseif( (x == 36) and (y == 48) ) then MissionEvent(12)	
    elseif( (x == 24) and (y == 53) ) then MissionEvent(13)	
    elseif( (x == 56) and (y == 39) ) then MissionEvent(14)		
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
        rttr:GetWorld():AddStaticObject(9, 55, 560, 0xFFFF, 2)        -- Show arc
	end
	  
    if(e == 98) then
        rttr:GetPlayer(1):SetRestrictedArea()
        rttr:GetPlayer(2):SetRestrictedArea()
        rttr:GetPlayer(3):SetRestrictedArea()	
	end	
	
    if(e == 99) then
        rttr:GetWorld():AddStaticObject(9, 55, 561, 0xFFFF, 2)        -- Open arc
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
