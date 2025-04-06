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
eIdx = {1, 2, 3, 4, 5, 6, 7, 99}

local debugTexts = false;

rttr:RegisterTranslations(
{
    en =
    {
        title   = 'Elvor, the Weaponsmith',
        name    = 'Unknown Enemy',
        diary   = 'Diary',

        msg1    = 'We reached the neighboring island to the west by boat. Ansgar had a conversation with my father Knut and me as soon as we arrived. First he explained that he had taught Bjarki, the most skilled of us all, how to mint coins. He then asked me to find the right people for a weapon smithy and an iron foundry.\n\nAnsgar found a smelting pan, a blacksmith\'s hammer and an anvil on the last island in a destroyed Roman camp and brought them here with the help of some of our soldiers. We need coins, swords and shields so that we can defend ourselves better in close combat. But first we need a sawmill to get enough timber.\n\nThen he invited our King Knut to come with him by ship to explore our gray islands in the southwest. My father knows all the gray islands well because he has often commanded troops there for hunting, fishing and felling trees. We must expect our enemies to occupy these islands too. And for my father, who still doesn\'t speak, this task is tailor-made. He knows the islands inside out and he\'s in contact with Ansgar, who will get him talking!',
        msg2    = 'Elvor is a bear of a man. He is just over two meters tall, weighs well over a hundred kilos and has not a gram of fat on his ribs. We call him a bear because he seems a bit clumsy, like a giant baby. But no grass grows where he goes, I can\'t think of a better blacksmith. Elvor just laughed approvingly when I asked him if he would be able to handle a blacksmith\'s hammer any time soon.\n\nDarvi, on the other hand, is small, tough, almost always freezes and only really thaws out when the outside temperature is high. I asked him if he dared to work with a melting pan? He gave me a big look because he couldn\'t imagine what it was. I then explained to him that we would be looking for coal and iron ore and that he should smelt it into pig iron. When I explained to him that temperatures in an iron foundry can exceed 40 degrees, he was won over to our cause.',
        msg3    = 'Now let\'s make sure we get enough swords, shields and coins together to be better prepared for any battles. Elvor is hammering away at the anvil like there\'s no tomorrow. And Darvi is really thriving in his high-temperature workshop.\n\nOur hunters and fishermen will have their work cut out to keep our miners fit and motivated for their work underground. I don\'t know anyone who has such an appetite as they do. We have to make sure we have enough pickaxes ready for them.',
        msg4    = 'Ole has been longing for a harbor building where he has a starting point for his shipbuilding skills. So we built a shipyard and let Ole run it. He uses up a lot of planks, but his ships make us much more mobile in our campaigns.\n\nWhat kind of useless thing is a ship without a suitable harbor? And what kind of useless thing is a harbor without ships?',
        msg5    = 'The confrontation with our enemies will also come on this island. But if our brave lads at the front have received their pay on time, I\'m not worried about a battle. However, we must first get the enemy within striking distance so that we know how best to attack them.\n\nThere are reports from our camp that Elvor has cut his anvil in two. The way I saw Elvor at work, I can well imagine such an outcome. Our blacksmith simply has too much strength. So we quickly organize a new anvil and continue.',
        msg6    = 'Knut and Ansgar are back with their ship! Ansgar looks serious, but is still confident. My father, our king, is also still looking sad, but he is talking again.\n\nFirst he apologized for his long silence, but the grief of his heart has literally left him speechless.\n\nSecond, he declared all the gray and white islands they had explored occupied, but with not very strong enemy troops, which is why he would prefer to liberate the gray and white islands first and then turn south to our green islands.\n\nThirdly, they would have found an unguarded camp with a lot of beer barrels and some tools in the immediate vicinity of one of their harbors and taken everything with them. A Viking can always use something like that! My father smiled for the first time since the raid.',
        msg7    = 'We should now be strong enough to liberate this island from all enemies. We suspect that the Babylonian seniors\' camp is more heavily occupied in the north-west. There also seems to be an enemy camp in the north-east, but it\'s difficult to get anywhere. However, the immediate surroundings seem to be free of enemies.\n\nAs there seems to be no way forward in the north and west, we have to gain the mountains in the south and try to reach the enemy camps from there. It\'s a good thing that we have no shortage of coal or game to hunt. And there will certainly be some iron and gold around our tent.',
        msg99   = 'Our next island has been recaptured after a long battle. This means that the far north of our empire is now free of enemies. We leave the women and children here well provided for and will now turn our attention to the next white islands in the east. We have noticed a lot of ship traffic coming from there.\n\nWhen will I see my homeland and our beloved green islands again?'
    },
    de =
    {
        title   = 'Elvor, der Waffenschmied',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = 'Wir haben die Nachbarinsel im Westen mit dem Schiff erreicht. Ansgar hat gleich nach unserer Ankunft ein Gespräch mit meinem Vater Knut und mir geführt. Zuerst erklärte er, dass er Bjarki, dem handwerklich Geschicktesten von uns allen, die Münzprägerei beigebracht hätte. Anschließend bat er mich, für eine Waffenschmiede und eine Eisengießerei die richtigen Leute dafür auszusuchen.\n\nAnsgar hat auf der letzten Insel in einem zerstörten Römerlager eine Schmelzpfanne, einen Schmiedehammer und einen Amboss gefunden und mit Hilfe einiger unserer Soldaten hierhergebracht. Wir brauchen Münzen, Schwerter und Schilde, damit wir uns im Nahkampf besser verteidigen können. Aber zuerst brauchen wir ein Sägewerk, um genügend Bauholz zu bekommen.\n\nDann lud er unsern König Knut ein, mit Ihm zu Schiff mitzukommen, um unsere grauen Inseln im Südwesten zu erkunden. Meinem Vater sind alle grauen Inseln gut bekannt, weil er dort oft Trupps zum Jagen, Angeln und zum Baumfällen befehligt hat. Wir müssen damit rechnen, dass unsere Feinde auch diese Inseln besetzt halten. Und für meinen Vater, der nach wie vor nicht redet, ist diese Aufgabe wie geschaffen. Er kennt die Inseln genau und er hat dabei Gemeinschaft mit Ansgar, der wird ihn schon zum Reden bringen!',
        msg2    = 'Elvor ist ein Bär von einem Mann. Er ist etwas über zwei Meter groß, wiegt weit über hundert Kilo und hat kein Gramm Fett auf den Rippen. Wir nennen ihn deshalb Bär, weil er etwas tapsig erscheint, ähnlich wie ein Riesenbaby. Aber wo er hinhaut, wächst kein Gras mehr, ich kann mir keinen besseren Schmied vorstellen. Elvor hat nur zustimmend gelacht, als ich ihm mein Anliegen vorgebracht habe, ob er in nächster Zeit mit einem Schmiedehammer hantieren könnte.\n\nDarvi dagegen ist klein, zäh, friert nahezu immer, und taut erst bei hohen Außentemperaturen richtig auf. Ihn habe ich gefragt, ob er mit einer Schmelzpfanne sich zu arbeiten traut? Er hat mich groß angeschaut, weil er sich nichts darunter vorstellen kann. Daraufhin habe ich ihm erklärt, dass wir nach Kohlen und Eisenerz Ausschau halten werden, und er es zu Roheisen umschmelzen sollte. Als ich ihm erklärt habe, dass in einer Eisengießerei Temperaturen von über 40 Grad vorkommen können, war er für unsere Sache gewonnen.',
        msg3    = 'Jetzt schauen wir, dass wir genügend Schwerter, Schilde und Münzen zusammenbekommen, um für eventuelle Schlachten besser gewappnet zu sein. Elvor haut auf den Amboss, als ob es kein Morgen mehr gäbe. Und Darvi blüht richtig auf in seiner Hochtemperaturwerkstatt.\n\nUnsere Jäger und Fischer werden gut zu tun haben, damit unsere Bergwerker fit und motiviert ihrer Arbeit unter Tage nachkommen können. Ich kenne niemanden, der solch einen Appetit hat, wie sie. Wir müssen dafür sorgen, dass wir genügend Spitzhacken für sie bereithalten.',
        msg4    = 'Ole hat sich schon sehnsüchtig einem Hafengebäude gewünscht, wo er einen Ausgangspunkt für seine Schiffsbaukunst hat. Also: Werft gebaut und Ole darin schalten und walten lassen. Er verbraucht zwar eine Menge Bretter, aber seine Schiffe machen uns viel beweglicher bei unseren Feldzügen.\n\nWas ist ein Schiff für eine nutzlose Angelegenheit ohne geeigneten Hafen? Und was ist ein Hafen für eine öde Angelegenheit ohne Schiffe?',
        msg5    = 'Die Auseinandersetzung mit unseren Feinden wird auch auf dieser Insel kommen. Wenn unsere tapferen Jungs an der Front ihren Sold pünktlich bekommen haben, ist mir aber vor einer Schlacht nicht bange. Allerdings müssen wir erst einmal den Feind in Schlagdistanz bekommen, damit wir wissen, wie wir ihm am besten angreifen können.\n\nAus unserem Lager wurde berichtet, dass Elvor seinen Amboss entzweigeschlagen hat. So, wie ich Elvor beim Arbeiten erlebt habe, kann ich mir solch ein Ergebnis durchaus vorstellen. Unser Schmied hat einfach zu viel Kraft. Also rasch einen neuen Amboss organisiert und weiter geht es.',
        msg6    = 'Knut und Ansgar sind wieder mit ihrem Schiff zurück! Ansgar blickt ernst, ist aber trotzdem zuversichtlich. Auch mein Vater, unser König schaut immer noch traurig darein, aber er redet wieder.\n\nZuerst hat er sich für sein langes Schweigen entschuldigt, aber ihm hat die Trauer seines Herzens buchstäblich die Sprache verschlagen.\n\nAls zweites erklärte er alle grauen und weißen Inseln, die sie erkundet haben, für besetzt, allerdings mit nicht sehr starken feindlichen Truppen, weshalb er vorziehen würde, zuerst die grauen und weißen Inseln zu befreien und dann erst Richtung Süden zu unseren grünen Inseln sich zuzuwenden.\n\nAls drittes hätten sie in unmittelbarer Nähe einer ihrer Hafenplätze ein unbewachtes Lager mit einer Menge Bierfässer und etwas Werkzeug gefunden und alles gleich mitgenommen. So etwas kann ein Wikinger immer gebrauchen! Dabei hat mein Vater zum ersten Mal seit dem Überfall wieder gelächelt.',
        msg7    = 'Eigentlich müssten wir jetzt stark genug sein, um diese Insel von allen Feinden befreien zu können. Im Nordwesten vermuten wir das stärker besetzte Lager der babylonischen Senioren. Auch im Nordosten scheint ein feindliches Lager zu sein, aber da ist überall schwierig, hinzukommen. Die unmittelbare Umgebung scheint aber frei von Feinden zu sein.\n\nDa es im Norden und im Westen nicht mehr weiterzugehen scheint, müssen wir das Gebirge im Süden gewinnen und von dort aus versuchen, die feindlichen Lager zu erreichen. Gut, dass es uns weder an Kohlen noch an jagdbarem Wild mangelt. Und rings um unser Zelt wird es sicherlich auch noch etwas Eisen und Gold geben.',
        msg99   = 'Unsere nächste Insel ist nach langem Kampf zurückerobert. Somit ist der äußerste Norden unseres Reiches nunmehr frei von Feinden. Wir lassen Frauen und Kinder hier wohlversorgt zurück und werden uns nunmehr der nächsten weißen Inseln im Osten zuwenden. Wir haben dort auffällig viel Schiffsverkehr von dort kommend beobachtet.\n\nWann werde ich meine Heimat und unsere geliebten grünen Inseln wiedersehen?'
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
    rttr:GetPlayer(1):SetNation(NAT_BABYLONIANS)
    rttr:GetPlayer(2):SetNation(NAT_BABYLONIANS)

    for p = 1, rttr:GetNumPlayers() - 1 do
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
        addExtraSoldiers(1, 10)
        addExtraBoards(2, 100)
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
        rttr:GetWorld():AddAnimal(12, 37, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(47, 11, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(20, 68, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(56, 77, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(67, 58, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(72, 36, SPEC_POLARBEAR)

        rttr:GetWorld():AddStaticObject(79, 12, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(37, 62, 0, 0, 1)
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
        rttr:GetPlayer(p):DisableBuilding(BLD_FORTRESS)
        rttr:GetPlayer(p):DisableBuilding(BLD_CATAPULT)
        rttr:GetPlayer(p):DisableBuilding(BLD_LOOKOUTTOWER)
        rttr:GetPlayer(p):DisableBuilding(BLD_WELL)
        rttr:GetPlayer(p):DisableBuilding(BLD_MILL)
        rttr:GetPlayer(p):DisableBuilding(BLD_BAKERY)
        rttr:GetPlayer(p):DisableBuilding(BLD_FARM)
        rttr:GetPlayer(p):DisableBuilding(BLD_DONKEYBREEDER)
        rttr:GetPlayer(p):DisableBuilding(BLD_IRONSMELTER)
        rttr:GetPlayer(p):DisableBuilding(BLD_METALWORKS)
        rttr:GetPlayer(p):DisableBuilding(BLD_BREWERY)
        rttr:GetPlayer(p):DisableBuilding(BLD_SLAUGHTERHOUSE)
        rttr:GetPlayer(p):DisableBuilding(BLD_PIGFARM)
        rttr:GetPlayer(p):DisableBuilding(BLD_ARMORY)
        rttr:GetPlayer(p):DisableBuilding(BLD_FORESTER)
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
            [GD_BOARDS    ] = 20,
            [GD_STONES    ] = 40,
            [GD_HAM       ] = 0,
            [GD_GRAIN     ] = 0,
            [GD_FLOUR     ] = 0,

            [GD_FISH      ] = 5,
            [GD_MEAT      ] = 5,
            [GD_BREAD     ] = 0,
            [GD_WATER     ] = 0,
            [GD_BEER      ] = 0,
            [GD_COAL      ] = 10,

            [GD_IRONORE   ] = 10,
            [GD_GOLD      ] = 4,
            [GD_IRON      ] = 2,
            [GD_COINS     ] = 2,
            [GD_TONGS     ] = 0,
            [GD_AXE       ] = 5,

            [GD_SAW       ] = 1,
            [GD_PICKAXE   ] = 5,
            [GD_HAMMER    ] = 10,
            [GD_SHOVEL    ] = 1,
            [GD_CRUCIBLE  ] = 1,
            [GD_RODANDLINE] = 5,

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
            [JOB_BUILDER            ] = 6,
            [JOB_PLANER             ] = 4,
            [JOB_WOODCUTTER         ] = 3,
            [JOB_FORESTER           ] = 0,
            [JOB_STONEMASON         ] = 3,

            [JOB_FISHER             ] = 1,
            [JOB_HUNTER             ] = 5,
            [JOB_CARPENTER          ] = 2,
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
            [JOB_MINTER             ] = 1,
            [JOB_METALWORKER        ] = 0,
            [JOB_SHIPWRIGHT         ] = 1,
            [JOB_GEOLOGIST          ] = 3,
            [JOB_SCOUT              ] = 1,

            [JOB_PACKDONKEY         ] = 2,
            [JOB_CHARBURNER         ] = 0,

            [JOB_PRIVATE            ] = 20,
            [JOB_PRIVATEFIRSTCLASS  ] = 10,
            [JOB_SERGEANT           ] = 10,
            [JOB_OFFICER            ] = 5,
            [JOB_GENERAL            ] = 5
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

    if (eState[4] > 0 and x == 21 and y == 32) then
        -- EVENT4
        MissionEvent(4, false)
    end
    
    if (eState[7] > 0 and x == 39 and y == 7) then
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

    if (eState[3] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_IRONSMELTER) > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_ARMORY) > 0) then
        -- EVENT3
        MissionEvent(3, false)

    end

    local milBuildingCount = GetNumMilitaryBuilding(0, true)

    if (eState[5] > 0 and milBuildingCount >= 10) then
        -- EVENT5
        MissionEvent(5, false)
    end

    if (eState[6] > 0 and rttr:GetPlayer(0):GetNumWares(GD_SWORD) > 24 and rttr:GetPlayer(0):GetNumWares(GD_SHIELD) > 24) then
        -- EVENT6
        MissionEvent(6, false)

    end

    if (eState[99] > 0 and (GetNumStorage(1) + GetNumStorage(2)) < 1) then
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

    elseif(e == 2) then
        rttr:GetPlayer(0):EnableBuilding(BLD_ARMORY, not onLoad)
        rttr:GetPlayer(0):EnableBuilding(BLD_IRONSMELTER, not onLoad)

    elseif(e == 3 and not onLoad) then
        -- nothing

    elseif(e == 4 and not onLoad) then
        -- nothing

    elseif(e == 5 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_MEAT] = 20,
            [GD_FISH] = 20
            })

    elseif(e == 6 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_BEER] = 200,
            [GD_PICKAXE] = 10,
            [GD_AXE] = 10,
            [GD_SWORD] = 15,
            [GD_SHIELD] = 15
            })

    elseif(e == 7) then
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