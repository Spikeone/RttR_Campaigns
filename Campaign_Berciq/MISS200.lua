------------------------------------------------------------------------------
-- LUA-Script for MISS200.WLD (mission 1 of the Berciq "Roman Campaign II"  --
--                                                                          --
-- Author: (basing on CrazyL (v0.4)) by Berciq                              --
------------------------------------------------------------------------------

-------------------------------- TODO -----------------------------------------
-- EnableNextMissions()
-- Set Portraits
-------------------------------------------------------------------------------

-------------------------------- Lua Version used -----------------------------
function getRequiredLuaVersion()
    return 1.3
end

-------------------------------- mission events and texts ---------------------
-- Message-Window (mission statement and hints): 52 chars wide
eIdx = {1, 2, 3, 4, 5, 6, 98, 99}

rttr:RegisterTranslations(
{
    en = -- story by Berciq --
    { 
        Diary   = 'Diary',

        msg1    = 'We did it! \nAfter ten long years we are finally back to empire! \nI even recognize this mountains, we\'ve travelled by this pass \nto Marseille when I was young! \n\n\nPeople wants to settle here they don\'t want to fight anymore. \n\nI\'ll get some guards and head east there must be someone \nwho is waiting for the emperor to get home... \n\nBut first lets help my people, \nI feel obligated to help for their loyalty.',
        msgh1   = 'Move eastwards.',

        msg2    = 'Geologist has found coal but this is really thin layer... \n\nWell it is still better than nothing...',
        msgh2   = 'Consider building mine',

        msg3    = 'Iron ore has been spotted \nlooks like this mountains doesn\'t have rich sources...',
        msgh3   = 'Consider building mine',
		
        msg4    = 'This granite could be useful \nhowever... strange... it glitters in sun...',
        msgh4   = 'Consider building mine',

        msg5    = 'Slight amounts of gold but the luck is on our side. \nIt\'ll be enough to train few soldiers \nif I distribute it properly then even a general or two!',
        msgh5   = 'Consider building mine',		

		msg6    = 'The pass is guarded while I\'m treated like a stranger! \n\nLet\'s teach them their manners.. but how to? We must denounce an alliance treaty somehow It\'d be good to know if all soldiers woulnd are healed before next attack. \n\nThey are claiming that emperor hasn\'t disappeared and is ruling the Rome since 30 years! I\'ll show them what We\'ve learned in past 10 years!',
        msgh6   = 'Denounce an alliance treaty and persuade enemy to surrender',
		
        msg99   = 'The beacons are lit, they called for help... \n\nWhat is worse it is getting colder...',
        msgh99  = 'You have completed this mission.\nThe Chapter XII awaits you...'
},
    pl = -- translated by: Berciq --
    { 
        Diary   = 'Dziennik',

        msg1    = 'Udało nam się!! \nPo 10 latach tułaczki nareszcie powróciliśmy do imperium! \nRozpoznaję te szczyty, gdy byłem młodszy podróżowaliśmy tendy do Marsyli! \n\n\nLudzie któzy przyłączyli się do nas podczas tej pragną tu osiąść i zerwać z przeszłością. \n\nUdam się ze strażą na wschód, ktoś przecież musi czekać na cesarza.. \n\nale najpierw powinienem pomóc naszym ludziom, jestem im to winiem',
        msgh1   = 'Udaj się na wschód',

        msg2    = 'Znaleziono cienką warstwę węgla \n\nLepsze to niż nic...',
        msgh2   = 'Rozważ budowę kopalni',

        msg3    = 'Niewielkie ilości rudy żelaza \nZdaje się że nie natrafimy tu na nic lepszego...',
        msgh3   = 'Rozważ budowę sztolni',
		
        msg4    = 'Te skały przydadzą nam się do budowy \należ się mienią w tym słońcu...',
        msgh4   = 'Rozważ budowę kamieniołomu',

        msg5    = 'Drobiny złota, ale mamy szczęście. \nPowinno wystarczyć żeby wyszkolić kilku żołnieży \nKto wie, jeśli je dobrze rozdysponuję może nawet wyszkolimy generała!',
        msgh5   = 'Rozważ wydobycie złota w tym rejonie',		

		msg6    = 'Przełęcz jest strzeżona podczas gdy mnie traktują jak obcego!! \n\nPokażmy im ich miejsce, wypowiedzmy traktat pokojowy i zaatakujmy! Tylko wpierw się przygotujmy lepiej? \n\nMówią, że imperator wcale nie zniknął 10 lat temu \n\ni włada rzymem od ponad 30 lat! Pokażmy im czego się nauczyliśmy przed te wszystkie lata!',
        msgh6   = 'Wypowiedz traktat pokojowy i zmuś przeciwnika do poddania się!',
		
        msg99   = 'Zapalili wici! Wezwali posiłki \n\nCo gorsza robi się coraz chłodniej...',
        msgh99  = 'Ukończyłeś tą misję,\nRodzaiał XII czeka...'
} 
})


-- format mission texts
function MissionText(e)
    local msg = _('msg' .. tostring(e))
    local msgh = _('msgh'.. tostring(e))

    if(msg ~= ('msg' .. tostring(e)) and msgh ~= ('msgh'.. tostring(e))) then
        rttr:MissionStatement(0, _('Diary'), msg .. '\n\n\n\n\n\n\n' ..msgh.. '\n\n\n\n\n\n\n', IM_RIDER, true)
        rttr:SetMissionGoal(0, msgh)
    elseif(msg ~= ('msg' .. tostring(e))) then
        rttr:MissionStatement(0, _('Diary'), msg .. '\n\n\n\n\n\n\n', IM_RIDER, true)
    end

end


-------------------------------- general settings -----------------------------
function onSettingsReady()
    rttr:Log("-----------------------\n MISS200.lua loaded... \n-----------------------\n")
    rttr:ResetAddons()                          -- S2-settings
    rttr:SetAddon(ADDON_MILITARY_HITPOINTS, true)	
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetGameSettings({                      -- TEST
        ["fow"] = EXP_CLASSIC,
        ["teamView"] = false,
        ["lockedTeams"] = false
    })

    rttr:GetPlayer(0):SetNation(NAT_ROMANS)     -- nation
    rttr:GetPlayer(0):SetColor(0)               -- 0:blue, 1:red, 2:yellow, 
    rttr:GetPlayer(0):SetName('Octavian') 

    rttr:GetPlayer(1):SetAI(1)                  -- hard AI
    rttr:GetPlayer(1):SetNation(NAT_ROMANS)     -- nation
    rttr:GetPlayer(1):SetColor(1)               -- red
    rttr:GetPlayer(1):SetName('Aquarium')       -- Enemy Name
	
    rttr:GetPlayer(0):SetTeam(TM_TEAM1)
    rttr:GetPlayer(1):SetTeam(TM_TEAM1)
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
    rttr:GetPlayer(1):ModifyHQ(1)               -- tent	
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
        -- type 8 == 7 in rttr
        rttr:GetWorld():AddAnimal( 70,  72, SPEC_DUCK)
        rttr:GetWorld():AddAnimal( 26,  86, SPEC_RABBITWHITE)
        rttr:GetWorld():AddAnimal( 26,  87, SPEC_RABBITGREY)
        rttr:GetWorld():AddAnimal( 27,  88, SPEC_FOX)
        rttr:GetWorld():AddAnimal( 30,  88, SPEC_STAG)
        rttr:GetWorld():AddAnimal( 31,  86, SPEC_DEER)
        rttr:GetWorld():AddAnimal( 26, 101, SPEC_SHEEP)
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
    rttr:GetPlayer(p):DisableBuilding(BLD_CATAPULT, false)	
    rttr:GetPlayer(p):DisableBuilding(BLD_HARBORBUILDING, false)

    if(p == 0) then
        rttr:GetPlayer(p):DisableBuilding(BLD_CHARBURNER, false)
	end	
	
    if(p == 1) then
        rttr:GetPlayer(p):DisableBuilding(BLD_BARRACKS, false)
	end		
	
-- Building orders
		
    if(p == 1) then
        if onLoad then return end
        rttr:GetPlayer(p):AIConstructionOrder(51, 18, BLD_FORESTER)
        rttr:GetPlayer(p):AIConstructionOrder(55, 20, BLD_WOODCUTTER)
        rttr:GetPlayer(p):AIConstructionOrder(51, 25, BLD_WOODCUTTER)
        rttr:GetPlayer(p):AIConstructionOrder(55, 22, BLD_SAWMILL)		
        rttr:GetPlayer(p):AIConstructionOrder(45, 23, BLD_GUARDHOUSE)		
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

        -- people
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
            [JOB_PRIVATE            ] =   3,
            [JOB_PRIVATEFIRSTCLASS  ] =   0,
            [JOB_SERGEANT           ] =   0,
            [JOB_OFFICER            ] =   0,
            [JOB_GENERAL            ] =   0,
            [JOB_SCOUT              ] =   2,
            [JOB_SHIPWRIGHT         ] =   0,
            [JOB_PACKDONKEY         ] =   4,
            [JOB_CHARBURNER         ] =   0
        })

    elseif(p == 1) then
        -- goods
        rttr:GetPlayer(p):AddWares({
            [GD_BEER        ] =  0,
            [GD_TONGS       ] =  0,
            [GD_HAMMER      ] =  0,
            [GD_AXE         ] =  0,
            [GD_SAW         ] =  0,
            [GD_PICKAXE     ] =  0,
            [GD_SHOVEL      ] =  0,
            [GD_CRUCIBLE    ] =  0,
            [GD_RODANDLINE  ] =  0,
            [GD_SCYTHE      ] =  0,
            [GD_WATER       ] =  0,
            [GD_CLEAVER     ] =  0,
            [GD_ROLLINGPIN  ] =  0,
            [GD_BOW         ] =  0,
            [GD_BOAT        ] =  0,
            [GD_SWORD       ] =  0,
            [GD_IRON        ] =  0,
            [GD_FLOUR       ] =  0,
            [GD_FISH        ] = 10,
            [GD_BREAD       ] = 10,
            [GD_SHIELD      ] =  0,
            [GD_WOOD        ] =  0,
            [GD_BOARDS      ] = 10,
            [GD_STONES      ] =  5,
            [GD_GRAIN       ] =  0,
            [GD_COINS       ] =  0,
            [GD_GOLD        ] =  0,
            [GD_IRONORE     ] =  0,
            [GD_COAL        ] =  0,
            [GD_MEAT        ] = 10,
            [GD_HAM         ] =  0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 50,
            [JOB_WOODCUTTER         ] =  3,
            [JOB_FISHER             ] =  0,
            [JOB_FORESTER           ] =  1,
            [JOB_CARPENTER          ] =  2,
            [JOB_STONEMASON         ] =  0,
            [JOB_HUNTER             ] =  1,
            [JOB_FARMER             ] =  0,
            [JOB_MILLER             ] =  0,
            [JOB_BAKER              ] =  0,
            [JOB_BUTCHER            ] =  0,
            [JOB_MINER              ] =  2,
            [JOB_BREWER             ] =  0,
            [JOB_PIGBREEDER         ] =  0,
            [JOB_DONKEYBREEDER      ] =  0,
            [JOB_IRONFOUNDER        ] =  0,
            [JOB_MINTER             ] =  0,
            [JOB_METALWORKER        ] =  0,
            [JOB_ARMORER            ] =  0,
            [JOB_BUILDER            ] =  6,
            [JOB_PLANER             ] =  6,
            [JOB_GEOLOGIST          ] =  6,
            [JOB_PRIVATE            ] =  0,
            [JOB_PRIVATEFIRSTCLASS  ] =  0,
            [JOB_SERGEANT           ] =  0,
            [JOB_OFFICER            ] =  4,
            [JOB_GENERAL            ] =  0,
            [JOB_SCOUT              ] =  2,
            [JOB_SHIPWRIGHT         ] =  0,
            [JOB_PACKDONKEY         ] =  5,
            [JOB_CHARBURNER         ] =  0
        })
    end
end


-------------------------------- mission events -------------------------------
function onOccupied(p, x, y)
    -- only check human player
    if(p ~= 0) then
        return
    end

    if( (x == 52) and (y == 23) ) then MissionEvent(99)
    end
    
    if(not rttr:GetPlayer(1):IsInRestrictedArea(x, y)) then 
        MissionEvent(98) -- for lifting restrictions
    end
    
end

function onExplored(p, x, y, o)
    -- onContact events
    if(     ((p == 0) and (o == 1)) or ((p == 1) and (o == 0)) ) then MissionEvent(6)
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

    elseif(e == 99) then
        -- TODO: EnableNextMissions()
        -- Show opened arc
        rttr:GetWorld():AddStaticObject(52, 23, 561, 0xFFFF, 2)
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
