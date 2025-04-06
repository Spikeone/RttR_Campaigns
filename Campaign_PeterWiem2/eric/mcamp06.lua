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
        title   = 'Sigvaldi, the Brewer',
        name    = 'Unknown Enemy',
        diary   = 'Diary',

        msg1    = 'Halvar chose this hidden valley as our starting point. We discovered a lot of fresh footprints on our way here, so a hidden spot seemed safer.\n\nThe whole island seems to be strewn with the remains of campfires and freshly broken game. However, the tracks we have found here are so varied that we can almost certainly conclude that several peoples have left these different tracks. Among other things, we have discovered three different types of arrowheads, which were obviously used in the hunt for game.',
        msg2    = 'Halvar\'s intuition has so far been admirable when it comes to choosing our locations. There is enough coal around us to keep a mint busy for a long time, for example. Now we should expand southwards quickly so that our blacksmith Elvor, our iron caster Darvi and their suppliers have enough to do. We need coal, iron, gold, food and enough space to get our economy up and running.\n\nHalvar and Ole are also traveling in pairs to get an idea of the situation here. Ole is mainly looking for suitable harbor locations, Halvar wants to find out where the enemies are camped and how strong they are.\n\nAnsgar already suggested on our last island that, in addition to sword and shield, we should construct a weapon that could also damage the enemy at a distance. We have already been confronted with enemy structures that can hurl stones over a long distance and have caused us a lot of trouble. It would be a help if we could get more detailed plans about them.',
        msg3    = 'Ymir has spoken to Sigvaldi and advised him to try brewing with the captured hops from the Chinese camp instead of nettles as before. Ymir has found out that these hops also grow where winter barley thrives, and a hop beer can\'t really taste any worse than nettle beer. Sigvaldi is a little skeptical, but he wants to try it.\n\nHalvar and Ole have returned breathlessly during the night in a rush to report back. There are three large camps of Babylonians, Chinese and Romans on the island. They support each other by trading with each other, spreading out quickly and thus being able to attack us at any time and from almost any direction. Even our headquarters are not safe from them, as we cannot defend it from the north.\n\nWe need to build fortifications around our camp as quickly as possible so that we are reasonably protected if an enemy gets too close. Our economy is already doing quite well, but there is too little rather than too much food for our ever-hungry miners.',
        msg4    = 'Sigvaldi has sent his first hop beer to the front, and unlike the nettle beer, you can actually drink it! However, you shouldn\'t drink more than five liters at a time, otherwise your concentration and sense of balance on the battlefield will be noticeably impaired and you\'ll suddenly see everything twice!\n\nBut we need this concentration at the moment, because the enemy fronts are advancing inexorably towards us and there are few opportunities to retreat. So we will fight where there are the best opportunities to weaken the enemy and otherwise try to hold our front. Above all, we need flat and fertile land where Ymir can build and cultivate his farms.\n\nHere we are challenged to the last man, but we will not give up! We want and we will see our homeland, the green islands, again.',
        msg5    = 'Ansgar and his men have returned from Gorge Island with a boat filled to the brim with ham and fish. His arrival and our message of victory greatly encouraged our people and especially my father Knut. Under his guidance, many women and children have fished and hunted everything with fur or fins so that our miners in particular have enough to eat. The ham and fish are just what we need!\n\nSigvaldi\'s beer is now a stunner - our fighters can\'t get enough of it. Somehow he managed to find some malt and added it to the barley water in addition to the hops. As a result, the beer tastes so palatable that you can pass it off as a staple food for a Viking.',
        msg6    = 'Our strong soldiers are hacking away with the sword that has a way of doing it, but the enemies are so strong militarily that we get a premonition of what might await us on the rest of the islands if we win here.\n\nOn a visit to our smithy, I discovered a pile of dented shields and crooked swords. When I asked Elvor why he hadn\'t given the weapons to our soldiers, he said loyally that the swords and shields weren\'t good enough to entrust to a Viking for a fight to the death. I allayed his concerns and reminded him of the weapons that our women and children had made for us on the ravine island. Compared to them, his products were much better, even if they seemed inadequate in his eyes.\n\nElvor was visibly relieved when I ordered some of our men to tidy up the smithy and take away anything they considered suitable as a weapon. When a soldier then wanted to take the blacksmith\'s hammer as well, Elvor stood up, cleared his throat audibly and looked at the soldier so penetratingly that he quickly put the hammer back in its place.',
        msg99   = 'That was a battle, but the island is ours again. We found plans for war machines and grain processing plants in the destroyed Roman headquarters, but unfortunately we can\'t do anything with them because we don\'t have anyone who can implement them. Even Ansgar just shook his head when he studied one of these plans for slingshots more closely.\n\nWe\'re going to set foot on our first green island next. It is the island of eternal snow, because the mountains there are so high that the snow on the peaks never thaws. It is the northernmost of the green islands and the geographical center of our realm. We have a high and hidden resting place there, which we like to visit in the warmer seasons.\n\nBefore that, we will see our King Knut and our families again. They will also be taken to the green island because the air and temperatures are much more bearable there. I\'m really looking forward to seeing my father again. Should I tell him about the letter about Prainn that fell into my hands in the Chinese camp?'
    },
    de =
    {
        title   = 'Sigvaldi, der Brauer',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = 'Halvar hat für uns dieses versteckte Tal als Ausgangspunkt gewählt. Auf unserem Anmarschweg hierher haben wir eine Menge frischer Fußspuren entdeckt, deshalb erschien uns ein verborgener Platz sicherer.\n\nDie ganze Insel scheint durchzogen mit Resten von Lagerfeuern und frisch aufgebrochenem Wild. Allerdings sind die Spuren so unterschiedlich, die wir hier gefunden haben, dass wir mit ziemlicher Sicherheit auf mehrere Völker schließen können, die diese unterschiedlichen Spuren hinterlassen haben. Unter anderem haben wir drei verschiedenartige Pfeilspitzen entdeckt, die offensichtlich bei der Jagd nach Wild verwendet worden sind.',
        msg2    = 'Halvars Spürsinn ist bisher bewundernswert, was die Wahl unserer Lageplätze angeht. Um uns herum hat es genügend Kohle, um zum Beispiel eine Münzprägerei für lange Zeit auszulasten. Jetzt sollten wir uns schnell nach Süden ausbreiten, damit unser Schmied Elvor, unser Eisengießer Darvi und ihre Zulieferer genug zu tun bekommen. Wir brauchen Kohle, Eisen, Gold, Verpflegung und genügend Platz, um unsere Wirtschaft zum Laufen zu bringen.\n\nAußerdem sind Halvar und Ole zu zweit unterwegs, um sich ein Bild von der Lage hier zu machen. Ole sucht vor allem geeignete Hafenplätze, Halvar will herausfinden, wo die Feinde lagern und wie stark sie sind.\n\nAnsgar hat schon auf unserer letzten Insel vorgeschlagen, neben Schwert und Schild noch eine Waffe zu konstruieren, die den Gegner auch auf Distanz schaden könnten. Wir sind schon mit gegnerischen Bauwerken konfrontiert worden, die Steine über eine größere Entfernung schleudern können, und die uns sehr zugesetzt haben. Es wäre eine Hilfe, wenn wir genauere Pläne darüber bekommen könnten.',
        msg3    = 'Ymir hat mit Sigvaldi gesprochen und ihm geraten, es beim Brauen einmal mit dem erbeuteten Hopfen aus dem Chinesenlager anstatt wie bisher mit Brennnesseln zu versuchen. Ymir hat herausgefunden, dass dieser Hopfen dort ebenfalls wächst, wo Wintergerste gedeiht, und schlimmer als das Brennnesselbier kann ein Hopfenbier eigentlich nicht schmecken. Sigvaldi ist etwas skeptisch, aber er will es probieren.\n\nHalvar und Ole sind atemlos in der Nacht in Eilmärschen zurückgekehrt, um zu berichten. Es sind drei größere Lager jeweils von Babyloniern, Chinesen und Römern auf der Insel. Sie unterstützen sich gegenseitig, indem sie Handel miteinander treiben, sich schnell ausbreiten und dadurch jederzeit und so gut wie aus jeder Himmelsrichtung in der Lage sind, uns anzugreifen. Selbst unser Hauptquartier sei nicht vor Ihnen sicher, da wir es von Norden aus nicht verteidigen können.\n\nWir müssen so schnell wie möglich Festungen rund um unser Lager herum bauen, damit wir einigermaßen geschützt sind, wenn uns ein Gegner zu nahe kommen sollte. Unsere Wirtschaft läuft schon ganz gut, aber es gibt eher zu wenig als zu viel Nahrung für unsere stets hungrigen Bergarbeiter.',
        msg4    = 'Sigvaldi hat sein erstes Hopfenbier an die Front geschickt, und im Gegensatz zu dem Brennnessel Bier man kann es tatsächlich trinken! Allerdings darf man nicht mehr als fünf Liter davon auf einmal zu sich nehmen, sonst lassen die Konzentration und das Gleichgewichtsempfinden auf dem Schlachtfeld spürbar nach und man sieht plötzlich alles doppelt!\n\nAber diese Konzentration brauchen wir im Moment nötig, denn die feindlichen Fronten schieben sich unaufhaltsam auf uns zu und es gibt wenige Rückzugsmöglichkeiten. Also werden wir dort kämpfen, wo die besten Möglichkeiten bestehen, den Feind zu schwächen und ansonsten versuchen, unsere Front zu halten. Vor allem benötigen wir ebenes und fruchtbares Land, wo Ymir seine Bauernhöfe bauen und auch bewirtschaften kann.\n\nHier sind wir gefordert bis zum letzten Mann, aber wir geben nicht auf! Wir wollen und wir werden unsere Heimat, die grünen Inseln, wiedersehen. ',
        msg5    = 'Ansgar und seine Männer sind mit einem bis zum Rand gefüllten Boot voller Schinken und Fische von der Schluchteninsel zurückgekommen. Seine Ankunft und unsere Siegesbotschaft haben unser Volk und vor allem meinen Vater Knut sehr ermutigt. Viele Frauen und Kinder haben unter seiner Anleitung alles geangelt und gejagt, was ein Fell oder Flossen hat, damit vor allem unsere Bergwerker genügend zu essen haben. Die Schinken und Fische kommen für uns wie gerufen!\n\nSigvaldis Bier ist mittlerweile eine Wucht – unsere Kämpfer können gar nicht genug davon bekommen. Irgendwie hat er noch Malz auftreiben können und es zusätzlich zum Hopfen ins Gerstenwasser getan. Dadurch schmeckt das Bier so süffig, dass man es als Grundnahrungsmittel für einen Wikinger durchgehen lassen kann.',
        msg6    = 'Unsere starken Soldaten hauen mit dem Schwert drein, das es eine Art hat, aber die Feinde sind militärisch so stark, dass wir eine Vorahnung bekommen, was uns auf den restlichen Inseln erwarten könnte, wenn wir hier siegen.\n\nBei einem Besuch in unserer Schmiede entdeckte ich einen Haufen verbeulter Schilde und krumme Schwerter. Als ich Elvor fragte, warum er die Waffen nicht an unsere Soldaten weitergegeben hat, meinte er treuherzig, dass die Schwerter und Schilde nicht gut genug seien, um sie einem Wikinger  für einen Kampf auf Tod und Leben anzuvertrauen. Ich zerstreute seine Bedenken und erinnerte Ihn an die Waffen, die unsere Frauen und Kinder auf der Schluchteninsel für uns angefertigt haben. Verglichen damit seien seine Produkte um Klassen besser, auch wenn sie in seinen Augen mangelhaft erscheinen.\n\nElvor war sichtlich erleichtert, als ich einigen unseren Männern befahl, die Schmiede mal richtig aufzuräumen und alles mitzunehmen, was in ihren Augen als Waffe tauglich erschien. Als daraufhin ein Soldat auch den Schmiedehammer mitnehmen wollte, erhob sich Elvor, räusperte sich vernehmlich und sah diesen Soldaten so durchdringend an, dass er den Hammer schnell wieder an seinen Platz hinstellte.',
        msg99   = 'Das war eine Schlacht, aber die Insel ist wieder unser. Im zerstörten römischen Hauptquartier haben wir Pläne für Kriegsmaschinen und weiterverarbeitende Getreidebetriebe gefunden, aber wir können leider nichts damit anfangen, weil uns jemand fehlt, der sie umsetzen kann. Selbst Ansgar hat nur mit dem Kopf geschüttelt, als er einer dieser Pläne  über Steinschleudern genauer studiert hat.\n\nWir werden als nächstes unsere erste grüne Insel betreten. Es ist die Insel des ewigen Schnees, weil die Berge dort so hoch sind, dass der Schnee auf den Gipfeln niemals taut. Es ist die nördlichste der grünen Inseln und der geographische Mittelpunkt unseres Reiches. Wir haben dort einen hochgelegenen und versteckten Ruheort, den wir in der wärmeren Jahreszeit gerne aufgesucht haben.\n\nVorher werden wir unseren König Knut und unsere Familien wiedersehen. Auch sie sollen auf die grüne Insel gebracht werden, weil die Luft und die Temperaturen dort wesentlich erträglicher sind. Wie freue ich mich auf das Wiedersehen mit meinem Vater. Ob ich ihm von den Brief über Prainn erzählen soll, der mir im Chinesenlager in die Hände gefallen ist?'
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
    rttr:GetPlayer(3):SetNation(NAT_ROMANS)

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
        addExtraSoldiers(1, 20)
        addExtraBoards(2, 100)
        addExtraSoldiers(3, 10)
        addExtraBoards(3, 50)
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
        rttr:GetWorld():AddStaticObject(62, 12, 0, 0, 1)
        rttr:GetWorld():AddStaticObject( 7, 26, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(17,  6, 0, 0, 1)
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
        rttr:GetPlayer(p):DisableBuilding(BLD_CATAPULT)
        rttr:GetPlayer(p):DisableBuilding(BLD_MILL)
        rttr:GetPlayer(p):DisableBuilding(BLD_BAKERY)
        rttr:GetPlayer(p):DisableBuilding(BLD_PIGFARM)
        rttr:GetPlayer(p):DisableBuilding(BLD_SLAUGHTERHOUSE)
        rttr:GetPlayer(p):DisableBuilding(BLD_METALWORKS)
        rttr:GetPlayer(p):DisableBuilding(BLD_FORESTER)
        rttr:GetPlayer(p):DisableBuilding(BLD_DONKEYBREEDER)
    end

    if (p ~= 0 and not onLoad) then
        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 54,
            [GD_BOARDS    ] = 94,
            [GD_STONES    ] = 94,
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
            [JOB_FARMER             ] = 4,
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

            [JOB_PRIVATE            ] = 55,
            [JOB_PRIVATEFIRSTCLASS  ] = 6,
            [JOB_SERGEANT           ] = 3,
            [JOB_OFFICER            ] = 2,
            [JOB_GENERAL            ] = 1
        })
    elseif (p == 0 and not onLoad) then
        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 20,
            [GD_BOARDS    ] = 20,
            [GD_STONES    ] = 20,
            [GD_HAM       ] = 0,
            [GD_GRAIN     ] = 0,
            [GD_FLOUR     ] = 0,

            [GD_FISH      ] = 8,
            [GD_MEAT      ] = 8,
            [GD_BREAD     ] = 8,
            [GD_WATER     ] = 0,
            [GD_BEER      ] = 8,
            [GD_COAL      ] = 50,

            [GD_IRONORE   ] = 20,
            [GD_GOLD      ] = 4,
            [GD_IRON      ] = 30,
            [GD_COINS     ] = 4,
            [GD_TONGS     ] = 0,
            [GD_AXE       ] = 6,

            [GD_SAW       ] = 3,
            [GD_PICKAXE   ] = 8,
            [GD_HAMMER    ] = 18,
            [GD_SHOVEL    ] = 0,
            [GD_CRUCIBLE  ] = 4,
            [GD_RODANDLINE] = 8,

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
            [JOB_WOODCUTTER         ] = 8,
            [JOB_FORESTER           ] = 0,
            [JOB_STONEMASON         ] = 8,

            [JOB_FISHER             ] = 4,
            [JOB_HUNTER             ] = 6,
            [JOB_CARPENTER          ] = 3,
            [JOB_FARMER             ] = 2,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,

            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 0,
            [JOB_BREWER             ] = 1,
            [JOB_MINER              ] = 9,
            [JOB_IRONFOUNDER        ] = 1,

            [JOB_ARMORER            ] = 1,
            [JOB_MINTER             ] = 1,
            [JOB_METALWORKER        ] = 0,
            [JOB_SHIPWRIGHT         ] = 1,
            [JOB_GEOLOGIST          ] = 5,
            [JOB_SCOUT              ] = 2,

            [JOB_PACKDONKEY         ] = 20,
            [JOB_CHARBURNER         ] = 0,
    

            [JOB_PRIVATE            ] = 20,
            [JOB_PRIVATEFIRSTCLASS  ] = 20,
            [JOB_SERGEANT           ] = 3,
            [JOB_OFFICER            ] = 3,
            [JOB_GENERAL            ] = 3
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

    if (eState[3] > 0 and milBuildingCount >= 4) then
        -- EVENT3
        MissionEvent(3, false)
    end

    if (eState[4] > 0 and milBuildingCount >= 8) then
        -- EVENT4
        MissionEvent(4, false)
    end
    
    if (eState[5] > 0 and milBuildingCount >= 12) then
        -- EVENT5
        MissionEvent(5, false)
    end

    if (eState[6] > 0 and milBuildingCount >= 16) then
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

    elseif(e == 2 and not onLoad) then
        -- nothing

    elseif(e == 3 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
                [GD_BREAD] = 10
            })

    elseif(e == 4 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
                [GD_COINS] = 10
            })

    elseif(e == 5 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
                [GD_MEAT] = 50,
                [GD_FISH] = 50
            })

    elseif(e == 6 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
                [GD_SHIELD] = 30,
                [GD_SWORD] = 30
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