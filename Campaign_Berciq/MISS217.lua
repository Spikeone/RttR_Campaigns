------------------------------------------------------------------------------
-- LUA-Script for MISS217.WLD (mission 8 of the Berciq "Roman Campaign II"  --
--                                                                          --
-- Author: (basing on CrazyL (v0.4)) by Berciq                              --
------------------------------------------------------------------------------

-------------------------------- TODO -----------------------------------------
-- Set Portraits
-- EnableNextMissions()
-- Julius and Brutus alliance, it should work like you attack one you attack them both 
-- Set AI Agression Level -> enemy should attach first
-------------------------------------------------------------------------------

-------------------------------- Lua Version used -----------------------------
function getRequiredLuaVersion()
    return 1.0
end

-------------------------------- mission events and texts ---------------------
-- Message-Window (mission statement and hints): 52 chars wide
eIdx = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 98, 99}

rttr:RegisterTranslations(
{
    en = -- story by Berciq --
    {
        Diary   = 'Diary',

        msg1    = 'We\'ve travelled the sea for so long. We run out of supplies and won\'t search for better place to build headquarter. Most of our soldiers has deserted, we have to encourage them somehow on this god\'s forsaken place... I can\'t look on fish anymore... \n\nThere are also good news. Builders claim that new constructing method allows to restore every three of four materials!',
        msgh1   = 'Use boards from ship wisely',

        msg2    = 'Source of freshwater. I\'m afraid it won\'t last forever.',

        msg3    = 'Vikings settlement to the north.',
		msgh3	= '\nTruth, soon we shall either kill the barbarians or else we are bound to be killed ourselves.',		

        msg4    = 'Here he is. Julius is much younger.',
		msgh4	= 'Prepare army!',			

        msg5    = 'Brutus also has his army here. We must take advantage of natural borders',

		msg6	= 'Desert is really large, we must secure as much area as possible, even with high cost.',

		msg7    = 'This small canyon can provide us much stone supply.',	

		msg8	= 'What an lovely island! ',
		
		msg9	= 'Over there! Active volcano, there must be rich sources!',
		
		msg10	= 'Earth is tearing apart here! This long fault ease access to minerals',

		msg11	= 'This bay is underwater during high tide, place with grass will be not flooded however.',
		msgh11	= 'Better hurry! Each second your enemies are using up resources and getting stronger!!',

		msg12	= 'Vikings will not be problem anymore, let\'s use this land, and check if there are any resources left here.',

		msg13	= 'This mining valley is also great place to fortify.',

		msg14	= 'Stone range is blocking our way.',

		msg15	= 'Where is gateway, I\'m sure they\'ve mentioned it!',

		msg16	= 'Prepare for glory!',
		
		msg99   = 'Brutus and Julius escaped through portal! Quick before they will gain new army!',
        msgh99  = '\n\nThe Chapter XIX awaits you...',
},
    pl = -- translated by: Berciq --
    {
        Diary   = 'Dziennik',

        msg1    = 'Płyneliśmy statkiem tak długo że dni zaczęły nam się mieszać. Zapasy prawie się wyczerpały i nie możemy płynąć dalej w oczekiwaniu na lepsze miejsce do zejścia na ląd. Większość  żołnierzy zdezerterowała. Musimy ich nakłonić do służby w tym zapomnianym przez bogów miejscu... Już nie mogę patrzeć na ryby, zjadłbym w końcu coś innego.. \n\nPośród wszystkich złych nowin jest też dobra, budownicy zaproponowali istotne zmiany w konstrukcji budynków, pozwalają one odzyskać podczas rozbiórki blisko trzy z czterech części.',
        msgh1   = 'Desek z rozebranego statku używaj z rozwagą',

        msg2    = 'Pod warstwą piachu znajduje się słodka woda, jednak jej ilości są ograniczone',

        msg3    = 'Zabudowania vikingów na północy.',
		msgh3	= '\nW krótce albo pokonamy tych barbarzyńców albo zostaniemy ich niewolnikami.',		

        msg4    = 'Jest Juliusz, znacznie młodszy i dowodzi potężną armią',
		msgh4	= 'Przygotuj wojska!',			

        msg5    = 'Wojska brutusa, musimy wykorzystać naturalne przeszkody na swoją korzyść',

		msg6	= 'Pustynia jest rozległa, musimy zabezpieczyć jak największy teren, nawet olbrzymim kosztem.',

		msg7    = 'Malutki kanion ale zapewni nam surowiec do budowy domów.',	

		msg8	= 'Jaka urocza wysepka! ',
		
		msg9	= 'Przy wulkanie mogą występować bogate złoża!',
		
		msg10	= 'Ziemia rozdziera się tutaj na części ułatwiając dostęp do złóż',

		msg11	= 'Podczas przypływu zatoka jest zalewana przez ocean. Na szczęście są miejsca do których nie sięga',
		msgh11	= 'Lepiej się pospiesz, z każdą chwilą wróg wykorzystuje zasoby i rośnie w siłę!',

		msg13	= 'Ta górnicza dolinka jest zarazem doskonałym miejscem na umocnienia',

		msg14	= 'Skały blokują przeprawę dalej',

		msg15	= 'Gdzie ten portal?!',

		msg16	= 'Gotujcie się na chwałę!',
		
		msg99   = 'Brutus i Juliusz ucielki portalem. Prędko, za nimi, nim zbiorą nową armię!',
        msgh99  = '\n\nRozdział XIX czeka...',
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
    rttr:Log("-----------------------\n MISS217.lua loaded... \n-----------------------\n")
    rttr:ResetAddons()                          -- S2-settings
    rttr:SetAddon(ADDON_MILITARY_HITPOINTS, true)	
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetAddon(ADDON_CATAPULT_GRAPHICS, true)
	rttr:SetAddon(ADDON_MILITARY_AID, true)		
	rttr:SetAddon(ADDON_REFUND_MATERIALS, 3)		
    rttr:SetAddon(ADDON_TOOL_ORDERING, true)	
    rttr:SetAddon(ADDON_METALWORKSBEHAVIORONZERO, true)	
	rttr:SetAddon(ADDON_DEMOLITION_PROHIBITION, true)
    rttr:SetAddon(ADDON_MILITARY_CONTROL, true)	
    rttr:SetAddon(ADDON_MORE_ANIMALS, true)
    rttr:SetAddon(ADDON_CHARBURNER, true)	
    rttr:SetAddon(ADDON_BURN_DURATION, 4)	
	rttr:SetAddon(ADDON_EXHAUSTIBLE_WATER, 2)
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

    rttr:GetPlayer(1):SetAI(3)                  -- hard AI
    rttr:GetPlayer(1):SetNation(NAT_VIKINGS)    -- nation
    rttr:GetPlayer(1):SetColor(1)               -- yellow
    rttr:GetPlayer(1):SetName('Thorus')         -- Enemy Name	
	
    rttr:GetPlayer(2):SetAI(3)                  -- hard AI
    rttr:GetPlayer(2):SetNation(NAT_ROMANS)     -- nation
    rttr:GetPlayer(2):SetColor(1)               -- red
    rttr:GetPlayer(2):SetName('Brutus')         -- Enemy Name	

    rttr:GetPlayer(3):SetAI(3)                  -- hard AI
    rttr:GetPlayer(3):SetNation(NAT_ROMANS)     -- nation
    rttr:GetPlayer(3):SetColor(1)               -- purple
    rttr:GetPlayer(3):SetName('Julius')         -- Enemy Name	
	
    rttr:GetPlayer(2):SetTeam(TM_TEAM1)
    rttr:GetPlayer(3):SetTeam(TM_TEAM1)
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

-- Buildings limits (Set limits in amount of AI buildings, first parametr is Player ID) --

function enforceBuildingCount(player, building, limit, notify)
    local sumBuildings = rttr:GetPlayer(player):GetNumBuildings(building) + rttr:GetPlayer(player):GetNumBuildingSites(building)

    if (sumBuildings >= limit) then
        rttr:GetPlayer(player):DisableBuilding(building)
    else
        rttr:GetPlayer(player):EnableBuilding(building, notify)
    end
end
	 
function onGameFrame(gf)

    -- for AI 1
		enforceBuildingCount(1, BLD_FORESTER, 1, false)	
		enforceBuildingCount(1, BLD_WOODCUTTER, 2, false)	
		enforceBuildingCount(1, BLD_SAWMILL, 2, false)		
		enforceBuildingCount(1, BLD_BREWERY, 1, false)
		enforceBuildingCount(1, BLD_MILL, 2, false)
		enforceBuildingCount(1, BLD_BAKERY, 2, false)
		enforceBuildingCount(1, BLD_PIGFARM, 1, false)
		enforceBuildingCount(1, BLD_SLAUGHTERHOUSE, 1, false)
		enforceBuildingCount(1, BLD_IRONSMELTER, 2, false)
		enforceBuildingCount(1, BLD_ARMORY, 2, false)
		enforceBuildingCount(1, BLD_METALWORKS, 0, false)
		enforceBuildingCount(1, BLD_MINT, 2, false)		
		enforceBuildingCount(1, BLD_SHIPYARD, 1, false)		

    -- for AI 2
		enforceBuildingCount(2, BLD_FORESTER, 1, false)	
		enforceBuildingCount(2, BLD_WOODCUTTER, 2, false)	
		enforceBuildingCount(2, BLD_SAWMILL, 2, false)		
		enforceBuildingCount(2, BLD_BREWERY, 1, false)
		enforceBuildingCount(2, BLD_MILL, 2, false)
		enforceBuildingCount(2, BLD_BAKERY, 2, false)
		enforceBuildingCount(2, BLD_PIGFARM, 1, false)
		enforceBuildingCount(2, BLD_SLAUGHTERHOUSE, 1, false)
		enforceBuildingCount(2, BLD_IRONSMELTER, 2, false)
		enforceBuildingCount(2, BLD_ARMORY, 2, false)
		enforceBuildingCount(2, BLD_METALWORKS, 0, false)
		enforceBuildingCount(2, BLD_MINT, 2, false)		
		enforceBuildingCount(2, BLD_SHIPYARD, 1, false)		

    -- for AI 3
		enforceBuildingCount(3, BLD_FORESTER, 1, false)	
		enforceBuildingCount(3, BLD_WOODCUTTER, 2, false)	
		enforceBuildingCount(3, BLD_SAWMILL, 2, false)		
		enforceBuildingCount(3, BLD_BREWERY, 1, false)
		enforceBuildingCount(3, BLD_MILL, 2, false)
		enforceBuildingCount(3, BLD_BAKERY, 2, false)
		enforceBuildingCount(3, BLD_PIGFARM, 1, false)
		enforceBuildingCount(3, BLD_SLAUGHTERHOUSE, 1, false)
		enforceBuildingCount(3, BLD_IRONSMELTER, 2, false)
		enforceBuildingCount(3, BLD_ARMORY, 2, false)
		enforceBuildingCount(3, BLD_METALWORKS, 0, false)
		enforceBuildingCount(3, BLD_MINT, 2, false)		
		enforceBuildingCount(3, BLD_SHIPYARD, 1, false)		
end 

-------------------------------- set buildings --------------------------------
function addPlayerBld(p, onLoad)

-- set buildings for all players
	
    rttr:GetPlayer(p):EnableAllBuildings()
    rttr:GetPlayer(p):DisableBuilding(BLD_CATAPULT)	
	
-- set restricted areas 
	
	if(p ~= 0) then
        rttr:GetPlayer(p):SetRestrictedArea(
            nil, nil,       -- enable the whole map
                0,   0,
                0,   63,
                95,  63,
                95,  0,
            nil, nil
        )		
	end	
	
-- Disable specified building for player
	
    if(p == 1) then
        rttr:GetPlayer(p):DisableBuilding(BLD_GOLDMINE, false)
        rttr:GetPlayer(p):DisableBuilding(BLD_BARRACKS, false)		
        rttr:GetPlayer(p):DisableBuilding(BLD_GUARDHOUSE, false)		
        rttr:GetPlayer(p):DisableBuilding(BLD_FORTRESS, false)				
	end	
	
    if(p == 2) then
        rttr:GetPlayer(p):DisableBuilding(BLD_BARRACKS, false)			
        rttr:GetPlayer(p):DisableBuilding(BLD_QUARRY, false)		
	end
	
    if(p == 3) then
        rttr:GetPlayer(p):DisableBuilding(BLD_BARRACKS, false)			
	end
	
-- Building orders
		
    if(p == 1) then
        if onLoad then return end
        rttr:GetPlayer(p):AIConstructionOrder(58, 7, BLD_WATCHTOWER)			
        rttr:GetPlayer(p):AIConstructionOrder(54, 8, BLD_WATCHTOWER)		
        rttr:GetPlayer(p):AIConstructionOrder(55, 11, BLD_FARM)		
        rttr:GetPlayer(p):AIConstructionOrder(59, 11, BLD_FARM)		
        rttr:GetPlayer(p):AIConstructionOrder(56, 15, BLD_FARM)			
    end		
		
    if(p == 2) then
        if onLoad then return end
        rttr:GetPlayer(p):AIConstructionOrder(83, 41, BLD_FORTRESS)	
        rttr:GetPlayer(p):AIConstructionOrder(80, 49, BLD_FORTRESS)	
        rttr:GetPlayer(p):AIConstructionOrder(86, 52, BLD_FARM)	
        rttr:GetPlayer(p):AIConstructionOrder(83, 48, BLD_FARM)	
        rttr:GetPlayer(p):AIConstructionOrder(85, 52, BLD_FARM)			
    end		

     if(p == 3) then
        if onLoad then return end
        rttr:GetPlayer(p):AIConstructionOrder(75, 6, BLD_FORTRESS)
        rttr:GetPlayer(p):AIConstructionOrder(79, 12, BLD_FORTRESS)
        rttr:GetPlayer(p):AIConstructionOrder(85, 9, BLD_FARM)
        rttr:GetPlayer(p):AIConstructionOrder(83, 12, BLD_FARM)
        rttr:GetPlayer(p):AIConstructionOrder(80, 9, BLD_FARM)
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
            [GD_BOARDS      ] =  4,
            [GD_STONES      ] =  3,
            [GD_HAM         ] =  0,
            [GD_GRAIN       ] =  0,		
            [GD_FLOUR       ] =  0,			
            [GD_FISH        ] =  10,			
            [GD_MEAT        ] =  0,			
            [GD_BREAD       ] =  0,		
            [GD_WATER       ] =  0,
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
            [GD_SWORD       ] =  15,
            [GD_SHIELD      ] =  15,
            [GD_BOAT        ] =  0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  10,
            [JOB_WOODCUTTER         ] =   5,
            [JOB_FISHER             ] =   1,
            [JOB_FORESTER           ] =   3,
            [JOB_CARPENTER          ] =   3,
            [JOB_STONEMASON         ] =   3,
            [JOB_HUNTER             ] =   1,
            [JOB_FARMER             ] =   4,
            [JOB_MILLER             ] =   1,
            [JOB_BAKER              ] =   1,
            [JOB_BUTCHER            ] =   1,
            [JOB_MINER              ] =   5,
            [JOB_BREWER             ] =   1,
            [JOB_PIGBREEDER         ] =   1,
            [JOB_DONKEYBREEDER      ] =   1,
            [JOB_IRONFOUNDER        ] =   1,
            [JOB_MINTER             ] =   1,
            [JOB_METALWORKER        ] =   1,
            [JOB_ARMORER            ] =   1,
            [JOB_BUILDER            ] =   20,
            [JOB_PLANER             ] =   5,
            [JOB_GEOLOGIST          ] =   10,
            [JOB_PRIVATE            ] =   3,
            [JOB_PRIVATEFIRSTCLASS  ] =   0,
            [JOB_SERGEANT           ] =   0,
            [JOB_OFFICER            ] =   0,
            [JOB_GENERAL            ] =   0,
            [JOB_SCOUT              ] =   3,
            [JOB_SHIPWRIGHT         ] =   1,
            [JOB_PACKDONKEY         ] =   4,
            [JOB_CHARBURNER         ] =   1
        })

    elseif(p == 1) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  90,
            [GD_BOARDS      ] =  90,
            [GD_STONES      ] =  90,
            [GD_HAM         ] =  90,
            [GD_GRAIN       ] =  90,		
            [GD_FLOUR       ] =  90,			
            [GD_FISH        ] =  90,			
            [GD_MEAT        ] =  90,			
            [GD_BREAD       ] =  90,		
            [GD_WATER       ] =  90,
            [GD_BEER        ] =  90,
            [GD_COAL        ] =  0,
            [GD_IRONORE     ] =  90,
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
            [JOB_HELPER             ] =  100,
            [JOB_WOODCUTTER         ] =   5,
            [JOB_FISHER             ] =   2,
            [JOB_FORESTER           ] =   1,
            [JOB_CARPENTER          ] =   1,
            [JOB_STONEMASON         ] =   2,
            [JOB_HUNTER             ] =   1,
            [JOB_FARMER             ] =   5,
            [JOB_MILLER             ] =   1,
            [JOB_BAKER              ] =   1,
            [JOB_BUTCHER            ] =   1,
            [JOB_MINER              ] =   5,
            [JOB_BREWER             ] =   1,
            [JOB_PIGBREEDER         ] =   1,
            [JOB_DONKEYBREEDER      ] =   1,
            [JOB_IRONFOUNDER        ] =   2,
            [JOB_MINTER             ] =   2,
            [JOB_METALWORKER        ] =   1,
            [JOB_ARMORER            ] =   2,
            [JOB_BUILDER            ] =   20,
            [JOB_PLANER             ] =   10,
            [JOB_GEOLOGIST          ] =   10,
            [JOB_PRIVATE            ] =   20,
            [JOB_PRIVATEFIRSTCLASS  ] =   0,
            [JOB_SERGEANT           ] =   0,
            [JOB_OFFICER            ] =   0,
            [JOB_GENERAL            ] =   0,
            [JOB_SCOUT              ] =   2,
            [JOB_SHIPWRIGHT         ] =   0,
            [JOB_PACKDONKEY         ] =   20,
            [JOB_CHARBURNER         ] =   1
        })
		
    elseif(p == 2) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  90,
            [GD_BOARDS      ] =  90,
            [GD_STONES      ] =  90,
            [GD_HAM         ] =  90,
            [GD_GRAIN       ] =  90,		
            [GD_FLOUR       ] =  90,			
            [GD_FISH        ] =  90,			
            [GD_MEAT        ] =  90,			
            [GD_BREAD       ] =  90,		
            [GD_WATER       ] =  90,
            [GD_BEER        ] =  90,
            [GD_COAL        ] =  0,
            [GD_IRONORE     ] =  90,
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
            [JOB_HELPER             ] =  100,
            [JOB_WOODCUTTER         ] =   5,
            [JOB_FISHER             ] =   2,
            [JOB_FORESTER           ] =   1,
            [JOB_CARPENTER          ] =   1,
            [JOB_STONEMASON         ] =   2,
            [JOB_HUNTER             ] =   1,
            [JOB_FARMER             ] =   5,
            [JOB_MILLER             ] =   1,
            [JOB_BAKER              ] =   1,
            [JOB_BUTCHER            ] =   1,
            [JOB_MINER              ] =   5,
            [JOB_BREWER             ] =   1,
            [JOB_PIGBREEDER         ] =   1,
            [JOB_DONKEYBREEDER      ] =   1,
            [JOB_IRONFOUNDER        ] =   2,
            [JOB_MINTER             ] =   2,
            [JOB_METALWORKER        ] =   1,
            [JOB_ARMORER            ] =   2,
            [JOB_BUILDER            ] =   20,
            [JOB_PLANER             ] =   10,
            [JOB_GEOLOGIST          ] =   10,
            [JOB_PRIVATE            ] =   20,
            [JOB_PRIVATEFIRSTCLASS  ] =   0,
            [JOB_SERGEANT           ] =   20,
            [JOB_OFFICER            ] =   2,
            [JOB_GENERAL            ] =   2,
            [JOB_SCOUT              ] =   2,
            [JOB_SHIPWRIGHT         ] =   0,
            [JOB_PACKDONKEY         ] =   20,
            [JOB_CHARBURNER         ] =   1
        })

    elseif(p == 3) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  90,
            [GD_BOARDS      ] =  90,
            [GD_STONES      ] =  90,
            [GD_HAM         ] =  90,
            [GD_GRAIN       ] =  90,		
            [GD_FLOUR       ] =  90,			
            [GD_FISH        ] =  90,			
            [GD_MEAT        ] =  90,			
            [GD_BREAD       ] =  90,		
            [GD_WATER       ] =  90,
            [GD_BEER        ] =  90,
            [GD_COAL        ] =  0,
            [GD_IRONORE     ] =  90,
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
            [JOB_HELPER             ] =  100,
            [JOB_WOODCUTTER         ] =   5,
            [JOB_FISHER             ] =   2,
            [JOB_FORESTER           ] =   1,
            [JOB_CARPENTER          ] =   1,
            [JOB_STONEMASON         ] =   2,
            [JOB_HUNTER             ] =   1,
            [JOB_FARMER             ] =   5,
            [JOB_MILLER             ] =   1,
            [JOB_BAKER              ] =   1,
            [JOB_BUTCHER            ] =   1,
            [JOB_MINER              ] =   5,
            [JOB_BREWER             ] =   1,
            [JOB_PIGBREEDER         ] =   1,
            [JOB_DONKEYBREEDER      ] =   1,
            [JOB_IRONFOUNDER        ] =   2,
            [JOB_MINTER             ] =   2,
            [JOB_METALWORKER        ] =   1,
            [JOB_ARMORER            ] =   2,
            [JOB_BUILDER            ] =   20,
            [JOB_PLANER             ] =   10,
            [JOB_GEOLOGIST          ] =   10,
            [JOB_PRIVATE            ] =   20,
            [JOB_PRIVATEFIRSTCLASS  ] =   2,
            [JOB_SERGEANT           ] =   2,
            [JOB_OFFICER            ] =   2,
            [JOB_GENERAL            ] =   20,
            [JOB_SCOUT              ] =   2,
            [JOB_SHIPWRIGHT         ] =   0,
            [JOB_PACKDONKEY         ] =   20,
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

    if(rIdx == RES_WATER) then           MissionEvent(2)
    end
end

function onExplored(p, x, y, o)
    -- onContact events
    if(     	((p == 0) and (o == 1)) or ((p == 1) and (o == 0)) ) then MissionEvent(3)
    elseif(     ((p == 0) and (o == 2)) or ((p == 2) and (o == 0)) ) then MissionEvent(4)	
    elseif(     ((p == 0) and (o == 3)) or ((p == 3) and (o == 0)) ) then MissionEvent(5)
    end	
	
    -- onExplored events only check human player, You could erase following and then when enemy reach xy message will also be shown
    if(p ~= 0) then
        return
    end
	
    if(     (x == 17) and (y == 17) ) then MissionEvent(7)
    elseif(  (x == 8) and (y == 24) ) then MissionEvent(8)		
    elseif( (x == 33) and (y == 24) ) then MissionEvent(9)		
    elseif( (x == 36) and (y == 34) ) then MissionEvent(10)
    elseif( (x == 40) and (y == 41) ) then MissionEvent(11)
    elseif( (x == 65) and (y == 42) ) then MissionEvent(13)	
    elseif( (x == 71) and (y == 48) ) then MissionEvent(14)	
    elseif( (x == 82) and (y == 31) ) then MissionEvent(15)
	end
end

function onOccupied(p, x, y)
    -- only check human player
    if(p ~= 0) then
        return
    end

    if(     (x == 19) and (y == 40) ) then MissionEvent(6)	
    elseif( (x == 54) and  (y == 8) ) then MissionEvent(12)	
    elseif( (x == 72) and (y == 48) ) then MissionEvent(16)
	elseif( (x == 89) and  (y == 8) ) then MissionEvent(99)	
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
        rttr:GetWorld():AddStaticObject(89, 8, 560, 0xFFFF, 2)
        rttr:GetWorld():AddStaticObject(72, 39, 559, 0xFFFF, 1)		
        rttr:GetWorld():AddStaticObject(79, 27, 559, 0xFFFF, 1)			
    end
	
	if(e == 98) then
        rttr:GetPlayer(1):SetRestrictedArea()
	end

    if(e == 99) then
        -- TODO: EnableNextMissions()
        -- Show opened arc
        rttr:GetWorld():AddStaticObject(89, 8, 561, 0xFFFF, 2)
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
