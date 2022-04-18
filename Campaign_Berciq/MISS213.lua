------------------------------------------------------------------------------
-- LUA-Script for MISS213.WLD (mission 4 of the Berciq "Roman Campaign II"  --
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
eIdx = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 98, 99}

rttr:RegisterTranslations(
{
    en = -- story by Berciq --
    {
        Diary   = 'Diary',

        msg1    = 'How unbearable frost! \n\nPortal thrown our ship in the middle of the sea. During night the sea has frozen over, and our ship has been destroyed. Fortunately we were in short distance from land. \n\nDays are really short and lack of the sun is affecting each one of us. Close to sea temperature isn\'t changing that quickly so lets keep close to coastline. Here is little of space to build anything but we must manage somehow... In this narrow land pass even wood supply will not be obvious. Road to warmer south is blocked by huge mountain range and dangerous glaciers, if we don\'t secure the path people will not be willing to walk there. \n\nBuilders improved many projects. We can now restore almost half of building materials before burning it!',
        msgh1   = 'Let\'s find a place to build harbor and head south.',

        msg2    = 'We hardly recognized coal. It is covered with white frost layer.',

        msg3    = 'I heard rumors about iron sources in northern countries but I haven\'t realized they\'re so significant and speeded on such a huge area. Maybe this huge army is not what we seek for right now..',

        msg4    = 'This mountains are made out of granite! Well.. what a surprise.. who would knew.. I\'m something of a scientist myself',

        msg5    = 'Now I can mine Gold and conquer those Vikings!! However.. I dont know.. Indeed they haven\'t attacked us.. I\'m starting to feel bad with all this killing..',

		msg6	= 'So the Vikings took best land to settle! Anyway I have to admit they are doing great with sheeps and managing to grow anything on this unfertile soil. \n\nWeird though that they have no fortification at all. They\'re brawny and much better prepared for winter, even their huts despite using same amount of wood are much warmer inside.',
		
		msg7    = 'Our ship.. Neptun will take care of it',

		msg8	= 'Here is where iceberg ends, I can even hear how it cracks.',
		
		msg9	= 'Our bay has been cut off by this ice, It won\'t melt in following months.',
		
		msg10	= 'This tiny islands.. It is pointless to settle them.',

		msg11	= 'This molten badlands, meaningful message from our gods',

		msg12	= 'They have catapult! But they lack in accuracy. What is more our geologist says that their stone supply will end soon! I understand their anxiety but if we show our determination and tenacity they will tolerate our temporary presence here.. I hope..',
		msgh12	= 'Hold our position! At all cost! Avoid conflict! Survive! Then push slowly to south',

		msg13	= 'Good decision, this floating icebergs would smash our ship! We will have to go further by our feets..',	

		msg14	= 'Lets build here another harbor, seems like floating ice will not be that problem here. Just where to go..',
		
		msg15	= 'It is now possible to secure path through glacier, guards will help people if they stuck there. Both harbors seems useless now, it took us so long to build them..',

		msg16	= 'You did it You crazy son of Jupiter, You did it!',
		
		msg17	= 'I mistook the stars reflected in a sea at night for those in the sky.',
		
		msg18	= 'Strong wind, and this huge waves will challenge our sailing skills! Open sea is completely different than sheltered bay. We shall not risk taking everyone onboard. Much safer would be taking just tools with us.. ',

        msg99   = 'I\'m afraid human wouldn\'t place gate in such a place. Island can\'t be old, there are no trees, nor even bushers. I think this is gods cause and they are toying with us... \n\nWe got some tools with us because much people wants to stay in this land.. \n\nI know that we must move on through next gateway.. wait... can You smell it? ',
        msgh99  = '\n\nPortal opened in front of You! \nThe Chapter XV awaits you...',
},
    pl = -- translated by: Berciq --
    {
        Diary   = 'Dziennik',

        msg1    = 'Mróz nie do zniesienia. \n\nPortal wciągnął nas z całym statkiem i wyrzucił pośrodku morza. Płyneliśmy aż nastała noc i całe morze zamarzło niszcząc nas okręt. Szcęśliwie ląd był niedaleko. \n\nDni sa tutaj bardzo krótkie a niedobór słońca przybija każdego. \n\nNad brzegiem, temperatury nie wachają się tak drastycznie dlatego lepiej będzie podążać wzdłóż wybrzeża. Stoki gór odrazu toną w zatoce, przez co jest niewiele miejsca na budowę czegokolwiek ale jakoś musimy sobie z tym poradzić. Nawet z drewnem będzie tu kłopot. \n\nDrogę na cieplejsze południe blokują wysokie góry i niebezpieczny lodowiec. Dopóki nie zabezpieczymy drogi przy lodowcu dopóty nasi ludzie nie będą tamtendy chodzić \n\nNasz architekt zmienił plany budowli dzięki czemu możemy odzyskać blisko połowę zużytych materiałów przed zniszczeniem!',
        msgh1   = 'Znajdź dogodne miejsce na port i płyń na południe',

        msg2    = 'Ledwie rozpoznaliśmy pokryty białym szronem węgiel',

        msg3    = 'Słyszałem tylko opowieści o bogatych złożach żelaza na północy ale nie zdawałem sobie sprawy że są tak bogate!',

        msg4    = 'Nie do wiary, góry z których można pozyskać kamień.. któż by się spodziewał...',

        msg5    = 'Z takimi rezerwami złota mogę roznieść w pył tych wikingów!! Ale czy to wszystko ma sens, po prawdzie nas nie zaatakowali.. Zaczynam zatraacać granicę między tym co konieczne i niezbędne byśmy przetrwali a tym co chcę zrobić bo po prostu mogę i nikt mi się nie sprzeciwi..',

		msg6	= 'Vikingowie osiedlili się w najlepszym miejscu! Muszę przyznać że radzą sobie doskonale wypasając tu owce i pozyskując tak wysokie plony z przemarzniętej gleby. \n\nCo dziwne nie mają żadnej strażnicy, żadnego wojskowego obiektu który można byłoby zaatakować. Zapewne w razie ataku wszyscy staną do obrony swojej wioski. \n\nSą o wiele lepiej przystosowani do tych warunków, postawni i wysocy, nawet ich domy, mimo że zbudowane z takiej samej ilości drewna są o wiele cieplejsze w środku.',
		
		msg7    = 'Nasz statek.. Niechaj Neptun ma go w swej opiece...',

		msg8	= 'To tutaj kończy się lodowiec, słyszę nawet jak pęka.',
		
		msg9	= 'Nasza zatoka została odcięta przez lód. Prawdopodobnie nie stopnieje przez kilka najbliższych miesięcy.',
		
		msg10	= 'Nie ma potrzeby by zajmować te malutkie wysepki.',

		msg11	= 'Rozżarzone pustkowie, jakby bogowie starali się nam coś przekazać..',

		msg12	= 'Mają katapultę! Brakuje im co prawda celności i niedługo skończą się zapasy kamienia! Musimy pokazać, że nigdzie się stąd nie ruszymy, to być może nas tu zaakceptują.. Taką mam nadzieję..',
		msgh12	= 'Utrzymuj pozycję! Wszelkimi możliwymi środkami, Nie atakuj, przetrwaj! Jeśli się powiedzie udaj się dalej na południe',

		msg13	= 'Dobra decyzja, te góry lodowe zmiażdżyłyby nasz statek, dalej pójdziemy pieszo..',	

		msg14	= 'Miejsce na kolejny port, góry lodowe tutaj nie stanowią już tak dużego zagrożenia..',
		
		msg15	= 'Zabezpieczyliśmy drogę przez lodowiec, w razie kłopotów naszym ludziom pomogą żołnieże. Obydwa porty są nam teraz zbędne, a kosztowały nas tyle pracy..',

		msg16	= 'Na Jowisza! Jak Ci się udało tu dotrzeć!',
		
		msg17	= 'Nie myl nieba z gwiazdami odbitymi nocą na powierzchni morza',
		
		msg18	= 'Cóż za cholerny sztorm! Na otwartym morzu warunki są zupełnie inne niż w osłoniętej zatoce. Dwa z trzech statków zniknęły nam nocą, zostały nam same narzędzia.. ',

        msg99   = 'Żaden człowiek nie mógł tu wybudować portalu, Wyspa wygląda jakby niedawno wyłoniła się z morza, nie ma na niej krzaków ani nawet porostów. Bogowie, bawią się nami jak kukłami... \n\nBierzmy narzędzia.. Musimy iść dalej.. chwila... też to czujecie?',
        msgh99  = '\n\nPortal otworzył się przed tobą! \nMisja XV czeka...',
}
})


-- format mission texts
function MissionText(e)
    local msg = _('msg' .. tostring(e))
    local msgh = _('msgh'.. tostring(e))

    if(msg ~= ('msg' .. tostring(e)) and msgh ~= ('msgh'.. tostring(e))) then
        rttr:MissionStatement(0, _('Diary'), msg .. '\n\n\n\n\n\n\n' ..msgh.. '\n\n\n\n\n\n\n', IM_READER, true)
        rttr:SetMissionGoal(0, msgh)
    elseif(msg ~= ('msg' .. tostring(e))) then
        rttr:MissionStatement(0, _('Diary'), msg .. '\n\n\n\n\n\n\n', IM_READER, true)
    end
end


-------------------------------- general settings -----------------------------
function onSettingsReady()
    rttr:Log("-----------------------\n MISS213.lua loaded... \n-----------------------\n")
    rttr:ResetAddons()                          -- S2-settings
    rttr:SetAddon(ADDON_MILITARY_HITPOINTS, true)	
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetAddon(ADDON_CATAPULT_GRAPHICS, true)
	rttr:SetAddon(ADDON_MILITARY_AID, true)		
	rttr:SetAddon(ADDON_REFUND_MATERIALS, 2, true)		
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
        ["fow"] = EXP_CLASSIC,
        ["teamView"] = false,
        ["lockedTeams"] = false
    })

    rttr:GetPlayer(0):SetNation(NAT_ROMANS)     -- nation romans, vikings, babylonians, africans, japanese
    rttr:GetPlayer(0):SetColor(0)               -- color 0:blue, 1:yellow, 2:red, 3:purple, 4:grey, 5:green, 6:orange, 7:cyan, 8:white, 9:brown
    rttr:GetPlayer(0):SetName('Octavian') 

    rttr:GetPlayer(1):SetAI(3)                  -- hard AI
    rttr:GetPlayer(1):SetNation(NAT_VIKINGS)    -- nation
    rttr:GetPlayer(1):SetColor(1)               -- grey
    rttr:GetPlayer(1):SetName('Sven')           -- Enemy Name	
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
    for i = 0, 1 do                             -- set resources
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
        rttr:GetWorld():AddAnimal( 63,  40, SPEC_RABBITWHITE)
        rttr:GetWorld():AddAnimal( 50,  42, SPEC_SHEEP)		
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
	enforceBuildingCount(1, BLD_WOODCUTTER, 1, false)	
	enforceBuildingCount(1, BLD_FORESTER, 1, false)	
	enforceBuildingCount(1, BLD_SAWMILL, 1, false)
	enforceBuildingCount(1, BLD_METALWORKS, 1, false)
	enforceBuildingCount(1, BLD_CATAPULT, 1, false)	
end


-------------------------------- set buildings --------------------------------
function addPlayerBld(p, onLoad)
    -- set buildings for all players
    rttr:GetPlayer(p):EnableAllBuildings()
	
    if(p == 1) then
        rttr:GetPlayer(p):DisableBuilding(BLD_SHIPYARD, false)
	end	
	
    if(p == 0) then
        rttr:GetPlayer(p):DisableBuilding(BLD_CHARBURNER, false)
		rttr:GetPlayer(p):DisableBuilding(BLD_CATAPULT, false)					
		
    else
        rttr:GetPlayer(p):SetRestrictedArea(
            nil, nil,       -- enable the whole map
                0,   0,
                0,   127,
                127, 95,
                95, 0,
            nil, nil
        )
		
        if(p == 1) then
            if onLoad then return end
            rttr:GetPlayer(p):AIConstructionOrder(51, 80, BLD_CATAPULT)
            --rttr:GetPlayer(p):AIConstructionOrder(49, 88, BLD_PIGFARM)
            --rttr:GetPlayer(p):AIConstructionOrder(48, 84, BLD_FARM)
            rttr:GetPlayer(p):AIConstructionOrder(52, 81, BLD_LOOKOUTTOWER)
            rttr:GetPlayer(p):AIConstructionOrder(51, 83, BLD_SAWMILL)
            rttr:GetPlayer(p):AIConstructionOrder(53, 86, BLD_FORESTER)
            --rttr:GetPlayer(p):AIConstructionOrder(53, 84, BLD_WELL)
            --rttr:GetPlayer(p):AIConstructionOrder(50, 46, BLD_SLAUGHTERHOUSE)
            rttr:GetPlayer(p):AIConstructionOrder(50, 84, BLD_WOODCUTTER)			
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
			[GD_WOOD        ] =  0,
            [GD_BOARDS      ] =  15,
            [GD_STONES      ] =  0,
            [GD_HAM         ] =  0,
            [GD_GRAIN       ] =  20,		
            [GD_FLOUR       ] =  0,			
            [GD_FISH        ] =  6,			
            [GD_MEAT        ] =  0,			
            [GD_BREAD       ] =  0,		
            [GD_WATER       ] =  0,
            [GD_BEER        ] =  1,
            [GD_COAL        ] =  0,
            [GD_IRONORE     ] =  0,
            [GD_GOLD        ] =  0,
            [GD_IRON        ] =  0,		
            [GD_COINS       ] =  0,		
            [GD_TONGS       ] =  0,	
            [GD_AXE         ] =  0,
            [GD_SAW         ] =  0,
            [GD_PICKAXE     ] =  2,
            [GD_HAMMER      ] =  4,
            [GD_SHOVEL      ] =  4,
            [GD_CRUCIBLE    ] =  0,
            [GD_RODANDLINE  ] =  4,
            [GD_SCYTHE      ] =  2,
	        [GD_CLEAVER     ] =  1,
            [GD_ROLLINGPIN  ] =  1,			
            [GD_BOW         ] =  2,
            [GD_SWORD       ] =  0,
            [GD_SHIELD      ] =  0,
            [GD_BOAT        ] =  2
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  40,
            [JOB_WOODCUTTER         ] =   2,
            [JOB_FISHER             ] =   2,
            [JOB_FORESTER           ] =   2,
            [JOB_CARPENTER          ] =   2,
            [JOB_STONEMASON         ] =   2,
            [JOB_HUNTER             ] =   0,
            [JOB_FARMER             ] =   1,
            [JOB_MILLER             ] =   0,
            [JOB_BAKER              ] =   0,
            [JOB_BUTCHER            ] =   0,
            [JOB_MINER              ] =   3,
            [JOB_BREWER             ] =   1,
            [JOB_PIGBREEDER         ] =   1,
            [JOB_DONKEYBREEDER      ] =   0,
            [JOB_IRONFOUNDER        ] =   1,
            [JOB_MINTER             ] =   1,
            [JOB_METALWORKER        ] =   0,
            [JOB_ARMORER            ] =   4,
            [JOB_BUILDER            ] =   10,
            [JOB_PLANER             ] =   4,
            [JOB_GEOLOGIST          ] =   4,
            [JOB_PRIVATE            ] =   10,
            [JOB_PRIVATEFIRSTCLASS  ] =   0,
            [JOB_SERGEANT           ] =   0,
            [JOB_OFFICER            ] =   0,
            [JOB_GENERAL            ] =   0,
            [JOB_SCOUT              ] =   4,
            [JOB_SHIPWRIGHT         ] =   1,
            [JOB_PACKDONKEY         ] =   0,
            [JOB_CHARBURNER         ] =   0
        })

    elseif(p == 1) then
        -- goods
        rttr:GetPlayer(p):AddWares({
			[GD_WOOD        ] =  240,
            [GD_BOARDS      ] =  60,
            [GD_STONES      ] =  30,
            [GD_HAM         ] =  0,
            [GD_GRAIN       ] =  200,		
            [GD_FLOUR       ] =  0,			
            [GD_FISH        ] =  0,			
            [GD_MEAT        ] =  0,			
            [GD_BREAD       ] =  0,		
            [GD_WATER       ] =  200,
            [GD_BEER        ] =  0,
            [GD_COAL        ] =  200,
            [GD_IRONORE     ] =  200,
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
            [JOB_WOODCUTTER         ] =   1,
            [JOB_FISHER             ] =   1,
            [JOB_FORESTER           ] =   1,
            [JOB_CARPENTER          ] =   1,
            [JOB_STONEMASON         ] =   1,
            [JOB_HUNTER             ] =   1,
            [JOB_FARMER             ] =   1,
            [JOB_MILLER             ] =   1,
            [JOB_BAKER              ] =   1,
            [JOB_BUTCHER            ] =   1,
            [JOB_MINER              ] =   1,
            [JOB_BREWER             ] =   1,
            [JOB_PIGBREEDER         ] =   1,
            [JOB_DONKEYBREEDER      ] =   1,
            [JOB_IRONFOUNDER        ] =   1,
            [JOB_MINTER             ] =   1,
            [JOB_METALWORKER        ] =   1,
            [JOB_ARMORER            ] =   1,
            [JOB_BUILDER            ] =   1,
            [JOB_PLANER             ] =   1,
            [JOB_GEOLOGIST          ] =   1,
            [JOB_PRIVATE            ] =   1,
            [JOB_PRIVATEFIRSTCLASS  ] =   1,
            [JOB_SERGEANT           ] =   1,
            [JOB_OFFICER            ] =   1,
            [JOB_GENERAL            ] =   1,
            [JOB_SCOUT              ] =   1,
            [JOB_SHIPWRIGHT         ] =   0,
            [JOB_PACKDONKEY         ] =   1,
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
    if(     ((p == 0) and (o == 1)) or ((p == 1) and (o == 0)) ) then MissionEvent(6)
    end	
	
    -- onExplored events only check human player, You could erase following and then when enemy reach xy message will also be shown
    if(p ~= 0) then
        return
    end
	
    if(     (x == 20) and (y == 12) ) then MissionEvent(7)
    elseif( (x == 31) and (y == 39) ) then MissionEvent(8)
    elseif( (x == 35) and (y == 14) ) then MissionEvent(9)
    elseif( (x == 67) and (y == 26) ) then MissionEvent(10)	
    elseif( (x == 81) and (y == 72) ) then MissionEvent(11)	
    elseif( (x == 51) and (y == 80) ) then MissionEvent(12)	
    elseif( (x == 5) and (y == 107) ) then MissionEvent(17)	
    elseif( (x == 58) and (y == 115) ) then MissionEvent(18)		
	end
end

function onOccupied(p, x, y)
    -- only check human player
    if(p ~= 0) then
        return
    end

    if(     (x == 49) and (y == 62) ) then MissionEvent(13)	
    elseif( (x == 58) and (y == 100) ) then MissionEvent(14)	
    elseif( (x == 38) and (y == 44) ) then MissionEvent(15)	
	elseif( (x == 80) and (y == 37) ) then MissionEvent(16)	
	elseif( (x == 24) and (y == 107) ) then MissionEvent(99)
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
        rttr:GetWorld():AddStaticObject(24, 107, 560, 0xFFFF, 2)        -- Show arc
	end	
	  
    if(e == 98) then
        rttr:GetPlayer(1):SetRestrictedArea()
	end	
	
    if(e == 99) then
        rttr:GetWorld():AddStaticObject(24, 107, 561, 0xFFFF, 2)        -- Open arc
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
