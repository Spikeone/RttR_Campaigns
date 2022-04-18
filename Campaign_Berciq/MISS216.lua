------------------------------------------------------------------------------
-- LUA-Script for MISS216.WLD (mission 7 of the Berciq "Roman Campaign II"  --
--                                                                          --
-- Author: (basing on CrazyL (v0.4)) by Berciq                              --
------------------------------------------------------------------------------

-------------------------------- TODO -----------------------------------------
-- consider fixing always opened gateways
-- Set Portraits
-- EnableNextMissions()
-- Set AI Agression Level -> enemy should attach first
-------------------------------------------------------------------------------

-------------------------------- Lua Version used -----------------------------
function getRequiredLuaVersion()
    return 1.0
end

-------------------------------- mission events and texts ---------------------
-- Message-Window (mission statement and hints): 52 chars wide
eIdx = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 98, 99}

rttr:RegisterTranslations(
{
    en = -- story by Berciq --
    {
        Diary   = 'Diary',

        msg1    = 'Unbearable moist coming from swamps nearby, insects everywhere. Each day looks the same, after midday comes rainfall and temperatures slightly changes. Rain also helps reducing time required to put down fire.  \n\nBuilding ship is pointless, sea currents, wind and reef barrier won\'t allow us to leave. \n\nHuge problem is lack of any stone around. We haven\'t faced such a problem yet. \n\nIt is hard to say if the bay has salt or fresh water, I would say it is little salty.. I think that huge river must inflow to ocean nearby.',
        msgh1   = 'Let\'s wade this thick rain forest and see what to do next.',

        msg2    = 'We\'ve found lignite, it is poor version of coal, we can see some fossils inside. Anyway it will help us to smelt ore.',

        msg3    = 'Much richer source of iron than mud proposed by geologists. I\'m really glad, mining it from turf would take ages..',

        msg4    = 'Lack of granite is terrible, we cannot build anything bigger than hut! Fortunately, we\'ve found some that can be mined here.',

        msg5    = 'In some river sandbanks we can find gold, small amounts but always something.',

		msg6	= 'There is native tribe to the West! They are surprised, let’s take advantage and attack! There are managing to farm in this wet soil, we have to learn from them or at least capture their farmers.',
		
		msg7    = 'There is kingdom located in the mountains, by the river. We must be careful, they have few skilled warriors.',

		msg8	= 'Best warriors lives in this village, they have so much gold! What is more, they occupy gateway, it is really important for them but they have no idea how to open it. Fighting with them will be really tough, lets train as many soldiers as we can!',
		
		msg9	= 'More swamps to the west.. \n\nIv only there vas a vay to chop vaster', --intentional mistake to use V and speed up time
		
		msg10	= 'Hard to say whether it is river or is it a lake.',

		msg11	= 'River delta, it is huge! Sometimes river flows backwards, I guess it is caused by high tides.',

		msg12	= 'Few rocks on this plain swamps, better than nothing.',	

		msg13	= 'Marsh.. what a surprise... I\'m howevere concerned, after clearing forest there are places where trees are unable to grow back.. specially close to swamps, but there is no other way, dangerous species hide in tree crown and we must get rid of them somehow.',
		
		msg14	= 'Mountain range! I hope granite can be found here!',

		msg15	= 'The holy mountain of native tribe is visible. ',

		msg16	= 'We are used to high precipitation in mountains but here mountain peaks are blocking all humidity, not a surprise to find desert here...',

		msg17	= 'This glyph, it has strange shape.. looks like message to gods',

		msg18	= 'Earth started shaking and we heard loud rumble, looks like massive landslide buried animals here.',

		msg19	= 'People we\'ve captured started to get sick, I think it is gods punishment for challenging us! Our people are feeling fine!',
		
		msg20	= 'Mosquitoes are terrible, what is worse our people also started to get sick. But this disease looks different than natives..',
		
		msg21	= 'All that glitter is gold!',
		
		msg22	= 'I\'m really surprised, didn\'t expect to learn anything from this tribes, and for sure so advanced way to produce coal, well charcoal to be precise. They create huge pile, starting with straw, logs and then earth on top of it. Lit it will turn wood into charcoal which could be used as substitute of coal.. amazing, for all this time we had all ingredients and had no idea..',
        msgh22  = 'New building type has been unlocked, it requires some space but still worth it. Charburner will require shovel to work properly',
		
		msg99   = 'Gateway... It brought us back to our headquarter, thank gods they couldn\'t open it... but this must be a mistake! It leads to nowhere!',
        msgh99  = 'Wind has changed direction, there is chance for us to leave this place, we must build a ship... all this battles, gold fever... it was unnecessary, we could just stay here for this months and wait for good condition to escape.. \n\nThe Chapter XVIII awaits you...',
},
    pl = -- translated by: Berciq --
    {
        Diary   = 'Dziennik',

        msg1    = 'Niemiłosierna duchota, robactwo w każdym zakamarku. Każdy dzień wygląda tu podobnie, temperatury prawie się nie zmieniają a niedługo po południu zaczynają się ulewy, które pomagają dogaszać płomienie. \n\nBudowa statku jest skazana na porażkę. Prądy morskie, wiatr i bariera z rafy koralowej uniemożliwiają opuszczenie tego miejsca. \n\nProblem jest też pozyskanie kamienia, nie spotkaliśmy się z takim problemem wcześniej. \n\nNie jestem nawet w stanie powiedzieć czy woda w morzu jest słodka czy słona. Powiedziałbym, że jest słonawa a to musi oznaczać olbrzymią rzekę która wpadającą nieopodal. ',
        msgh1   = 'Przeprawmy się przez serce gęstej puszczy i zobaczmy co dalej',

        msg2    = 'Znaleźliśmy warstwę brunatnego węgla, wyraźnie widać w nim odbite liście i łodygi. Mimo marnej jakości nada się do przetopu rudy.',

        msg3    = 'O wiele bogatsze złoża żelaza niż proponowane przez geologów pozyskiwanie go z rudy darniowej i torfu',

        msg4    = 'Brak budulca doskwiera nam straszliwie, nie możemy wybudować nic trwalszego od chaty. Na szczęście możemy tu wydobywać kamień.',

        msg5    = 'Nad brzegami potoków można odnaleźć płatki złota.. niewielkie ilości ale zawsze się przydadzą.',

		msg6	= 'Tubylcy mieszkają na zachód stąd! Są zaskoczeni naszą obecnością, musimy zaatakować pierwsi. Doskonale radzą sobie z orką w tej przewilgoconej glebie.. powinniśmy się od nich uczyć albo przynajmniej postarać się schwytać farmerów',

		msg7    = 'Nad rzeką posród gór znajduje się niewielkie królestwo. Uważajmy na nich, mają kilku dobrze wyszkolonych żołnieży!',

		msg8	= 'Najlepsi wojownicy żyją wysoko w górach, wprost ociekają złotem. Co więcej, mają dostęp do portalu, który stanowi ważny element ich kultury.. mimo wszystko nie wiedzą jak go uruchomić. Walka będzie trudna tym bardziej, że oddzielają nas od nich wysokie góry!',
		
		msg9	= 'Więcej bagien.. \n\nŻebv tvlko istniał jakiś sposób abv czas płvnął szvbciej', --specjalnie podmienione y z v żeby zasugerować użycie przyspieszenia
		
		msg10	= 'Trudno określić czy to jeszcze rzeka czy już jezioro.',

		msg11	= 'Ujście rzeki jest ogromne, czasem pływy sprawiają że woda płynie w przeciwnym kierunku.',

		msg12	= 'Trochę kamieni na tym płaskim bagnie.. Liczyłem na więcej.',	

		msg13	= 'Bagna, cóż za niespodzianka... Ale pewna myśl nie daje mi spokoju... po wycięciu drzew w niektórych miejscach, nie sposób posadzić ich na nowo... po prostu nie chcą urosnąć, zwłaszcza te w pobliżu bagien. W każdym razie nie mamy wyjścia, w koronach żyje mnóstwo niebezpiecznych dla nas zwierząt', 
		
		msg14	= 'Pasmo górskie! Mam nadzieję, że skały nadają się do obróbki i budowy',

		msg15	= 'Święta góra tubylców jest widoczna ponad koronami drzew',

		msg16	= 'Przywykliśmy że w górach występują obfite opady, ale te góry są tak wysokie że chmury porzucają całą wilgoć zanim tu dolecą. Nic dziwnego że mamy tu pustynię', 
	
		msg17	= 'Zastanawiający kształt... wiadomość od bogów? czy może raczej do bogów?',

		msg18	= 'Ziemia się zatrzęsła i zeszło ogromne osuwisko grzebiąc zwierzęta które tu mieszkały, musimy być ostrożni.',

		msg19	= 'Jeńcy których przechwyciliśmy zaczeli chorować. Musiał na nich spłynąć gniew bogów, bo mu czujemy się znakomicie!',
		
		msg20	= 'Komary kłują niemiłosiernie, co gorsza, nasi ludzie również zaczęli chorować.. ale ta choroba wygląda zupełnie inaczej niż ta na którą cierpią tubylcy..',
		
		msg21	= 'Nie wszystko złoto co się świeci!',
		
		msg22	= 'Cóż za niespodzianka, nie spodziewałem się nauczyć czegokolwiek od tych zacofanych plemion, a już na pewno nie sposobu na wytwarzanie węgla.. węgla drzewnego jeśli mamy być ściśli. Budują wysoki kopiec, poczynając od słomy na którą kładą drewniane bale a następnie przysypują ziemią. Podpalone w kilka dni zamieni drewno w węgiel drzewny! zadziwiające, przez ten cały czas mieliśmy wszystkie potrzebne składniki i na to nie wpadliśmy...',
        msgh22  = 'Możesz teraz wybudować chatę węglarza, wymaga sporo miejsca, oraz miejsce na mielerz. Węglarzowi wystarczy łopata żeby mógł zacząć pracę!',
		
		msg99   = 'Portal prowadzi spowrotem do naszego obozu! Mieliśmy szczęście że nie potrafili go użyć!',
        msgh99  = 'Wiatr zmienił kierunek, mamy szansę uciec, wybudujemy okręt i ruszymy dalej... Te wszystkie bitwy, walka, gorączka złota... to wszystko było niepotrzebne... wystarczyło poczekać kilka miesięcy i moglibyśmy ruszać dalej... Przynajmniej nauczyliśmy się czegoś... \n\nRodział XVIII czeka...',
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
    rttr:Log("-----------------------\n MISS216.lua loaded... \n-----------------------\n")
    rttr:ResetAddons()                          -- S2-settings
    rttr:SetAddon(ADDON_MILITARY_HITPOINTS, true)	
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetAddon(ADDON_CATAPULT_GRAPHICS, true)
	rttr:SetAddon(ADDON_MILITARY_AID, true)		
	rttr:SetAddon(ADDON_REFUND_MATERIALS, 2, true)		
    rttr:SetAddon(ADDON_TOOL_ORDERING, true)	
    rttr:SetAddon(ADDON_METALWORKSBEHAVIORONZERO, true)	
	rttr:SetAddon(ADDON_DEMOLITION_PROHIBITION, true)
    rttr:SetAddon(ADDON_MILITARY_CONTROL, true)	
    rttr:SetAddon(ADDON_MORE_ANIMALS, true)
    rttr:SetAddon(ADDON_CHARBURNER, true)	
    rttr:SetAddon(ADDON_BURN_DURATION, 3, true)	
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
    rttr:GetPlayer(1):SetNation(NAT_AFRICANS)   -- nation
    rttr:GetPlayer(1):SetColor(1)               -- yellow
    rttr:GetPlayer(1):SetName('Yaxjal')         -- Enemy Name	
	
    rttr:GetPlayer(2):SetAI(3)                  -- hard AI
    rttr:GetPlayer(2):SetNation(NAT_AFRICANS)   -- nation
    rttr:GetPlayer(2):SetColor(1)               -- red
    rttr:GetPlayer(2):SetName('Cusco')          -- Enemy Name	

    rttr:GetPlayer(3):SetAI(3)                  -- easy AI
    rttr:GetPlayer(3):SetNation(NAT_AFRICANS)   -- nation
    rttr:GetPlayer(3):SetColor(1)               -- purple
    rttr:GetPlayer(3):SetName('Pahacutec')      -- Enemy Name	
	
    rttr:GetPlayer(1):SetTeam(TM_TEAM1)
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
        -- type 8 == 7 in rttr					-- SPEC_RABBITWHITE 	SPEC_RABBITGREY  	SPEC_POLARBEAR	SPEC_STAG 	SPEC_DEER 	SPEC_SHEEP 	SPEC_DUCK 	SPEC_FOX 
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

function enforceBuildingCount(player, building, limit, notify)
    local sumBuildings = rttr:GetPlayer(player):GetNumBuildings(building) + rttr:GetPlayer(player):GetNumBuildingSites(building)

    if (sumBuildings >= limit) then
        rttr:GetPlayer(player):DisableBuilding(building)
    else
        rttr:GetPlayer(player):EnableBuilding(building, notify)
    end
end
	 
function onGameFrame(gf)
	enforceBuildingCount(1, BLD_FORESTER, 1, false)	
	enforceBuildingCount(1, BLD_SAWMILL, 2, false)
	enforceBuildingCount(1, BLD_METALWORKS, 1, false)
	
	enforceBuildingCount(2, BLD_FORESTER, 1, false)		
	enforceBuildingCount(2, BLD_SAWMILL, 2, false)
	enforceBuildingCount(2, BLD_METALWORKS, 1, false)
	
	enforceBuildingCount(3, BLD_FORESTER, 1, false)		
	enforceBuildingCount(3, BLD_SAWMILL, 2, false)
	enforceBuildingCount(3, BLD_METALWORKS, 1, false)
end

-------------------------------- set buildings --------------------------------
function addPlayerBld(p, onLoad)
    -- set buildings for all players
    rttr:GetPlayer(p):EnableAllBuildings()
	
    if(p == 0) then
        rttr:GetPlayer(p):DisableBuilding(BLD_CATAPULT, false)
	end		
	
    if(p == 1) then
        rttr:GetPlayer(p):DisableBuilding(BLD_GOLDMINE, false)
        rttr:GetPlayer(p):DisableBuilding(BLD_IRONMINE, false)
        rttr:GetPlayer(p):DisableBuilding(BLD_GRANITEMINE, false)
        rttr:GetPlayer(p):DisableBuilding(BLD_FORTRESS, false)
        rttr:GetPlayer(p):DisableBuilding(BLD_BARRACKS, false)		
        rttr:GetPlayer(p):DisableBuilding(BLD_WATCHTOWER, false)		
        rttr:GetPlayer(p):DisableBuilding(BLD_METALWORKS, false)		
        rttr:GetPlayer(p):DisableBuilding(BLD_ARMORY, false)				
	end	
	
    if(p == 2) then
        rttr:GetPlayer(p):DisableBuilding(BLD_GOLDMINE, false)
        rttr:GetPlayer(p):DisableBuilding(BLD_IRONMINE, false)
        rttr:GetPlayer(p):DisableBuilding(BLD_GRANITEMINE, false)	
        rttr:GetPlayer(p):DisableBuilding(BLD_FORTRESS, false)		
	elseif(p == 2) then
        rttr:GetPlayer(p):SetRestrictedArea(
            nil, nil,       -- enable the whole map
                0,   0,
                0,   127,
                95,  127,
                95,  0,
            nil, nil,       -- R=6, 	X=84, 	Y=32
                78,  32,	-- West	 	X-R		Y
                90,  32,	-- Eeast	X+R 	Y
                81,  38,	-- NW		X-1/2R	Y+R
                87,  38,	-- NE		X+1/2R	Y+R
                81,  24,	-- SW		X-1/2R	Y-R
                87,  24,	-- SE		X+1/2R	Y-R
				78,  32,	-- Close
            nil, nil
        )		
	end	
	
	-- Building orders	
		
        if(p == 1) then
            if onLoad then return end
            rttr:GetPlayer(p):AIConstructionOrder(104, 63, BLD_CHARBURNER)			
            rttr:GetPlayer(p):AIConstructionOrder(111, 56, BLD_FARM)		
            rttr:GetPlayer(p):AIConstructionOrder(113, 60, BLD_FARM)		
            rttr:GetPlayer(p):AIConstructionOrder(111, 65, BLD_FARM)		
            rttr:GetPlayer(p):AIConstructionOrder(106, 55, BLD_FARM)	
            rttr:GetPlayer(p):AIConstructionOrder(109, 52, BLD_FORTRESS)	
            rttr:GetPlayer(p):AIConstructionOrder(104, 58, BLD_WATCHTOWER)	
            rttr:GetPlayer(p):AIConstructionOrder(107, 60, BLD_SAWMILL)	
            rttr:GetPlayer(p):AIConstructionOrder(107, 62, BLD_SLAUGHTERHOUSE)	
            rttr:GetPlayer(p):AIConstructionOrder(105, 60, BLD_WELL)				
            rttr:GetPlayer(p):AIConstructionOrder(109, 62, BLD_BAKERY)		
            rttr:GetPlayer(p):AIConstructionOrder(108, 64, BLD_MILL)	
            rttr:GetPlayer(p):AIConstructionOrder(108, 66, BLD_WELL)				
        end		
		
        if(p == 2) then
            if onLoad then return end
            rttr:GetPlayer(p):AIConstructionOrder(97, 18, BLD_WATCHTOWER)	
            rttr:GetPlayer(p):AIConstructionOrder(89, 19, BLD_SAWMILL)	
            rttr:GetPlayer(p):AIConstructionOrder(94, 17, BLD_FARM)	
            rttr:GetPlayer(p):AIConstructionOrder(92, 21, BLD_MINT)	
            rttr:GetPlayer(p):AIConstructionOrder(88, 24, BLD_WELL)	
            rttr:GetPlayer(p):AIConstructionOrder(85, 17, BLD_FARM)	
            rttr:GetPlayer(p):AIConstructionOrder(85, 19, BLD_MILL)	
            rttr:GetPlayer(p):AIConstructionOrder(85, 21, BLD_BAKERY)	
            rttr:GetPlayer(p):AIConstructionOrder(84, 18, BLD_QUARRY)	
            rttr:GetPlayer(p):AIConstructionOrder(86, 23, BLD_WOODCUTTER)	
            rttr:GetPlayer(p):AIConstructionOrder(94, 21, BLD_WOODCUTTER)	
            rttr:GetPlayer(p):AIConstructionOrder(93, 19, BLD_QUARRY)	
            rttr:GetPlayer(p):AIConstructionOrder(95, 19, BLD_QUARRY)				
        end		

        if(p == 3) then
            if onLoad then return end
            rttr:GetPlayer(p):AIConstructionOrder(16, 19, BLD_BREWERY)	
            rttr:GetPlayer(p):AIConstructionOrder(17, 21, BLD_MINT)	
            rttr:GetPlayer(p):AIConstructionOrder(19, 22, BLD_BAKERY)	
            rttr:GetPlayer(p):AIConstructionOrder(18, 24, BLD_MILL)	
            rttr:GetPlayer(p):AIConstructionOrder(14, 25, BLD_IRONSMELTER)	
            rttr:GetPlayer(p):AIConstructionOrder(13, 22, BLD_PIGFARM)	
            rttr:GetPlayer(p):AIConstructionOrder(14, 23, BLD_SLAUGHTERHOUSE)	
            rttr:GetPlayer(p):AIConstructionOrder(19, 27, BLD_WELL)		
            rttr:GetPlayer(p):AIConstructionOrder(18, 28, BLD_WOODCUTTER)	
            rttr:GetPlayer(p):AIConstructionOrder(18, 26, BLD_WATCHTOWER)	
            rttr:GetPlayer(p):AIConstructionOrder(16, 25, BLD_SAWMILL)				
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
			[GD_WOOD        ] =  0,
            [GD_BOARDS      ] =  20,
            [GD_STONES      ] =  20,
            [GD_HAM         ] =  0,
            [GD_GRAIN       ] =  0,		
            [GD_FLOUR       ] =  0,			
            [GD_FISH        ] =  10,			
            [GD_MEAT        ] =  10,			
            [GD_BREAD       ] =  10,		
            [GD_WATER       ] =  0,
            [GD_BEER        ] =  0,
            [GD_COAL        ] =  0,
            [GD_IRONORE     ] =  0,
            [GD_GOLD        ] =  0,
            [GD_IRON        ] =  10,		
            [GD_COINS       ] =  0,		
            [GD_TONGS       ] =  1,	
            [GD_AXE         ] =  10,
            [GD_SAW         ] =  4,
            [GD_PICKAXE     ] =  10,
            [GD_HAMMER      ] =  30,
            [GD_SHOVEL      ] =  10,
            [GD_CRUCIBLE    ] =  2,
            [GD_RODANDLINE  ] =  4,
            [GD_SCYTHE      ] =  16,
	        [GD_CLEAVER     ] =  2,
            [GD_ROLLINGPIN  ] =  2,			
            [GD_BOW         ] =  10,
            [GD_SWORD       ] =  20,
            [GD_SHIELD      ] =  20,
            [GD_BOAT        ] =  4
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  70,
            [JOB_WOODCUTTER         ] =   0,
            [JOB_FISHER             ] =   0,
            [JOB_FORESTER           ] =   0,
            [JOB_CARPENTER          ] =   0,
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
            [JOB_METALWORKER        ] =   0,
            [JOB_ARMORER            ] =   0,
            [JOB_BUILDER            ] =   0,
            [JOB_PLANER             ] =   0,
            [JOB_GEOLOGIST          ] =   20,
            [JOB_PRIVATE            ] =   20,
            [JOB_PRIVATEFIRSTCLASS  ] =   0,
            [JOB_SERGEANT           ] =   0,
            [JOB_OFFICER            ] =   0,
            [JOB_GENERAL            ] =   0,
            [JOB_SCOUT              ] =   5,
            [JOB_SHIPWRIGHT         ] =   1,
            [JOB_PACKDONKEY         ] =   5,
            [JOB_CHARBURNER         ] =   0
        })

    elseif(p == 1) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  80,
            [GD_BOARDS      ] =  60,
            [GD_STONES      ] =  60,
            [GD_HAM         ] =  20,
            [GD_GRAIN       ] =  20,		
            [GD_FLOUR       ] =  20,			
            [GD_FISH        ] =  20,			
            [GD_MEAT        ] =  20,			
            [GD_BREAD       ] =  20,		
            [GD_WATER       ] =  20,
            [GD_BEER        ] =  0,
            [GD_COAL        ] =  0,
            [GD_IRONORE     ] =  0,
            [GD_GOLD        ] =  0,
            [GD_IRON        ] =  20,		
            [GD_COINS       ] =  0,		
            [GD_TONGS       ] =  0,	
            [GD_AXE         ] =  2,
            [GD_SAW         ] =  1,
            [GD_PICKAXE     ] =  0,
            [GD_HAMMER      ] =  30,
            [GD_SHOVEL      ] =  10,
            [GD_CRUCIBLE    ] =  0,
            [GD_RODANDLINE  ] =  10,
            [GD_SCYTHE      ] =  6,
	        [GD_CLEAVER     ] =  2,
            [GD_ROLLINGPIN  ] =  2,			
            [GD_BOW         ] =  10,
            [GD_SWORD       ] =  20,
            [GD_SHIELD      ] =  20,
            [GD_BOAT        ] =  0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  100,
            [JOB_WOODCUTTER         ] =   0,
            [JOB_FISHER             ] =   0,
            [JOB_FORESTER           ] =   0,
            [JOB_CARPENTER          ] =   0,
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
            [JOB_METALWORKER        ] =   0,
            [JOB_ARMORER            ] =   0,
            [JOB_BUILDER            ] =   10,
            [JOB_PLANER             ] =   10,
            [JOB_GEOLOGIST          ] =   10,
            [JOB_PRIVATE            ] =   20,
            [JOB_PRIVATEFIRSTCLASS  ] =   1,
            [JOB_SERGEANT           ] =   1,
            [JOB_OFFICER            ] =   1,
            [JOB_GENERAL            ] =   0,
            [JOB_SCOUT              ] =   5,
            [JOB_SHIPWRIGHT         ] =   0,
            [JOB_PACKDONKEY         ] =   5,
            [JOB_CHARBURNER         ] =   1
        })
		
    elseif(p == 2) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  80,
            [GD_BOARDS      ] =  60,
            [GD_STONES      ] =  60,
            [GD_HAM         ] =  20,
            [GD_GRAIN       ] =  20,		
            [GD_FLOUR       ] =  20,			
            [GD_FISH        ] =  20,			
            [GD_MEAT        ] =  20,			
            [GD_BREAD       ] =  20,		
            [GD_WATER       ] =  20,
            [GD_BEER        ] =  0,
            [GD_COAL        ] =  20,
            [GD_IRONORE     ] =  20,
            [GD_GOLD        ] =  10,
            [GD_IRON        ] =  0,		
            [GD_COINS       ] =  0,		
            [GD_TONGS       ] =  0,	
            [GD_AXE         ] =  3,
            [GD_SAW         ] =  1,
            [GD_PICKAXE     ] =  10,
            [GD_HAMMER      ] =  30,
            [GD_SHOVEL      ] =  10,
            [GD_CRUCIBLE    ] =  2,
            [GD_RODANDLINE  ] =  10,
            [GD_SCYTHE      ] =  6,
	        [GD_CLEAVER     ] =  2,
            [GD_ROLLINGPIN  ] =  2,			
            [GD_BOW         ] =  10,
            [GD_SWORD       ] =  20,
            [GD_SHIELD      ] =  20,
            [GD_BOAT        ] =  0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  100,
            [JOB_WOODCUTTER         ] =   1,
            [JOB_FISHER             ] =   1,
            [JOB_FORESTER           ] =   2,
            [JOB_CARPENTER          ] =   1,
            [JOB_STONEMASON         ] =   1,
            [JOB_HUNTER             ] =   1,
            [JOB_FARMER             ] =   4,
            [JOB_MILLER             ] =   1,
            [JOB_BAKER              ] =   1,
            [JOB_BUTCHER            ] =   1,
            [JOB_MINER              ] =   10,
            [JOB_BREWER             ] =   1,
            [JOB_PIGBREEDER         ] =   1,
            [JOB_DONKEYBREEDER      ] =   1,
            [JOB_IRONFOUNDER        ] =   1,
            [JOB_MINTER             ] =   1,
            [JOB_METALWORKER        ] =   1,
            [JOB_ARMORER            ] =   1,
            [JOB_BUILDER            ] =   10,
            [JOB_PLANER             ] =   10,
            [JOB_GEOLOGIST          ] =   10,
            [JOB_PRIVATE            ] =   20,
            [JOB_PRIVATEFIRSTCLASS  ] =   4,
            [JOB_SERGEANT           ] =   3,
            [JOB_OFFICER            ] =   1,
            [JOB_GENERAL            ] =   0,
            [JOB_SCOUT              ] =   5,
            [JOB_SHIPWRIGHT         ] =   0,
            [JOB_PACKDONKEY         ] =   5,
            [JOB_CHARBURNER         ] =   1
        })

    elseif(p == 3) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  180,
            [GD_BOARDS      ] =  140,
            [GD_STONES      ] =  140,
            [GD_HAM         ] =  20,
            [GD_GRAIN       ] =  220,		
            [GD_FLOUR       ] =  20,			
            [GD_FISH        ] =  20,			
            [GD_MEAT        ] =  20,			
            [GD_BREAD       ] =  20,		
            [GD_WATER       ] =  220,
            [GD_BEER        ] =  0,
            [GD_COAL        ] =  20,
            [GD_IRONORE     ] =  20,
            [GD_GOLD        ] =  0,
            [GD_IRON        ] =  0,		
            [GD_COINS       ] =  0,		
            [GD_TONGS       ] =  0,	
            [GD_AXE         ] =  3,
            [GD_SAW         ] =  1,
            [GD_PICKAXE     ] =  10,
            [GD_HAMMER      ] =  30,
            [GD_SHOVEL      ] =  2,
            [GD_CRUCIBLE    ] =  2,
            [GD_RODANDLINE  ] =  10,
            [GD_SCYTHE      ] =  6,
	        [GD_CLEAVER     ] =  2,
            [GD_ROLLINGPIN  ] =  2,			
            [GD_BOW         ] =  10,
            [GD_SWORD       ] =  20,
            [GD_SHIELD      ] =  20,
            [GD_BOAT        ] =  0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  100,
            [JOB_WOODCUTTER         ] =   1,
            [JOB_FISHER             ] =   1,
            [JOB_FORESTER           ] =   2,
            [JOB_CARPENTER          ] =   1,
            [JOB_STONEMASON         ] =   1,
            [JOB_HUNTER             ] =   1,
            [JOB_FARMER             ] =   4,
            [JOB_MILLER             ] =   1,
            [JOB_BAKER              ] =   1,
            [JOB_BUTCHER            ] =   1,
            [JOB_MINER              ] =   10,
            [JOB_BREWER             ] =   1,
            [JOB_PIGBREEDER         ] =   1,
            [JOB_DONKEYBREEDER      ] =   1,
            [JOB_IRONFOUNDER        ] =   1,
            [JOB_MINTER             ] =   1,
            [JOB_METALWORKER        ] =   1,
            [JOB_ARMORER            ] =   1,
            [JOB_BUILDER            ] =   10,
            [JOB_PLANER             ] =   10,
            [JOB_GEOLOGIST          ] =   10,
            [JOB_PRIVATE            ] =   31,
            [JOB_PRIVATEFIRSTCLASS  ] =   1,
            [JOB_SERGEANT           ] =   1,
            [JOB_OFFICER            ] =   1,
            [JOB_GENERAL            ] =   92,
            [JOB_SCOUT              ] =   5,
            [JOB_SHIPWRIGHT         ] =   0,
            [JOB_PACKDONKEY         ] =   45,
            [JOB_CHARBURNER         ] =   1
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
    end	
	
    -- onExplored events only check human player, You could erase following and then when enemy reach xy message will also be shown
    if(p ~= 0) then
        return
    end
	
    if(     (x == 13) and (y == 78) ) then MissionEvent(9)
    elseif( (x == 35) and (y == 61) ) then MissionEvent(10)
    elseif( (x == 53) and (y == 68) ) then MissionEvent(11)
    elseif( (x == 36) and (y == 69) ) then MissionEvent(12)
    elseif( (x == 77) and (y == 75) ) then MissionEvent(13)	
    elseif( (x == 81) and (y == 50) ) then MissionEvent(14)	
    elseif( (x == 115) and (y == 78) ) then MissionEvent(15)	
    elseif( (x == 104) and (y == 35) ) then MissionEvent(16)		
    elseif( (x == 111) and (y == 16) ) then MissionEvent(17)	
    elseif( (x == 59) and (y == 35) ) then MissionEvent(18)	
    elseif( (x == 104) and (y == 63) ) then MissionEvent(22)
	end
end

function onOccupied(p, x, y)
    -- only check human player
    if(p ~= 0) then
        return
    end

    if(     (x == 106) and (y == 45) ) then MissionEvent(19)	
    elseif( (x == 70) and (y == 31) ) then MissionEvent(20)	
    elseif( (x == 93) and (y == 41) ) then MissionEvent(21)
	elseif( (x == 14) and (y == 18) ) then MissionEvent(99)	
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
        rttr:GetPlayer(0):DisableBuilding(BLD_CHARBURNER, onLoad)
        rttr:GetWorld():AddStaticObject(16, 23, 560, 0xFFFF, 1)        -- Show arc		
	end	
	
    if(e == 22) then
        rttr:GetPlayer(0):EnableBuilding(BLD_CHARBURNER, not onLoad)	
	end	
	
	if(e == 98) then
        rttr:GetPlayer(1):SetRestrictedArea()
	end

    if(e == 99) then
        -- TODO: EnableNextMissions()
        -- Show opened arc
        rttr:GetWorld():AddStaticObject(16, 23, 561, 0xFFFF, 1)        -- Open arc
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
