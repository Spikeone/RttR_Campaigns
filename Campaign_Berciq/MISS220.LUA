------------------------------------------------------------------------------
-- LUA-Script for MISS220.WLD (ending of Berciq "Roman Campaign II"  		--
--                                                                          --
-- Author: (basing on CrazyL (v0.4)) by Berciq                              --
------------------------------------------------------------------------------

function getRequiredLuaVersion()
    return 1.0
end

eIdx = {1, 2, 3, 4, 5, 6, 98, 99}

rttr:RegisterTranslations(
{
    en = -- story by Berciq --
    { 
        Diary   = 'Diary',

        msg1    = 'This cannot be! We are again on this devil island where all begun. \n\nNone of our building has survied this 20 years.. or is it differnt.. Island look unspoiled, like noone ever been here.. just this portal. \nI made my decision long time ago, just now i find strenght to do this. \nWe must destroy it, and end this madness once and for all!',
		msgh1	= 'Ensure supplies, explore island, we will take care of the gateway',

        msg2    = 'I was sure that we\'ve had exploited all resources before..',

        msg3    = 'We were drinking water from the spring close to lake.. in the morning we felt stronger and looked younger.. \n\nI started to think about us as about plague for nature of all this places we\'ve been so far. We spoiled all this habitats leaving nothing but choped down forests, exhausted resources and empty lakes. This time we\'ll try to do it in proper way.',
		mshg3 	= 'We don\'t need that much to survie.'
		
        msg4    = 'After all this days we look almost same as at the day our ship wrecked. We have also sucesfully destroyed the gateway. Now we will destroy the fountain of youth',

        msg5    = 'We know how to build harbor and construct ships, we must find a proper place and escape from this island... Weather is going bad!',
		msgh5	= 'Let\'s build harbor and leave this island',

		msg6    = 'There was a storm this night... \nIn the morning we saw a shipwreck...  \n...the waves washed the bodies ashore... \n\n...It was our corpses... ',
        msgh6   = 'We dug our own graves and buried ourselves...',
		
        msg99   = 'We left this devil island, with all its secrets burried..',
        msgh99  = 'We are heading Rome, like nothing ever happened. If I\'m correct, we will have opportunity to got back to our families, to our previous lives, before it all had happend. \n\nWe should never enter this gate. I felt that all we\'ve done was planned by someone else. \n\nBut in the end I\'m glad that all this decisions brought us to the place we are now, safe, sailing back to home... \nThank You, whoever You were..',
},
    pl = -- translated by: Berciq --
    { 
        Diary   = 'Dziennik',

        msg1    = 'Niemożliwe! Znów jesteśmy na tej piekelniej wyspie od której wszystko się zaczęło! \n\nŻaden z naszych budynków nie przetrwał tych dwudziestu lat.. a może.. nie.. Wyspa wygląda na nietkniętą ludzką ręką, tylko ten przeklęty portal. \n\nPodjąłem już deczyzję, musimy zniszczyć portal i zakończyć to całe szaleństwo raz na zawsze!',
 		msgh1	= 'Zapewnij ludziom zapasy i bezpieczeństwo. Odkryj pozostałą część wyspy',       
		
		msg2    = 'Mógłbym przysiąc, że wyczerpaliśmy wszystkie zasoby poprzednim razem...',

        msg3    = 'Piliśmy wodę ze źródła. Rankiem czuliśmy się młodsi i silniejsi..\n\nZaczynam myśleć o naszych poczynaniach jak o pladze nawiedzającej każde z miejsc które odwiedzamy. Poza wykarczowanymi puszczami, ogołoconymi z zasobów górami i jeziorami pozbawionymi ryb nie pozostaje po nas nic innego. Tym razem postaramy się zrobić inaczej.',
		mshg3 	= 'Wcale tak wiele do przetrwania tutaj nam nie trzeba.'
		
        msg4    = 'Po tych kilku tygodniach na wyspie znów wyglądamy jak wtedy kiedy roztrzaskaliśmy się o skały dwadzieścia lat temu. Udało nam się również zniszczyć portal.',

        msg5    = 'Wiemy jak wybudować okręt i załadować go w porcie. Znajdźmy odpowiednie miejsce i opuścmy tą wyspę raz na zawsze... Prędzej bo pogoda zaczyna się psuć.',
		msgh5	= 'Zbuduj port i opuść wyspę',

		msg6    = 'Nocą przyszedł potężny sztorm... \nRankiem zobaczyliśmy wrak roztrzaskany o skały...  \n...Morze wyrzuciło na brzeg ciała... \n\n...to były nasze ciała... ',
        msgh6   = 'Sami wykopaliśmy własne gróby i pogrzebaliśmy się...',
		
        msg99   = 'Opuściliśmy tą przeklętą wyspę ze wszystkimi jej sekretami..',
        msgh99  = 'Płyniemy do Rzymu, jakby nic się nigdy nie wydarzyło. Jeśli się nie mylę powrócimy znów do naszych domów, do naszych rodzi i naszego poprzedniego życia, zanim to wszystko się wydarzyło. \n\nNie powinniśmy byli wchodzić w ten portal. Czułem jakby każdą moją decyzję podejmował ktoś inny. \n\nOstatecznie jednak cieszę się, że te wszystkie decyzje doprowadziły nas tutaj spowrotem, bezpiecznych, wracających nareszcie do domów... \nDziękuję, kimkolwiek byłeś..',
}
})

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

function onSettingsReady()
    rttr:Log("-----------------------\n MISS_220.lua loaded... \n-----------------------\n")
    rttr:ResetAddons()
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
    rttr:SetAddon(ADDON_BURN_DURATION, 3)	
    rttr:SetAddon(ADDON_SEA_ATTACK, true)
    rttr:SetAddon(ADDON_INEXHAUSTIBLE_MINES, true)	
	rttr:SetAddon(ADDON_INEXHAUSTIBLE_FISH, true)	
	
    rttr:SetGameSettings({
        ["fow"] = EXP_CLASSIC,
        ["teamView"] = false,
        ["lockedTeams"] = false
    })

    rttr:GetPlayer(0):SetNation(NAT_ROMANS)
    rttr:GetPlayer(0):SetColor(0)
    rttr:GetPlayer(0):SetName('Octavian')
end

function getAllowedChanges()    
    return  { 
        ["addonsAll"]   = false,
        ["ownNation"]   = false,
        ["ownColor"]    = true,
        ["ownTeam"]     = false,
        ["aiNation"]    = false, 
        ["aiColor"]     = false,
        ["aiTeam"]      = false
            }    
end

function onStart(isFirstStart)
    rttr:GetPlayer(0):ModifyHQ(1)
    for i = 0, (rttr:GetPlayerCount() - 1) do
        addPlayerRes(i, not isFirstStart)
        addPlayerBld(i, not isFirstStart)
    end

    eState = {}
    for _, i in ipairs(eIdx) do
        eState[i] = 1
    end

    if not isFirstStart then
        for i = 1, eHist["n"] do
            MissionEvent(eHist[i], true)
        end

    else
        eHist = {["n"] = 0}
        MissionEvent(1)
    end
    
    if isFirstStart then
        rttr:GetWorld():AddAnimal(0,  0, SPEC_DEER)
    end
end

function onSave(saveGame)
    saveGame:PushInt(eHist["n"])
    for i = 1, eHist["n"] do
        saveGame:PushInt(eHist[i])
    end
    return true
end

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

	enforceBuildingCount(0, BLD_FORESTER, 2, false)	
	enforceBuildingCount(0, BLD_WOODCUTTER, 4, false)	
	enforceBuildingCount(0, BLD_QUARRY, 1, false)			
	enforceBuildingCount(0, BLD_SAWMILL, 1, false)				
		
	enforceBuildingCount(0, BLD_HUNTER, 1, false)	
	enforceBuildingCount(0, BLD_FISHERY, 1, false)

	enforceBuildingCount(0, BLD_WELL, 4, false)		
	enforceBuildingCount(0, BLD_FARM, 5, false)
	enforceBuildingCount(0, BLD_BREWERY, 1, false)
	enforceBuildingCount(0, BLD_MILL, 1, false)
	enforceBuildingCount(0, BLD_BAKERY, 1, false)
	enforceBuildingCount(0, BLD_PIGFARM, 1, false)
	enforceBuildingCount(0, BLD_SLAUGHTERHOUSE, 1, false)
	enforceBuildingCount(0, BLD_DONKEYBREEDER, 1, false)		
	enforceBuildingCount(0, BLD_CHARBURNER, 1, false)

	enforceBuildingCount(0, BLD_BARRACKS, 3, false)
	enforceBuildingCount(0, BLD_GUARDHOUSE, 3, false)
	enforceBuildingCount(0, BLD_WATCHTOWER, 3, false)		
	enforceBuildingCount(0, BLD_FORTRESS, 3, false)
	enforceBuildingCount(0, BLD_CATAPULT, 2, false)		
	enforceBuildingCount(0, BLD_LOOKOUTTOWER, 2, false)
		
	enforceBuildingCount(0, BLD_COALMINE, 2, false)
	enforceBuildingCount(0, BLD_IRONMINE, 1, false)
	enforceBuildingCount(0, BLD_GOLDMINE, 1, false)
	enforceBuildingCount(0, BLD_GRANITEMINE, 1, false)

	enforceBuildingCount(0, BLD_IRONSMELTER, 1, false)
	enforceBuildingCount(0, BLD_ARMORY, 1, false)
	enforceBuildingCount(0, BLD_METALWORKS, 1, false)
	enforceBuildingCount(0, BLD_MINT, 1, false)		
		
	enforceBuildingCount(0, BLD_SHIPYARD, 1, false)	
	enforceBuildingCount(0, BLD_STOREHOUSE, 1, false)			
	enforceBuildingCount(0, BLD_HARBORBUILDING, 3, false)		
end

function addPlayerBld(p, onLoad)
    rttr:GetPlayer(p):EnableAllBuildings()

	if(p ~= 0) then
        rttr:GetPlayer(p):SetRestrictedArea(
            nil, nil,
                0,   0,
                0,   62,
                63,  62,
                63,  0,
            nil, nil
        )		
	end
end

function addPlayerRes(p, onLoad)
    if onLoad then return end
    rttr:GetPlayer(p):ClearResources()
    if(p == 0) then
        rttr:GetPlayer(p):AddWares({
            [GD_BEER        ] =  0,
            [GD_TONGS       ] =  1,
            [GD_HAMMER      ] =  0,
            [GD_AXE         ] =  4,
            [GD_SAW         ] =  2,
            [GD_PICKAXE     ] =  0,
            [GD_SHOVEL      ] =  2,
            [GD_CRUCIBLE    ] =  0,
            [GD_RODANDLINE  ] =  0,
            [GD_SCYTHE      ] =  5,
            [GD_WATER       ] =  3,
            [GD_CLEAVER     ] =  1,
            [GD_ROLLINGPIN  ] =  0,
            [GD_BOW         ] =  0,
            [GD_BOAT        ] =  0,
            [GD_SWORD       ] =  1,
            [GD_IRON        ] =  0,
            [GD_FLOUR       ] =  3,
            [GD_FISH        ] =  3,
            [GD_BREAD       ] =  4,
            [GD_SHIELD      ] =  1,
            [GD_WOOD        ] =  5,
            [GD_BOARDS      ] = 20,
            [GD_STONES      ] = 20,
            [GD_GRAIN       ] = 10,
            [GD_COINS       ] =  0,
            [GD_GOLD        ] =  0,
            [GD_IRONORE     ] =  0,
            [GD_COAL        ] =  0,
            [GD_MEAT        ] =  2,
            [GD_HAM         ] =  3
        })

        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] =  10,
            [JOB_WOODCUTTER         ] =   0,
            [JOB_FISHER             ] =   0,
            [JOB_FORESTER           ] =   0,
            [JOB_CARPENTER          ] =   0,
            [JOB_STONEMASON         ] =   4,
            [JOB_HUNTER             ] =   0,
            [JOB_FARMER             ] =   0,
            [JOB_MILLER             ] =   1,
            [JOB_BAKER              ] =   1,
            [JOB_BUTCHER            ] =   0,
            [JOB_MINER              ] =   3,
            [JOB_BREWER             ] =   1,
            [JOB_PIGBREEDER         ] =   1,
            [JOB_DONKEYBREEDER      ] =   1,
            [JOB_IRONFOUNDER        ] =   1,
            [JOB_MINTER             ] =   0,
            [JOB_METALWORKER        ] =   0,
            [JOB_ARMORER            ] =   1,
            [JOB_BUILDER            ] =   6,
            [JOB_PLANER             ] =   6,
            [JOB_GEOLOGIST          ] =   4,
            [JOB_PRIVATE            ] =   4,
            [JOB_PRIVATEFIRSTCLASS  ] =   0,
            [JOB_SERGEANT           ] =   0,
            [JOB_OFFICER            ] =   0,
            [JOB_GENERAL            ] =   0,
            [JOB_SCOUT              ] =   2,
            [JOB_SHIPWRIGHT         ] =   0,
            [JOB_PACKDONKEY         ] =   4,
            [JOB_CHARBURNER         ] =   0
        })
    end
end

function onResourceFound(p, x, y, rIdx, q)
    if(p ~= 0) then
        return
    end

    if(rIdx == RES_COAL) then           MissionEvent(2)
    elseif(rIdx == RES_IRON) then       MissionEvent(2)
    elseif(rIdx == RES_GRANITE) then    MissionEvent(2)
    elseif(rIdx == RES_GOLD) then       MissionEvent(2)
    end
end

function onExplored(p, x, y)
    if(p ~= 0) then
        return
    end

    if( (x == 32) and (y == 52) ) then MissionEvent(6)		
	end
end

function onOccupied(p, x, y)
    if(p ~= 0) then
        return
    end

	if( 	(x == 32) and (y ==  8) ) then MissionEvent(3)
    elseif( (x == 37) and (y == 26) ) then MissionEvent(4)		 
	elseif( (x == 35) and (y == 31) ) then MissionEvent(5)	
    elseif( (x ==  1) and (y ==  1) ) then MissionEvent(99)		
    end
	
	if(not rttr:GetPlayer(0):IsInRestrictedArea(x, y)) then 
        MissionEvent(98)
    end		
end

function MissionEvent(e, onLoad)
    if(eState[e] <= 0) then
        return
    end

    if(e == 1) then
        rttr:GetWorld():AddStaticObject(14, 8, 561, 0xFFFF, 2)
    end

    if(e == 3) then
        rttr:GetWorld():AddStaticObject(14, 8, 560, 0xFFFF, 2)
    end

    if(e == 4) then
        rttr:GetWorld():AddStaticObject(13, 7, 523, 0xFFFF, 1)
        rttr:GetWorld():AddStaticObject(14, 8, 524, 0xFFFF, 1)
        rttr:GetWorld():AddStaticObject(14, 9, 522, 0xFFFF, 1)		
    end
	
	if(e == 98) then
        rttr:GetPlayer(0):SetRestrictedArea()
	end

    eState[e] = eState[e] - 1

    if not onLoad then
        rttr:Log(">> Event: " .. e .. ",\teState[" .. e .. "] = " .. eState[e])
        eHist["n"] = eHist["n"] + 1
        eHist[eHist["n"]] = e
        MissionText(e)
    end
end
