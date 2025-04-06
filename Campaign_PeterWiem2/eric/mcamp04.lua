function getRequiredLuaVersion()
    return 1
end

local requiredFeature = 4
function checkVersion()
    local featureLevel = rttr:GetFeatureLevel()
    if(featureLevel < requiredFeature) then
        rttr:MsgBox("LUA-Version Error", "Your Return to the Roots version is outdated. The required LUA-Feature level is " ..requiredFeature.. ", your version is "..featureLevel..". The script can possibly crash or run unexpectedly!\n\nPlease update the game!", true)
    end
end

-- Message-Window (mission statement and hints): 52 chars wide
eIdx = {1, 2, 3, 4, 5, 6, 99}

local debugTexts = false;

rttr:RegisterTranslations(
{
    en =
    {
        title   = 'Halvar, the Scout',
        name    = 'Unknown Enemy',
        diary   = 'Diary',

        msg1    = 'Unfortunately, we were discovered when we sailed here. A Babylonian camp is so exposed that it can observe all movements at sea. So we won\'t have much peace and quiet here for very long. Fortunately, I know the gorge we visited from my childhood. I don\'t know of a similarly deep and hidden gorge on any of our islands that can be navigated by boat.\n\nWe took our families to a sheltered spot to the south of our headquarters. It stinks here all the time, but it\'s not as lousy cold as on the white islands. We have also stored the rest of our beer barrels left over from our last adventures there. Knut is supposed to settle in here with our wives and children as best he can, because Ansgar and I don\'t yet know what the long-term plans are.',
        msg2    = 'In order to be clear about what to do next, I had a conversation with Ansgar and Halvar. They think the island is too confusing to get the information about the Babylonian enemies that we so urgently need here just by exploring. We need a building that will give us a good overview.\n\nI called Teitur, our carpenter, and Ole, our shipbuilder and artist when it comes to working with wood. Both sat down with Ansgar and Halvar and together they exchanged ideas about the structure we needed. In the end, they came up with a slender wooden tower that seems to work.\n\nAron pointed out a building site in the north where a fortress would just about fit. However, the road to the north would be blocked for a while. Bjarki, our coiner, Ole, our shipbuilder, and Elvor, our blacksmith, are also burning with energy. But it\'s not possible to do everything at once due to lack of space. Maybe I\'ll just have Ole build a ship to be mobile? Or do we prioritize securing the area with one or even two fortresses?',
        msg3    = 'We will probably be beset by our enemies here sooner than we would like. That\'s why we need every man we can get to clear the numerous stone deposits and trees and clear usable building sites. There is a small plateau in the south that seems well suited to erecting all the necessary buildings. We also need more than enough food for ourselves.\n\nOur women and children have built some hand tools themselves under Knut\'s guidance. They may not be as perfectly made as we men are used to, but they are still very welcome.',
        msg4    = 'Halvar has discovered a Chinese camp in the north-east. They are very agile in their actions and maneuvers, especially by ship. But what are the Chinese doing here?\n\nThey are obviously hostile to us and also seem to be working with the Babylonians. Why? And what do they have against us? Questions upon questions! We will have to be very careful with them.',
        msg5    = 'This island is really confusing! It has several large gorges that can almost only be navigated lengthways or partly by boat.\n\nDarvi, Elvor and Bjarki have made the best of the situation and are making sure that they can carry out their tasks as quickly as possible and as well as usual. Fortunately, there are enough natural resources here, even gold seems to be available at the moment.',
        msg6    = 'The enemies are really strong and the Chinese are represented almost everywhere on the island thanks to their fast and mobile fleet. We will probably have to conquer the island by land, meter by meter, because all the ports are occupied.\n\nKnut is grateful for the task of managing and running the temporary shelter for our women and children. Together with the women and children, he makes swords and shields to make himself useful to us men. They can\'t compare with Elvor\'s products, but you can fight and protect yourself with them, and that\'s all a soldier really needs.\n\nWith Ansgar as a witness, Knut has appointed me, his son Eric, as commander of all the Vikings and given me responsibility for carrying out the liberation of all the occupied islands. I am deeply moved and grateful and will do everything in my power not to betray his trust.',
        msg99   = 'We have finally succeeded in destroying the last enemy camp building on this island. In the Chinese camp we found a closed and sealed letter, some winter barley and a sack full of hops, among other useful items. Ymir, our farmer, has agreed to try sowing the grain and hops when he gets the chance.\n\nIn the letter I opened and read, a certain Prainn was asked to come to the Isle of Gathering as soon as possible. This island is my home, from which we were first expelled, and I remember hearing nothing good from Prainn as a young boy around our campfires. I will discuss the contents of this letter with Ansgar and Knut when I get the chance.\n\nNow we say goodbye to our families, who are in Knut\'s good care, and will sail back north from here to check the remaining gray and white islands for possible enemies. When will we be reunited with our wives and children?'
    },
    de =
    {
        title   = 'Halvar, der Späher',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = 'Leider wurden wir entdeckt, als wir hierher gesegelt sind. Ein babylonisches Lager liegt so exponiert, dass es alle Bewegungen zur See beobachten kann. Wir werden also nicht sehr lang hier unsere Ruhe haben. Glücklicherweise kenne ich die Schlucht aus Kindertagen, die wir aufgesucht haben. Ich weiß um keine ähnlich tiefe und verborgene Schlucht auf allen unseren Inseln, die mit dem Schiff befahren werden kann.\n\nWir haben unsere Familien an einen windgeschützten Ort gebracht, der im Süden von unserem Hauptquartier gelegen ist. Hier stinkt es zwar beständig, aber es ist nicht so lausig kalt wie auf den weißen Inseln. Außerdem haben wir dort den Rest von unseren Bierfässern gelagert, die noch von unseren letzten Abenteuern übriggeblieben sind. Knut soll sich hier mit unseren Frauen und Kindern einrichten, so gut es geht, weil Ansgar und ich noch nicht wissen, wie es langfristig weitergehen soll.',
        msg2    = 'Um mir darüber im Klaren zu sein, was jetzt als Nächstes zu tun ist, führte ich ein Gespräch mit Ansgar und Halvar. Sie meinen, die Insel sei zu unübersichtlich, um allein mit Erkundungsgängen die Information über die babylonischen Feinde zu bekommen, die wir hier so dringend benötigen. Wir brauchen ein Bauwerk, was uns eine gute Übersicht verspricht.\n\nIch rief Teitur, unseren Zimmermann und Ole, unseren Schiffsbauer und Künstler, wenn es um den Umgang mit Holz geht. Beide setzten sich mit Ansgar und Halvar zusammen und gemeinsam tauschten sie ihre Vorstellungen über dieses benötigte Bauwerk aus. Am Ende kam ein schlanker Holzturm dabei heraus, der zu funktionieren scheint.\n\nAron hat mich auf einen Bauplatz im Norden hingewiesen, auf den eine Festung gerade noch Platz hätte. Allerdings wäre der Weg nach Norden dadurch eine Zeit lang verbaut. Auch Bjarki, unser Münzpräger, Ole unser Schiffsbauer und Elvor unser Schmied brennen geradezu vor Tatendrang. Aber alles auf einmal ist hier aus Platzgründen nicht möglich. Vielleicht lasse ich Ole nur ein Schiff bauen, um beweglich zu sein? Oder sichern wir das Gelände vorrangig durch eine oder gar zwei Festungen?',
        msg3    = 'Wir werden wahrscheinlich schneller von unseren Feinden hier heimgesucht werden, als uns lieb sein kann. Deshalb brauchen wir jeden Mann, um die zahlreichen Steinvorkommen und Bäume zu beseitigen und brauchbare Bauplätze freizulegen. Im Süden gibt es eine kleine Hochebene, die gut geeignet scheint, um alle notwendigen Bauten errichten zu können. Auch Nahrung für uns brauchen wir mehr als genug.\n\nUnsere Frauen und Kinder haben unter Knuts Anleitung einige Handwerkzeuge selbst gebaut. Sie sind vielleicht nicht so perfekt gefertigt, wie wir Männer das gewohnt sind, aber trotzdem hochwillkommen.',
        msg4    = 'Halvar hat im Nordosten ein Chinesenlager entdeckt. Sie sind vor allem mit dem Schiff sehr beweglich in ihren Aktionen und Manövern. Was aber haben die Chinesen hier zu suchen?\n\nSie sind uns offensichtlich feindlich gesinnt und scheinen ebenfalls mit den Babyloniern zusammen zu arbeiten. Warum? Und was haben sie gegen uns? Fragen über Fragen! Wir werden ihnen gegenüber sehr vorsichtig sein müssen.',
        msg5    = 'Diese Insel ist wirklich unübersichtlich! Sie hat mehrere große Schluchten, die fast nur in Längsrichtung begangen oder zum Teil mit dem Schiff befahren werden können.\n\nDarvi, Elvor, und Bjarki haben das Beste aus der vorhandenen Situation gemacht und schauen, dass sie ihren Aufgaben so schnell wie möglich und so gut wie gewohnt nachkommen können. Glücklicherweise hat es hier genug Bodenschätze, selbst Gold scheint momentan noch ausreichend vorhanden.',
        msg6    = 'Die Feinde sind wirklich stark und die Chinesen sind durch ihre schnelle und bewegliche Flotte so gut wie überall auf der Insel vertreten. Hier werden wir wohl auf dem Landweg Meter um Meter erobern müssen, weil alle Häfen besetzt sind.\n\nKnut ist dankbar für die Aufgabe, den provisorischen Aufenthaltsort für unsere Frauen und Kinder leiten und führen zu können. Zusammen mit Frauen und Kinder stellt er Schwerter und Schilde her, um sich bei uns Männern nützlich zu machen. Die sind mit Elvors Produkten nicht zu vergleichen, aber man kann mit ihnen kämpfen und sich schützen, und mehr braucht ein Soldat im Grunde nicht.\n\nMit Ansgar als Zeugen hat Knut mich, seinen Sohn Eric, zum Feldherren aller Wikinger eingesetzt und mir die Verantwortung für die Durchführung der Befreiung aller besetzten Inseln aufgetragen. Ich bin zutiefst bewegt und dankbar darüber und werde alles tun, um sein Vertrauen nicht zu enttäuschen.',
        msg99   = 'Endlich ist es uns gelungen, auch das letzte feindliche Lagergebäude auf dieser Insel zu zerstören. Im Lager der Chinesen haben wir neben anderen nützlichen Kleinigkeiten einen verschlossenen und versiegelten Brief, etwas Wintergerste und einen Sack voll Hopfen gefunden. Ymir, unser Landwirt, hat sich bereit erklärt, bei Gelegenheit eine Aussaat des Getreides und des Hopfens zu probieren.\n\nIn dem Brief, den ich öffnete und las, wurde ein gewisser Prainn gebeten, so schnell wie möglich zu der Insel der Zusammenkunft zu kommen. Diese Insel ist meine Heimat, aus der wir zuerst vertrieben worden sind, und von Prainn erinnere ich mich, als kleiner Junge an unseren Lagerfeuern nichts Gutes gehört zu haben. Ich werde den Inhalt dieses Briefes bei Gelegenheit mit Ansgar und Knut besprechen.\n\nNun verabschieden wir uns von unseren Familien, die bei Knut in guter Obhut sind, und werden von hier aus wieder nach Norden zurücksegeln, um die restlichen grauen und weißen Inseln auf mögliche Feinde hin zu untersuchen. Wann werden wir mit unseren Frauen und Kindern wieder vereint sein?'
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
    checkVersion()
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
    if isFirstStart then
        addExtraBoards(1, 50)
        addExtraBoards(2, 50)
        addExtraSoldiers(2, 20)
    end
    rttr:GetPlayer(0):ModifyHQ(true)

    eState = {}                             -- enable all events
    for _, i in ipairs(eIdx) do
        eState[i] = 1
    end

    if not isFirstStart then                -- initialize history of all called events, event counter at ["n"]
        for i = 1, eHist["n"] do
            MissionEvent(eHist[i], true)    -- call events without mission text to activate all achievements
        end
    else
        eHist = {["n"] = 0}
    end

    if(isFirstStart) then
        rttr:GetWorld():AddStaticObject(51, 22, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(26, 86, 0, 0, 1)
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
    if (p == 0) then
        rttr:GetPlayer(p):DisableBuilding(BLD_LOOKOUTTOWER)
        rttr:GetPlayer(p):DisableBuilding(BLD_CATAPULT)
        rttr:GetPlayer(p):DisableBuilding(BLD_MILL)
        rttr:GetPlayer(p):DisableBuilding(BLD_BAKERY)
        rttr:GetPlayer(p):DisableBuilding(BLD_FARM)
        rttr:GetPlayer(p):DisableBuilding(BLD_PIGFARM)
        rttr:GetPlayer(p):DisableBuilding(BLD_SLAUGHTERHOUSE)
        rttr:GetPlayer(p):DisableBuilding(BLD_BREWERY)
        rttr:GetPlayer(p):DisableBuilding(BLD_METALWORKS)
        rttr:GetPlayer(p):DisableBuilding(BLD_FORESTER)
        rttr:GetPlayer(p):DisableBuilding(BLD_DONKEYBREEDER)
        rttr:GetPlayer(p):DisableBuilding(BLD_WELL)
    end

    if (p ~= 0 and not onLoad) then
        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 24,
            [GD_BOARDS    ] = 44,
            [GD_STONES    ] = 68,
            [GD_HAM       ] = 1,
            [GD_GRAIN     ] = 1,
            [GD_FLOUR     ] = 1,

            [GD_FISH      ] = 4,
            [GD_MEAT      ] = 6,
            [GD_BREAD     ] = 8,
            [GD_WATER     ] = 2,
            [GD_BEER      ] = 6,
            [GD_COAL      ] = 20,

            [GD_IRONORE   ] = 20,
            [GD_GOLD      ] = 4,
            [GD_IRON      ] = 4,
            [GD_COINS     ] = 4,
            [GD_TONGS     ] = 1,
            [GD_AXE       ] = 6,

            [GD_SAW       ] = 4,
            [GD_PICKAXE   ] = 4,
            [GD_HAMMER    ] = 16,
            [GD_SHOVEL    ] = 4,
            [GD_CRUCIBLE  ] = 4,
            [GD_RODANDLINE] = 6,

            [GD_SCYTHE    ] = 8,
            [GD_CLEAVER   ] = 2,
            [GD_ROLLINGPIN] = 2,
            [GD_BOW       ] = 2,
            [GD_SWORD     ] = 6,
            [GD_SHIELD    ] = 6,

            [GD_BOAT      ] = 8
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 52,
            [JOB_BUILDER            ] = 10,
            [JOB_PLANER             ] = 6,
            [JOB_WOODCUTTER         ] = 8,
            [JOB_FORESTER           ] = 4,
            [JOB_STONEMASON         ] = 6,

            [JOB_FISHER             ] = 2,
            [JOB_HUNTER             ] = 4,
            [JOB_CARPENTER          ] = 4,
            [JOB_FARMER             ] = 2,
            [JOB_PIGBREEDER         ] = 2,
            [JOB_DONKEYBREEDER      ] = 2,

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
            [JOB_GEOLOGIST          ] = 6,
            [JOB_SCOUT              ] = 2,

            [JOB_PACKDONKEY         ] = 12,
            [JOB_CHARBURNER         ] = 0,

            [JOB_PRIVATE            ] = 40,
            [JOB_PRIVATEFIRSTCLASS  ] = 6,
            [JOB_SERGEANT           ] = 1,
            [JOB_OFFICER            ] = 1,
            [JOB_GENERAL            ] = 1
        })
    elseif (p == 0 and not onLoad) then
        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 15,
            [GD_BOARDS    ] = 25,
            [GD_STONES    ] = 25,
            [GD_HAM       ] = 0,
            [GD_GRAIN     ] = 0,
            [GD_FLOUR     ] = 0,

            [GD_FISH      ] = 2,
            [GD_MEAT      ] = 2,
            [GD_BREAD     ] = 2,
            [GD_WATER     ] = 0,
            [GD_BEER      ] = 200,
            [GD_COAL      ] = 20,

            [GD_IRONORE   ] = 20,
            [GD_GOLD      ] = 8,
            [GD_IRON      ] = 20,
            [GD_COINS     ] = 4,
            [GD_TONGS     ] = 0,
            [GD_AXE       ] = 6,

            [GD_SAW       ] = 2,
            [GD_PICKAXE   ] = 8,
            [GD_HAMMER    ] = 12,
            [GD_SHOVEL    ] = 0,
            [GD_CRUCIBLE  ] = 3,
            [GD_RODANDLINE] = 6,

            [GD_SCYTHE    ] = 0,
            [GD_CLEAVER   ] = 0,
            [GD_ROLLINGPIN] = 0,
            [GD_BOW       ] = 0,
            [GD_SWORD     ] = 0,
            [GD_SHIELD    ] = 0,

            [GD_BOAT      ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 50,
            [JOB_BUILDER            ] = 9,
            [JOB_PLANER             ] = 5,
            [JOB_WOODCUTTER         ] = 6,
            [JOB_FORESTER           ] = 0,
            [JOB_STONEMASON         ] = 6,

            [JOB_FISHER             ] = 2,
            [JOB_HUNTER             ] = 6,
            [JOB_CARPENTER          ] = 3,
            [JOB_FARMER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,

            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 0,
            [JOB_BREWER             ] = 0,
            [JOB_MINER              ] = 9,
            [JOB_IRONFOUNDER        ] = 1,

            [JOB_ARMORER            ] = 1,
            [JOB_MINTER             ] = 2,
            [JOB_METALWORKER        ] = 0,
            [JOB_SHIPWRIGHT         ] = 1,
            [JOB_GEOLOGIST          ] = 5,
            [JOB_SCOUT              ] = 2,

            [JOB_PACKDONKEY         ] = 9,
            [JOB_CHARBURNER         ] = 0,
    

            [JOB_PRIVATE            ] = 30,
            [JOB_PRIVATEFIRSTCLASS  ] = 10,
            [JOB_SERGEANT           ] = 5,
            [JOB_OFFICER            ] = 2,
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

    local milBuildingCount = GetNumMilitaryBuilding(0, true)

    if (eState[3] > 0 and milBuildingCount >= 3) then
        -- EVENT3
        MissionEvent(3, false)
    end

    if (eState[4] > 0 and milBuildingCount >= 6) then
        -- EVENT4
        MissionEvent(4, false)
    end

    if (eState[5] > 0 and milBuildingCount >= 9) then
        -- EVENT5
        MissionEvent(5, false)
    end

    if (eState[6] > 0 and milBuildingCount >= 12) then
        -- EVENT6
        MissionEvent(6, false)
    end

    if (eState[99] > 0 and (GetNumStorage(1) + GetNumStorage(2) + GetNumStorage(3)) < 1) then
        -- EVENT7 (maps to 99)
        MissionEvent(99, false)
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

    elseif(e == 2) then
        rttr:GetPlayer(0):EnableBuilding(BLD_LOOKOUTTOWER, not onLoad)

    elseif(e == 3 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
                [GD_PICKAXE] = 2,
                [GD_AXE] = 2,
                [GD_RODANDLINE] = 2
            })
        rttr:GetPlayer(0):AddPeople({
                [JOB_HUNTER] = 2
            })

    elseif(e == 4 and not onLoad) then
        -- nothing

    elseif(e == 5 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
                [GD_COINS] = 20
            })

    elseif(e == 6 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
                [GD_SWORD] = 10,
                [GD_SHIELD] = 10
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
    local numBld = rttr:GetPlayer(plr):GetNumBuildings(BLD_BARRACKS) + rttr:GetPlayer(plr):GetNumBuildings(BLD_GUARDHOUSE) + rttr:GetPlayer(plr):GetNumBuildings(BLD_WATCHTOWER) + rttr:GetPlayer(plr):GetNumBuildings(BLD_FORTRESS)

    if(withHarbor) then
        numBld = numBld + rttr:GetPlayer(plr):GetNumBuildings(BLD_HARBORBUILDING)
    end

    return numBld
end

function addExtraBoards(plrId, amount)
    rttr:GetPlayer(plrId):AddWares({[GD_BOARDS] = amount})
end

function addExtraSoldiers(plrId, amount)
    rttr:GetPlayer(plrId):AddPeople({[JOB_PRIVATE] = amount})
end