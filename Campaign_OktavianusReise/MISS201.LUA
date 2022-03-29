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
eIdx = {1, 2, 3, 99}

rttr:RegisterTranslations(
{ 
    en = 
    { 
        Diary   = 'Diary',

        msg1    = '2. Tag im 5. Monat des 2. Jahres\n\nDas Tor brachte uns in eine neue Welt. Es scheint\nsich um ein Hochgebirge zu handeln.\n\nNach einem Blick in unser Hauptquartier ist mir\nunsere erste Prüfung bekannt: Wir haben keinen\neinzigen Stein. Doch das soll uns nicht am Bau einer\nSiedlung hindern. Zumal sich überall\nvielversprechende Gebirge befinden.',
        msgh1   = 'Kümmern Sie sich um die Versorgung mit Steinen und\nziehen sie Ihre Siedlung hoch!',

        msg2    = 'Unser Gelehrter hat im Gebirge ein reiches\nGranitvorkommen festgestellt. Allerdings scheint dies\nauch die einzige Möglichkeit zu sein, an Steine zu\nkommen. Ich habe hier noch keinen überirdischen\nSteinwall gesehen.\n\nZum Glück waren uns die Götter wohl gestimmt und\nhaben uns genug Nahrung für die Bergarbeiter\ngelassen. Dennoch müssen wir eine gute\nNahrungsmittelversorgung auf die Beine stellen, da\nwir auch noch Erz-, Gold- und Kohleminen benötigen.\nDer Feind scheint sehr mächtig zu sein.',
        msgh2   = 'Bauen Sie das Granit im Gebirge ab und errichten Sie\neine effiziente Nahrungsmittelindustrie!',

        msg3    = '22. Tag im 12. Monat des 2. Jahres\n\nErneut versperrt uns ein Gegner den Weg zum Ziel. Der\nWickinger scheint aggressiv zu sein, wenn es um das\nTor geht. Er wollte uns nicht sagen, wo es sich\nbefindet. Doch wir wissen, dass es existiert. So\nbleibt uns nichts anderes übrig, als die Schwerter\nzu zücken. Möge der Glücklichere diese Schlacht\ngewinnen!',
        msg3h   = 'Schlagen Sie den Feind zurück und besetzen Sie das\nTor!',

        msg99   = '3. Tag im 7. Monat des 3. Jahres\n\nDa steht es, in all seiner Pracht. Erneut waren\nunsere Männer erfolgreich im Kampf um das Tor. Möge\nes uns auf eine neue Insel mit einer weiteren\nPrüfung bringen! Ich habe das Vertrauen in meine\nMänner wiedergewonnen, nachdem wir uns vor Jahren\ndurch zehn Inseln zurück nach Rom kämpften.\nVielleicht wird es dieses Mal nicht so einfach, aber\nwollen wir das Beste hoffen!',
        msg99h  = 'Erste Prüfung bestanden, auf zur nächsten!',
    },
    de = 
    {
        Diary   = 'Tagebuch',

        msg1    = '2. Tag im 5. Monat des 2. Jahres\n\nDas Tor brachte uns in eine neue Welt. Es scheint\nsich um ein Hochgebirge zu handeln.\n\nNach einem Blick in unser Hauptquartier ist mir\nunsere erste Prüfung bekannt: Wir haben keinen\neinzigen Stein. Doch das soll uns nicht am Bau einer\nSiedlung hindern. Zumal sich überall\nvielversprechende Gebirge befinden.',
        msgh1   = 'Kümmern Sie sich um die Versorgung mit Steinen und\nziehen sie Ihre Siedlung hoch!',

        msg2    = 'Unser Gelehrter hat im Gebirge ein reiches\nGranitvorkommen festgestellt. Allerdings scheint dies\nauch die einzige Möglichkeit zu sein, an Steine zu\nkommen. Ich habe hier noch keinen überirdischen\nSteinwall gesehen.\n\nZum Glück waren uns die Götter wohl gestimmt und\nhaben uns genug Nahrung für die Bergarbeiter\ngelassen. Dennoch müssen wir eine gute\nNahrungsmittelversorgung auf die Beine stellen, da\nwir auch noch Erz-, Gold- und Kohleminen benötigen.\nDer Feind scheint sehr mächtig zu sein.',
        msgh2   = 'Bauen Sie das Granit im Gebirge ab und errichten Sie\neine effiziente Nahrungsmittelindustrie!',

        msg3    = '22. Tag im 12. Monat des 2. Jahres\n\nErneut versperrt uns ein Gegner den Weg zum Ziel. Der\nWickinger scheint aggressiv zu sein, wenn es um das\nTor geht. Er wollte uns nicht sagen, wo es sich\nbefindet. Doch wir wissen, dass es existiert. So\nbleibt uns nichts anderes übrig, als die Schwerter\nzu zücken. Möge der Glücklichere diese Schlacht\ngewinnen!',
        msg3h   = 'Schlagen Sie den Feind zurück und besetzen Sie das\nTor!',

        msg99   = '3. Tag im 7. Monat des 3. Jahres\n\nDa steht es, in all seiner Pracht. Erneut waren\nunsere Männer erfolgreich im Kampf um das Tor. Möge\nes uns auf eine neue Insel mit einer weiteren\nPrüfung bringen! Ich habe das Vertrauen in meine\nMänner wiedergewonnen, nachdem wir uns vor Jahren\ndurch zehn Inseln zurück nach Rom kämpften.\nVielleicht wird es dieses Mal nicht so einfach, aber\nwollen wir das Beste hoffen!',
        msg99h  = 'Erste Prüfung bestanden, auf zur nächsten!',
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
    rttr:Log("-----------------------\n MISS201.lua loaded... \n-----------------------\n")
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

    --!GLOBAL_ADD_COMPUTER_PLAYER 1 3
    rttr:GetPlayer(1):SetAI(3)              -- hard AI
    rttr:GetPlayer(1):SetNation(NAT_VIKINGS)-- nation
    rttr:GetPlayer(1):SetColor(1)           -- yellow
    rttr:GetPlayer(1):SetName('Brutus')     -- Enemy Name
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
    addPlayerRes(0, not isFirstStart)
    addPlayerRes(1, not isFirstStart)

    eState = {}                                 -- disable all events
    for _, i in ipairs(eIdx) do
        eState[i] = 0
    end

    for _, i in ipairs({1, 2, 3, 99}) do -- set events as active
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


-------------------------------- set resources --------------------------------
function addPlayerRes(p, onLoad)
    if onLoad then return end

    -- not original, not possible that way
    --!GLOBAL_SET_COMPUTER_BARRIER 15 39   26
    --!GLOBAL_SET_COMPUTER_BARRIER 15 40   32
    --!GLOBAL_SET_COMPUTER_BARRIER 15 49   63
    --!GLOBAL_SET_COMPUTER_BARRIER 15 50   71
    if (p ~= 0) then
        rttr:GetPlayer(p):SetRestrictedArea(
            nil, nil,       -- enable the whole map
                0,   0,
                0,  96,
                96, 96,
                96, 0,
            nil, nil,
                43, 10,
                49, 44,
                49, 85,
                32, 85,
                32, 10,
            nil, nil
        )
    end

    rttr:GetPlayer(p):ClearResources()
    
    if (p == 0) then
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD        ] = 24,
            [GD_BOARDS      ] = 44,
            [GD_STONES      ] = 0 ,
            [GD_HAM         ] = 0 ,
            [GD_GRAIN       ] = 0 ,
            [GD_FLOUR       ] = 0 ,
            [GD_FISH        ] = 32,
            [GD_MEAT        ] = 16,
            [GD_BREAD       ] = 16,
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
    else
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
            [JOB_PRIVATE            ] = 10,
            [JOB_PRIVATEFIRSTCLASS  ] = 10,
            [JOB_SERGEANT           ] = 10,
            [JOB_OFFICER            ] = 10,
            [JOB_GENERAL            ] = 20,
            [JOB_SCOUT              ] = 2 ,
            [JOB_SHIPWRIGHT         ] = 0 ,
            [JOB_PACKDONKEY         ] = 8 ,
            [JOB_BOATCARRIER        ] = 0 ,
            [JOB_CHARBURNER         ] = 0 ,
        })
    end
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

function onResourceFound(p, x, y, res, quantity)
    if(p ~= 0) then
        return
    end
    -- !MET_FOUND_GRANITE	         1     255                      2      7
    -- 1: EventID
    -- 255: no EndEvent
    -- 2: Message 2
    -- 7: Unknown, maybe a sound
    if (res == RES_GRANITE) then
        MissionEvent(2)
    end
end


function onOccupied(p, x, y)
    -- only check human player
    if(p ~= 0) then
        return
    end

    -- !MET_POSITION_OCCUPIED    3     99     72   28               -1    -1         1
    -- !MET_END_EVENT         99   255    1    98 255 255 255     6     -1
    -- !MET_SET_FINAL_EVENT   99     2  255  255
    -- !MET_SET_MAP_ELEMENT   98 72   28 23

    if((x == 72) and (y == 28)) then
        MissionEvent(99)
    end
end

function onExplored(p, x, y, owner)
    if(p ~= 0) then
        return
    end

    -- !MET_CONTACT_TO_PLAYER     2    255       1            4     35
    -- 2: EventID
    -- 255: No EndEvent
    -- 1: TargetPlayerID
    -- 4: MessageID
    -- 35: Trigger Event 35?
    if(owner == 1) then
        MissionEvent(3)
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
        -- nothing happening
    elseif(e == 3) then
        -- lift restrictions so no strange things happen
        rttr:GetPlayer(1):SetRestrictedArea()
    elseif(e == 99) then
        rttr:GetWorld():AddStaticObject(72, 28, 561, 0xFFFF, 2)
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