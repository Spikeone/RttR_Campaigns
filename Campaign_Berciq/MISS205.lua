------------------------------------------------------------------------------
-- LUA-Script for MISS205.WLD (mission 6 of the Berciq "Roman Campaign II"  --
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
-- Set AI Agression Level
-------------------------------------------------------------------------------


-------------------------------- Lua Version used -----------------------------
function getRequiredLuaVersion()
    return 1.3
end


-------------------------------- mission events and texts ---------------------
-- Message-Window (mission statement and hints): 52 chars wide
eIdx = {1, 2, 98, 99}

rttr:RegisterTranslations(
{
    en = -- story by Berciq --
    {
        Diary   = 'Diary',

        msg1    = 'When we got back for our people it turned that they all had died, even my best advisor... We could only take their tools with us... It was hard to catch a breath there and people were fainting all the time, I\'m glad we managed to move.. however... We were complaining about heat, now we suffer from freeze again but the air is fresh fortunately.. Gate we\'ve entered here sunk in this lake. This icy land seems to lack of food, fortunately our people have learned how to fish properly. \n\nScout reported that most ends of this sea flooded valleys got some space and good soil to put farm.',
        msgh1   = 'Proceed, find the gateway and occupy it, You are on Your own!',

        msg2    = 'Water here is warm and doesn\'t freeze. We should have learned from vikings how to build sauna..',

		msg99   = 'This gateway, We\'ve opened it but earth shaken, heat is coming out of it. The ice beneath is melting, quick before it collapses!',
        msgh99  = '\n\nYou walked into portal just in time! \nThe Chapter XVII awaits you...',
},
    pl = -- translated by: Berciq --
    {
        Diary   = 'Dziennik',

        msg1    = 'Gdy powróciliśmy wszyscy w osadzie już nie żyli, nawet mój doradca który od samego początku służył mi radą i wsparciem... Mogliśmy zabrać tylko narzędzia... Ciężko było złapać oddech a ludzie wciąż mdleli. Jestem rad że udało nam się przenieść. Narzekaliśmy na skwar, a teraz znów jesteśmy przemarznięci, przynajmniej świeżego powietrza nam nie zabraknie.. Pod portalem którym przybyliśmy zarwał się lód i jego gruzy leżą na dnie jeziora. Ten mroźny skrawek lądu wydaje się pozbawiony pożywienie ale wody są pełne ryb. \n\nZwiadowcy donoszą o równinach odpowiednich pod uprawę, które znajdują się na końcach zalanych przez morze gór.',
        msgh1   = 'Znajdź portal, i go uruchom. Jesteś zdany sam na siebie!',

        msg2    = 'Woda tutaj nie zamarza, co więcej, jest ciepła. Powinniśmy byli nauczyć się od vikingów konstruować saunę.',

		msg99   = 'Uruchomiliśmy portal, ziemia zatrzęsła się a wydobywające ciepło topi lód pod całą konstrukcją! Szybko, póki czas!',
        msgh99  = '\n\nW samą porę! \nRodział XVII czeka...',
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
    rttr:Log("-----------------------\n MISS205.lua loaded... \n-----------------------\n")
    rttr:ResetAddons()                          -- S2-settings
    rttr:SetAddon(ADDON_MILITARY_HITPOINTS, true)	
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetAddon(ADDON_CATAPULT_GRAPHICS, true)
	rttr:SetAddon(ADDON_MILITARY_AID, true)		
    rttr:SetAddon(ADDON_TOOL_ORDERING, true)	
    rttr:SetAddon(ADDON_METALWORKSBEHAVIORONZERO, true)	
	rttr:SetAddon(ADDON_DEMOLITION_PROHIBITION, true)
    rttr:SetAddon(ADDON_MILITARY_CONTROL, true)	
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

    rttr:GetPlayer(1):SetAI(3)                  -- hard AI
    rttr:GetPlayer(1):SetNation(NAT_VIKINGS)    -- nation
    rttr:GetPlayer(1):SetColor(1)               -- yellow
    rttr:GetPlayer(1):SetName('Brandt')         -- Enemy Name	
	
    rttr:GetPlayer(2):SetAI(3)                  -- hard AI
    rttr:GetPlayer(2):SetNation(NAT_VIKINGS)    -- nation
    rttr:GetPlayer(2):SetColor(2)               -- red
    rttr:GetPlayer(2):SetName('Hjalmar')        -- Enemy Name	

    rttr:GetPlayer(3):SetAI(3)                  -- hard AI
    rttr:GetPlayer(3):SetNation(NAT_VIKINGS)    -- nation
    rttr:GetPlayer(3):SetColor(3)               -- purple
    rttr:GetPlayer(3):SetName('Viggo')          -- Enemy Name	
	
    rttr:GetPlayer(1):SetTeam(TM_TEAM1)
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
        rttr:GetWorld():AddAnimal( 69,  43, SPEC_POLARBEAR)
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
            nil, nil,       -- R=6, 	X=9, 	Y=9
                 3,  9,		-- West	 	X-R		Y
                15,  9,		-- Eeast	X+R 	Y
                 6,  15,	-- NW		X-1/2R	Y+R
                12,  15,	-- NE		X+1/2R	Y+R
                 6,  3,		-- SW		X-1/2R	Y-R
                12,  3,		-- SE		X+1/2R	Y-R
				 3,  9,		-- Close
            nil, nil
        )
		
        if(p == 1) then
            if onLoad then return end
            rttr:GetPlayer(p):AIConstructionOrder(43, 27, BLD_FORTRESS)	
            rttr:GetPlayer(p):AIConstructionOrder(42, 22, BLD_MILL)	
            rttr:GetPlayer(p):AIConstructionOrder(43, 23, BLD_BAKERY)	
            rttr:GetPlayer(p):AIConstructionOrder(39, 20, BLD_SAWMILL)	
            rttr:GetPlayer(p):AIConstructionOrder(39, 16, BLD_FARM)		
            rttr:GetPlayer(p):AIConstructionOrder(36, 19, BLD_FARM)		
            rttr:GetPlayer(p):AIConstructionOrder(36, 24, BLD_WATCHTOWER)		
            rttr:GetPlayer(p):AIConstructionOrder(36, 22, BLD_WELL)				
        end		
		
        if(p == 2) then
            if onLoad then return end
            rttr:GetPlayer(p):AIConstructionOrder(71, 17, BLD_FORTRESS)	
            rttr:GetPlayer(p):AIConstructionOrder(67, 28, BLD_FORTRESS)
            rttr:GetPlayer(p):AIConstructionOrder(60, 20, BLD_FARM)	
            rttr:GetPlayer(p):AIConstructionOrder(67, 25, BLD_FARM)		
            rttr:GetPlayer(p):AIConstructionOrder(72, 19, BLD_IRONSMELTER)	
            rttr:GetPlayer(p):AIConstructionOrder(72, 21, BLD_ARMORY)	
            rttr:GetPlayer(p):AIConstructionOrder(71, 21, BLD_MINT)	
            rttr:GetPlayer(p):AIConstructionOrder(66, 18, BLD_PIGFARM)	
            rttr:GetPlayer(p):AIConstructionOrder(65, 23, BLD_QUARRY)	
            rttr:GetPlayer(p):AIConstructionOrder(61, 23, BLD_BREWERY)	
            rttr:GetPlayer(p):AIConstructionOrder(61, 25, BLD_WATCHTOWER)	
            rttr:GetPlayer(p):AIConstructionOrder(60, 24, BLD_SAWMILL)	
            rttr:GetPlayer(p):AIConstructionOrder(62, 21, BLD_WELL)	
        end		

        if(p == 3) then
            if onLoad then return end	
            rttr:GetPlayer(p):AIConstructionOrder(95, 47, BLD_FORTRESS)	
            rttr:GetPlayer(p):AIConstructionOrder(89, 36, BLD_FORTRESS)	
            rttr:GetPlayer(p):AIConstructionOrder(90, 40, BLD_SAWMILL)	
            rttr:GetPlayer(p):AIConstructionOrder(94, 37, BLD_PIGFARM)	
            rttr:GetPlayer(p):AIConstructionOrder(94, 40, BLD_SLAUGHTERHOUSE)	
            rttr:GetPlayer(p):AIConstructionOrder(95, 42, BLD_IRONSMELTER)	
            rttr:GetPlayer(p):AIConstructionOrder(95, 44, BLD_ARMORY)	
            rttr:GetPlayer(p):AIConstructionOrder(92, 44, BLD_FARM)	
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
			[GD_WOOD        ] =  60,
            [GD_BOARDS      ] =  40,
            [GD_STONES      ] =  40,
            [GD_HAM         ] =  5,
            [GD_GRAIN       ] =  5,		
            [GD_FLOUR       ] =  5,			
            [GD_FISH        ] =  10,			
            [GD_MEAT        ] =  10,			
            [GD_BREAD       ] =  10,		
            [GD_WATER       ] =  5,
            [GD_BEER        ] =  5,
            [GD_COAL        ] =  0,
            [GD_IRONORE     ] =  0,
            [GD_GOLD        ] =  10,
            [GD_IRON        ] =  10,		
            [GD_COINS       ] =  1,		
            [GD_TONGS       ] =  3,	
            [GD_AXE         ] =  8,
            [GD_SAW         ] =  3,
            [GD_PICKAXE     ] =  5,
            [GD_HAMMER      ] =  20,
            [GD_SHOVEL      ] =  12,
            [GD_CRUCIBLE    ] =  3,
            [GD_RODANDLINE  ] =  6,
            [GD_SCYTHE      ] =  2,
	        [GD_CLEAVER     ] =  2,
            [GD_ROLLINGPIN  ] =  3,			
            [GD_BOW         ] =  8,
            [GD_SWORD       ] =  20,
            [GD_SHIELD      ] =  20,
            [GD_BOAT        ] =  10
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =   0,
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
            [JOB_GEOLOGIST          ] =   0,
            [JOB_PRIVATE            ] =   15,
            [JOB_PRIVATEFIRSTCLASS  ] =   2,
            [JOB_SERGEANT           ] =   2,
            [JOB_OFFICER            ] =   2,
            [JOB_GENERAL            ] =   5,
            [JOB_SCOUT              ] =   0,
            [JOB_SHIPWRIGHT         ] =   0,
            [JOB_PACKDONKEY         ] =   0,
            [JOB_CHARBURNER         ] =   0
        })

    elseif(p == 1) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  80,
            [GD_BOARDS      ] =  40,
            [GD_STONES      ] =  40,
            [GD_HAM         ] =  0,
            [GD_GRAIN       ] =  0,		
            [GD_FLOUR       ] =  0,			
            [GD_FISH        ] =  10,			
            [GD_MEAT        ] =  10,			
            [GD_BREAD       ] =  10,		
            [GD_WATER       ] =  10,
            [GD_BEER        ] =  0,
            [GD_COAL        ] =  0,
            [GD_IRONORE     ] =  0,
            [GD_GOLD        ] =  0,
            [GD_IRON        ] =  0,		
            [GD_COINS       ] =  0,		
            [GD_TONGS       ] =  0,	
            [GD_AXE         ] =  10,
            [GD_SAW         ] =  2,
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
            [GD_BOAT        ] =  20
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  100,
            [JOB_WOODCUTTER         ] =   6,
            [JOB_FISHER             ] =   4,
            [JOB_FORESTER           ] =   3,
            [JOB_CARPENTER          ] =   3,
            [JOB_STONEMASON         ] =   4,
            [JOB_HUNTER             ] =   4,
            [JOB_FARMER             ] =   4,
            [JOB_MILLER             ] =   2,
            [JOB_BAKER              ] =   2,
            [JOB_BUTCHER            ] =   2,
            [JOB_MINER              ] =   10,
            [JOB_BREWER             ] =   2,
            [JOB_PIGBREEDER         ] =   2,
            [JOB_DONKEYBREEDER      ] =   2,
            [JOB_IRONFOUNDER        ] =   2,
            [JOB_MINTER             ] =   2,
            [JOB_METALWORKER        ] =   2,
            [JOB_ARMORER            ] =   2,
            [JOB_BUILDER            ] =   10,
            [JOB_PLANER             ] =   10,
            [JOB_GEOLOGIST          ] =   10,
            [JOB_PRIVATE            ] =   20,
            [JOB_PRIVATEFIRSTCLASS  ] =   16,
            [JOB_SERGEANT           ] =   3,
            [JOB_OFFICER            ] =   3,
            [JOB_GENERAL            ] =   3,
            [JOB_SCOUT              ] =   10,
            [JOB_SHIPWRIGHT         ] =   2,
            [JOB_PACKDONKEY         ] =   10,
            [JOB_CHARBURNER         ] =   0
        })
		
    elseif(p == 2) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  80,
            [GD_BOARDS      ] =  40,
            [GD_STONES      ] =  40,
            [GD_HAM         ] =  0,
            [GD_GRAIN       ] =  0,		
            [GD_FLOUR       ] =  0,			
            [GD_FISH        ] =  10,			
            [GD_MEAT        ] =  10,			
            [GD_BREAD       ] =  10,		
            [GD_WATER       ] =  10,
            [GD_BEER        ] =  0,
            [GD_COAL        ] =  0,
            [GD_IRONORE     ] =  0,
            [GD_GOLD        ] =  0,
            [GD_IRON        ] =  0,		
            [GD_COINS       ] =  0,		
            [GD_TONGS       ] =  0,	
            [GD_AXE         ] =  10,
            [GD_SAW         ] =  2,
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
            [GD_BOAT        ] =  20
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  100,
            [JOB_WOODCUTTER         ] =   6,
            [JOB_FISHER             ] =   4,
            [JOB_FORESTER           ] =   3,
            [JOB_CARPENTER          ] =   3,
            [JOB_STONEMASON         ] =   4,
            [JOB_HUNTER             ] =   4,
            [JOB_FARMER             ] =   4,
            [JOB_MILLER             ] =   2,
            [JOB_BAKER              ] =   2,
            [JOB_BUTCHER            ] =   2,
            [JOB_MINER              ] =   10,
            [JOB_BREWER             ] =   2,
            [JOB_PIGBREEDER         ] =   2,
            [JOB_DONKEYBREEDER      ] =   2,
            [JOB_IRONFOUNDER        ] =   2,
            [JOB_MINTER             ] =   2,
            [JOB_METALWORKER        ] =   2,
            [JOB_ARMORER            ] =   2,
            [JOB_BUILDER            ] =   10,
            [JOB_PLANER             ] =   10,
            [JOB_GEOLOGIST          ] =   10,
            [JOB_PRIVATE            ] =   20,
            [JOB_PRIVATEFIRSTCLASS  ] =   17,
            [JOB_SERGEANT           ] =   4,
            [JOB_OFFICER            ] =   4,
            [JOB_GENERAL            ] =   4,
            [JOB_SCOUT              ] =   10,
            [JOB_SHIPWRIGHT         ] =   2,
            [JOB_PACKDONKEY         ] =   10,
            [JOB_CHARBURNER         ] =   0
        })		
		
    elseif(p == 3) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  80,
            [GD_BOARDS      ] =  40,
            [GD_STONES      ] =  40,
            [GD_HAM         ] =  0,
            [GD_GRAIN       ] =  0,		
            [GD_FLOUR       ] =  0,			
            [GD_FISH        ] =  10,			
            [GD_MEAT        ] =  10,			
            [GD_BREAD       ] =  10,		
            [GD_WATER       ] =  10,
            [GD_BEER        ] =  0,
            [GD_COAL        ] =  0,
            [GD_IRONORE     ] =  0,
            [GD_GOLD        ] =  0,
            [GD_IRON        ] =  0,		
            [GD_COINS       ] =  0,		
            [GD_TONGS       ] =  0,	
            [GD_AXE         ] =  10,
            [GD_SAW         ] =  2,
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
            [GD_BOAT        ] =  20
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  100,
            [JOB_WOODCUTTER         ] =   6,
            [JOB_FISHER             ] =   4,
            [JOB_FORESTER           ] =   3,
            [JOB_CARPENTER          ] =   3,
            [JOB_STONEMASON         ] =   4,
            [JOB_HUNTER             ] =   4,
            [JOB_FARMER             ] =   4,
            [JOB_MILLER             ] =   2,
            [JOB_BAKER              ] =   2,
            [JOB_BUTCHER            ] =   2,
            [JOB_MINER              ] =   10,
            [JOB_BREWER             ] =   2,
            [JOB_PIGBREEDER         ] =   2,
            [JOB_DONKEYBREEDER      ] =   2,
            [JOB_IRONFOUNDER        ] =   2,
            [JOB_MINTER             ] =   2,
            [JOB_METALWORKER        ] =   2,
            [JOB_ARMORER            ] =   2,
            [JOB_BUILDER            ] =   10,
            [JOB_PLANER             ] =   10,
            [JOB_GEOLOGIST          ] =   10,
            [JOB_PRIVATE            ] =   20,
            [JOB_PRIVATEFIRSTCLASS  ] =   15,
            [JOB_SERGEANT           ] =   5,
            [JOB_OFFICER            ] =   5,
            [JOB_GENERAL            ] =   5,
            [JOB_SCOUT              ] =   10,
            [JOB_SHIPWRIGHT         ] =   2,
            [JOB_PACKDONKEY         ] =   10,
            [JOB_CHARBURNER         ] =   0
        })		
    end
end


-------------------------------- mission events -------------------------------

function onExplored(p, x, y, o)
    -- onExplored events only check human player, You could erase following and then when enemy reach xy message will also be shown
    if(p ~= 0) then
        return
    end
	
    if(     (x == 90) and (y == 24) ) then MissionEvent(2)	
	end
end

function onOccupied(p, x, y)
    -- only check human player
    if(p ~= 0) then
        return
    end
	
    if( (x == 97) and (y == 40) ) then MissionEvent(99)	
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
        rttr:GetWorld():AddStaticObject(97, 40, 561, 0xFFFF, 2)
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
