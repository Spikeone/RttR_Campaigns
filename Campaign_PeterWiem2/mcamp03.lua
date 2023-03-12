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
        title   = 'Aron, der Burgenbauer',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = 'Wir hatten intensiven Schiffsverkehr in Verbindung mit dieser Insel beobachtet. Darunter waren auch Schiffe von anderer Bauart und anderer Beflaggung als die Babylonier. Es könnte deshalb möglich sein, noch andere Eindringlinge zusätzlich zu den Babyloniern auf dieser Insel anzutreffen. Das haben wir, Ansgar, Knut und ich, aber unseren Frauen und Kindern verschwiegen, damit sie sich nicht unnötig Sorgen um uns machen. Deshalb haben wir sie auch mit einigen Männern und unserem König auf der letzten Insel zurückgelassen. Knut muss dort notfalls einen feindlichen Angriff abwehren können. Und das kann er, wenn ihm genügend Zeit dazu gelassen wird.\n\nUnserem König und unseren Familien haben wir drei Fässer Bier zurückgelassen, alle anderen haben wir mit uns genommen. Für einen Soldaten scheint Bier etwas Unersetzliches zu sein. Selbst unsere Jünglinge, die noch nie mit Schwert und Schild hantiert haben, sind auf einmal losgezogen in die Schlachten und haben wie gestandene Soldaten gekämpft. Deshalb benötigen wir dieses Bier und überdies schmeckt es nicht gar zu schlecht!',
        msg2    = 'Wir hätten einen guten und geschützten Hafenplatz in unmittelbarer Nähe, aber wir müssen uns den Weg dorthin erst einmal freiräumen. Auch hier hat es genügend Ananasbäume und bisher hat es selbst Elvor mit seiner Bärenkraft nicht fertiggebracht, solch einen Baum zu fällen. Der Stamm ist dick und eisenhart, deshalb müssen wir unsere Wege um diese Ananas herum legen. Nebenbei hat es hier jede Menge Holz und Steine, so dass unsere Steinhauer und Holzfäller sich nicht über Mangel an Arbeit zu beklagen haben. Ansgar ist mit Halvar, einem jungen, aber verständigen Burschen losgezogen, um die Insel genauer in Augenschein zu nehmen. Sie müssen vorsichtig sein, weil die feindlichen Schiffe überall auftauchen können.',
        msg3    = 'Oberhalb des Hafengeländes auf einer Anhöhe hat es guten und ebenen Baugrund, um unsere notwendigen Gebäude errichten zu können. Elvor läuft schon die ganze Zeit mit dem Schmiedehammer in der Hand herum, und Darvi hat bereits Sehnsucht nach seinem Hochtemperaturraum. Auch unser neu angelernter Münzpräger Bjarki hätte nichts dagegen, wenn er seiner neugelernten Tätigkeit nachkommen könnte. Also schauen wir, dass wir die Bauplätze geräumt kriegen, und unsere Bergwerker ergiebige Rohstoffquellen bekommen.',
        msg4    = 'Unsere Jäger haben Aron völlig entkräftet in den Wäldern um unseren Hafenplatz entdeckt. Aron ist unser Baumeister, und wir haben ihn auf der Flucht vor den Babyloniern verloren. Er konnte sich mit dem Boot und etwas Handwerkzeug hierhin retten und hat mehr schlecht als recht von Enten, Pilzen und Wasser gelebt.\n\nWir haben ihm erst einmal etwas zu Essen und von unserem Bier gegeben, damit er wieder zu Kräften kommt. Er berichtete und von mindestens zwei Lagern, die er auf unserer Insel entdeckt hat. Sie seien aber nicht allzu groß gewesen. Noch interessanter ist die Tatsache, dass er selbstgebaute Schneemänner gesehen hat, die recht zahlreich im nördlichen Teil der Insel vorhanden seien. Da die Babylonier keine Schneemänner bauen, muss also noch ein weiteres Volk auf der Insel sein. Das könnte die fremden Schiffe erklären, die wir im Zusammenhang mit dieser Insel beobachtet haben.',
        msg5    = 'Aron hat unsere bisherigen Militärgebäude besichtigt und seine Bewunderung geäußert, dass wir damit so weit gekommen sind. Er hat uns gebeten, ein größeres Gebäude bauen zu dürfen, damit unsere Soldaten auch einmal zu neunt sich darin aufhalten könnten. Nichts lieber als das! Aron hat erklärt wieviel Holz und vor allem wieviel Steine er dazu benötigen würde – die haben wir ihm sofort zur Verfügung gestellt.',
        msg6    = 'Aron hat einen Kasten hingestellt, eine richtige Hausnummer! Mit diesen Burgen kann man ganz anders verteidigen und angreifen. Nur schade, dass sie so viel Platz brauchen, aber man kann nicht alles haben. Ich denke, wir werden vor allem an den Fronten schauen, dass wir vorzugsweise solche Festungen errichten werden.',
        msg7    = 'Ansgar ist mit Halvar zurückgekommen. Beide bestätigen das Vorhandensein von einem babylonischen Lager, die aber bis jetzt nicht allzu gefährlich erscheint. Umso mehr sollten wir uns vor einem großen römischen Versorgungslager im Norden der Insel in Acht nehmen. Sie arbeiten mit den Babyloniern zusammen, unterstützen sie vor allem mit Nahrung und Waffen, und sind wirtschaftlich und militärisch als sehr stark einzuschätzen. Sie können uns richtig wehtun, wenn es zu einer offenen Schlacht zwischen uns und ihnen kommen würde. Nebenbei haben sie auf der benachbarten grauen Insel ein babylonisches Lager in Ufernähe entdeckt. Das könnte unsere nächste Aufgabe nach der Rückeroberung dieser Insel werden.\n\nVon unseren neugebauten Festungen waren Halvar und vor allem Ansgar schwer beeindruckt. Er riet uns, unsere Wirtschaft und unser Militär so weit wie möglich hochzufahren und die Römer an allen Fronten zu bekämpfen, wo wir auf sie stoßen würden. Dabei müssen wir uns aber vorsehen, denn die Römer wissen, wie man Kriege führt. Also mobilisieren wir zuerst einmal alles, was eine Angel halten und einen Bogen führen kann, um unsere Bergwerker nicht hungern zu lassen.',
        msg99   = 'Endlich ist diese Insel wieder in unserer Hand. Wir werden einen kleinen Stützpunkt zurücklassen damit diese Insel unser bleibt. Alle Handwerker werden mit uns zur letzten Insel zurückfahren, um unseren König und unsere Frauen und Kinder wiederzusehen. Wahrscheinlich werden wir mit Ihnen zusammen zu der grauen Insel fahren, wo Ansgar und Halvar das babylonische Lager entdeckt haben.',
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

    rttr:ResetAddons()                          -- S2-settings
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

    for p = 1, 2 do
        --rttr:GetPlayer(p):SetNation(NAT_BABYLONIANS)
        rttr:GetPlayer(p):SetTeam(TM_TEAM1)
        rttr:GetPlayer(p):SetAI(3)
        rttr:GetPlayer(p):SetName(_('name'))
    end
    
    rttr:GetPlayer(1):SetNation(NAT_ROMANS)
    rttr:GetPlayer(2):SetNation(NAT_BABYLONIANS)
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
    addPlayerRes(0, not isFirstStart)
    addPlayerRes(1, not isFirstStart)
    addPlayerRes(2, not isFirstStart)
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
        --MissionEvent(1)                         -- initial event / start screen
    end

    if(isFirstStart) then
        rttr:GetWorld():AddAnimal(80, 32, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(85, 76, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(26, 80, SPEC_POLARBEAR)

        rttr:GetWorld():AddStaticObject(22, 71, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(89, 20, 0, 0, 1)
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
    elseif (p == 0) then
        rttr:GetPlayer(p):ClearResources()

        rttr:GetPlayer(p):DisableBuilding(BLD_FORTRESS)
        rttr:GetPlayer(p):DisableBuilding(BLD_CATAPULT)
        rttr:GetPlayer(p):DisableBuilding(BLD_LOOKOUTTOWER)

        rttr:GetPlayer(p):DisableBuilding(BLD_WELL)
        rttr:GetPlayer(p):DisableBuilding(BLD_MILL)
        rttr:GetPlayer(p):DisableBuilding(BLD_BAKERY)
        rttr:GetPlayer(p):DisableBuilding(BLD_FARM)
        rttr:GetPlayer(p):DisableBuilding(BLD_DONKEYBREEDER)
        rttr:GetPlayer(p):DisableBuilding(BLD_METALWORKS)
        rttr:GetPlayer(p):DisableBuilding(BLD_BREWERY)
        rttr:GetPlayer(p):DisableBuilding(BLD_SLAUGHTERHOUSE)
        rttr:GetPlayer(p):DisableBuilding(BLD_PIGFARM)
        rttr:GetPlayer(p):DisableBuilding(BLD_FORESTER)

        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 6,
            [GD_BOARDS    ] = 20,
            [GD_STONES    ] = 50,
            [GD_HAM       ] = 0,
            [GD_GRAIN     ] = 0,
            [GD_FLOUR     ] = 0,

            [GD_FISH      ] = 5,
            [GD_MEAT      ] = 5,
            [GD_BREAD     ] = 5,
            [GD_WATER     ] = 0,
            [GD_BEER      ] = 100,
            [GD_COAL      ] = 8,

            [GD_IRONORE   ] = 8,
            [GD_GOLD      ] = 4,
            [GD_IRON      ] = 4,
            [GD_COINS     ] = 4,
            [GD_TONGS     ] = 0,
            [GD_AXE       ] = 4,

            [GD_SAW       ] = 4,
            [GD_PICKAXE   ] = 4,
            [GD_HAMMER    ] = 14,
            [GD_SHOVEL    ] = 0,
            [GD_CRUCIBLE  ] = 0,
            [GD_RODANDLINE] = 1,

            [GD_SCYTHE    ] = 0,
            [GD_CLEAVER   ] = 0,
            [GD_ROLLINGPIN] = 0,
            [GD_BOW       ] = 1,
            [GD_SWORD     ] = 0,
            [GD_SHIELD    ] = 0,

            [GD_BOAT      ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 20,
            [JOB_BUILDER            ] = 8,
            [JOB_PLANER             ] = 5,
            [JOB_WOODCUTTER         ] = 6,
            [JOB_FORESTER           ] = 0,
            [JOB_STONEMASON         ] = 4,

            [JOB_FISHER             ] = 2,
            [JOB_HUNTER             ] = 2,
            [JOB_CARPENTER          ] = 2,
            [JOB_FARMER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,

            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 0,
            [JOB_BREWER             ] = 0,
            [JOB_MINER              ] = 4,
            [JOB_IRONFOUNDER        ] = 1,

            [JOB_ARMORER            ] = 1,
            [JOB_MINTER             ] = 1,
            [JOB_METALWORKER        ] = 0,
            [JOB_SHIPWRIGHT         ] = 0,
            [JOB_GEOLOGIST          ] = 4,
            [JOB_SCOUT              ] = 2,

            [JOB_PACKDONKEY         ] = 20,
            [JOB_CHARBURNER         ] = 0,
    

            [JOB_PRIVATE            ] = 50,
            [JOB_PRIVATEFIRSTCLASS  ] = 0,
            [JOB_SERGEANT           ] = 0,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0
        })
    end
end

function onExplored(playerIdx, x, y, owner)
    if(playerIdx ~= 0) then
        return
    end
end

function onOccupied(playerIdx, x, y)
    if(playerIdx ~= 0) then
        return
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
    
    if (rttr:GetPlayer(0):GetNumBuildings(BLD_SAWMILL) > 0) then
        -- EVENT2
        MissionEvent(2, false)
    end

    if ((
        rttr:GetPlayer(0):GetNumBuildings(BLD_BARRACKS) + 
        rttr:GetPlayer(0):GetNumBuildings(BLD_GUARDHOUSE) +
        rttr:GetPlayer(0):GetNumBuildings(BLD_WATCHTOWER) +
        rttr:GetPlayer(0):GetNumBuildings(BLD_FORTRESS)) > 1) then
        -- EVENT3
        MissionEvent(3, false)
    end

    if (rttr:GetPlayer(0):GetNumBuildings(BLD_MINT) > 0) then
        -- EVENT4
        MissionEvent(4, false)
    end

    if ((
        rttr:GetPlayer(0):GetNumBuildings(BLD_BARRACKS) + 
        rttr:GetPlayer(0):GetNumBuildings(BLD_GUARDHOUSE) +
        rttr:GetPlayer(0):GetNumBuildings(BLD_WATCHTOWER) +
        rttr:GetPlayer(0):GetNumBuildings(BLD_FORTRESS)) > 4) then
        -- EVENT5
        MissionEvent(5, false)
    end

    if (rttr:GetPlayer(0):GetNumBuildings(BLD_FORTRESS) > 0) then
        -- EVENT6
        MissionEvent(6, false)
    end

    if ((
        rttr:GetPlayer(0):GetNumBuildings(BLD_BARRACKS) + 
        rttr:GetPlayer(0):GetNumBuildings(BLD_GUARDHOUSE) +
        rttr:GetPlayer(0):GetNumBuildings(BLD_WATCHTOWER) +
        rttr:GetPlayer(0):GetNumBuildings(BLD_FORTRESS)) > 8) then
        -- EVENT7
        MissionEvent(7, false)
    end

    if ((rttr:GetPlayer(1):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(1):GetNumBuildings(BLD_HARBORBUILDING) + rttr:GetPlayer(1):GetNumBuildings(BLD_STOREHOUSE) +
         rttr:GetPlayer(2):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(2):GetNumBuildings(BLD_HARBORBUILDING) + rttr:GetPlayer(2):GetNumBuildings(BLD_STOREHOUSE)) < 1) then
        -- EVENT8 (maps to 99)
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
        -- nothing

    elseif(e == 3 and not onLoad) then
        -- nothing

    elseif(e == 4 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_HAMMER] = 10,
            [GD_AXE] = 10,
            [GD_PICKAXE] = 10
            })

    elseif(e == 5 and not onLoad) then
        rttr:GetPlayer(0):EnableBuilding(BLD_FORTRESS, not onLoad)

    elseif(e == 6 and not onLoad) then
        -- nothing

    elseif(e == 7) then
        rttr:GetPlayer(0):AddPeople({[JOB_FISHER] = 2, [JOB_HUNTER] = 2})

    elseif(e == 99) then
        -- TODO: EnableNextMissions()
    end

    -- update event state
    eState[e] = eState[e] - 1

    -- no history update or mission texts while loading
    -- no history update or mission texts while loading
    if not onLoad then
        rttr:Log(">> Event: " .. e .. ",\teState[" .. e .. "] = " .. eState[e])
        eHist["n"] = eHist["n"] + 1
        eHist[eHist["n"]] = e
    end

    MissionText(e, onLoad)
end