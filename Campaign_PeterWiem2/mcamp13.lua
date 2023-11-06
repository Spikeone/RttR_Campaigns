function getRequiredLuaVersion()
    return 1
end

-- Message-Window (mission statement and hints): 52 chars wide
eIdx = {1, 2, 3, 4, 5, 6, 99}

local debugTexts = false;

rttr:RegisterTranslations(
{
    en =
    {
        title   = 'Lars, der Schlosser',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = 'Ansgar und Knut haben sich auf unserer Insel des ewigen Schnees abgesprochen, dass diesmal mein Vater mit mir auf die letzte graue Insel zieht, und Ansgar bei unseren Frauen und Kinder bleibt. Knut hat Lars mitgenommen, der zwar schon im fortgeschrittenen Alter ist und eigentlich keinen Kriegsdienst mehr leisten muss. Lars hat aber um Mitnahme gebeten und meinen Vater dadurch überzeugt, dass er so gut wie jedes beliebige Handwerkszeug aus Holz und Eisen herstellen kann.\n\nBin ich froh, wenn wir die grauen Inseln hinter uns haben. Es gibt hier kein direktes Sonnenlicht, keine grüne Landschaft, keine blauen Gewässer, nur einen diesigen und stinkenden Mix aus braunen und dunkelroten Elementen. Aber es wäre die erste Insel, auf der keine Feinde wären.\n\nAuf dieser geräumigen Insel sind wir alle drei Monate für einen Tag unsere Lieblingsbeschäftigung nachgegangen, dem Filzkugelkicken. Ein mit Stoffen prall gefüllter Filzsack von etwa einem Meter Durchmesser wird dabei von zwei Mannschaften von jeweils 200 Mann mit den Füßen vorwärts getreten. Jede Mannschaft versucht dabei, ihre Filzkugel jeweils zwischen zwei markierten Bäumen per Fuß durch zu kicken.',
        msg2    = 'Mein Vater hat mir aufgrund meiner Frage an Ihn etwas über seinem Amtsvorgänger Prainn erzählt. Er war ein junger, aber kluger Kopf und ein strategisch außerordentlich begabter König. Leider war er jähzornig und auch etwas hochmütig, deshalb war er bei allen Taten, die er zum Besten für uns Wikinger gewirkt hat, nicht sonderlich beliebt beim Volk.\n\nAls er aus Wut einen Menschen erschlug, dessen Botschaft er nicht hören wollte, musste er sein Amt niederlegen und unser Volk verlassen. Es sind Viele mit ihm gegangen, die ähnlich dachten wie er. Danach wurde das übrige Volk befragt nach einem neuen König, und auch auf Ansgars Fürsprache wurde der bisherige Bäcker Knut nunmehr zum neuen König Knut gewählt. Für ihn sei das alles sehr überraschend und unerwartet gekommen.\n\nIch habe meinem Vater nichts über den Brief im Chinesenlager erzählt, wo dieser Prainn auf meine Heimatinsel,  die Insel der Versammlung, zu kommen gebeten wurde, um dort etwas zu organisieren. Ich werde das Gefühl nicht los, das wir diesem Menschen noch begegnen werden, und er uns Einiges über den momentanen Krieg erklären könnte.',
        msg3    = 'Unser Späher Halvar kam ganz aufgeregt von seinem Erkundungsgang zurück! Es wimmle hier geradezu von Feinden, und sie bewegen sich geschlossen auf uns zu. Da das Gelände keinerlei Schutz bietet, sollte sofort der Rückzug angetreten werden mit allem, was sich transportieren lässt.\n\nHalvar hat im Südwesten der Insel einen Ort ausgemacht, der noch unentdeckt sei, und uns dringend geraten, so schnell wie nur möglich dorthin zu flüchten. Dort gäbe es etwas Deckung und genügend Bodenschätze, um sich für eine Schlacht zu rüsten, die hier unweigerlich auf uns zukommen würde.',
        msg4    = 'Es wird höchste Zeit, von hier zu verschwinden! Von fast allen Seiten rücken Feinde heran und wir sind nicht stark und schon gar nicht geschützt genug, ihnen zu widerstehen. Wir müssen im Südwesten der Insel ein Lagerhaus bauen und hoffen, soviel Werkzeug wie möglich dorthin bekommen zu können.',
        msg5    = 'Das war eine Hetzerei, aber hier haben wir eine Chance zum Überleben! Das Gelände ist nicht sehr geräumig, bietet aber Rohstoffe und natürlichen Schutz. Hier sollten wir uns erst einmal niederlassen und diesen Platz mit Thorbens Katapulten und Arons Festungen um uns herum bestmöglich verteidigen.\n\nDann müssen wir schauen, was in den Hügeln um uns herum an Kohle, Eisen und Gold vorhanden ist, um unsere Wirtschaft in Gang zu bringen. Darvi, Bajrki und Elvor warten schon sehnsüchtig auf ihre vertrauten Werkstattgebäuden, um sich handwerklich betätigen zu können. Und auch Lars ist bereit, seine Handwerkskunst praktisch unter Beweis zu stellen. Und vor allem brauchen wir Sigvaldis Bier, unser flüssiger Mutmacher in allen Kämpfen gegen unsere Feinde.',
        msg6    = 'An dieser Stelle standen zwei der vier Bäume, deren Zwischenraum uns als Zielobjekt für unsere Filzsäcke gedient hat, die wir quer über die Ebene gedroschen haben. Mancher von uns Wikinger denkt an die unvergesslichen Stunden während des Spieles und an etliche blaue Flecken, die in dem wilden Getümmel um diese Kugel entstanden sind.\n\nJetzt sind es blutige Kämpfe, die uns hierher geführt haben. Es ist ein Ende der Schlacht abzusehen, obwohl der Widerstand der Feinde noch nicht vollständig gebrochen ist. Aber die weite Ebene ist zum großen Teil zurück erobert und mit den restlichen Gegnern in den umliegenden Hügeln werden wir auch noch ein Hühnchen miteinander rupfen.\n\nAus unserem Lager kam die Mitteilung, dass erneut ein Amboss von Elvor versehentlich zerstört wurde. Ich wies zwei unserer Soldaten an, in den rauchenden Trümmern der feindlichen Gebäude nach einem brauchbaren Ersatz zu suchen und ihn in unser Lager zu bringen.'
        msg99   = 'Endlich ist auch diese Schlacht zu unseren Gunsten geschlagen worden und die letzte graue Insel zurück erobert. Mein Vater war sichtlich betroffen, als er im letzten zerstörten Hauptquartier eine Suchmeldung über  eine Person namens Ahasversos zu Gesicht bekam. Ansgar und ich waren diese Suchmeldungen ja schon bekannt, wir haben aber nie mit meinem Vater darüber gesprochen.\n\nÜber diesen Ahasversos müsse er mit mir zusammen mit Ansgar reden, meinte er nur. Ich bin ehrlich gespannt, was er mir als Vater und König der Wikinger darüber zu sagen hat.',
    }
})

-- format mission texts
function MissionText(e, silent)
    local msg = _('msg' .. tostring(e))

    if(msg ~= ('msg' .. tostring(e))) then
        if not silent then
            rttr:MissionStatement(0, _('diary'), msg .. '\n\n\n\n\n\n\n', IM_AVATAR6, true)
        end
        rttr:SetMissionGoal(0, msg)
    else
        rttr:Log("Error: no Translation found!" .. _(msg))
    end
end

function isMapPreviewEnabled()
    return false;
end

function onSettingsReady()
    rttr:Log("-----------------------\n Mission Script loaded... \n-----------------------\n")

    rttr:ResetAddons()
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetAddon(ADDON_CATAPULT_GRAPHICS, true)
    rttr:SetAddon(ADDON_NUM_SCOUTS_EXPLORATION, 4)
    rttr:SetGameSettings({
        ["fow"] = EXP_CLASSIC,
        ["teamView"] = false,
        ["lockedTeams"] = true,
        ["startWares"] = SWR_NORMAL,
        ["objective"] = GO_TOTALDOMINATION
    })

    rttr:GetPlayer(0):SetNation(NAT_VIKINGS)
    rttr:GetPlayer(1):SetNation(NAT_JAPANESE)
    rttr:GetPlayer(2):SetNation(NAT_BABYLONIANS)
    rttr:GetPlayer(3):SetNation(NAT_AFRICANS)
    rttr:GetPlayer(4):SetNation(NAT_ROMANS)

    for p = 1, rttr:GetNumPlayers() - 1 do
        rttr:GetPlayer(p):SetTeam(TM_TEAM1)
        rttr:GetPlayer(p):SetAI(3)
        rttr:GetPlayer(p):SetName(_('name'))
    end
end

function getAllowedChanges()
    return {
        ["addonsAll"]   = false,
        ["addonsSome"]  = true,
        ["ownNation"]   = false,
        ["ownColor"]    = true,
        ["ownTeam"]     = false,
        ["aiNation"]    = false,
        ["aiColor"]     = true,
        ["aiTeam"]      = false
    }
end

function getAllowedAddons()
    return {
        ADDON_TOOL_ORDERING,
        ADDON_CATAPULT_GRAPHICS,
        ADDON_NO_COINS_DEFAULT,
        ADDON_MANUAL_ROAD_ENLARGEMENT,
        ADDON_METALWORKSBEHAVIORONZERO
    }
end

function onStart(isFirstStart)
    for p = 0, rttr:GetNumPlayers() - 1 do
        addPlayerRes(p, not isFirstStart)
    end
    rttr:GetPlayer(0):ModifyHQ(true)

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
    end

    if(isFirstStart) then
        rttr:GetWorld():AddStaticObject(13,  8, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(95, 92, 0, 0, 1)
        rttr:GetWorld():AddStaticObject( 4, 40, 0, 0, 1)
    end
end

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

function addPlayerRes(p, onLoad)
    if(p ~= 0) then
        if onLoad then return end
        rttr:GetPlayer(p):ClearResources()

        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 50,
            [GD_BOARDS    ] = 30,
            [GD_STONES    ] = 30,
            [GD_HAM       ] = 5,
            [GD_GRAIN     ] = 5,
            [GD_FLOUR     ] = 5,

            [GD_FISH      ] = 8,
            [GD_MEAT      ] = 8,
            [GD_BREAD     ] = 8,
            [GD_WATER     ] = 8,
            [GD_BEER      ] = 0,
            [GD_COAL      ] = 15,

            [GD_IRONORE   ] = 15,
            [GD_GOLD      ] = 2,
            [GD_IRON      ] = 10,
            [GD_COINS     ] = 2,
            [GD_TONGS     ] = 1,
            [GD_AXE       ] = 5,

            [GD_SAW       ] = 5,
            [GD_PICKAXE   ] = 5,
            [GD_HAMMER    ] = 16,
            [GD_SHOVEL    ] = 5,
            [GD_CRUCIBLE  ] = 4,
            [GD_RODANDLINE] = 5,

            [GD_SCYTHE    ] = 8,
            [GD_CLEAVER   ] = 2,
            [GD_ROLLINGPIN] = 2,
            [GD_BOW       ] = 5,
            [GD_SWORD     ] = 5,
            [GD_SHIELD    ] = 5,

            [GD_BOAT      ] = 8
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 80,
            [JOB_BUILDER            ] = 10,
            [JOB_PLANER             ] = 6,
            [JOB_WOODCUTTER         ] = 6,
            [JOB_FORESTER           ] = 4,
            [JOB_STONEMASON         ] = 8,

            [JOB_FISHER             ] = 4,
            [JOB_HUNTER             ] = 4,
            [JOB_CARPENTER          ] = 4,
            [JOB_FARMER             ] = 4,
            [JOB_PIGBREEDER         ] = 4,
            [JOB_DONKEYBREEDER      ] = 4,

            [JOB_MILLER             ] = 2,
            [JOB_BAKER              ] = 2,
            [JOB_BUTCHER            ] = 2,
            [JOB_BREWER             ] = 2,
            [JOB_MINER              ] = 10,
            [JOB_IRONFOUNDER        ] = 2,

            [JOB_ARMORER            ] = 4,
            [JOB_MINTER             ] = 1,
            [JOB_METALWORKER        ] = 2,
            [JOB_SHIPWRIGHT         ] = 2,
            [JOB_GEOLOGIST          ] = 8,
            [JOB_SCOUT              ] = 2,

            [JOB_PACKDONKEY         ] = 30,
            [JOB_CHARBURNER         ] = 0,

            [JOB_PRIVATE            ] = 40,
            [JOB_PRIVATEFIRSTCLASS  ] = 6,
            [JOB_SERGEANT           ] = 4,
            [JOB_OFFICER            ] = 2,
            [JOB_GENERAL            ] = 1
        })
    elseif (p == 0) then
        rttr:GetPlayer(p):DisableBuilding(BLD_METALWORKS)

        if onLoad then return end

        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 20,
            [GD_BOARDS    ] = 40,
            [GD_STONES    ] = 20,
            [GD_HAM       ] = 30,
            [GD_GRAIN     ] = 4,
            [GD_FLOUR     ] = 4,

            [GD_FISH      ] = 8,
            [GD_MEAT      ] = 8,
            [GD_BREAD     ] = 8,
            [GD_WATER     ] = 0,
            [GD_BEER      ] = 0,
            [GD_COAL      ] = 15,

            [GD_IRONORE   ] = 8,
            [GD_GOLD      ] = 8,
            [GD_IRON      ] = 15,
            [GD_COINS     ] = 2,
            [GD_TONGS     ] = 0,
            [GD_AXE       ] = 2,

            [GD_SAW       ] = 4,
            [GD_PICKAXE   ] = 2,
            [GD_HAMMER    ] = 10,
            [GD_SHOVEL    ] = 2,
            [GD_CRUCIBLE  ] = 4,
            [GD_RODANDLINE] = 4,

            [GD_SCYTHE    ] = 6,
            [GD_CLEAVER   ] = 0,
            [GD_ROLLINGPIN] = 2,
            [GD_BOW       ] = 0,
            [GD_SWORD     ] = 2,
            [GD_SHIELD    ] = 2,

            [GD_BOAT      ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 80,
            [JOB_BUILDER            ] = 15,
            [JOB_PLANER             ] = 8,
            [JOB_WOODCUTTER         ] = 8,
            [JOB_FORESTER           ] = 2,
            [JOB_STONEMASON         ] = 8,

            [JOB_FISHER             ] = 4,
            [JOB_HUNTER             ] = 6,
            [JOB_CARPENTER          ] = 3,
            [JOB_FARMER             ] = 2,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,

            [JOB_MILLER             ] = 2,
            [JOB_BAKER              ] = 2,
            [JOB_BUTCHER            ] = 1,
            [JOB_BREWER             ] = 2,
            [JOB_MINER              ] = 10,
            [JOB_IRONFOUNDER        ] = 2,

            [JOB_ARMORER            ] = 2,
            [JOB_MINTER             ] = 1,
            [JOB_METALWORKER        ] = 0,
            [JOB_SHIPWRIGHT         ] = 1,
            [JOB_GEOLOGIST          ] = 5,
            [JOB_SCOUT              ] = 2,

            [JOB_PACKDONKEY         ] = 30,
            [JOB_CHARBURNER         ] = 0,

            [JOB_PRIVATE            ] = 50,
            [JOB_PRIVATEFIRSTCLASS  ] = 1,
            [JOB_SERGEANT           ] = 1,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0
        })
    end
end

function onGameFrame(gf)
    if (gf == 10 and debugTexts) then
        for _, i in ipairs(eIdx) do
            MissionText(i, false)
        end
    end

    enforceBuildingCount(0, BLD_CATAPULT, 3, false)

    if((gf%20)~=0) then
        return
    end

    if(gf==60) then
        -- EVENT1
        MissionEvent(1, false)
    end

    if (eState[2] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_SAWMILL) > 0) then
        -- EVENT2
        MissionEvent(2, false)
    end

    if (eState[3] > 0 and GetNumMilitaryBuilding(0, true) == 2) then
        -- EVENT3
        MissionEvent(3, false)
    end

    if ((GetNumStorage(1) + GetNumStorage(2) + GetNumStorage(3) + GetNumStorage(4)) < 1) then
        -- EVENT8 (maps to 99)
        MissionEvent(99, false)
    end
end

function onOccupied(p, x, y)
    if(p ~= 0) then return end

    if(eState[4] > 0 and x == 22 and y == 63) then
        -- EVENT4
        MissionEvent(4, false)
    end

    if(eState[5] > 0 and x == 12 and y == 75) then
        -- EVENT5
        MissionEvent(5, false)
    end

    if(eState[6] > 0 and x == 73 and y == 48) then
        -- EVENT6
        MissionEvent(6, false)
    end
end

function MissionEvent(e, onLoad)
    -- event e is inactive
    if(eState[e] <= 0) then
        return
    end

    -- call side effects for active events, check "eState[e] == 1" for multiple call events!
    if(e == 1 and not onLoad) then
        -- nothing

    elseif(e == 2 and not onLoad) then
        -- nothing

    elseif(e == 3 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_PICKAXE ] = 10
        })

    elseif(e == 4 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_FISH    ] = 10,
            [GD_MEAT    ] = 10
        })

    elseif(e == 5) then
        rttr:GetPlayer(0):EnableBuilding(BLD_METALWORKS, not onLoad)

        if(not onLoad) then
            rttr:GetPlayer(0):AddPeople({
                [JOB_METALWORKER] = 1
            })
        end
    elseif(e == 6 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_COAL    ] = 10,
            [GD_GOLD    ] = 10
        })

    elseif(e == 99) then
        -- TODO: EnableNextMissions()
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

function GetNumStorage(plr)
    return rttr:GetPlayer(plr):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(plr):GetNumBuildings(BLD_HARBORBUILDING) + rttr:GetPlayer(plr):GetNumBuildings(BLD_STOREHOUSE)
end

function GetNumMilitaryBuilding(plr, withHarbor)
    if(withHarbor) then
        return rttr:GetPlayer(plr):GetNumBuildings(BLD_HARBORBUILDING) + rttr:GetPlayer(plr):GetNumBuildings(BLD_BARRACKS) + rttr:GetPlayer(plr):GetNumBuildings(BLD_GUARDHOUSE) + rttr:GetPlayer(plr):GetNumBuildings(BLD_WATCHTOWER) + rttr:GetPlayer(plr):GetNumBuildings(BLD_FORTRESS)
    else
        return rttr:GetPlayer(plr):GetNumBuildings(BLD_BARRACKS) + rttr:GetPlayer(plr):GetNumBuildings(BLD_GUARDHOUSE) + rttr:GetPlayer(plr):GetNumBuildings(BLD_WATCHTOWER) + rttr:GetPlayer(plr):GetNumBuildings(BLD_FORTRESS)
    end
end

function enforceBuildingCount(player, building, limit, notify)
    local sumBuildings = rttr:GetPlayer(player):GetNumBuildings(building) + rttr:GetPlayer(player):GetNumBuildingSites(building)

    if (sumBuildings >= limit) then
        rttr:GetPlayer(player):DisableBuilding(building)
    else
        rttr:GetPlayer(player):EnableBuilding(building, notify)
    end
end