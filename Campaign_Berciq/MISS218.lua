------------------------------------------------------------------------------
-- LUA-Script for MISS218.WLD (mission 9 of the Berciq "Roman Campaign II"  --
--                                                                          --
-- Author: (basing on CrazyL (v0.4)) by Berciq                              --
------------------------------------------------------------------------------

-------------------------------- TODO -----------------------------------------
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
eIdx = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 98, 99}

rttr:RegisterTranslations(
{
    en = -- story by Berciq --
    {
        Diary   = 'Diary',

        msg1    = 'I love the smell of sulphur in the morning! Nearby volcano is still active and lava rivers are heading south, we have to follow them to find some passage on the other side where Julius has escaped. \n\nI ordered people to decide on their own if the building is not needed anymore when resources are exhausted. I will have more time to focus on our mission',
        msgh1   = 'Find Julius, dark volcanic smoke will reduce visibility',

        msg2    = 'We have found coal supply.',

        msg3    = 'There were found significant amounts of iron ore.',

        msg4    = 'Geologists claimed finding granite rocks.',

        msg5    = 'Gold ore has been found here.',

		msg6	= 'Hakirawashi is his name, he came in peace, but we\'ve seen that he is holding hands on gold resources. I\'m afraid this is just temporary state until he will train his army and turn against us.',
		
		msg7    = 'Tsunami lives to the south, it is really unlikely that despite being enemies we were invited to the meeting. Their culture is completely different than ours. They have much respect to the sea and use its resources.',

		msg8	= 'Yamauchi seems like much younger than me, he is very observant and tries to learn from what he was allowed to see. He must have realized that our encounter is inevitable.',
		
        msg9    = 'Julius and Brutus were murdered by scouts when they crossed border of our enemy. I don\'t understand.. this couldn\'t happen as I remember Julius being old... Shouln\'t all the memories about him vanish if he is dead? \n\nWas this differnt Julius? From different world? \n\nIf only I had chance to speak to him. I will not leave it this way! I will revenge him!',		
        msgh9   = 'Revenge Julius',
		
        msg10   = 'This world is a trap! Going westwards results comming from the east!',		
		
		msg99   = 'We managed somehow, even being outnumbered. If we didn\'t we would become slaves for rest of our lives. I didn\'t wanted all this to happen, but it was certain we or them... only one to survive...  \n\nVolcano is getting more and more active, we can\'t stay here. ',
        msgh99  = '\nFortunately We\'ve opened the gateway, there is no time to waste, let\'s go. \n\nThe Chapter XX awaits you...',
},
    pl = -- translated by: Berciq --
    {
        Diary   = 'Dziennik',

        msg1    = 'Uwielbiam zapach siarki o poranku! Pobliski wulkan jest nadal aktywny a potoki lawy płyną na południe. Musimy podążać wzdłuż ich brzegów. Juliusz powinien być niedaleko. \n\nPoleciłem ludziom decydować o niszczeniu zbędnych budowli na własną rękę. Dzięki temu będę mógł się lepiej skupić na naszej misji.',
        msgh1   = 'Podążaj za potokami lawy, odszukaj Juliusza. Gęsty dym z wulkanu ogranicza nam widoczność',

        msg2    = 'Znaleźliśmy pokłady węgla',

        msg3    = 'Znaczące ilości rudy żelaza',

        msg4    = 'Geolodzy odnaleźli źródło doskonałego surowca do budowy',

        msg5    = 'Bogate złoża złota odkryto opodal',

		msg6	= 'Jego imie to Hakirawashi i przybywa w pokoju. Widzieliśmy jednak że ma dostęp do złóż złota dlatego obawiam się, że pokój jest tylko tymczasowy. Gdy wyszkoli wojowników, z pewnością zwróci się przeciw nam.',
		
		msg7    = 'Tsunami żyje na południu. Zaprosił nas i ugościł pomimo że jest naszym wrogiem, to rzadko spotykane. Ich kultura jest zupełnie inna niż nasza, mają wiele szacunku do morza i czerpią z niego wiele dóbr.',

		msg8	= 'Yamauchi wydaje się znacznie młodszy ode mnie. Jest spostrzegawczy, a z każdego spotkania stara się wyciągnąć lekcje. Doskonale rozumie, że nasze starcie jest nieuniknione.',

        msg9    = 'Juliusz i Brutus zostali zabici na naszych oczach gdy tylko przekroczyli granicę wroga. Nic z tego nie rozumiem... Nie mogło się to wydarzyć bo przecież pamiętam Juliusza gdy był znacznie starszy... Jeśli on nie żyje, to czy wszystkie wspomnienia nie powinny zniknąć? \n\nCo jeśli to inny Juliusz? Z innego świata? \n\nGdybym tylko miał okazję z nim porozmawiać.. Nie pozostawię tego tak! Pomszczę Juliusza!',
        msgh9   = 'Pomścij Juliusza',
		
        msg10   = 'Ten świat jest pułapką! Idąc na zachód wychodzimy na wschodzie!',		
		
		msg99   = 'Udało się, pomimo bycia między młotem a kowadłem. Gdybyśmy ich nie pokonali, zostalibyśmy ich niewolnikami. Niechciałem żeby wszystko tak się potoczyło. Wybór był jeden - albo my, albo oni...  \n\nAktywność wulkanu się wzmaga, nie możemy tu pozostać',
        msgh99  = '\nSzczęśliwie uruchomiliśmy portal, nie ma na co czekać, ruszajmy, \n\nRozdział XX czeka...',
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
    rttr:Log("-----------------------\n MISS218.lua loaded... \n-----------------------\n")
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
    rttr:SetAddon(ADDON_DEMOLISH_BLD_WO_RES, true)
    --rttr:SetAddon(ADDON_SEA_ATTACK, true)	
    rttr:SetGameSettings({                      -- TEST
        ["fow"] = EXP_FOGOFWAR,
        ["teamView"] = false,
        ["lockedTeams"] = false
    })

    rttr:GetPlayer(0):SetNation(NAT_ROMANS)     -- nation romans, vikings, babylonians, africans, japanese
    rttr:GetPlayer(0):SetColor(0)               -- color 0:blue, 1:yellow, 2:red, 3:purple, 4:grey, 5:green, 6:orange, 7:cyan, 8:white, 9:brown
    rttr:GetPlayer(0):SetName('Octavian') 

    rttr:GetPlayer(1):SetAI(3)                  -- hard AI
    rttr:GetPlayer(1):SetNation(NAT_JAPANESE)   -- nation
    rttr:GetPlayer(1):SetColor(1)               -- yellow
    rttr:GetPlayer(1):SetName('Hakirawashi')         -- Enemy Name	
	
    rttr:GetPlayer(2):SetAI(3)                  -- hard AI
    rttr:GetPlayer(2):SetNation(NAT_JAPANESE)   -- nation
    rttr:GetPlayer(2):SetColor(2)               -- red
    rttr:GetPlayer(2):SetName('Tsunami')          -- Enemy Name	

    rttr:GetPlayer(3):SetAI(3)                  -- hard AI
    rttr:GetPlayer(3):SetNation(NAT_JAPANESE)   -- nation
    rttr:GetPlayer(3):SetColor(3)               -- purple
    rttr:GetPlayer(3):SetName('Yamauchi')       -- Enemy Name	
	
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
        rttr:GetWorld():AddAnimal( 1,  30, SPEC_FOX)	
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
	enforceBuildingCount(1, BLD_SAWMILL, 3, false)				
	enforceBuildingCount(1, BLD_BREWERY, 1, false)
	enforceBuildingCount(1, BLD_MILL, 2, false)
	enforceBuildingCount(1, BLD_BAKERY, 2, false)
	enforceBuildingCount(1, BLD_PIGFARM, 2, false)
	enforceBuildingCount(1, BLD_SLAUGHTERHOUSE, 2, false)
	enforceBuildingCount(1, BLD_DONKEYBREEDER, 1, false)		
	enforceBuildingCount(1, BLD_CHARBURNER, 1, false)
	enforceBuildingCount(1, BLD_IRONSMELTER, 2, false)
	enforceBuildingCount(1, BLD_ARMORY, 2, false)
	enforceBuildingCount(1, BLD_METALWORKS, 1, false)
	enforceBuildingCount(1, BLD_MINT, 2, false)
	
	enforceBuildingCount(2, BLD_FORESTER, 1, false)		
	enforceBuildingCount(2, BLD_SAWMILL, 3, false)				
	enforceBuildingCount(2, BLD_BREWERY, 1, false)
	enforceBuildingCount(2, BLD_MILL, 2, false)
	enforceBuildingCount(2, BLD_BAKERY, 2, false)
	enforceBuildingCount(2, BLD_PIGFARM, 2, false)
	enforceBuildingCount(2, BLD_SLAUGHTERHOUSE, 2, false)
	enforceBuildingCount(2, BLD_DONKEYBREEDER, 1, false)		
	enforceBuildingCount(2, BLD_CHARBURNER, 1, false)
	enforceBuildingCount(2, BLD_IRONSMELTER, 2, false)
	enforceBuildingCount(2, BLD_ARMORY, 2, false)
	enforceBuildingCount(2, BLD_METALWORKS, 1, false)
	enforceBuildingCount(2, BLD_MINT, 2, false)		
	
	enforceBuildingCount(3, BLD_FORESTER, 1, false)		
	enforceBuildingCount(3, BLD_SAWMILL, 3, false)				
	enforceBuildingCount(3, BLD_BREWERY, 1, false)
	enforceBuildingCount(3, BLD_MILL, 2, false)
	enforceBuildingCount(3, BLD_BAKERY, 2, false)
	enforceBuildingCount(3, BLD_PIGFARM, 2, false)
	enforceBuildingCount(3, BLD_SLAUGHTERHOUSE, 2, false)
	enforceBuildingCount(3, BLD_DONKEYBREEDER, 1, false)		
	enforceBuildingCount(3, BLD_CHARBURNER, 1, false)
	enforceBuildingCount(3, BLD_IRONSMELTER, 2, false)
	enforceBuildingCount(3, BLD_ARMORY, 2, false)
	enforceBuildingCount(3, BLD_METALWORKS, 1, false)
	enforceBuildingCount(3, BLD_MINT, 2, false)		
end

-------------------------------- set buildings --------------------------------
function addPlayerBld(p, onLoad)
    -- set buildings for all players
    rttr:GetPlayer(p):EnableAllBuildings()
    rttr:GetPlayer(p):DisableBuilding(BLD_CATAPULT)		
	
    if not(p == 0) then
        rttr:GetPlayer(p):SetRestrictedArea(
            nil, nil,       -- enable the whole map
                0,   0,
                0,   112,
                112, 112,
                112, 0,
            nil, nil
        )				
    end				
end


-------------------------------- set resources --------------------------------
-- Don't add goods/people onLoad!
function addPlayerRes(p, onLoad)
    if onLoad then return end
    rttr:GetPlayer(p):ClearResources()
    if(p >= 0) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  40,
            [GD_BOARDS      ] =  40,
            [GD_STONES      ] =  40,
            [GD_HAM         ] =  20,
            [GD_GRAIN       ] =  20,		
            [GD_FLOUR       ] =  10,			
            [GD_FISH        ] =  20,			
            [GD_MEAT        ] =  20,			
            [GD_BREAD       ] =  20,		
            [GD_WATER       ] =  20,
            [GD_BEER        ] =  20,
            [GD_COAL        ] =  10,
            [GD_IRONORE     ] =  10,
            [GD_GOLD        ] =  10,
            [GD_IRON        ] =  10,		
            [GD_COINS       ] =  10,		
            [GD_TONGS       ] =  2,	
            [GD_AXE         ] =  4,
            [GD_SAW         ] =  2,
            [GD_PICKAXE     ] =  4,
            [GD_HAMMER      ] =  4,
            [GD_SHOVEL      ] =  4,
            [GD_CRUCIBLE    ] =  4,
            [GD_RODANDLINE  ] =  2,
            [GD_SCYTHE      ] =  8,
	        [GD_CLEAVER     ] =  2,
            [GD_ROLLINGPIN  ] =  2,			
            [GD_BOW         ] =  2,
            [GD_SWORD       ] =  10,
            [GD_SHIELD      ] =  10,
            [GD_BOAT        ] =  10
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  100,
            [JOB_WOODCUTTER         ] =   8,
            [JOB_FISHER             ] =   4,
            [JOB_FORESTER           ] =   4,
            [JOB_CARPENTER          ] =   4,
            [JOB_STONEMASON         ] =   4,
            [JOB_HUNTER             ] =   4,
            [JOB_FARMER             ] =   8,
            [JOB_MILLER             ] =   4,
            [JOB_BAKER              ] =   4,
            [JOB_BUTCHER            ] =   4,
            [JOB_MINER              ] =   10,
            [JOB_BREWER             ] =   4,
            [JOB_PIGBREEDER         ] =   4,
            [JOB_DONKEYBREEDER      ] =   4,
            [JOB_IRONFOUNDER        ] =   2,
            [JOB_MINTER             ] =   2,
            [JOB_METALWORKER        ] =   2,
            [JOB_ARMORER            ] =   2,
            [JOB_BUILDER            ] =   10,
            [JOB_PLANER             ] =   10,
            [JOB_GEOLOGIST          ] =   10,
            [JOB_PRIVATE            ] =   23,
            [JOB_PRIVATEFIRSTCLASS  ] =   17,
            [JOB_SERGEANT           ] =   9,
            [JOB_OFFICER            ] =   5,
            [JOB_GENERAL            ] =   3,
            [JOB_SCOUT              ] =   8,
            [JOB_SHIPWRIGHT         ] =   2,
            [JOB_PACKDONKEY         ] =   20,
            [JOB_CHARBURNER         ] =   2
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
	
    if(     (x == 45) and (y == 59) ) then MissionEvent(9)
	elseif( (x == 87) and (y == 29) ) then MissionEvent(10)
	end
end

function onOccupied(p, x, y)
    -- only check human player
    if(p ~= 0) then
        return
    end
	if( (x == 70) and (y == 16) ) then MissionEvent(99)	
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
        rttr:GetWorld():AddStaticObject(70, 16, 560, 0xFFFF, 2)
    end
	
	if(e == 98) then
        rttr:GetPlayer(1):SetRestrictedArea()
	end

    if(e == 99) then
        -- TODO: EnableNextMissions()
        -- Show opened arc
        rttr:GetWorld():AddStaticObject(70, 16, 561, 0xFFFF, 2)
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
