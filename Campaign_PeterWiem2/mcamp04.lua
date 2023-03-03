function getRequiredLuaVersion()
    return 1
end

-- Message-Window (mission statement and hints): 52 chars wide
eIdx = {1, 2, 3, 4, 5, 6, 99}

local debugTexts = true;

rttr:RegisterTranslations(
{
    en =
    {
        title   = 'Halvar, der Späher',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = 'Leider wurden wir entdeckt, als wir hierher gesegelt sind. Ein babylonisches Lager liegt so exponiert, dass es alle Bewegungen zur See beobachten kann. Wir werden also nicht sehr lang hier unsere Ruhe haben. Glücklicherweise kenne ich die Schlucht aus Kindertagen, die wir aufgesucht haben. Ich weiß um keine ähnlich tiefe und verborgene Schlucht auf allen unseren Inseln, die mit dem Schiff befahren werden kann.\n\nWir haben unsere Familien an einen windgeschützten Ort gebracht, der im Süden von unserem Hauptquartier gelegen ist. Hier stinkt es zwar beständig, aber es ist nicht so lausig kalt wie auf den weißen Inseln. Außerdem haben wir dort den Rest von unseren Bierfässern gelagert, die noch von unseren letzten Abenteuern übriggeblieben sind. Knut soll sich hier mit unseren Frauen und Kindern einrichten, so gut es geht, weil Ansgar und ich noch nicht wissen, wie es langfristig weitergehen wird.',

        msg2    = 'Um mir im Klaren zu sein, was jetzt als Nächstes zu tun ist, führte ich ein Gespräch mit Ansgar und Halvar. Sie meinen, die Insel sei zu unübersichtlich, um allein mit Erkundungsgängen die Information über die babylonischen Feinde zu bekommen, die wir hier so dringend benötigen. Wir brauchen ein Bauwerk, was uns eine gute Übersicht verspricht.\n\nIch rief Teitur, unseren Zimmermann und Ole, unseren Schiffsbauer und Künstler, wenn es um den Umgang mit Holz geht. Beide setzten sich mit Ansgar und Halvar zusammen und gemeinsam tauschten sie ihre Vorstellungen über dieses benötigte Bauwerk aus. Am Ende kam ein Holzturm dabei heraus, der zu funktionieren scheint.\n\nAron hat mich auf einen Bauplatz im Norden hingewiesen, auf den eine Festung gerade noch Platz hätte. Allerdings wäre der Weg nach Norden dadurch eine Zeit lang verbaut. Auch Bjarki, unser Münzpräger, Ole unser Schiffsbauer und Elvor unser Schmied brennen geradezu vor Tatendrang. Aber alles auf einmal ist hier aus Platzgründen nicht möglich. Vielleicht lasse ich Ole nur ein Schiff bauen, um beweglich zu sein? Oder sichern wir das Gelände vorrangig durch eine oder gar zwei Festungen?',

        msg3    = 'Wir werden wahrscheinlich schneller von unseren Feinden hier heimgesucht werden, als uns lieb sein kann. Deshalb brauchen wir jeden Mann, um die zahlreichen Steinvorkommen und Bäume zu beseitigen und brauchbare Bauplätze freizulegen. Im Süden gibt es eine kleine Hochebene, die gut geeignet scheint, um alle notwendigen Bauten errichten zu können. Auch Nahrung für uns brauchen wir mehr als genug.\n\nUnsere Frauen und Kinder haben unter Knuts Anleitung einige Handwerkzeuge selbst gebaut. Sie sind vielleicht nicht so perfekt gefertigt, wie wir Männer das gewohnt sind, aber trotzdem hochwillkommen.',

        msg4    = 'Halvar hat im Nordosten ein Chinesenlager entdeckt. Sie sind vor allem mit dem Schiff sehr beweglich in ihren Aktionen und Manövern. Was aber haben die Chinesen hier verloren?\n\nSie sind uns offensichtlich feindlich gesinnt und scheinen ebenfalls mit den Babyloniern zusammen zu arbeiten. Warum? Und was haben sie gegen uns? Fragen über Fragen! Wir werden ihnen gegenüber sehr vorsichtig sein müssen.',

        msg5    = 'Diese Insel ist wirklich unübersichtlich! Sie hat mehrere große Schluchten, die fast nur in Längsrichtung begangen oder zum Teil mit dem Schiff befahren werden können.\n\nDarvi, Elvor, und Bjarki haben das Beste aus der vorhandenen Situation gemacht und schauen, dass sie ihren Aufgaben so schnell wie möglich und so gut wie gewohnt nachkommen können. Glücklicherweise hat es hier genug Bodenschätze, selbst Gold scheint momentan noch ausreichend vorhanden.',

        msg6    = 'Die Feinde sind wirklich stark und die Chinesen sind durch ihre schnelle und bewegliche Flotte so gut wie überall auf der Insel vertreten. Hier werden wir wohl auf dem Landweg Meter um Meter erobern müssen, weil alle Häfen besetzt sind. Das verspricht einen langen und zähen Kampf um die Alleinherrschaft auf dieser Insel.\n\nUnsere Familien haben sich den Umständen entsprechend gut eingerichtet. Knut ist dankbar für die Aufgabe, diesen provisorischen Aufenthaltsort für unsere Frauen und Kinder leiten und führen zu können. Er möchte an Ort und Stelle bleiben, bis die Verhältnisse eine Rückkehr zu unseren geliebten grünen Inseln gestatten. Zusammen mit Frauen und Kinder stellt er Werkzeuge her, um sich bei uns Männern nützlich zu machen. Die von ihnen gefertigten Schwerter und Schilde sind ungewohnt leicht und biegsam, aber sehr viel besser als nichts. Außerdem erinnern uns diese Waffen beständig an unsere Verantwortung gegenüber unseren Frauen und Kindern.\n\nMit Ansgar als Zeugen hat Knut mich, seinen Sohn Eric, zum Feldherren aller Wikinger eingesetzt und mir die Verantwortung für die Durchführung der Befreiung aller besetzten Inseln aufgetragen. Ich bin zutiefst bewegt und dankbar darüber und werde alles tun, um sein Vertrauen nicht zu enttäuschen.',

        msg99   = 'Endlich ist es uns gelungen, auch das letzte feindliche Lagergebäude auf dieser Insel zu zerstören. Im Lager der Chinesen haben wir neben anderen nützlichen Kleinigkeiten einen verschlossenen und versiegelten Brief, etwas Wintergerste und einen Sack voll Hopfen gefunden, die beide auch bei schlechten Böden und ungünstigen Temperaturen zu wachsen scheinen. Ymir, unser Landwirt, hat sich bereit erklärt, bei Gelegenheit eine Aussaat des Getreides und des Hopfens zu probieren.\n\nIn dem Brief, den ich öffnete und las, wurde ein gewisser Prainn gebeten, so schnell wie möglich zu der Insel der Zusammenkunft zu kommen. Diese Insel ist meine Heimat, aus der wir zuerst vertrieben wurden, und von Prainn erinnere ich mich, als kleiner Junge an unseren Lagerfeuern nichts Gutes gehört zu haben. Ich werde den Inhalt dieses Briefes bei Gelegenheit mit Ansgar und Knut besprechen.\n\nNun verabschieden wir uns von unseren Familien, die bei Knut in guter Obhut sind, und werden von hier aus wieder nach Norden zurücksegeln, um die restlichen grauen und weißen Inseln auf mögliche Feinde hin zu untersuchen. Wann werden wir mit unseren Frauen und Kindern wieder vereint sein?'
    }
})

-- format mission texts
function MissionText(e, silent)
    local msg = _('msg' .. tostring(e))

    if(msg ~= ('msg' .. tostring(e))) then
        if not silent then
            rttr:MissionStatement(0, _('diary'), msg .. '\n\n\n\n\n\n\n', IM_SWORDSMAN, true)
        end
        rttr:SetMissionGoal(0, msg)
    else
        rttr:Log("Error: no Translation found!" .. _(msg))
    end
end

function onSettingsReady()
    rttr:Log("-----------------------\n Mission Script loaded... \n-----------------------\n")

    rttr:ResetAddons()
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetAddon(ADDON_CATAPULT_GRAPHICS, true)
    rttr:SetGameSettings({
        ["fow"] = EXP_CLASSIC,
        ["teamView"] = false,
        ["lockedTeams"] = true,
        ["startWares"] = SWR_NORMAL,
        ["objective"] = GO_TOTALDOMINATION
    })

    rttr:GetPlayer(0):SetNation(NAT_VIKINGS)

    for p = 1, 3 do
        if(p == 1) then rttr:GetPlayer(p):SetNation(NAT_JAPANESE)
        else rttr:GetPlayer(p):SetNation(NAT_BABYLONIANS) end
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
    addPlayerRes(0, not isFirstStart)
    addPlayerRes(1, not isFirstStart)
    addPlayerRes(2, not isFirstStart)
    addPlayerRes(3, not isFirstStart)
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
        --MissionEvent(1)                   -- initial event / start screen
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
    if onLoad then return end

    if(p ~= 0) then                 -- Map activates 7 players!
        -- goods
        rttr:GetPlayer(p):ClearResources()

        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 24,
            [GD_BOARDS    ] = 44,
            [GD_STONES    ] = 68,
            [GD_MEAT      ] = 1,
            [GD_GRAIN     ] = 1,
            [GD_FLOUR     ] = 1,

            [GD_FISH      ] = 4,
            [GD_HAM       ] = 6,
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
    elseif (p == 0) then
        rttr:GetPlayer(p):ClearResources()

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

        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 15,
            [GD_BOARDS    ] = 25,
            [GD_STONES    ] = 25,
            [GD_MEAT      ] = 0,
            [GD_GRAIN     ] = 0,
            [GD_FLOUR     ] = 0,

            [GD_FISH      ] = 2,
            [GD_HAM       ] = 2,
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
            [GD_BOW       ] = 6,
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
            [JOB_HUNTER             ] = 2,
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
    
    if (eState[3] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_LOOKOUTTOWER) > 0) then
        -- EVENT3
        MissionEvent(3, false)
    end

    local milBuildingCount = rttr:GetPlayer(0):GetNumBuildings(BLD_BARRACKS) + rttr:GetPlayer(0):GetNumBuildings(BLD_GUARDHOUSE) + rttr:GetPlayer(0):GetNumBuildings(BLD_WATCHTOWER) + rttr:GetPlayer(0):GetNumBuildings(BLD_FORTRESS)

    if (eState[4] > 0 and milBuildingCount >= 5) then
        -- EVENT4
        MissionEvent(4, false)
    end

    if (eState[5] > 0 and milBuildingCount >= 7) then
        -- EVENT5
        MissionEvent(5, false)
    end

    if (eState[6] > 0 and milBuildingCount >= 12) then
        -- EVENT6
        MissionEvent(6, false)
    end

    if ((GetNumStorage(1) + GetNumStorage(2) + GetNumStorage(3)) < 1) then
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

    elseif(e == 2 and not onLoad) then
        rttr:GetPlayer(0):EnableBuilding(BLD_LOOKOUTTOWER, true)

    elseif(e == 3 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
                [GD_PICKAXE] = 2,
                [GD_BOW] = 2,
                [GD_AXE] = 2,
                [GD_RODANDLINE] = 2
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