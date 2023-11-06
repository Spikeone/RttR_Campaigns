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
        title   = 'Ansgar, der Kanzler',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = 'Genau an der Stelle, wo jetzt unser neues Hauptquartier steht, stand früher unser Königsschloss. Es wurde, wie alle anderen Gebäude hier, dem Erdboden gleichgemacht. Unter der Führung von Ansgar und Knut und unter tatkräftiger Mithilfe von Aron, Teitur und Thorben hat unser Volk sogleich ein angemessenes Gebäude als Ersatz für unser zerstörtes Schloss errichtet. Hier regierte mein Vater und hier war und ist der Mittelpunkt unseres Reiches.\n\nHier wurde auch Gericht gehalten, als Prainn als König der Wikinger abgesetzt und aus unserem Volk verstoßen wurde. Da Prainn einen unschuldigen Menschen erschlagen hatte, durfte er nicht länger König und Mitbürger unseres Volkes sein.\n\nMein Vater und Ansgar erzählen mir diese Geschichte, als sei sie erst gestern passiert. Prainn hatte einen Gast aus Wut über seine Worte umgebracht, sein Name war Ahasversos. Der unschuldig Erschlagene wurde damals auf unserem kleinen Friedhof auf der Insel des ewigen Schnees unter großer Anteilnahme unseres Volkes beerdigt.',
        msg2    = 'Prainn war vor etwa dreißig Jahren mit seinen etwa zweihundert Getreuen von uns verbannt worden. Zum Abschied sagte er zu Ansgar in stolzem Zorn, dass er ihn wiedersehen würde!\nDa erinnerte ich mich an den Brief vom Chinesenhauptquartier auf unserer grauen Schluchteninsel, wo Prainn zur Insel der Zusammenkunft gebeten wurde, und legte ihn meinem Vater und Ansgar vor. Daraufhin sahen sich mein Vater und Ansgar lange schweigend und betroffen an. Mein Vater sagte nach etwa einer Minute nur: "Ach so hat er sich das Wiedersehen gedacht; mit Krieg und Vergeltung!"\n\nAnsgar und ich ließen meinen Vater in seiner Betroffenheit eine Zeit lang allein. In einem Gespräch unter vier Augen dankte Ansgar mir für mein bisheriges Verhalten in diesem Krieg und versprach mir, zu gelegener Zeit etwas über diesen Ahasversos zu erzählen. So, wie es in seinen Augen aussieht, ist Prainn der Hauptverantwortliche für diesen Krieg, und es müsse jetzt darum gehen, ihn auf meiner Heimat, der Insel der Zusammenkunft, in unsere Gewalt zu bekommen.  Zuerst aber sollten wir meinem Vater und unserem König beistehen in seiner Betroffenheit, und unsere Schlossinsel von allen Feinden räumen.',
        msg3    = 'Nicht wenige Schiffe sind von unserem Hauptquartier aus zu sehen. Diese Insel muss also von mehreren Feinden belagert sein, und deren Wirtschaften scheinen allesamt gut zu funktionieren. Von vielen Leuten auf den vorbeifahrenden Schiffen kann man erstaunte und erschrockene Gesichter sehen, als sie unser neues Hauptquartier an seinem ursprünglichen Platz wieder aufgebaut entdeckt haben. Das bedeutet, dass sie uns mittlerweile als Gegner fürchten gelernt haben.\n\nMein Vater ist immer noch bedrückt über Prainn, und was er alles unternommen hat, um sich an uns zu rächen. Da er in dem Brief aus dem Chinesenhauptquartier gebeten wurde, die Sachen gegen uns neu zu ordnen, scheint er eine herausragende Rolle in dem Vernichtungsfeldzug gegen uns zu spielen.\n\nAber wie hat er es geschafft, ganze Völker gegen uns Wikinger aufzuwiegeln? Fragen über Fragen! Prainn wird sie uns beantworten müssen, wenn wir ihn auf meiner Heimatinsel zu fassen kriegen!',
        msg4    = 'Ringsherum um uns sind Feinde, allerdings werden die meisten davon durch das tiefe Wasser um uns herum abgehalten, uns sofort an den Kragen zu gehen. Wir werden sie allesamt auf dem Landweg oder zu Wasser irgendwann erreichen, und dann wollen wir ihnen beweisen, wer hier der Stärkere ist.\n\nEin babylonisches Lager hat Halvor im Osten ausgespäht. Es scheint militärisch so stark zu sein, dass wir es wahrscheinlich nicht einfach überrennen können. Wir warten, bis wir stark genug sind, und schauen dann nach einem schwächeren Punkt in der Abwehr des  Feindes, den wir dann angreifen werden.',
        msg5    = 'Bjarki, unser Münzpräger, macht wieder einmal einen fantastischen Job, unsere Soldaten sind aufgrund seiner guten Arbeit reichlich mit Sold versehen und sprühen deswegen vor Kampfeslust. Und auch Elvor und Darvi treiben sich gegenseitig zu Höchstleistungen an. Elvor haut nunmehr etwas vorsichtiger auf seinen neuen Amboss, dennoch fliegen die Funken nur so, und Darvi liefert zuverlässig Roheisen in rauen Mengen. Elvor und Darvy erinnern mich aufgrund ihrer Statur und ihres Auftretens ein wenig an die zwei Gallier, die in der römischen Provinz Aremorica zusammen mit den restlichen Dorfbewohnern den Römern das Leben richtig schwer machen, und von denen man schon viele erheiternde Geschichten gehört hat.\n\nDas erste feindliche Hauptquartier auf dieser Insel wurde zerstört und die Bedrohung für unsere Familien, die wir im neuen Stammschloss zurückgelassen haben, ist etwas geringer geworden. Jetzt werden wir schauen, wie wir den anderen feindlichen Lagern auf dieser Insel beikommen können.',
        msg6    = 'Von diesem Flecken Land kann man gleichzeitig im Norden unser neues Königsschloss und im äußersten Südwesten die Insel der Zusammenkunft erkennen. Wenn wir diese Insel von Feinden geräumt haben, wird sie unser letztes Ziel in diesem Feldzug sein. Aber zuerst müssen wir noch einige gegnerische Stützpunkte und etliche Hafengebäude hier erobern.\n\nDa sich die Schlossinsel sich wie eine gigantische Spirale um unser Königsschloss herumwindet, sind die Wege weit und der Transport von Nachschub und Bodenschätzen mühsam und aufwendig. Gut, dass wir Jon und seine Esel haben, die leisten uns hier gute Dienste.',
        msg99   = 'Auch diese Insel ist zurückerobert und wir Wikinger haben unser Königsschloss wieder. Unser geliebter und allseits geschätzter Ansgar wurde einstimmig als neuer Schlossherr und Kanzler von unserem Volk gewählt und in einer feierlichen Zeremonie sogleich in sein Amt eingesetzt. Da wir aber seinen Rat in unseren Schlachten schätzen gelernt haben, geht es jetzt gemeinsam mit Knut und ihm und dem gesamten Kriegsvolk zur letzten Insel, nämlich meiner Heimat.\n\nSie scheint das Zentrum zu sein, wo alles zu unserer Vernichtung geplant und in die Wege geleitet wurde. Hier wurden die Kriege gegen uns organisiert und hier werden wir Prainn antreffen und Antworten auf unsere Fragen bekommen. Ich bin schon ganz aufgeregt, meine geliebte Heimat wieder zu sehen.'
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
    rttr:GetPlayer(5):SetNation(NAT_BABYLONIANS)

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
        rttr:GetWorld():AddStaticObject(70, 42, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(28, 59, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(29, 23, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(75, 91, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(89, 36, 0, 0, 1)
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

    if (eState[5] > 0 and (rttr:GetPlayer(1):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(2):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(3):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(4):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(5):GetNumBuildings(BLD_HEADQUARTERS)) < 5) then
        -- EVENT5
        MissionEvent(5, false)
    end

    if ((GetNumStorage(1) + GetNumStorage(2) + GetNumStorage(3) + GetNumStorage(4) + GetNumStorage(5)) < 1) then
        -- EVENT8 (maps to 99)
        MissionEvent(99, false)
    end
end

function onOccupied(p, x, y)
    if(p ~= 0) then return end

    if(eState[3] > 0 and x == 19 and y == 37) then
        -- EVENT3
        MissionEvent(3, false)
    end

    if(eState[4] > 0 and x == 29 and y == 33) then
        -- EVENT4
        MissionEvent(4, false)
    end

    if(eState[6] > 0 and x == 24 and y == 75) then
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