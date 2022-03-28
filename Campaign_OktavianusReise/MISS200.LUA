------------------------------------------------------------------------------
--                                                                          --
--                                                                          --
--                                                                          --
------------------------------------------------------------------------------


-------------------------------- TODO -----------------------------------------
-- EnableNextMissions()
-- Set Portraits
-------------------------------------------------------------------------------


-------------------------------- Lua Version used -----------------------------
function getRequiredLuaVersion()
    return 1
end


-------------------------------- mission events and texts ---------------------
eIdx = {1, 2, 3, 4, 99}

rttr:RegisterTranslations(
{ 
    en = 
    { 
        Diary   = 'Diary',

        msg1    = 'Erster Tag.\n\nEs ist alles so eingetroffen, wie es mir mein weiser\nGroßvater immer erzählt hat. Wir folgten in der Nacht\ndes Jupiter dem hellen Licht am Horizont. Doch meine\nMänner erzählten mir, als ich mich bereits zur Ruhe\nlegte, dass auch sie plötzlich alle müde wurden und\neinschliefen.\nDas Nächste, woran wir uns erinnerten, ist, dass wir auf dieser Sanddüne gelandet sind. Das Schiff ist untüchtig, aber wir haben genug Rohstoffe dabei, um eine Siedlung aufzubauen und nach dem ersten Tor zu suchen.',
        msgh1   = 'Bauen Sie wie gewohnt Ihre Siedlung auf.',

        msg2    = '4.Tag im 1.Monat.\n\nUnsere Erkunder berichten von einem weiten,\nunbebauten Land im Westen. Dieses werden wir\nbrauchen, um eine schlagkräftige Siedlung aufzubauen.\nZusätzlich sollten wir Schiffe bauen und nach\nrohstoffreichen Inseln Ausschau halten. Vielleicht\nkönnen wir auch so den Gegnern in den Rücken fallen.',
        msgh2   = 'Bauen Sie einen Hafen und starten Sie eine\nExpedition.',

        msg3    = '11. Tag im 6. Monat.\n\nWir haben eine Insel entdeckt. Auf ihr befinden sich vielversprechende Gebirge. Mit etwas Glück gibt es Goldvorkommen, sodass wir unsere Soldaten befördern können.',
        msg3h   = 'Bauen Sie die Rohstoffe ab und suchen Sie nach dem\nTor.',
        
        msg4    = '9. Tag im 11. Monat.\n\nFeindkontakt! Es sind ebenfalls Römer. Die Frage ist\nnur, ob sie auch nach dem Tor suchen. Jedenfalls\nscheinen sie uns nicht wohlgesonnen zu sein. Wir\nhaben einen Erkunder ausgeschickt, um mit den Römern\nin Kontakt zu treten. Doch als er nicht wiederkam,\nsendeten wir einen zweiten aus, der nur noch die\nMütze des ersten fand. Er berichtete weiterhin, dass\nhinter einem kleinen Gebirge auffällig viele Soldaten\nund Gelehrte umherirrten. Er vermutet, dass sich dort\ndas Tor befindet.',
        msg4h   = 'Dringen Sie weiter nach Westen vor und besetzen Sie\ndas Tor!',

        msg99   = '1. Tag im 5. Monat des 2. Jahres.\n\nWir haben das Tor gefunden und in unseren Besitz\ngebracht! Glücklicherweise wussten unsere Feinde\nnicht, wie man es aktiviert, sonst wäre es für uns\nwohl zu spät gewesen.\n\nNun bin ich sehr gespannt, welche Prüfungen uns die\nGötter auferlegen werden. Ich bin zuversichtlich,\ndass wir erfolgreich sein werden.',
        msg99h  = 'Auf gehts in das nächste Kapitel!',
    },
    de = 
    {
        Diary   = 'Tagebuch',

        msg1    = 'Erster Tag.\n\nEs ist alles so eingetroffen, wie es mir mein weiser\nGroßvater immer erzählt hat. Wir folgten in der Nacht\ndes Jupiter dem hellen Licht am Horizont. Doch meine\nMänner erzählten mir, als ich mich bereits zur Ruhe\nlegte, dass auch sie plötzlich alle müde wurden und\neinschliefen.\nDas Nächste, woran wir uns erinnerten, ist, dass wir auf dieser Sanddüne gelandet sind. Das Schiff ist untüchtig, aber wir haben genug Rohstoffe dabei, um eine Siedlung aufzubauen und nach dem ersten Tor zu suchen.',
        msgh1   = 'Bauen Sie wie gewohnt Ihre Siedlung auf.',

        msg2    = '4.Tag im 1.Monat.\n\nUnsere Erkunder berichten von einem weiten,\nunbebauten Land im Westen. Dieses werden wir\nbrauchen, um eine schlagkräftige Siedlung aufzubauen.\nZusätzlich sollten wir Schiffe bauen und nach\nrohstoffreichen Inseln Ausschau halten. Vielleicht\nkönnen wir auch so den Gegnern in den Rücken fallen.',
        msgh2   = 'Bauen Sie einen Hafen und starten Sie eine\nExpedition.',

        msg3    = '11. Tag im 6. Monat.\n\nWir haben eine Insel entdeckt. Auf ihr befinden sich vielversprechende Gebirge. Mit etwas Glück gibt es Goldvorkommen, sodass wir unsere Soldaten befördern können.',
        msg3h   = 'Bauen Sie die Rohstoffe ab und suchen Sie nach dem\nTor.',
        
        msg4    = '9. Tag im 11. Monat.\n\nFeindkontakt! Es sind ebenfalls Römer. Die Frage ist\nnur, ob sie auch nach dem Tor suchen. Jedenfalls\nscheinen sie uns nicht wohlgesonnen zu sein. Wir\nhaben einen Erkunder ausgeschickt, um mit den Römern\nin Kontakt zu treten. Doch als er nicht wiederkam,\nsendeten wir einen zweiten aus, der nur noch die\nMütze des ersten fand. Er berichtete weiterhin, dass\nhinter einem kleinen Gebirge auffällig viele Soldaten\nund Gelehrte umherirrten. Er vermutet, dass sich dort\ndas Tor befindet.',
        msg4h   = 'Dringen Sie weiter nach Westen vor und besetzen Sie\ndas Tor!',

        msg99   = '1. Tag im 5. Monat des 2. Jahres.\n\nWir haben das Tor gefunden und in unseren Besitz\ngebracht! Glücklicherweise wussten unsere Feinde\nnicht, wie man es aktiviert, sonst wäre es für uns\nwohl zu spät gewesen.\n\nNun bin ich sehr gespannt, welche Prüfungen uns die\nGötter auferlegen werden. Ich bin zuversichtlich,\ndass wir erfolgreich sein werden.',
        msg99h  = 'Auf gehts in das nächste Kapitel!',
    }
})

-- format mission texts
function MissionText(e, silent)
    local msg = _('msg' .. tostring(e))
    local msgh = _('msgh'.. tostring(e))

    if(msg ~= ('msg' .. tostring(e)) and msgh ~= ('msgh'.. tostring(e))) then
        if not silent then
            rttr:MissionStatement(0, _('Diary'), msg .. '\n\n\n\n\n\n\n' ..msgh.. '\n\n\n\n\n\n\n', IM_SWORDSMAN, true)
        end
        rttr:SetMissionGoal(0, msgh)
    elseif(msg ~= ('msg' .. tostring(e))) then
        if not silent then
            rttr:MissionStatement(0, _('Diary'), msg .. '\n\n\n\n\n\n\n', IM_SWORDSMAN, true)
        end
    else
        rttr:Log("Error: no Translation found!" .. _('msg1'))
    end
end

-------------------------------- general settings -----------------------------
function onSettingsReady()
    rttr:Log("-----------------------\n MISS200.lua loaded... \n-----------------------\n")
    rttr:ResetAddons()
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetGameSettings({
        ["fow"] = EXP_CLASSIC,
        ["teamView"] = false,
        ["lockedTeams"] = false
    })

    rttr:GetPlayer(0):SetNation(NAT_ROMANS)     -- nation
    rttr:GetPlayer(0):SetColor(0)               -- 0:blue, 1:red, 2:yellow
    rttr:GetPlayer(0):SetName('Octavianus')     -- Enemy Name

    -- !GLOBAL_ADD_COMPUTER_PLAYER 1 1
    rttr:GetPlayer(1):SetAI(3)              -- hard AI
    rttr:GetPlayer(1):SetNation(NAT_ROMANS) -- nation
    rttr:GetPlayer(1):SetColor(1)           -- yellow
    rttr:GetPlayer(1):SetName('Julius')     -- Enemy Name

    -- !GLOBAL_ADD_COMPUTER_PLAYER 2 2
    rttr:GetPlayer(2):SetAI(3)              -- hard AI
    rttr:GetPlayer(2):SetNation(NAT_ROMANS) -- nation
    rttr:GetPlayer(2):SetColor(2)           -- red
    rttr:GetPlayer(2):SetName('Brutus')     -- Enemy Name

    --!GLOBAL_SET_COMPUTER_ALLIANCE 1  2
    --!GLOBAL_SET_COMPUTER_ALLIANCE 2  1
    rttr:GetPlayer(1):SetTeam(TM_TEAM1)
    rttr:GetPlayer(2):SetTeam(TM_TEAM1)

    -- Setting HQs is not done via script (use mapeditor)
    --!SET_HOUSE 24  111   31
    --!SET_HOUSE 24  32   32
    --!SET_HOUSE 24  44   53
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
    --!GLOBAL_SET_HQ_BOBS	 6, 7, 0
    rttr:GetPlayer(0):ModifyHQ(1)

    addPlayerRes(0, not isFirstStart)
    addPlayerBld(0, not isFirstStart) --!DISABLE_HOUSE 23

    addPlayerRes(1, not isFirstStart)
    addPlayerBld(1, not isFirstStart) --!DISABLE_HOUSE 23

    addPlayerRes(2, not isFirstStart)
    addPlayerBld(2, not isFirstStart) --!DISABLE_HOUSE 23

    eState = {}                                 -- disable all events
    for _, i in ipairs(eIdx) do
        eState[i] = 0
    end

    for _, i in ipairs({1, 2, 3, 4, 99}) do -- set events as active
        eState[i] = 1
    end

    if not isFirstStart then                    -- initialize history of all called events, event counter at ["n"]
        for i = 1, eHist["n"] do
            MissionEvent(eHist[i], true)        -- call events without mission text to activate all achievements
        end
    else
        eHist = {["n"] = 0}
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
    --!DISABLE_HOUSE 23
    rttr:GetPlayer(p):DisableBuilding(BLD_HARBORBUILDING)
    
    --!GLOBAL_SET_COMPUTER_BARRIER 15 70   35
    -- 15: Radius
    -- 70: X
    -- 35: Y
    if (p ~= 0) then
        rttr:GetPlayer(p):SetRestrictedArea(
            nil, nil,       -- enable the whole map
                0,   0,
                0,   96,
                128, 96,
                128, 0,
            nil, nil,
                55, 35,
                63, 20,
                77, 20,
                85, 35,
                78, 50,
                63, 50,
            nil, nil
        )
    end
end

-------------------------------- set resources --------------------------------
function addPlayerRes(p, onLoad)
    if onLoad then return end

    rttr:GetPlayer(p):ClearResources()
    rttr:GetPlayer(p):AddWares({
        [GD_WOOD        ] = 24,
        [GD_BOARDS      ] = 44,
        [GD_STONES      ] = 68,
        [GD_HAM         ] = 0 ,
        [GD_GRAIN       ] = 0 ,
        [GD_FLOUR       ] = 0 ,
        [GD_FISH        ] = 4 ,
        [GD_MEAT        ] = 6 ,
        [GD_BREAD       ] = 8 ,
        [GD_WATER       ] = 0 ,
        [GD_BEER        ] = 6 ,
        [GD_COAL        ] = 16,
        [GD_IRONORE     ] = 16,
        [GD_GOLD        ] = 0 ,
        [GD_IRON        ] = 0 ,
        [GD_COINS       ] = 0 ,
        [GD_TONGS       ] = 0 ,
        [GD_AXE         ] = 6 ,
        [GD_SAW         ] = 2 ,
        [GD_PICKAXE     ] = 2 ,
        [GD_HAMMER      ] = 16,
        [GD_SHOVEL      ] = 4 ,
        [GD_CRUCIBLE    ] = 4 ,
        [GD_RODANDLINE  ] = 6 ,
        [GD_SCYTHE      ] = 8 ,
        [GD_CLEAVER     ] = 2 ,
        [GD_ROLLINGPIN  ] = 2 ,
        [GD_BOW         ] = 2 ,
        [GD_SWORD       ] = 6 ,
        [GD_SHIELD      ] = 6 ,
        [GD_BOAT        ] = 12
    })

    -- people
    rttr:GetPlayer(p):AddPeople({
        [JOB_HELPER             ] = 52,
        [JOB_WOODCUTTER         ] = 8 ,
        [JOB_FISHER             ] = 0 ,
        [JOB_FORESTER           ] = 4 ,
        [JOB_CARPENTER          ] = 4 ,
        [JOB_STONEMASON         ] = 4 ,
        [JOB_HUNTER             ] = 2 ,
        [JOB_FARMER             ] = 0 ,
        [JOB_MILLER             ] = 0 ,
        [JOB_BAKER              ] = 0 ,
        [JOB_BUTCHER            ] = 0 ,
        [JOB_MINER              ] = 10,
        [JOB_BREWER             ] = 0 ,
        [JOB_PIGBREEDER         ] = 0 ,
        [JOB_DONKEYBREEDER      ] = 0 ,
        [JOB_IRONFOUNDER        ] = 0 ,
        [JOB_MINTER             ] = 0 ,
        [JOB_METALWORKER        ] = 2 ,
        [JOB_ARMORER            ] = 4 ,
        [JOB_BUILDER            ] = 10,
        [JOB_PLANER             ] = 6 ,
        [JOB_GEOLOGIST          ] = 6 ,
        [JOB_PRIVATE            ] = 46,
        [JOB_PRIVATEFIRSTCLASS  ] = 0 ,
        [JOB_SERGEANT           ] = 0 ,
        [JOB_OFFICER            ] = 0 ,
        [JOB_GENERAL            ] = 0 ,
        [JOB_SCOUT              ] = 2 ,
        [JOB_SHIPWRIGHT         ] = 0 ,
        [JOB_PACKDONKEY         ] = 8 ,
        [JOB_BOATCARRIER        ] = 0 ,
        [JOB_CHARBURNER         ] = 0
    })
end


-------------------------------- mission events -------------------------------
function onGameFrame(gf)
    if (gf == 20) then
        --!MET_DIRECT_EVENT 0 255 0 -1
        -- 0: Event ID
        -- 255: No Endevent
        -- 0: Message 0
        -- -1: No Sound
        MissionEvent(1)
    end
end

function onOccupied(p, x, y)
    -- only check human player
    if(p ~= 0) then
        return
    end

    --!MET_POSITION_OCCUPIED     4    99     40   40               -1    -1         1
    -- 4: EventID
    -- 99: EndEvent -> trigger this event
    -- 40: X
    -- 40: Y
    -- -1: No Message
    -- -1: No SampleID
    -- 1: GotoFlag -> Doesnt seem to work

    --!MET_END_EVENT         99   255    1    98 255 255 255     8     -1
    -- 99: EventID
    -- 255: No EndEvent
    -- 1: WinPoints?
    -- 98: Enable Event -> Trigger
    -- 255: No Event
    -- 8: Message 8
    -- -1: No SampleID

    --!MET_SET_FINAL_EVENT   99     1  255  255
    -- 99: EventID
    -- 1: Unknown, enable mission 1?
    -- 255: no event
    -- 255: no event

    --!MET_SET_MAP_ELEMENT   98 40   40 23
    -- 98: Event ID
    -- 40: X
    -- 40: Y
    -- 23: opened Gate

    if((x == 40) and (y == 40)) then
        MissionEvent(99)
    end
end

function onExplored(p, x, y, owner)
    if(p ~= 0) then
        return
    end

    --!MET_POSITION_EXPLORED     1     255    98   28              2    29           1
    -- 1: Event ID
    -- 255: No Endevent
    -- 98: X
    -- 29: Y
    -- 2: Message 2
    -- 29: Sample 29? -> doesn't seem to work
    -- 1: GoTo point -> doesn't seem to work

    --!MET_HOUSE_ENABLING        1	 23	 255 255 255 255 255
    -- 1: Event ID (triggers this)
    -- 23: Harbor building
    if((x == 98) and (y == 28)) then
        MissionEvent(2)
    end

    --!MET_POSITION_EXPLORED     2     255    101   76              4    29           1
    -- 2: EventID
    -- 255: No Endevent
    -- 101: X
    -- 76: Y
    -- 4: Message 4
    -- 29: SampleID 29? -> doesnt seem to work
    -- 1: GoTo? -> doesnt seem to work
    if((x == 101) and (y == 76)) then
        MissionEvent(3)
    end

    --!MET_CONTACT_TO_PLAYER     3    255       2            6     35
    -- 3: ID Event
    -- 255: No EndEvent
    -- 2: Target PlayerID
    -- 6: Message 6
    -- 35: Trigger Event 35?
    if(owner == 1 or owner == 2) then
        MissionEvent(4)
    end
end


-- execute mission events, e == 1 is initial event, e == 99 is final event
function MissionEvent(e, onLoad)
    -- event e is inactive
    if(eState[e] <= 0) then
        rttr:Log("State less or equal 0")
        return
    end

    if(e == 1) then
        -- nothing happening, initial message
    elseif(e == 2) then
        -- enable harbor
        rttr:GetPlayer(0):EnableBuilding(BLD_HARBORBUILDING, not onLoad)
    elseif(e == 3) then
        -- nothing
    elseif(e == 4) then
        -- lift restrictions so no strange things happen
        rttr:GetPlayer(1):SetRestrictedArea()
        rttr:GetPlayer(2):SetRestrictedArea()
    elseif(e == 99) then
        rttr:GetWorld():AddStaticObject(40, 40, 561, 0xFFFF, 2)
    end

    -- update event state
    eState[e] = eState[e] - 1

    -- no history update or mission texts while loading
    if not onLoad then
        rttr:Log(">> Event: " .. e .. ",\teState[" .. e .. "] = " .. eState[e])
        eHist["n"] = eHist["n"] + 1
        eHist[eHist["n"]] = e
    end

    MissionText(e, onLoad)
end