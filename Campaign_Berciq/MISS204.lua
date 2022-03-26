------------------------------------------------------------------------------
-- LUA-Script for MISS204.WLD (mission 5 of the Berciq "Roman Campaign II"  --
--                                                                          --
-- Author: (basing on CrazyL (v0.4)) by Berciq                                                  --
------------------------------------------------------------------------------

-------------------------------- TODO -----------------------------------------
-- disable sawmills when there are more than 2
-- Force to build buildings in x, y
-- erase additional restricted ares
-- consider fixing always opened gateways
-- there is no ending 
-- pl translation

-- EnableNextMissions()
-- Set Portraits
-------------------------------------------------------------------------------

-------------------------------- Lua Version used -----------------------------
function getRequiredLuaVersion()
    return 1.3
end

-------------------------------- mission events and texts ---------------------
-- Message-Window (mission statement and hints): 52 chars wide
eIdx = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 98, 99}

rttr:RegisterTranslations(
{
    en = -- story by Berciq --
    {
        Diary   = 'Diary',

        msg1    = 'We are inside some kind of old volcano filled with huge lake. There is no possibility to climb over this cliffs around so we must stay in this flat as a pancake land. \n\nWe\'d better build harbor and take a look from the island in the middle, who knows what we will find on the other side of the caldera. Fortunately we have found much iron just lying on the ground.. Seems like it has naturally connected with coal.',
        msgh1   = 'We must equip our people with tools they need.',

        msg2    = 'There is rich source of coal in that cliffs.',

        msg3    = 'Looks like some ore can be mined form mountain to the west.',

        msg4    = 'I feel better now when we have found source of stones.     ',

        msg5    = 'Gold! Finally!',

		msg6	= 'This is just a tiny village but seems like they are producing gold and tools for all this people. ',
		
		msg7    = 'Best fortified enemy is to the north, he is hostile and will for sure revenge his brothers',

		msg8	= 'Friendly tribe is living to the north. They are fishing from boats, means that they must have access to a harbor. I was trying to ask their chief about access to harbor but it only made him angry. I must consider fighting with this tribe, their spears are really dangerous for our not so well prepared soldiers...',
		
		msg9	= 'Here is our real enemy. I hope we are well prepared! We must also secure pass through desert somehow...',
		
		msg10	= 'Gate! we must find a way to occupy it!',

		msg11	= 'Looks like small isle where one patrol will be enough to secure it!',

		msg12	= 'This lake is huge! It is also really deep, our ropes are too short to check how deep!',

		msg13	= 'Swamps are terrible place to build a harbor!',	

		msg14	= 'More wastelands...',
		
		msg15	= 'This sand dunes are blocking our way! It is impossible to build anything here.',

		msg16	= 'Water is shallow here, I think there would be possibility to connect this islands with small boats.',

		msg17	= 'This small piece of land truly is a paradise. Soil is so fertile that wheat will grow without any problems.',

		msg18	= 'There is great spot to build harbor for our ships.',

		msg19	= 'Another desert huh?',

		msg99   = 'Pyrrhic victory... so many soldiers died... anyway let\'s go back for our people... \n\n\n\nI CANNOT EXPLAIN WHAT HAS HAPPENED... People who had huts close to water.. we\'ve found them dead in the morning.. \n\nThey weren\'t murdered... They looked just as if they fell asleep.. \n\nEvil lives in this lake, what is more I am also feeling dizzy.. We cannot stay here...',
        msgh99  = '\n\nUse Portal before it\'ll be too late! \nThe Chapter XVI awaits you...',
},
    pl = -- translated by: Berciq --
    {
        Diary   = 'Dziennik',

        msg1    = 'Znaleźliśmy się wewnątrz starego wulkanu wypełnionego wodą. Nie ma najmniejszych szans wspiąć się na te klify dookoła. \n\nWybudujmy port i rozejżyjmy się z wyspy na środku, kto wie co znajdziemy po drugiej stronie. Ruda żelaza poprostu leży na stoku wygląda jakby się stopiła ze skłem i węglem.. ',
        msgh1   = 'Uposaż ludzi w potrzebne im narzędzia',

        msg2    = 'W klifie znajdują się bogate pokłady węgla.',

        msg3    = 'Wygląda na to że możemy tu wydobywać rudę żelaza',

        msg4    = 'Jestem spokojniejszy odkąd odkryliśmy te złoża granitu',

        msg5    = 'Złoto! Nareszcie!',

		msg6	= 'Maleńka osada ale wygląda na to że produkuje broń, i narzędzia dla wszystkich ludów wymieniając wszystko na jedzenie',
		
		msg7    = 'Wróg na północy ma wyjątkowo dobrze rozbudowane obiekty militarne, pokonanie go nie będzie takie łatwe..',

		msg8	= 'Zawiązaliśmy sojusz z plemieniem na północy. Łowią ryby z łódek ale widzę że mają doskonałe miejsce na budowę portu. Pomimo dobrych relacji ich wódz nie pozwoli nam na budowę niczego na jego terytorium, będziemy musieli wypowiedzieć sojusz i zaatakować, im szybciej tym lepiej',
		
		msg9	= 'Wróg osiedlił się za pustynią, musimy przygotować wojsko do przemarszu',
		
		msg10	= 'Portal! musimy znaleźć sposób by się do niego dostać!',

		msg11	= 'Jedna strażnica w zupełności wystarczy żeby chronić całą wysepkę',

		msg12	= 'Jezioro jest ogromne! Do tego nizewykle głębokie! Nasze liny nie są w stanie nawet dosięgnąć dna!',

		msg13	= 'Na tych bagnach nie uda się zbudować portu',	

		msg14	= 'Same pustkowia...',
		
		msg15	= 'Wielkie wydmy blokują dalszą drogę, musimy spróbować innej drogi.',

		msg16	= 'Jezioro przy wyspach jest wyjątkowo płytkie, rosną tu nawet szuwary, moglibyśmy poprowadzić transport z lądu łodziami na wyspę!',

		msg17	= 'Ten skrawek lądy jesst istnym rajem. Gleba jest tu tak urodzajnaa że przenica rośnie beż żadnych problemów. Wszystko musi być sprawką tych wulkanicznych popiołów.',

		msg18	= 'Zajeliśmy doskonałą lokację na port!',

		msg19	= 'Kolejna pustynia?',

		msg99   = 'Pyrrusowe zwycięstwo... tak wielu wspaniałych ludzi zmarło byśmy mogli tu dotrzeć... pora wrócić po resztę naszych ludzi... \n\nTRAGEDIA, NIE POTRAFIĘ TEGO NAWET WYJAŚNIĆ... Wszyscy nasi ludzie po drugiej stronie jeziora nie żyją. Znaleźliśmy ich martwych w chatach.. \n\nAle nikt ich nie zabił... Wyglądają jakby poprostu położyli się spać.. \n\nStraszliwe zło musi kryć się na dnie jeziora, ja też zaczynam się czuć coraz gorzej.. Uciekajmy!',
        msgh99  = '\n\nOtwórz portal nim będzie za późno! \nRozdział XVI czeka...',
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
    rttr:Log("-----------------------\n MISS204.lua loaded... \n-----------------------\n")
    rttr:ResetAddons()                          -- S2-settings
    rttr:SetAddon(ADDON_MILITARY_HITPOINTS, true)	
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetAddon(ADDON_CATAPULT_GRAPHICS, true)
	rttr:SetAddon(ADDON_MILITARY_AID, true)		
    rttr:SetAddon(ADDON_TOOL_ORDERING, true)	
    rttr:SetAddon(ADDON_METALWORKSBEHAVIORONZERO, true)	
	--rttr:SetAddon(ADDON_DEMOLITION_PROHIBITION, true)
    --rttr:SetAddon(ADDON_MILITARY_CONTROL, true)	
    --rttr:SetAddon(ADDON_MORE_ANIMALS, true)
    --rttr:SetAddon(ADDON_CHARBURNER, true)	
    --rttr:SetAddon(ADDON_EXHAUSTIBLE_WATER, true)	
	--rttr:SetAddon(ADDON_REFUND_MATERIALS, true)	
    --rttr:SetAddon(ADDON_DEMOLISH_BLD_WO_RES, true)
    --rttr:SetAddon(ADDON_SEA_ATTACK, true)	

    rttr:SetGameSettings({                      -- TEST
        ["fow"] = EXP_CLASSIC,
        ["teamView"] = false,
        ["lockedTeams"] = false
    })

    rttr:GetPlayer(0):SetNation(NAT_ROMANS)     -- nation romans, vikings, babylonians, africans, japanese
    rttr:GetPlayer(0):SetColor(0)               -- color 0:blue, 1:yellow, 2:red, 3:purple, 4:grey, 5:green, 6:orange, 7:cyan, 8:white, 9:brown
    rttr:GetPlayer(0):SetName('Octavian') 

    rttr:GetPlayer(1):SetAI(1)                  -- easy AI
    rttr:GetPlayer(1):SetNation(NAT_JAPANESE)   -- nation
    rttr:GetPlayer(1):SetColor(1)               -- yellow
    rttr:GetPlayer(1):SetName('Kofun')          -- Enemy Name	
	
    rttr:GetPlayer(2):SetAI(3)                  -- hard AI
    rttr:GetPlayer(2):SetNation(NAT_JAPANESE)   -- nation
    rttr:GetPlayer(2):SetColor(1)               -- red
    rttr:GetPlayer(2):SetName('Asuka')          -- Enemy Name	

    rttr:GetPlayer(3):SetAI(1)                  -- easy AI
    rttr:GetPlayer(3):SetNation(NAT_AFRICANS)   -- nation
    rttr:GetPlayer(3):SetColor(1)               -- purple
    rttr:GetPlayer(3):SetName('Mansa')          -- Enemy Name	

    rttr:GetPlayer(4):SetAI(3)                  -- hard AI
    rttr:GetPlayer(4):SetNation(NAT_JAPANESE)   -- nation
    rttr:GetPlayer(4):SetColor(1)               -- grey
    rttr:GetPlayer(4):SetName('Nara')           -- Enemy Name	
	
    rttr:GetPlayer(1):SetTeam(TM_TEAM1)
    rttr:GetPlayer(2):SetTeam(TM_TEAM1)
    rttr:GetPlayer(4):SetTeam(TM_TEAM1)	
	
    rttr:GetPlayer(0):SetTeam(TM_TEAM2)
    rttr:GetPlayer(3):SetTeam(TM_TEAM2)	
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
	
    if(p == 0) then
        rttr:GetPlayer(p):DisableBuilding(BLD_CHARBURNER, false)
	end
	
    if(p == 3) then
        rttr:GetPlayer(p):DisableBuilding(BLD_GOLDMINE, false)
	end	
	
    if not(p == 0) then
        rttr:GetPlayer(p):DisableBuilding(BLD_SHIPYARD)
        rttr:GetPlayer(p):DisableBuilding(BLD_HARBORBUILDING)
		
    else
        rttr:GetPlayer(p):SetRestrictedArea(
            nil, nil,       -- enable the whole map
                0,   0,
                0,   112,
                112, 112,
                112, 0,
            nil, nil
        )
		
        if(p == 1) then
            if onLoad then return end
            rttr:GetPlayer(p):AIConstructionOrder(95, 69, BLD_FORTRESS)	
            rttr:GetPlayer(p):AIConstructionOrder(95, 64, BLD_IRONSMELTER)	
            rttr:GetPlayer(p):AIConstructionOrder(94, 66, BLD_METALWORKS)	
            rttr:GetPlayer(p):AIConstructionOrder(96, 66, BLD_ARMORY)	
            rttr:GetPlayer(p):AIConstructionOrder(93, 64, BLD_MINT)				
        end		
		
        if(p == 2) then
            if onLoad then return end
            rttr:GetPlayer(p):AIConstructionOrder(94, 40, BLD_FORTRESS)	
            rttr:GetPlayer(p):AIConstructionOrder(89, 40, BLD_FORTRESS)	
            rttr:GetPlayer(p):AIConstructionOrder(86, 35, BLD_FORTRESS)	
        end		

        if(p == 3) then
            if onLoad then return end		
            rttr:GetPlayer(p):AIConstructionOrder(30, 36, BLD_METALWORKS)	
            rttr:GetPlayer(p):AIConstructionOrder(32, 36, BLD_MINT)	
            rttr:GetPlayer(p):AIConstructionOrder(34, 36, BLD_MILL)	
            rttr:GetPlayer(p):AIConstructionOrder(27, 38, BLD_BREWERY)	
            rttr:GetPlayer(p):AIConstructionOrder(30, 40, BLD_HUNTER)				
            rttr:GetPlayer(p):AIConstructionOrder(26, 40, BLD_ARMORY)	
            rttr:GetPlayer(p):AIConstructionOrder(28, 44, BLD_PIGFARM)	
            rttr:GetPlayer(p):AIConstructionOrder(25, 42, BLD_IRONSMELTER)	
            rttr:GetPlayer(p):AIConstructionOrder(34, 40, BLD_WATCHTOWER)	
            rttr:GetPlayer(p):AIConstructionOrder(35, 38, BLD_BAKERY)	
            rttr:GetPlayer(p):AIConstructionOrder(22, 40, BLD_FARM)	
            rttr:GetPlayer(p):AIConstructionOrder(24, 36, BLD_WELL)	
            rttr:GetPlayer(p):AIConstructionOrder(26, 44, BLD_SLAUGHTERHOUSE)	
            rttr:GetPlayer(p):AIConstructionOrder(30, 44, BLD_WATCHTOWER)	
            rttr:GetPlayer(p):AIConstructionOrder(28, 33, BLD_FORESTER)	
            rttr:GetPlayer(p):AIConstructionOrder(27, 34, BLD_WOODCUTER)	
            rttr:GetPlayer(p):AIConstructionOrder(25, 33, BLD_WOODCUTER)	
            rttr:GetPlayer(p):AIConstructionOrder(21, 36, BLD_FARM)	
            rttr:GetPlayer(p):AIConstructionOrder(32, 44, BLD_FISHERY)
            rttr:GetPlayer(p):AIConstructionOrder(33, 42, BLD_FISHERY)				
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
			[GD_WOOD        ] =  10,
            [GD_BOARDS      ] =  40,
            [GD_STONES      ] =  40,
            [GD_HAM         ] =  5,
            [GD_GRAIN       ] =  11,		
            [GD_FLOUR       ] =  7,			
            [GD_FISH        ] =  11,			
            [GD_MEAT        ] =  10,			
            [GD_BREAD       ] =  9,		
            [GD_WATER       ] =  0,
            [GD_BEER        ] =  0,
            [GD_COAL        ] =  0,
            [GD_IRONORE     ] =  30,
            [GD_GOLD        ] =  0,
            [GD_IRON        ] =  20,		
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
            [JOB_HELPER             ] =  20,
            [JOB_WOODCUTTER         ] =   2,
            [JOB_FISHER             ] =   1,
            [JOB_FORESTER           ] =   1,
            [JOB_CARPENTER          ] =   1,
            [JOB_STONEMASON         ] =   0,
            [JOB_HUNTER             ] =   0,
            [JOB_FARMER             ] =   0,
            [JOB_MILLER             ] =   0,
            [JOB_BAKER              ] =   0,
            [JOB_BUTCHER            ] =   0,
            [JOB_MINER              ] =   0,
            [JOB_BREWER             ] =   0,
            [JOB_PIGBREEDER         ] =   0,
            [JOB_DONKEYBREEDER      ] =   0,
            [JOB_IRONFOUNDER        ] =   0,
            [JOB_MINTER             ] =   0,
            [JOB_METALWORKER        ] =   1,
            [JOB_ARMORER            ] =   0,
            [JOB_BUILDER            ] =   10,
            [JOB_PLANER             ] =   5,
            [JOB_GEOLOGIST          ] =   10,
            [JOB_PRIVATE            ] =   40,
            [JOB_PRIVATEFIRSTCLASS  ] =   0,
            [JOB_SERGEANT           ] =   0,
            [JOB_OFFICER            ] =   0,
            [JOB_GENERAL            ] =   0,
            [JOB_SCOUT              ] =   3,
            [JOB_SHIPWRIGHT         ] =   1,
            [JOB_PACKDONKEY         ] =   10,
            [JOB_CHARBURNER         ] =   0
        })

    elseif(p == 1) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  40,
            [GD_BOARDS      ] =  200,
            [GD_STONES      ] =  50,
            [GD_HAM         ] =  0,
            [GD_GRAIN       ] =  0,		
            [GD_FLOUR       ] =  0,			
            [GD_FISH        ] =  30,			
            [GD_MEAT        ] =  30,			
            [GD_BREAD       ] =  30,		
            [GD_WATER       ] =  10,
            [GD_BEER        ] =  5,
            [GD_COAL        ] =  250,
            [GD_IRONORE     ] =  125,
            [GD_GOLD        ] =  0,
            [GD_IRON        ] =  125,		
            [GD_COINS       ] =  0,		
            [GD_TONGS       ] =  0,	
            [GD_AXE         ] =  3,
            [GD_SAW         ] =  5,
            [GD_PICKAXE     ] =  3,
            [GD_HAMMER      ] =  5,
            [GD_SHOVEL      ] =  5,
            [GD_CRUCIBLE    ] =  5,
            [GD_RODANDLINE  ] =  5,
            [GD_SCYTHE      ] =  5,
	        [GD_CLEAVER     ] =  5,
            [GD_ROLLINGPIN  ] =  5,			
            [GD_BOW         ] =  5,
            [GD_SWORD       ] =  5,
            [GD_SHIELD      ] =  5,
            [GD_BOAT        ] =  5
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  100,
            [JOB_WOODCUTTER         ] =   5,
            [JOB_FISHER             ] =   5,
            [JOB_FORESTER           ] =   5,
            [JOB_CARPENTER          ] =   5,
            [JOB_STONEMASON         ] =   5,
            [JOB_HUNTER             ] =   5,
            [JOB_FARMER             ] =   3,
            [JOB_MILLER             ] =   3,
            [JOB_BAKER              ] =   3,
            [JOB_BUTCHER            ] =   3,
            [JOB_MINER              ] =   5,
            [JOB_BREWER             ] =   3,
            [JOB_PIGBREEDER         ] =   3,
            [JOB_DONKEYBREEDER      ] =   3,
            [JOB_IRONFOUNDER        ] =   1,
            [JOB_MINTER             ] =   2,
            [JOB_METALWORKER        ] =   2,
            [JOB_ARMORER            ] =   1,
            [JOB_BUILDER            ] =   10,
            [JOB_PLANER             ] =   5,
            [JOB_GEOLOGIST          ] =   5,
            [JOB_PRIVATE            ] =   0,
            [JOB_PRIVATEFIRSTCLASS  ] =   0,
            [JOB_SERGEANT           ] =   0,
            [JOB_OFFICER            ] =   0,
            [JOB_GENERAL            ] =   10,
            [JOB_SCOUT              ] =   5,
            [JOB_SHIPWRIGHT         ] =   0,
            [JOB_PACKDONKEY         ] =   45,
            [JOB_CHARBURNER         ] =   0
        })
		
    elseif(p == 2) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  10,
            [GD_BOARDS      ] =  40,
            [GD_STONES      ] =  40,
            [GD_HAM         ] =  0,
            [GD_GRAIN       ] =  0,		
            [GD_FLOUR       ] =  0,			
            [GD_FISH        ] =  30,			
            [GD_MEAT        ] =  30,			
            [GD_BREAD       ] =  10,		
            [GD_WATER       ] =  5,
            [GD_BEER        ] =  0,
            [GD_COAL        ] =  0,
            [GD_IRONORE     ] =  0,
            [GD_GOLD        ] =  0,
            [GD_IRON        ] =  0,		
            [GD_COINS       ] =  0,		
            [GD_TONGS       ] =  3,	
            [GD_AXE         ] =  5,
            [GD_SAW         ] =  3,
            [GD_PICKAXE     ] =  5,
            [GD_HAMMER      ] =  5,
            [GD_SHOVEL      ] =  5,
            [GD_CRUCIBLE    ] =  5,
            [GD_RODANDLINE  ] =  5,
            [GD_SCYTHE      ] =  5,
	        [GD_CLEAVER     ] =  5,
            [GD_ROLLINGPIN  ] =  5,			
            [GD_BOW         ] =  5,
            [GD_SWORD       ] =  10,
            [GD_SHIELD      ] =  10,
            [GD_BOAT        ] =  5
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  100,
            [JOB_WOODCUTTER         ] =   5,
            [JOB_FISHER             ] =   5,
            [JOB_FORESTER           ] =   5,
            [JOB_CARPENTER          ] =   5,
            [JOB_STONEMASON         ] =   5,
            [JOB_HUNTER             ] =   5,
            [JOB_FARMER             ] =   3,
            [JOB_MILLER             ] =   3,
            [JOB_BAKER              ] =   3,
            [JOB_BUTCHER            ] =   3,
            [JOB_MINER              ] =   5,
            [JOB_BREWER             ] =   1,
            [JOB_PIGBREEDER         ] =   3,
            [JOB_DONKEYBREEDER      ] =   2,
            [JOB_IRONFOUNDER        ] =   2,
            [JOB_MINTER             ] =   2,
            [JOB_METALWORKER        ] =   1,
            [JOB_ARMORER            ] =   2,
            [JOB_BUILDER            ] =   10,
            [JOB_PLANER             ] =   10,
            [JOB_GEOLOGIST          ] =   10,
            [JOB_PRIVATE            ] =   40,
            [JOB_PRIVATEFIRSTCLASS  ] =   0,
            [JOB_SERGEANT           ] =   0,
            [JOB_OFFICER            ] =   0,
            [JOB_GENERAL            ] =   10,
            [JOB_SCOUT              ] =   5,
            [JOB_SHIPWRIGHT         ] =   0,
            [JOB_PACKDONKEY         ] =   45,
            [JOB_CHARBURNER         ] =   0
        })

    elseif(p == 3) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  50,
            [GD_BOARDS      ] =  100,
            [GD_STONES      ] =  50,
            [GD_HAM         ] =  0,
            [GD_GRAIN       ] =  0,		
            [GD_FLOUR       ] =  0,			
            [GD_FISH        ] =  30,			
            [GD_MEAT        ] =  30,			
            [GD_BREAD       ] =  30,		
            [GD_WATER       ] =  250,
            [GD_BEER        ] =  0,
            [GD_COAL        ] =  0,
            [GD_IRONORE     ] =  0,
            [GD_GOLD        ] =  0,
            [GD_IRON        ] =  0,		
            [GD_COINS       ] =  0,		
            [GD_TONGS       ] =  0,	
            [GD_AXE         ] =  0,
            [GD_SAW         ] =  5,
            [GD_PICKAXE     ] =  3,
            [GD_HAMMER      ] =  5,
            [GD_SHOVEL      ] =  5,
            [GD_CRUCIBLE    ] =  5,
            [GD_RODANDLINE  ] =  5,
            [GD_SCYTHE      ] =  5,
	        [GD_CLEAVER     ] =  5,
            [GD_ROLLINGPIN  ] =  5,			
            [GD_BOW         ] =  5,
            [GD_SWORD       ] =  5,
            [GD_SHIELD      ] =  10,
            [GD_BOAT        ] =  10
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  100,
            [JOB_WOODCUTTER         ] =   5,
            [JOB_FISHER             ] =   5,
            [JOB_FORESTER           ] =   5,
            [JOB_CARPENTER          ] =   5,
            [JOB_STONEMASON         ] =   5,
            [JOB_HUNTER             ] =   5,
            [JOB_FARMER             ] =   5,
            [JOB_MILLER             ] =   3,
            [JOB_BAKER              ] =   3,
            [JOB_BUTCHER            ] =   3,
            [JOB_MINER              ] =   5,
            [JOB_BREWER             ] =   3,
            [JOB_PIGBREEDER         ] =   3,
            [JOB_DONKEYBREEDER      ] =   1,
            [JOB_IRONFOUNDER        ] =   2,
            [JOB_MINTER             ] =   2,
            [JOB_METALWORKER        ] =   1,
            [JOB_ARMORER            ] =   2,
            [JOB_BUILDER            ] =   10,
            [JOB_PLANER             ] =   5,
            [JOB_GEOLOGIST          ] =   5,
            [JOB_PRIVATE            ] =   40,
            [JOB_PRIVATEFIRSTCLASS  ] =   0,
            [JOB_SERGEANT           ] =   0,
            [JOB_OFFICER            ] =   1,
            [JOB_GENERAL            ] =   0,
            [JOB_SCOUT              ] =   5,
            [JOB_SHIPWRIGHT         ] =   0,
            [JOB_PACKDONKEY         ] =   45,
            [JOB_CHARBURNER         ] =   0
        })

    elseif(p == 4) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  10,
            [GD_BOARDS      ] =  40,
            [GD_STONES      ] =  40,
            [GD_HAM         ] =  0,
            [GD_GRAIN       ] =  0,		
            [GD_FLOUR       ] =  0,			
            [GD_FISH        ] =  30,			
            [GD_MEAT        ] =  30,			
            [GD_BREAD       ] =  10,		
            [GD_WATER       ] =  5,
            [GD_BEER        ] =  0,
            [GD_COAL        ] =  0,
            [GD_IRONORE     ] =  0,
            [GD_GOLD        ] =  0,
            [GD_IRON        ] =  0,		
            [GD_COINS       ] =  0,		
            [GD_TONGS       ] =  3,	
            [GD_AXE         ] =  5,
            [GD_SAW         ] =  3,
            [GD_PICKAXE     ] =  5,
            [GD_HAMMER      ] =  5,
            [GD_SHOVEL      ] =  5,
            [GD_CRUCIBLE    ] =  5,
            [GD_RODANDLINE  ] =  5,
            [GD_SCYTHE      ] =  5,
	        [GD_CLEAVER     ] =  5,
            [GD_ROLLINGPIN  ] =  5,			
            [GD_BOW         ] =  5,
            [GD_SWORD       ] =  10,
            [GD_SHIELD      ] =  10,
            [GD_BOAT        ] =  5
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  100,
            [JOB_WOODCUTTER         ] =   5,
            [JOB_FISHER             ] =   5,
            [JOB_FORESTER           ] =   5,
            [JOB_CARPENTER          ] =   5,
            [JOB_STONEMASON         ] =   5,
            [JOB_HUNTER             ] =   5,
            [JOB_FARMER             ] =   3,
            [JOB_MILLER             ] =   3,
            [JOB_BAKER              ] =   3,
            [JOB_BUTCHER            ] =   3,
            [JOB_MINER              ] =   5,
            [JOB_BREWER             ] =   1,
            [JOB_PIGBREEDER         ] =   3,
            [JOB_DONKEYBREEDER      ] =   2,
            [JOB_IRONFOUNDER        ] =   2,
            [JOB_MINTER             ] =   2,
            [JOB_METALWORKER        ] =   1,
            [JOB_ARMORER            ] =   2,
            [JOB_BUILDER            ] =   10,
            [JOB_PLANER             ] =   10,
            [JOB_GEOLOGIST          ] =   10,
            [JOB_PRIVATE            ] =   40,
            [JOB_PRIVATEFIRSTCLASS  ] =   0,
            [JOB_SERGEANT           ] =   0,
            [JOB_OFFICER            ] =   0,
            [JOB_GENERAL            ] =   10,
            [JOB_SCOUT              ] =   5,
            [JOB_SHIPWRIGHT         ] =   0,
            [JOB_PACKDONKEY         ] =   45,
            [JOB_CHARBURNER         ] =   0
        })
    end
end


-------------------------------- mission events -------------------------------

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
    if(     	((p == 0) and (o == 1)) or ((p == 1) and (o == 0)) ) then MissionEvent(6)
    elseif(     ((p == 0) and (o == 2)) or ((p == 2) and (o == 0)) ) then MissionEvent(7)	
    elseif(     ((p == 0) and (o == 3)) or ((p == 3) and (o == 0)) ) then MissionEvent(8)
    elseif(     ((p == 0) and (o == 4)) or ((p == 4) and (o == 0)) ) then MissionEvent(9)
    end	
	
    -- onExplored events only check human player, You could erase following and then when enemy reach xy message will also be shown
    if(p ~= 0) then
        return
    end
	
    if(     (x == 95) and (y == 34) ) then MissionEvent(10)
    elseif( (x == 68) and (y == 55) ) then MissionEvent(11)
    elseif( (x == 60) and (y == 40) ) then MissionEvent(12)
    elseif( (x == 30) and (y == 57) ) then MissionEvent(13)	
    elseif( (x == 32) and (y == 81) ) then MissionEvent(14)	
    elseif( (x == 37) and (y == 30) ) then MissionEvent(15)	
    elseif( (x == 56) and (y == 88) ) then MissionEvent(19)		
	end
end

function onOccupied(p, x, y)
    -- only check human player
    if(p ~= 0) then
        return
    end

    if(     (x == 43) and (y == 47) ) then MissionEvent(16)	
    elseif( (x == 50) and (y == 22) ) then MissionEvent(17)	
    elseif( (x == 32) and (y == 44) ) then MissionEvent(18)
	elseif( (x == 95) and (y == 34) ) then MissionEvent(99)	
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
	
	if(e == 98) then
        rttr:GetPlayer(1):SetRestrictedArea()	

    elseif(e == 99) then
        -- TODO: EnableNextMissions()
        -- Show opened arc
        rttr:GetWorld():AddStaticObject(95, 34, 561, 0xFFFF, 2)
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
