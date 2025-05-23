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
eIdx = {1, 2, 3, 4, 5, 6, 7, 8, 99}

local debugTexts = false;
local debugEvents = false;

rttr:RegisterTranslations(
{
    de =
    {
        title   = 'Ole, der Schiffsbauer',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = 'Wie Hunde haben sie uns gehetzt! Wie die Heuschrecken sind unsere Feinde, die Babylonier, mit ihren Verbündeten über uns hergefallen. Wir waren im tiefsten Frieden, als von allen Seiten die Feinde uns angegriffen haben. Sie ließen uns keine Zeit, um Luft zu holen, in immer neuen Schlachten haben sie uns von Insel zu Insel getrieben. Einzelne von uns haben sich in den Wäldern verstecken können. Alle anderen mussten fliehen, um ihre Haut zu retten.\n\nEs blieb den Übriggebliebenen von unserem Volk zuletzt nur noch der Rückzug auf eine Insel im hohen Norden, die wir uns für Notfälle als Zuflucht angelegt haben. Den Hafen haben wir unbrauchbar gemacht, und uns in unseren Schlupfwinkel in der Mitte dieser Insel zurückgezogen.\n\nNach gemeinsamer Absprache haben wir uns entschlossen, ein Sägewerk zu bauen, weil wir fast kein Bauholz mehr haben. Auch ein Holzfällerhäuschen und eine Jagdhütte sollten wir bauen, damit wir nicht verhungern und stets etwas Brennholz haben. Es ist eiskalt hier und ohne ein Feuer nicht auszuhalten.',
        msg2    = 'Mein Vater Knut, unser großer und weiser König, ist vor Kummer und Herzeleid sprachlos geworden. Er sitzt in einem Raum in unserem Zelt, trauert und ist für nichts und niemandem zu sprechen. Meine Freunde und Kameraden haben mich, Eric, gebeten, so lange für meinen Vater Entscheidungen zu treffen, bis er wieder im Vollbesitz seiner seelischen und körperlichen Kräfte ist.\n\nMein guter Ansgar ist mein bester Freund und gleichzeitig der Älteste aller Wikinger, die es hierhergeschafft haben. Er ist Goldschmied von Beruf und kennt mich besser als ich mich selbst, weil er meine Erziehung von Kindesbeinen an verantwortlich begleitet hat.\n\nEr hat mir erzählt, dass auf einer Insel in der Nähe ein Trainingslager für junge babylonische Soldaten errichtet wurde, die von unserer Gegenwart hier nichts ahnen. Ansgar weiß um einen möglichen Hafenplatz im Südwesten unserer Insel und riet mir, diesen Platz aufzusuchen. Der Bau von weiteren Baracken wird uns helfen, diesen Platz zu finden. Außerdem gibt es an unserem Zufluchtsort noch einen Platz, wo eine Kiste mit Werkzeugen versteckt sein muss.',
        msg3    = 'Der mögliche Hafenplatz ist gefunden und er ist gar nicht so schlecht. Da Ole, mein Gefährte aus Kindertagen, sich von Kindesbeinen an für den Schiffsbau interessiert, hat er jedes Schiff bewundert und jedes Schiffswrack, das er entdecken konnte, genau besehen. Er würde sich zutrauen, ein Schiff zu bauen, das laut seinen Worten den Vergleich mit anderen Schiffen nicht scheuen müsste.\n\nNur braucht er dazu ein Hafengebäude, eine Werft, viel Bauholz und einige Leute zur Handreichung. Ich denke, wir wagen diesen Schritt, um mit dem Schiff die Umgebung zu erkundigen. Natürlich müssen wir dabei vorsichtig sein. Außerdem brauchen wir Fischer.',
        msg4    = 'Das babylonische Trainingsgelände in der Nähe ist manchmal zu hören und zu riechen. Die Wahrscheinlichkeit ist deshalb groß, irgendwann ebenfalls entdeckt zu werden. Unseres Bleibens ist hier auf Dauer nicht sicher! Wenn wir aber unsere Zuflucht verteidigen oder sie verlassen wollen, müssen wir wirtschaftlich und vor allem militärisch stärker werden. Daher sollten wir uns nach Rohstoffen umschauen, um uns Münzen prägen zu können.\n\nDie dunkle Oberfläche unseres Inselgebirges lässt reichlich Kohle darunter vermuten, aber wir brauchen auch Gold, damit Ansgar etwas zu tun bekommt. Ein Soldat, der Anerkennung und Wertschätzung durch seinen Sold erfährt, kämpft besser als ein Soldat ohne Münzen. Versuchen wir also, einen Platz für eine Münzprägerei zu finden, und dass wir Gold bekommen können, um Ansgar beschäftigen zu können.',
        msg5    = 'Wir haben die große Werkzeugkiste gefunden, die vollständig zugewachsen war. Darin befanden sich Äxte und Spitzhacken und andere Werkzeuge, die wir sehr gut gebrauchen können. Außerdem fanden sich in einem Leinenbeutel am Boden der Kiste noch lesbare, gut zusammengefaltete Baupläne über zwei stattliche Militärgebäude, auf die wir sicherlich später zurückgreifen werden.',
        msg6    = 'Oles Schiffsbaukunst ist wirklich bewundernswert, alle Achtung! Seine Schiffe machen uns beweglicher und flexibler. Es gibt scheinbar genug Hafenplätze in der Umgebung aber mit jedem gefundenen Hafenplatz steigt die Gefahr, selbst entdeckt zu werden. Allerdings steigt auch die Möglichkeit, Gold zu finden, da die neuentdeckten kleinen Inseln alle recht bergig sind.\n\nWir werden bei Bedarf Geologen hinschicken, die gelernt haben, an dem Geräusch ihrer Hammerschläge das jeweilig vorhandene Metall herauszufinden. Leider können wir momentan mit Eisen nichts anfangen, da uns sowohl die notwendigen Werkzeuge zur Bearbeitung, als auch die nötigen Leute fehlen, die damit umgehen können. Das müssen wir baldmöglichst ändern.',
        msg7    = 'Die kleineren Inseln sind zum großen Teil erkundet, was die vorhandenen Rohstoffe anbetrifft. Nur die unerforschte Insel hier ist noch übrig, und die dürfte das Trainingsgelände der Babylonier beherbergen\n\nHier sollten wir jetzt die Rohstoffe, beide Sägewerke, unseren Ansgar mit seiner Goldschmiede und vor allem sämtliche zur Verfügung stehende Soldaten zusammenziehen, und sie ausreichend mit Sold ausstatten. Das funktioniert am besten in größeren Militärgebäuden, deren Baupläne wir in der Werkzeugkiste entdeckt haben, weil dort die Münzen gleichmäßiger verteilt werden können. Vor allem brauchen wir kürzere Transportwege, als wir sie bisher haben.',
        msg8    = 'Wir sind tatsächlich an dem Punkt angelangt, wo sich unsere Zukunft als Volk entscheiden wird. Die Babylonier wollten uns ausrotten, deshalb müssen wir sie hier und jetzt besiegen. Darum brauchen wir jeden einzelnen verfügbaren Soldaten an vorderster Front und bestens ausgerüstet.\n\nDer ausgezahlte Sold hat einige von unseren jungen Kämpfern geradezu wie verwandelt, ihre Zuversicht und ihre Schlagfertigkeit sind wirklich beeindruckend. Wir können uns ausrechnen, dass wir es mit einer Übermacht von feindlichen Kämpfern zu tun haben werden, deshalb darf es keinem Soldaten an seinem Sold bis zur letzten Münze fehlen.',
        msg99   = 'Wir haben es geschafft, das dortige Hauptgebäude der Babylonier und alle ihre Lagerhäuser vollständig zu zerstören. Was noch übriggeblieben ist von dem Trainingsgelände schauen wir uns genau an, ob für uns etwas Verwertbares darunter ist. Besonders Ansgar sucht in den Ruinen eifrig nach herumliegenden Werkzeugen.\n\nAus den gefundenen Dokumenten im den Trümmern des Hauptquartiers wissen wir, dass es auf einer Nachbarinsel im Westen eine ähnliche Einrichtung gibt, allerdings für Senioren und viel besser ausgestattet wie hier – also ist Vorsicht geboten, wenn wir dorthin reisen. Außerdem hat Ansgar Knut und mich dort um ein Gespräch gebeten. Ich bin gespannt darauf, was er meinem armen Vater und mir zu sagen hat.'
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

    rttr:ResetAddons()                          -- S2-settings
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

    for p = 1, rttr:GetNumPlayers() - 1 do
        rttr:GetPlayer(p):SetNation(NAT_BABYLONIANS)
        rttr:GetPlayer(p):SetTeam(TM_TEAM1)
        rttr:GetPlayer(p):SetAI(3)
        rttr:GetPlayer(p):SetName(_('name'))
    end
end

function getAllowedChanges()
    return  { 
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
    end
    rttr:GetPlayer(0):ModifyHQ(true)

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
    end

    if(isFirstStart) then
        rttr:GetWorld():AddAnimal(24, 39, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(15, 75, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(34, 11, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(57, 14, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(87, 77, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(48, 29, SPEC_POLARBEAR)

        rttr:GetWorld():AddStaticObject(6, 34, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(53, 17, 0, 0, 1)
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
        rttr:GetPlayer(p):DisableBuilding(BLD_FORTRESS)
        rttr:GetPlayer(p):DisableBuilding(BLD_WATCHTOWER)
        rttr:GetPlayer(p):DisableBuilding(BLD_GUARDHOUSE)
        rttr:GetPlayer(p):DisableBuilding(BLD_ARMORY)
        rttr:GetPlayer(p):DisableBuilding(BLD_IRONSMELTER)
        rttr:GetPlayer(p):DisableBuilding(BLD_MILL)
        rttr:GetPlayer(p):DisableBuilding(BLD_BAKERY)
        rttr:GetPlayer(p):DisableBuilding(BLD_FARM)
        rttr:GetPlayer(p):DisableBuilding(BLD_PIGFARM)
        rttr:GetPlayer(p):DisableBuilding(BLD_SLAUGHTERHOUSE)
        rttr:GetPlayer(p):DisableBuilding(BLD_BREWERY)
        rttr:GetPlayer(p):DisableBuilding(BLD_METALWORKS)
        rttr:GetPlayer(p):DisableBuilding(BLD_DONKEYBREEDER)
        rttr:GetPlayer(p):DisableBuilding(BLD_FORESTER)
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
            [JOB_SERGEANT           ] = 0,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0
        })
    elseif (p == 0 and not onLoad) then
        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 6,
            [GD_BOARDS    ] = 11,
            [GD_STONES    ] = 17,
            [GD_HAM       ] = 0,
            [GD_GRAIN     ] = 0,
            [GD_FLOUR     ] = 0,

            [GD_FISH      ] = 1,
            [GD_MEAT      ] = 0,
            [GD_BREAD     ] = 0,
            [GD_WATER     ] = 0,
            [GD_BEER      ] = 0,
            [GD_COAL      ] = 4,

            [GD_IRONORE   ] = 0,
            [GD_GOLD      ] = 1,
            [GD_IRON      ] = 0,
            [GD_COINS     ] = 0,
            [GD_TONGS     ] = 0,
            [GD_AXE       ] = 1,

            [GD_SAW       ] = 1,
            [GD_PICKAXE   ] = 1,
            [GD_HAMMER    ] = 4,
            [GD_SHOVEL    ] = 1,
            [GD_CRUCIBLE  ] = 0,
            [GD_RODANDLINE] = 0,

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
            [JOB_HELPER             ] = 13,
            [JOB_BUILDER            ] = 2,
            [JOB_PLANER             ] = 1,
            [JOB_WOODCUTTER         ] = 2,
            [JOB_FORESTER           ] = 0,
            [JOB_STONEMASON         ] = 1,

            [JOB_FISHER             ] = 0,
            [JOB_HUNTER             ] = 0,
            [JOB_CARPENTER          ] = 1,
            [JOB_FARMER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,

            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 0,
            [JOB_BREWER             ] = 0,
            [JOB_MINER              ] = 2,
            [JOB_IRONFOUNDER        ] = 0,

            [JOB_ARMORER            ] = 0,
            [JOB_MINTER             ] = 0,
            [JOB_METALWORKER        ] = 0,
            [JOB_SHIPWRIGHT         ] = 0,
            [JOB_GEOLOGIST          ] = 2,
            [JOB_SCOUT              ] = 1,

            [JOB_PACKDONKEY         ] = 2,
            [JOB_CHARBURNER         ] = 0,

            [JOB_PRIVATE            ] = 35,
            [JOB_PRIVATEFIRSTCLASS  ] = 15,
            [JOB_SERGEANT           ] = 5,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0
        })
    end
end

function onExplored(playerIdx, x, y, owner)
    if(playerIdx ~= 0) then
        return
    end

    if (eState[3] > 0 and x == 6 and y == 53) then
        -- EVENT3
        MissionEvent(3, false)
    end
end

function onOccupied(playerIdx, x, y)
    if(playerIdx ~= 0) then
        return
    end

    if (eState[7] > 0 and x == 91 and y == 75) then
        -- EVENT7
        MissionEvent(7, false)
    end
end

function onGameFrame(gf)
    if (gf == 10 and debugTexts) then
        for _, i in ipairs(eIdx) do
            MissionText(i, false)
        end
    end
    
    if (gf == 20 and debugEvents) then
        for _, i in ipairs(eIdx) do
            MissionEvent(i, false)
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

    if (eState[4] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_HARBORBUILDING) > 0) then
        -- EVENT4
        MissionEvent(4, false)
    end

    if (eState[5] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_BARRACKS) > 3) then
        -- EVENT5
        MissionEvent(5, false)
    end

    if (eState[6] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_HARBORBUILDING) > 1) then
        -- EVENT6
        MissionEvent(6, false)

    end

    if (eState[8] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_WATCHTOWER) > 0) then
        -- EVENT8
        MissionEvent(8, false)
    end

    if (eState[99] > 0 and GetNumStorage(1) < 1) then
        -- EVENT9 (maps to 99)
        MissionEvent(99, false)
    end
end

function MissionEvent(e, onLoad)
    -- event e is invalid
    if(e == nil) then
        rttr:Log("Error: Invalid, non existing or uninitialized Event called: nil")
        return
    end

    -- event e is invalid
    if(eState[e] == nil) then
        rttr:Log("Error: Invalid, non existing or uninitialized Event called: " ..e)
        return
    end

    -- event e is inactive
    if(eState[e] <= 0) then
        return
    end

    -- call side effects for active events, check "eState[e] == 1" for multiple call events!
    if(e == 1 and not onLoad) then
        -- nothing

    elseif(e == 2 and not onLoad) then
        rttr:GetPlayer(0):AddPeople({[JOB_HUNTER] = 4})

    elseif(e == 3 and not onLoad) then
        rttr:GetPlayer(0):AddPeople({[JOB_FISHER] = 4, [JOB_SHIPWRIGHT] = 1})

    elseif(e == 4 and not onLoad) then
        rttr:GetPlayer(0):AddPeople({[JOB_MINTER] = 1})

    elseif(e == 5 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
                [GD_HAMMER] = 10,
                [GD_AXE] = 10,
                [GD_PICKAXE] = 10,
                [GD_RODANDLINE] = 5
            })
        rttr:GetPlayer(0):AddPeople({
                [JOB_HUNTER] = 5
            })

    elseif(e == 6 and not onLoad) then
        -- nothing

    elseif(e == 7) then
        rttr:GetPlayer(0):EnableBuilding(BLD_GUARDHOUSE, not onLoad)
        rttr:GetPlayer(0):EnableBuilding(BLD_WATCHTOWER, not onLoad)

    elseif(e == 8 and not onLoad) then
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

function GetNumMilitaryBuilding(plr, withHarbor)
    local numBld = rttr:GetPlayer(plr):GetNumBuildings(BLD_BARRACKS) + rttr:GetPlayer(plr):GetNumBuildings(BLD_GUARDHOUSE) + rttr:GetPlayer(plr):GetNumBuildings(BLD_WATCHTOWER) + rttr:GetPlayer(plr):GetNumBuildings(BLD_FORTRESS)

    if(withHarbor) then
        numBld = numBld + rttr:GetPlayer(plr):GetNumBuildings(BLD_HARBORBUILDING)
    end

    return numBld
end

function GetNumStorage(plr)
    return rttr:GetPlayer(plr):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(plr):GetNumBuildings(BLD_HARBORBUILDING) + rttr:GetPlayer(plr):GetNumBuildings(BLD_STOREHOUSE)
end

function addExtraBoards(plrId, amount)
    rttr:GetPlayer(plrId):AddWares({[GD_BOARDS] = amount})
end

function addExtraSoldiers(plrId, amount)
    rttr:GetPlayer(plrId):AddPeople({[JOB_PRIVATE] = amount})
end