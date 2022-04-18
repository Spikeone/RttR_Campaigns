------------------------------------------------------------------------------
-- LUA-Script for MISS211.WLD (mission 2 of the Berciq "Roman Campaign II"  --
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
eIdx = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 98, 99}

rttr:RegisterTranslations(
{
    en = -- story by Berciq --
    {
        Diary   = 'Diary',

        msg1    = 'I\'ve become an enemy of the republic... \na barbarian as they have called me! \n\nThey didn\'t even hear about Octavian. \n\nWhat is worse they are headed by Julius, same Julius who \nentrusted me just before he died and left empire in my \nhands.. \n\nI have no idea what has happened and how can we be back \nin time... this portals... maybe they not only transfer between \nplaces but also along time?. \n\n\nI must head east and find some answers.',
        msgh1   = 'Move eastwards.',

        msg2    = 'Rich source of coal! We shall not waste it. It will be wise to keep some in case of stronger winter.',

        msg3    = 'We must produce iron out of this ore. It will help us in defence. \n\nI still hope there is a chance for peaceful solution but naive people always died first..',

        msg4    = 'This dolomite will ensure our stone demand. But it is so hard to mine in this frost soil!',

        msg5    = 'Unbelievable!',

		msg6	= 'They are already here! Lead by my uncle! He is much younger!',
		msgh6	= 'He doesn\'t know me',
		
		msg7	= 'More enemies!?',
		msgh7	= 'We stand no chance!',		

		msg8    = 'We\'ve heard rumble and felt that the earth was shaking people are scared. They claim it was gods anger. Building lookout tower here is pointless, fog and high mountain range reduce visibility. We should send scouts to keep an eye on surrondings, and update our informations',
        msgh8   = 'Keep an eye on valley',

		msg9	= 'We have discovered long valley to the south. \n\nWe have no chance to win we are outnumbered! \n\nIf we will not lose now then in following days!',
		msgh9 	= 'Our situation is terrible!',
		
		msg10	= 'We just have to find a way to obtain this old watchtower, hold position and send all the people and goods there',
		
		msg11	= 'Soldiers from camp refused to attack directly. They are properly trained but afraid of fight',
		
		msg12	= 'Southern camp has been cut off from the guardhouses. They stopped atacking from headquarter... I\'m afraid they know that more reinforcements are comming when snow melts.',

        msg99   = 'Lets use this old watchtower as headquarter. \nNow when pass are melting more solider will come to fight with us.',
        msgh99  = 'You have completed this mission.\nThe Chapter XIII awaits you...'
},
    pl = -- translated by: Berciq --
    {
        Diary   = 'Dziennik',

        msg1    = 'Zostałem wrogiem republiki, \nBarbarzyńcą jak mnie nazwali! \n\nPierwsze słyszą o Oktavianie. \n\nCo gorsza dowodzi nimi Juliusz, ten sam który powierzył mi władze nad imperium zanim został zamordowany. \n\nNie potrafię tego wyjaśnić, jak znaleźliśmy się w przeszłości \nTe wszystkie portale... może nie tylko przenosiły nas w różne miejsca \nale także w różne czasy?. \n\n\nMuszę się dowiedzieć więcej.',
        msgh1   = 'Rusz na wschód.',

        msg2    = 'Gruba warstwa węgla! Wykorzystajmy ją mądrze. Może na wszelki wypadek zostawmy trochę na zapas, zima w górach jest trudna do przewidzenia.',

        msg3    = 'Musimy przetopić tą rudę na stal. Musimy mieć się czym bronić. \n\nCały czas mam nadzieję na pokojwe rozwiązanie konfliktu ale nadzieja matką głupich..',

        msg4    = 'Te skały zapewnią nam surowiec do budowy, jednakże wydobycie ich w tych zimowych warunkach jest czasochłonne',

        msg5    = 'Nie do wiary!',

		msg6	= 'Już tu są, Dowodzi nimi mój wuj, jest znacznie młodszy!',
		msgh6	= 'Nawet mnie nie rozpoznał',
		
		msg7	= 'Kolejny obóz?',
		msgh7	= 'Mamy marne szanse',		

		msg8    = 'Nocą usłyszeliśmy straszliwy hałas. Ludzie są przerażeni. Mówią że to gniew bogów. Budowa wieży obserwacyjnej mija się z celem. Dolina jest kręta a mgła dodatkowo ogranicza widoczność, lepiej będzie wysyłać zwiadowców ale informacje od nich muszą być stale uaktualniane. ',
        msgh8   = 'Wysyłaj zwiadowców by mieć oko na całą dolinę',

		msg9	= 'Odkryliśmy długą dolinę na południu \n\nSytuacja wygląda marnie, mają sporą liczebną przewagę! \n\nNie uda nam się wiecznie bronić!',
		
		msg10	= 'Gdyby tylko udało nam się zdobyć tą starą wieżę. Przenieślibyśmy tam zapasy i ruszyli na zachód..',
		
		msg11	= 'Wróg zaszył się w obozie i nie zamierza nas atakować bezpośrednio z niego, dobra nasza. Mimo że mają przewagę i są lepiej wyposażeni brakuje im woli walki',
		
		msg12	= 'Odcięliśmy południowy obóz od strażnic. Przestali atakować z głównego obozu... Obawiam się że czekają w nadziei na posiłki.',

        msg99   = 'Odbudujmy tą wierzę i wykorzystajmy jako kwaterę. \nZa niedługo przełęczą będą mogły przedrzeć się posiłki ale też i nasza droga na zachód zostanie odblokowana.',
        msgh99  = 'Gratulacje! Ukończyłeś tą misję,\nRodzaiał XIII czeka...'
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
    rttr:Log("-----------------------\n MISS211.lua loaded... \n-----------------------\n")
    rttr:ResetAddons()                          -- S2-settings
    rttr:SetAddon(ADDON_MILITARY_HITPOINTS, true)	
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
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
    rttr:GetPlayer(1):SetName('Totorum')        -- Enemy Name
	
    rttr:GetPlayer(2):SetAI(2)                  -- medium AI
    rttr:GetPlayer(2):SetNation(NAT_ROMANS)     -- nation
    rttr:GetPlayer(2):SetColor(2)               -- red
    rttr:GetPlayer(2):SetName('Julius')         -- Enemy Name

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
    rttr:GetPlayer(0):ModifyHQ(1)               -- tent
    rttr:GetPlayer(1):ModifyHQ(1)               -- tent	
    rttr:GetPlayer(2):ModifyHQ(1)               -- tent	
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
        rttr:GetWorld():AddAnimal( 27,  88, SPEC_FOX)
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
    rttr:GetPlayer(p):DisableBuilding(BLD_SHIPYARD, false)
    rttr:GetPlayer(p):DisableBuilding(BLD_HARBORBUILDING, false)
    rttr:GetPlayer(p):DisableBuilding(BLD_CATAPULT, false)
    rttr:GetPlayer(p):DisableBuilding(BLD_LOOKOUTTOWER, false)	

    if(p == 0) then
        rttr:GetPlayer(p):DisableBuilding(BLD_CHARBURNER, false)
	end	

    if(p == 1) then
        rttr:GetPlayer(p):DisableBuilding(BLD_FORTRESS, false)
        rttr:GetPlayer(p):DisableBuilding(BLD_WATCHTOWER, false)		
	end

    if(p == 2) then
        rttr:GetPlayer(p):DisableBuilding(BLD_FORTRESS, false)
        rttr:GetPlayer(p):DisableBuilding(BLD_WATCHTOWER, false)		
	end
		
-- Building orders
		
    if(p == 1) then
        if onLoad then return end
        rttr:GetPlayer(p):AIConstructionOrder(99, 19, BLD_BARRACKS)	
        rttr:GetPlayer(p):AIConstructionOrder(96, 16, BLD_GUARDHOUSE)			
	end		
	
    if(p == 2) then
        if onLoad then return end
        rttr:GetPlayer(p):AIConstructionOrder(93, 48, BLD_BARRACKS)
        rttr:GetPlayer(p):AIConstructionOrder(91, 40, BLD_GUARDHOUSE)	
        rttr:GetPlayer(p):AIConstructionOrder(89, 46, BLD_GUARDHOUSE)	
	end
	
    if not (p == 0) then
        rttr:GetPlayer(p):SetRestrictedArea(   
            nil, nil,       -- enable the whole map
                0,   0,		-- 		first X,	first Y,
                0,   63,	-- 		first X,	last Y,
                111, 63,	-- 		last X, 	last Y,
                111, 0,  	-- 		last X,		first Y,
            nil, nil,		-- Radius =10, 	X=79, 	Y=44  (additional restricted area)
                84,  34,	-- SE			X+1/2R	Y-R
                88,  44,	-- East			X+R 	Y
                84,  54,	-- NE			X+1/2R	Y+R				
                74,  54,	-- NW			X-1/2R	Y+R
                69,  44,	-- West	 		X-R		Y
                74,  34,	-- SW			X-1/2R	Y-R
                84,  34,	-- Close SE		X-R		Y			
            nil, nil
        )
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
            [GD_BOARDS      ] =  30,
            [GD_STONES      ] =  20,
            [GD_HAM         ] =  3,
            [GD_GRAIN       ] =  6,		
            [GD_FLOUR       ] =  3,			
            [GD_FISH        ] =  2,			
            [GD_MEAT        ] =  4,			
            [GD_BREAD       ] =  3,		
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
            [GD_SHIELD      ] =  0,
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
            [JOB_BUILDER            ] =   8,
            [JOB_PLANER             ] =   5,
            [JOB_GEOLOGIST          ] =   6,
            [JOB_PRIVATE            ] =   15,
            [JOB_PRIVATEFIRSTCLASS  ] =   3,
            [JOB_SERGEANT           ] =   2,
            [JOB_OFFICER            ] =   1,
            [JOB_GENERAL            ] =   1,
            [JOB_SCOUT              ] =   4,
            [JOB_SHIPWRIGHT         ] =   0,
            [JOB_PACKDONKEY         ] =   5,
            [JOB_CHARBURNER         ] =   0
        })

    elseif(p == 1) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  5,
            [GD_BOARDS      ] =  40,
            [GD_STONES      ] =  20,
            [GD_HAM         ] =  3,
            [GD_GRAIN       ] =  6,		
            [GD_FLOUR       ] =  3,			
            [GD_FISH        ] =  3,			
            [GD_MEAT        ] =  2,			
            [GD_BREAD       ] =  4,		
            [GD_WATER       ] =  3,
            [GD_BEER        ] =  4,
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
            [GD_SHIELD      ] =  0,
            [GD_BOAT        ] =  0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  40,
            [JOB_WOODCUTTER         ] =   2,
            [JOB_FISHER             ] =   2,
            [JOB_FORESTER           ] =   1,
            [JOB_CARPENTER          ] =   1,
            [JOB_STONEMASON         ] =   2,
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
            [JOB_BUILDER            ] =   8,
            [JOB_PLANER             ] =   5,
            [JOB_GEOLOGIST          ] =   6,
            [JOB_PRIVATE            ] =   16,
            [JOB_PRIVATEFIRSTCLASS  ] =   15,
            [JOB_SERGEANT           ] =   1,
            [JOB_OFFICER            ] =   1,
            [JOB_GENERAL            ] =   1,
            [JOB_SCOUT              ] =   4,
            [JOB_SHIPWRIGHT         ] =   0,
            [JOB_PACKDONKEY         ] =   5,
            [JOB_CHARBURNER         ] =   0
        })
		
    elseif(p == 2) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  5,
            [GD_BOARDS      ] =  40,
            [GD_STONES      ] =  20,
            [GD_HAM         ] =  3,
            [GD_GRAIN       ] =  6,		
            [GD_FLOUR       ] =  3,			
            [GD_FISH        ] =  3,			
            [GD_MEAT        ] =  2,			
            [GD_BREAD       ] =  4,		
            [GD_WATER       ] =  3,
            [GD_BEER        ] =  4,
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
            [GD_SHIELD      ] =  0,
            [GD_BOAT        ] =  0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  40,
            [JOB_WOODCUTTER         ] =   2,
            [JOB_FISHER             ] =   2,
            [JOB_FORESTER           ] =   2,
            [JOB_CARPENTER          ] =   1,
            [JOB_STONEMASON         ] =   2,
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
            [JOB_BUILDER            ] =   8,
            [JOB_PLANER             ] =   5,
            [JOB_GEOLOGIST          ] =   6,
            [JOB_PRIVATE            ] =   16,
            [JOB_PRIVATEFIRSTCLASS  ] =   3,
            [JOB_SERGEANT           ] =   2,
            [JOB_OFFICER            ] =   1,
            [JOB_GENERAL            ] =   1,
            [JOB_SCOUT              ] =   4,
            [JOB_SHIPWRIGHT         ] =   0,
            [JOB_PACKDONKEY         ] =   10,
            [JOB_CHARBURNER         ] =   1
        })
    end
end

-------------------------------- mission events -------------------------------
function onOccupied(p, x, y)
    -- only check human player
    if(p ~= 0) then
        return
    end

    if( (x == 99) and (y == 19) ) then MissionEvent(11)
	elseif( (x == 93) and (y == 48) ) then MissionEvent(12)
	elseif( (x == 79) and (y == 44) ) then MissionEvent(99)
    end
    
    if(not rttr:GetPlayer(1):IsInRestrictedArea(x, y)) then 
        MissionEvent(98) -- for lifting restrictions
    end
	
    if(not rttr:GetPlayer(2):IsInRestrictedArea(x, y)) then 
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
    if(     ((p == 0) and (o == 1)) or ((p == 1) and (o == 0)) ) then MissionEvent(7)
    end
	
    if(     ((p == 0) and (o == 2)) or ((p == 2) and (o == 0)) ) then MissionEvent(6)
    end	
	
    -- onExplored events only check human player, You could erase following and then when enemy reach xy message will also be shown
    if(p ~= 0) then
        return
    end
	
    if(     (x == 65) and (y == 26) ) then MissionEvent(8)
    elseif( (x == 86) and (y == 36) ) then MissionEvent(9)	
    elseif( (x == 79) and (y == 44) ) then MissionEvent(10)		
	end
end

-- execute mission events, e == 1 is initial event, e == 99 is final event
function MissionEvent(e, onLoad)
    -- event e is inactive
    if(eState[e] <= 0) then
        return
    end

    -- call side effects for active events, check "eState[e] == 1" for multiple call events!
        
    if(e == 98) then
        rttr:GetPlayer(1):SetRestrictedArea()
        rttr:GetPlayer(2):SetRestrictedArea()
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
