function getRequiredLuaVersion()
    return 1
end

-- Message-Window (mission statement and hints): 52 chars wide
eIdx = {1, 2, 3, 4, 5, 6, 7, 99}

local debugTexts = false;

rttr:RegisterTranslations(
{
    en =
    {
        title   = 'Eric, der König',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = 'Wir haben unsere Familien zusammen mit Aron und Thorben im Hauptquartier auf der Schlossinsel zurückgelassen und an diesem verschwiegenen Ort unser Zeltlager aufgeschlagen. Wie gut, dass ich die Gegend hier kenne wie meine Westentasche.\nMeine Heimatinsel ist unsere größte und in meinen Augen unsere schönste Insel. Genau in ihrer Mitte liegt ein idyllischer See, um den wir immer unsere Versammlungszelte herum gelagert haben, wenn es als Volk etwas gemeinsam zu feiern oder zu besprechen gab. Sie ist nur über einen schmalen und gebirgigen Landrücken oder zu Schiff erreichbar.\n\nDa unsere Feinde wahrscheinlich an diesem See zu suchen sind, habe ich diesmal unseren Lagerplatz ausgewählt mit Zustimmung von Knut, Ansgar und Halvar. Da die Insel der Zusammenkunft als Organisationsmittelpunkt aller Feldzüge gegen uns dient, vermuten wir von jedem Volk, dass diesen Krieg gegen uns führt, mindestens ein Lager auf dieser Insel. Wir werden sehen, was wir dort vorfinden werden. Die Entscheidung naht, und wir werden alles geben, um auch meine Heimatinsel wieder in unsere Gewalt zu bekommen.',
        msg2    = 'Wir scheinen noch unentdeckt zu sein, da dieser Platz sehr abgelegen ist, aber das kann uns nur recht sein. Wir wollen Richtung Osten zu der Landzunge kommen, die diesen Flecken Erde mit der Hauptinsel verbindet und uns da einen Weg über das Gebirge suchen. Außerdem müsste dort in der Nähe ein Hafenplatz sein, den wir dringend brauchen, um per Schiff eventuell eine zweite Front aufbauen könnten.\n\nKnut und Ansgar haben mich am kommenden Tag um ein Gespräch gebeten. Vermutlich wird es um Prainn oder Ahasversos gehen, über die ich noch weitere Information erhalten soll. Ich bin schon ganz gespannt auf den Austausch.',
        msg3    = 'Die Wirtschaft läuft zufriedenstellend, allerdings scheint es hier nur Kohlen im Gebirge zu geben. Wir benötigen dringend Eisen und Gold, um Soldaten in ausreichender Anzahl und in kampffähigen Zustand zu bekommen. Bjarki, Elvor und Darvi schauen ganz bedrückt drein. Sie wissen, dass ihr Dienst gebraucht wird, aber ohne Eisen und Gold ist kein Schwert zu schmieden und keine Münze zu prägen.\n\nAnsgar und Knut hatten einen ganz feierlichen und trotzdem ernsten Eindruck gemacht, als wir uns zu dritt zu einem gemeinsamen Gespräch trafen. Mein Vater erklärte mir, dass er nach erfolgreicher Beendigung dieses Kriegszuges sich wieder seinem geliebten Bäckerberuf widmen würde. Ansgar und er hätten mich gewissenhaft beobachtet und sie könnten sich, was meine persönlichen und militärischen Fähigkeiten anbetrifft, keinen besseren König für unser Volk vorstellen, als mich.\n\nIch musste mich erst einmal setzen, als ich das hörte. Ich erbat mir Bedenkzeit, umarmte aber meinen Vater und Ansgar, und dankte ihnen für ihr Vertrauen.',
        msg4    = 'Halvar und ich haben bei einem Erkundungsgang einen feindlichen Kundschafter gefangen, der den Auftrag hatte, jede feindliche Invasion hier sofort zu melden. Er wurde von uns überrascht, als er gerade in ein Boot steigen wollte, um Meldung über uns zu machen. Der Kundschafter ist babylonischer Herkunft, recht jung und auch recht verängstigt. Auf unsere Fragen erzählte er uns folgende Geschichte:\n\n"Vor etwa dreißig Jahren kam ein Mann namens Prainn in ein Dorf der Babylonier und bat dort um Asyl. Es wurde ihm und seinen Anhängern gewährt. Er verstand es sehr gut, sich beliebt und unentbehrlich zu machen. Schon nach wenigen Jahren bekleidete er den Rang eines Feldherrn und hat in vielen Schlachten den Babyloniern unschätzbare Dienste erwiesen und viele Siege errungen. Er hat im Krieg gegen uns Wikinger die Befehlsgewalt und dabei mehrere Völker an seiner Seite. Auch seine Anhänger kämpfen gegen uns."\n\nHalvar und ich sahen uns gegenseitig stumm an. Das war also des Rätsels Lösung! Prainns Rachedurst war der Grund des Vernichtungsfeldzugs gegen uns.',
        msg5    = 'Gerade kommt Halvar zurück, und meldet uns, dass ein Hafenplatz gefunden worden sei. Wir werden dort so schnell wie möglich ein Hafengebäude und Schiffe bauen, um die Gegend zur See zu erkunden.\n\nUnser gefangener Kundschafter setzte im Beisein von Ansgar, Knut und mir seinen Bericht fort:\n\n"Vor über dreißig Jahren ist unser geliebter und geachteter Priester Ahasversos aus Babylon mit dem Schiff aufgebrochen, um auch anderen Völkern seinen Glauben zu bezeugen, und kam nie wieder zurück. Er hat durch einen gottesfürchtigen Fischer von einem Messias erfahren und ist dadurch ein anderer Mensch geworden. Prainn hatte kürzlich behauptet, unser Priester wäre von den Wikingern gefangengenommen worden. Da Ahasversos weit bekannt und geschätzt war, waren wir und unsere befreundeten Völker sofort bereit, ihn zu befreien und die Wikinger zu bestrafen."\n\nAnsgar, Knut und ich schwiegen über dem Gehörten. Mein Vater seufzte, Ansgar schüttelte den Kopf, und ich dachte für mich, wie die rachsüchtigen Lügen eines Einzelnen ganze Völker ins Unglück stürzen können.',
        msg6    = 'Goldstaub auf dem Boden lässt auf eine ergiebige Fundstelle hoffen. Also rasch die Geologen und  Spitzhacken geholt und nachgeschaut, was sich hier finden lässt. Außerdem ist die Insel der Zusammenkunft recht nahe gelegen, vielleicht ist ein Zugang über Land von hier möglich?',
        msg7    = 'Es ist genauso gekommen, wie wir es vermutet haben. Es sind tatsächlich alle Völker mit mindestens einem Lager auf meiner Heimatinsel vertreten, sogar Prainns Anhänger haben hier ihr Hauptquartier.\n\nHalvar ist, wie so oft in unseren bisherigen Schlachten, an meiner Seite. Ich habe ihm hier und jetzt versprochen, ihn zum Feldherren aller Wikinger zu befördern, wenn dieser letzte Kampf hier gewonnen wird. Halvar nickte nur ernst, und wir musterten kurz gemeinsam die vorhandenen Gegebenheiten.\n\nUnsere Feinde haben sich allesamt ringförmig um den See im Südosten gelagert und sind in heller Aufregung, weil wir von Nordwesten in ihren gemeinsamen Stützpunkt eingedrungen sind. Ab jetzt kann es kein Zaudern und Zögern im Kampf mit ihnen mehr geben, weil unsere Gegner nunmehr gemeinsam gegen uns mobil machen.',
        msg99   = 'Nach einer beispiellosen Schlacht ist dieser Krieg endlich vorbei. Prainn ist im Kampf gefallen, er hat den blutigen Lohn seiner Taten erhalten mitsamt allen seinen Anhängern und Mitstreitern. Staunend betrachten wir das Mahnmal, welches die Babylonier zu Ehren Ahasversos im See errichtet haben. Auf dem Torbogen steht der Spruch, der sein Zeugnis geprägt und sein Leben verändert hat:\n\n"Gottesfürchtigkeit ist die Tür; so jemand durch sie eingeht, der wird gerettet werden."\n\nDiese Aussage bewegt mich zutiefst, ich werde gründlicher darüber nachdenken. Zunächst aber habe ich mich entschlossen, die Königswürde anzunehmen, die mir mein Vater und Ansgar angetragen haben. Es kommen also verantwortungsvolle Zeiten auf mich und auf unser Volk zu. Aber ich bin guter Zuversicht, unser gemeinsam angefangenes Werk vollenden zu können, nämlich als Volk der Wikinger wieder in Frieden und Freiheit leben zu können. Die Aussage des Mahnmals soll uns dabei helfen.'
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
    rttr:GetPlayer(3):SetNation(NAT_BABYLONIANS)
    rttr:GetPlayer(4):SetNation(NAT_AFRICANS)
    rttr:GetPlayer(5):SetNation(NAT_ROMANS)
    rttr:GetPlayer(6):SetNation(NAT_ROMANS)
    rttr:GetPlayer(7):SetNation(NAT_VIKINGS)

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
        rttr:GetWorld():AddStaticObject(91, 59, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(77,  9, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(10, 48, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(31,105, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(47, 58, 560, 0xFFFF, 2)
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
            [GD_WOOD      ] = 30,
            [GD_BOARDS    ] = 50,
            [GD_STONES    ] = 50,
            [GD_HAM       ] = 2,
            [GD_GRAIN     ] = 2,
            [GD_FLOUR     ] = 2,

            [GD_FISH      ] = 2,
            [GD_MEAT      ] = 2,
            [GD_BREAD     ] = 2,
            [GD_WATER     ] = 2,
            [GD_BEER      ] = 8,
            [GD_COAL      ] = 10,

            [GD_IRONORE   ] = 10,
            [GD_GOLD      ] = 5,
            [GD_IRON      ] = 10,
            [GD_COINS     ] = 5,
            [GD_TONGS     ] = 1,
            [GD_AXE       ] = 7,

            [GD_SAW       ] = 5,
            [GD_PICKAXE   ] = 7,
            [GD_HAMMER    ] = 20,
            [GD_SHOVEL    ] = 7,
            [GD_CRUCIBLE  ] = 7,
            [GD_RODANDLINE] = 7,

            [GD_SCYTHE    ] = 7,
            [GD_CLEAVER   ] = 3,
            [GD_ROLLINGPIN] = 3,
            [GD_BOW       ] = 7,
            [GD_SWORD     ] = 0,
            [GD_SHIELD    ] = 0,

            [GD_BOAT      ] = 8
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 80,
            [JOB_BUILDER            ] = 15,
            [JOB_PLANER             ] = 10,
            [JOB_WOODCUTTER         ] = 5,
            [JOB_FORESTER           ] = 5,
            [JOB_STONEMASON         ] = 5,

            [JOB_FISHER             ] = 5,
            [JOB_HUNTER             ] = 5,
            [JOB_CARPENTER          ] = 2,
            [JOB_FARMER             ] = 5,
            [JOB_PIGBREEDER         ] = 5,
            [JOB_DONKEYBREEDER      ] = 5,

            [JOB_MILLER             ] = 3,
            [JOB_BAKER              ] = 3,
            [JOB_BUTCHER            ] = 2,
            [JOB_BREWER             ] = 2,
            [JOB_MINER              ] = 10,
            [JOB_IRONFOUNDER        ] = 3,

            [JOB_ARMORER            ] = 3,
            [JOB_MINTER             ] = 3,
            [JOB_METALWORKER        ] = 2,
            [JOB_SHIPWRIGHT         ] = 2,
            [JOB_GEOLOGIST          ] = 8,
            [JOB_SCOUT              ] = 2,

            [JOB_PACKDONKEY         ] = 20,
            [JOB_CHARBURNER         ] = 0,

            [JOB_PRIVATE            ] = 40,
            [JOB_PRIVATEFIRSTCLASS  ] = 4,
            [JOB_SERGEANT           ] = 4,
            [JOB_OFFICER            ] = 4,
            [JOB_GENERAL            ] = 4
        })
    elseif (p == 0) then
        if onLoad then return end

        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 20,
            [GD_BOARDS    ] = 30,
            [GD_STONES    ] = 30,
            [GD_HAM       ] = 3,
            [GD_GRAIN     ] = 3,
            [GD_FLOUR     ] = 3,

            [GD_FISH      ] = 3,
            [GD_MEAT      ] = 4,
            [GD_BREAD     ] = 5,
            [GD_WATER     ] = 3,
            [GD_BEER      ] = 0,
            [GD_COAL      ] = 20,

            [GD_IRONORE   ] = 20,
            [GD_GOLD      ] = 4,
            [GD_IRON      ] = 20,
            [GD_COINS     ] = 3,
            [GD_TONGS     ] = 0,
            [GD_AXE       ] = 3,

            [GD_SAW       ] = 4,
            [GD_PICKAXE   ] = 8,
            [GD_HAMMER    ] = 18,
            [GD_SHOVEL    ] = 2,
            [GD_CRUCIBLE  ] = 4,
            [GD_RODANDLINE] = 3,

            [GD_SCYTHE    ] = 4,
            [GD_CLEAVER   ] = 3,
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
            [JOB_FARMER             ] = 3,
            [JOB_PIGBREEDER         ] = 2,
            [JOB_DONKEYBREEDER      ] = 0,

            [JOB_MILLER             ] = 2,
            [JOB_BAKER              ] = 2,
            [JOB_BUTCHER            ] = 2,
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

            [JOB_PRIVATE            ] = 55,
            [JOB_PRIVATEFIRSTCLASS  ] = 5,
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

    if ((GetNumStorage(1) + GetNumStorage(2) + GetNumStorage(3) + GetNumStorage(4) + GetNumStorage(5) + GetNumStorage(6) + GetNumStorage(7)) < 1) then
        -- EVENT8 (maps to 99)
        MissionEvent(99, false)
    end
end

function onOccupied(p, x, y)
    if(p ~= 0) then return end

    if(eState[3] > 0 and x == 94 and y == 110) then
        -- EVENT3
        MissionEvent(3, false)
    end

    if(eState[4] > 0 and x == 87 and y == 2) then
        -- EVENT4
        MissionEvent(4, false)
    end

    if(eState[5] > 0 and x == 80 and y == 4) then
        -- EVENT5
        MissionEvent(5, false)
    end

    if(eState[6] > 0 and x == 92 and y == 65) then
        -- EVENT6
        MissionEvent(6, false)
    end

    if(eState[7] > 0 and x == 23 and y == 36) then
        -- EVENT7
        MissionEvent(7, false)
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
        -- nothing

    elseif(e == 4 and not onLoad) then
        -- nothing

    elseif(e == 5 and not onLoad) then
        -- nothing

    elseif(e == 6 and not onLoad) then
        -- nothing

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