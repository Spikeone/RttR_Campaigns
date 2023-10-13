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
        title   = 'Jon, der Eselzüchter',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = 'Die sandige Insel, die Heimat unseres Försters Mikkel, haben wir stets als Rohstofflieferant für die anderen Inseln genützt. Vor allem natürlich Sand, aber auch Kies und Steine haben wir für unsere Wege und Bauten von hier mit dem Schiff geholt. Ein paar dieser Baugruben sind seit langem abgesoffen, andere waren bis zur feindlichen Invasion im Betrieb. Ein gut schiffbarer Kanal und viele geeignete Hafenplätze haben uns den Sandabbau leicht gemacht. Allerdings werden sie auch das Besiedeln leicht gemacht haben, deshalb ist hier recht sicher mit Feinden zu rechnen.\n\nAnsgar hat auf Empfehlung meines Vaters Knut einen pfiffigen Burschen von der Insel des ewigen Schnees mitgenommen. Jon ist noch zu jung zum Militärdienst, aber seine Familie hat vor etwa drei Jahren mit der Eselszucht angefangen, um den Lastentransport zu vereinfachen. Das kann uns nur nützen. Die Esel aus seiner Zucht sind eher klein, aber zäh und lange nicht so störrisch wie so viele ihrer Artgenossen. Außerdem sind sie ungewöhnlich geschickt beim auf- und abladen ihrer Lasten.',
        msg2    = 'So eine grüne Insel ist eine wahre Wohltat für das Auge und für die Nase. Hier riecht nichts, höchstens ein klein wenig die abgesoffenen Sandgruben. Und der Kanal ist wie geschaffen, darin zu Segeln. Also: rasch einen Hafen gesucht, damit Ole seine Schiffsbaukunst unter Beweis stellen kann.\n\nViele Bodenschätze hat es hier nicht, aber es sollte reichen, um Schmied und Eisengießerei gut zu beschäftigen. Und Gold hat es hier sicherlich auch, wie eigentlich so gut wie auf jeder unserer Inseln.',
        msg3    = 'Irgendetwas scheint auf dieser Insel anders zu sein als auf allen anderen vorhergehenden Inseln. Ab und zu weht der Wind den Geruch von feindlichen Lagerfeuern in unsere Nasen. Es müssen also Feinde auf dieser Insel sein. Aber diese Lagerfeuer riechen anders wie alle anderen bisher in unserem Feldzug. Sie stinken geradezu bestialisch, als ob Pferdemist oder Eselsmist verbrannt wird.\n\nDas habe ich bisher nur bei den Nubiern erlebt, als sie von meinem Vater Knut und Ansgar zu uns Wikingern eingeladen wurden und mit dem Schiff hergefahren sind, um neue Abnehmer für ihre Handelswaren zu suchen. Da haben wir dunkelhäutige Menschen getroffen mit Kraushaar und wulstigen Lippen, die während ihres Besuchs bei uns teilweise jämmerlich froren. Ihre Lagerfeuer qualmen und stinken unerträglich, weil sie vorwiegend den Mist ihrer Tiere verbrennen.\n\nDamals war ich noch ein kleiner Knabe und Ansgar hat mir beim Besuch der Nubier erklärt, dass es auch Menschen mit gelber und roter Haut geben würde. Damals fand ich das faszinierend und unerklärlich zugleich!',
        msg4    = 'Inzwischen wissen wir um mindestens vier feindlichen Völkern auf dieser Insel, zwei Nubierlager und zwei babylonische Stellungen. Sie sind militärisch und wirtschaftlich gut aufgestellt, aber wir kennen unsere Insel viel besser als sie.\n\nIch hatte ein Gespräch unter vier Augen mit Ansgar, wo ich ihn habe, ob er mit dem Namen Prainn etwas anfangen könnte. Ansgar erschrak, fasste sich aber schnell und erzählte mir, dass Prainn bis vor etwa dreißig Jahren unser König war, sich aber einem Verbrechen hat zuschulden kommen lassen, und er deshalb abgesetzt wurde und das Land verlassen musste. Ein großer Teil seiner Untertanen sei damals mit ihm weggezogen.\n\nDanach wurde mein Vater Knut zum König der Wikinger gewählt und, so fügte er schmunzelnd hinzu, unser Volk verlor damals ihren besten Bäcker, bekam aber einen guten König dafür. Er wollte wissen, wie ich zu diesem Namen gekommen sei, und ich antwortete vorsichtig, ich hätte in einem Brief davon gelesen. Er fragte nicht weiter nach, und auch ich hatte danach keinen Mut, ihm weitere Fragen zu stellen.',
        msg5    = 'In dem zerstörten Hauptquartier fanden wir detaillierte Angriffspläne der Nubier gegen uns und die Kopie eines Vertrags, der im Auftrag der Babylonier geschlossen wurde, und der die Babylonier, Römer, Chinesen, Nubier und noch ein fünftes Volk, dessen Namen unleserlich war, auf einem gemeinsamen und umfassenden Feldzug gegen uns verpflichtet.\n\nAuch einen wiederholten Steckbrief des Ahasversos, der von den Babyloniern zur Suche bei uns Wikingern ausgeschrieben worden war, und etwas Werkzeug fanden wir in dem zerstörten Hafengebäude.\n\nAnsgar wurde auffallend blass im Gesicht, als er diese Dokumente studierte. Jetzt bin ich mir sicher, dass Ansgar viel mehr über diesen ganzen Kriegsfeldzug gegen uns Wikinger weiß als wir anderen, und dass er mir bewusst etwas verheimlicht, was ich anscheinend nicht erfahren darf. Ich werde mit meinem Vater Knut, unserem Wikingerkönig darüber sprechen, sobald sich die Gelegenheit dazu ergibt.',
        msg6    = 'Wir haben unseren neuen Friedhof erreicht, der nach der Aufgabe des alten Friedhofs hier neu errichtet worden ist. Leider erinnern uns nur noch schemenhafte Überreste an diese letzte Ruhestätte. Alle Grabsteine sind geschleift worden und alle Würde, die dieser Ort einstmals hatte, wurde mutwillig zerstört.\n\nIch habe Aron, unseren Baumeister und Teitur, unseren Zimmermann gebeten, die Würde dieses Ortes wieder herzustellen. Unsere älteren Soldaten sollten noch wissen, wo ihre verstorbenen Verwandten begraben worden sind. Da wären einfache Gedenksteine und Grabeinfassungen ein Anfang, um diese verwahrloste Fläche wieder in einen Friedhof zu verwandeln.\n\nFür diese Arbeit und auch für den Warentransport auf den mittlerweile langen Wegen brauchen wir die Esel aus Jons Zucht. Ich habe ihn gebeten, uns so schnell wie möglich zusätzliche Esel bereitzustellen.',
        msg99   = 'Die letzte Schlacht ist auf dieser Insel geschlagen - wir haben gesiegt und die Sandinsel, wie wir sie immer genannt haben, und auch unser neuer Friedhof darin sind wieder vollständig in unserem Besitz. Das macht es uns auch mit dem zukünftigen Gebäudebau einfacher, weil wir jetzt genügend Rohstoffe beieinander haben, um auch größere Bauwerke sicher bauen zu können. Der Sand hilft uns vor allem, den Untergrund eben und tragfähig zu bekommen. Das hat vor allem den Katapultbau bisher so mühsam gemacht.\n\nWir werden gemeinsam zu der Insel des ewigen Schnees zurückkehren, um uns dort etwas zu erholen, danach stehen zuerst die letzte und größte graue Insel, danach unsere Schlossinsel und zuletzt meine Heimatinsel auf unserer Rückeroberungsliste. Wir rechnen besonders auf den zwei grünen Inseln mit größerem Widerstand, da diese Inseln leichter und besser zu besiedeln sind als die weißen und grauen Inseln.\n\nIch freue mich sehr auf die Gemeinschaft mit meinem Vater Knut. Ich habe überdies einige ungelöste Fragen an ihn, was diesen Krieg angeht, und erhoffe von ihm Antworten, besonders über das teilweise rätselhafte Verhalten von Ansgar. Was weiß Ansgar, was ich nicht wissen darf?'
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
    rttr:GetPlayer(1):SetNation(NAT_AFRICANS)
    rttr:GetPlayer(2):SetNation(NAT_AFRICANS)
    rttr:GetPlayer(3):SetNation(NAT_BABYLONIANS)
    rttr:GetPlayer(4):SetNation(NAT_BABYLONIANS)

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
        rttr:GetWorld():AddStaticObject(76, 55, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(32, 40, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(24, 94, 0, 0, 1)
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
            [GD_WOOD      ] = 40,
            [GD_BOARDS    ] = 40,
            [GD_STONES    ] = 40,
            [GD_HAM       ] = 2,
            [GD_GRAIN     ] = 2,
            [GD_FLOUR     ] = 2,

            [GD_FISH      ] = 4,
            [GD_MEAT      ] = 6,
            [GD_BREAD     ] = 8,
            [GD_WATER     ] = 2,
            [GD_BEER      ] = 0,
            [GD_COAL      ] = 10,

            [GD_IRONORE   ] = 10,
            [GD_GOLD      ] = 3,
            [GD_IRON      ] = 10,
            [GD_COINS     ] = 3,
            [GD_TONGS     ] = 1,
            [GD_AXE       ] = 5,

            [GD_SAW       ] = 5,
            [GD_PICKAXE   ] = 5,
            [GD_HAMMER    ] = 15,
            [GD_SHOVEL    ] = 5,
            [GD_CRUCIBLE  ] = 5,
            [GD_RODANDLINE] = 5,

            [GD_SCYTHE    ] = 5,
            [GD_CLEAVER   ] = 3,
            [GD_ROLLINGPIN] = 3,
            [GD_BOW       ] = 5,
            [GD_SWORD     ] = 3,
            [GD_SHIELD    ] = 3,

            [GD_BOAT      ] = 5
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
            [JOB_PIGBREEDER         ] = 3,
            [JOB_DONKEYBREEDER      ] = 2,

            [JOB_MILLER             ] = 2,
            [JOB_BAKER              ] = 2,
            [JOB_BUTCHER            ] = 2,
            [JOB_BREWER             ] = 2,
            [JOB_MINER              ] = 8,
            [JOB_IRONFOUNDER        ] = 2,

            [JOB_ARMORER            ] = 2,
            [JOB_MINTER             ] = 2,
            [JOB_METALWORKER        ] = 2,
            [JOB_SHIPWRIGHT         ] = 2,
            [JOB_GEOLOGIST          ] = 8,
            [JOB_SCOUT              ] = 2,

            [JOB_PACKDONKEY         ] = 20,
            [JOB_CHARBURNER         ] = 0,

            [JOB_PRIVATE            ] = 50,
            [JOB_PRIVATEFIRSTCLASS  ] = 1,
            [JOB_SERGEANT           ] = 1,
            [JOB_OFFICER            ] = 1,
            [JOB_GENERAL            ] = 1
        })
    elseif (p == 0) then
        rttr:GetPlayer(p):DisableBuilding(BLD_METALWORKS)
        rttr:GetPlayer(p):DisableBuilding(BLD_DONKEYBREEDER)
        if onLoad then return end

        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 30,
            [GD_BOARDS    ] = 30,
            [GD_STONES    ] = 30,
            [GD_HAM       ] = 2,
            [GD_GRAIN     ] = 2,
            [GD_FLOUR     ] = 2,

            [GD_FISH      ] = 3,
            [GD_MEAT      ] = 4,
            [GD_BREAD     ] = 5,
            [GD_WATER     ] = 3,
            [GD_BEER      ] = 6,
            [GD_COAL      ] = 40,

            [GD_IRONORE   ] = 20,
            [GD_GOLD      ] = 4,
            [GD_IRON      ] = 20,
            [GD_COINS     ] = 3,
            [GD_TONGS     ] = 0,
            [GD_AXE       ] = 8,

            [GD_SAW       ] = 4,
            [GD_PICKAXE   ] = 8,
            [GD_HAMMER    ] = 15,
            [GD_SHOVEL    ] = 2,
            [GD_CRUCIBLE  ] = 4,
            [GD_RODANDLINE] = 3,

            [GD_SCYTHE    ] = 4,
            [GD_CLEAVER   ] = 3,
            [GD_ROLLINGPIN] = 2,
            [GD_BOW       ] = 0,
            [GD_SWORD     ] = 0,
            [GD_SHIELD    ] = 0,

            [GD_BOAT      ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 50,
            [JOB_BUILDER            ] = 15,
            [JOB_PLANER             ] = 8,
            [JOB_WOODCUTTER         ] = 4,
            [JOB_FORESTER           ] = 2,
            [JOB_STONEMASON         ] = 4,

            [JOB_FISHER             ] = 3,
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

            [JOB_PACKDONKEY         ] = 10,
            [JOB_CHARBURNER         ] = 0,

            [JOB_PRIVATE            ] = 45,
            [JOB_PRIVATEFIRSTCLASS  ] = 2,
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

    if (eState[3] > 0 and GetNumMilitaryBuilding(0, true) == 3) then
        -- EVENT3
        MissionEvent(3, false)
    end

    if (eState[4] > 0 and (rttr:GetPlayer(1):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(2):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(3):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(4):GetNumBuildings(BLD_HEADQUARTERS)) < 4) then
        -- EVENT4
        MissionEvent(4, false)
    end

    if (eState[5] > 0 and (rttr:GetPlayer(1):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(2):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(3):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(4):GetNumBuildings(BLD_HEADQUARTERS)) < 3) then
        -- EVENT5
        MissionEvent(5, false)
    end

    if ((GetNumStorage(1) + GetNumStorage(2) + GetNumStorage(3) + GetNumStorage(4)) < 1) then
        -- EVENT8 (maps to 99)
        MissionEvent(99, false)
    end
end

function onOccupied(p, x, y)
    if(p ~= 0) then return end

    if(eState[6] > 0 and x == 85 and y == 75) then
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
        rttr:GetPlayer(0):AddWares({
            [GD_MEAT    ] = 10
        })

    elseif(e == 3 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_BOARDS    ] = 20
        })

    elseif(e == 4 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_PICKAXE ] = 10
        })

    elseif(e == 5 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_SWORD   ] = 10,
            [GD_SHIELD  ] = 10
        })

    elseif(e == 6 and not onLoad) then
        rttr:GetPlayer(0):EnableBuilding(BLD_DONKEYBREEDER, not onLoad)

        if(not onLoad) then
            rttr:GetPlayer(0):AddPeople({
                [JOB_DONKEYBREEDER] = 2
            })
        end

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