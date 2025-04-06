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
        title   = 'Knut, the Baker',
        name    = 'Unknown Enemy',
        diary   = 'Diary',

        msg1    = 'As expected, the island of eternal snow is occupied by enemies, but our hiding place in the mountains, which we have set up there for times of need, has not yet been discovered by them. We have carefully climbed this remote corner of the island with our families past the enemy camps. The view here is stunning, the grass and trees are green and the water is clear and tasty. How we and our families longed for our green islands.\n\nYmir, our farmer, is very confident about the possibilities of building a farm. Our blacksmith, our iron caster and our coiner will also surely find a suitable place to practice their craft. Bjarki, Darvj and Elvor know that their services are needed and radiate the serenity and security that a worker has when he masters his craft. And Sigvaldi is now so exceptionally good as a brewer that we wouldn\'t want to fight without his beer.',
        msg2    = 'Ymir talked to Knut and Ansgar about the possibilities of processing the grain into flour and then into bread. Our miners have a huge appetite, which is not surprising given the hard work they do. During this conversation, my father surprised me by telling me that he had learned the trade of a baker before he became the king of all Vikings. He also told me that Kristjan, our well builder, used to help him out as a miller. So he knew how to operate a windmill.\n\nAnsgar and Ymir were a little embarrassed when they asked my father to help them temporarily as a baker. Together they studied the captured plans from the last Roman camp. The plans for a mill and a baking oven didn\'t cause the three of them any major headaches, but the plans for the military equipment did. It was decided that our King Knut should temporarily try his hand at baking. My father only laughed at the embarrassment of his supplicants and said that it gave him pleasure and honor to be of service to his people.',
        msg3    = 'I would never have dreamed of seeing my father, the king of the Vikings, working in a bakery. But he\'s working at his oven as if he\'s never done anything else. Now our miners can eat something other than meat and fish for once, they should be allowed to. And as far as fish is concerned, little is to be expected here. The mountain lakes are crystal clear, but cold and small.\n\nMy father has been transformed since he started working as a baker. He jokes with the miller, the water carriers and the workers who bring grain and deliver his loaves to the miners. He gets to serve his people again, and he likes nothing better than that.',
        msg4    = 'As our hiding place can only be attacked from the north and west, we must protect these open flanks, preferably with Aron\'s fortresses. The decisive battles will probably be fought in the large plain in the northwest. A narrow valley runs from east to west, which we must win in order to get there.\n\nOur families are visibly recovering in the good air and healthy surroundings. They only laugh about the cold of the snow because it is much warmer than on the white islands and much friendlier than on the gray islands. The snow protects us from our enemies, and a Viking is more likely to be too warm than too cold.',
        msg5    = 'To the west of the plateau, I discover something unexpected. There is an almost circular area with a large cross on the ground and lots of small memorial stones in a row.\n\nWhen I asked my father and Ansgar about it, they explained that this was the Viking cemetery until about thirty years ago, but was eventually abandoned due to its small size. A new and larger cemetery was then built on our sand island, which I know well, but it is not even half as beautifully situated as this one.\n\nKnut, my father, explained to me that his grandparents and my grandparents had found their final resting place there. He had tears in his eyes. Ansgar then told me in private, with a touch of resignation and sadness, that this place held a dark secret that he would tell me about later.',
        msg6    = 'After a tough battle, we have reached the plain, which is completely occupied by enemies. Vikings, now it\'s either we win or we perish. All our strong soldiers must now go to this front, all other fronts are secondary, we just have to hold them so that we are not overrun.',
        msg99   = 'We have found an important letter in the Chinese headquarters, which states that there is a large Chinese base in the Rock Sea. This rocky sea is part of the gray islands and consists of a large number of small, rocky islands, all of which are quite difficult to reach and therefore to conquer.\n\nFor the time being, the plan is for our families to stay here in our green hideaway, partly because it is easy and effective to defend. Ansgar will stay with our families for the time being to help and advise them, as we still need my father\'s baking skills.\n\nI may be wrong, but the battles seem to get more intense the further south we go. The Babylonians are tough fighters, the Chinese are agile and fast, but we were able to drive them both off this island. Now we men want to return to the Rocky Sea, where we have already had several shipwrecks because the channels in between are treacherous and demand everything from a helmsman. But this Chinese base has to fall before we can continue south to my beloved home island.'
    },
    de =
    {
        title   = 'Knut, der Bäcker',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = 'Die Insel des ewigen Schnees ist, wie erwartet, von Feinden besetzt, aber unser Schlupfwinkel in den Bergen, den wir uns für Zeiten der Not dort eingerichtet haben, wurde von ihnen noch nicht entdeckt. Vorsichtig haben wir mit unseren Familien an den feindlichen Lagern vorbei diesen abgelegenen Winkel der Insel erstiegen. Die Aussicht hier ist überwältigend, das Gras und die Bäume sind grün und das Wasser klar und wohlschmeckend. Wie sehr haben wir und unsere Familien sich nach unseren grünen Inseln gesehnt.\n\nYmir, unser Landwirt, schaut sehr zuversichtlich darein, was die Möglichkeiten zum Bau einen Bauernhof anbetrifft. Auch für unseren Schmied, unseren Eisengießer und unseren Münzpräger wird sich sicherlich ein passendes Plätzchen finden, damit sie ihr Handwerk ausüben können. Bjarki, Darvj und Elvor wissen, dass ihre Dienste gebraucht werden und strahlen die Gelassenheit und die Sicherheit aus, die ein Arbeiter hat, wenn er sein Handwerk beherrscht. Und Sigvaldi ist als Brauer mittlerweile so außergewöhnlich gut, dass wir ohne sein Bier gar nicht mehr kämpfen wollen.',
        msg2    = 'Ymir hat sich mit Knut und Ansgar über die Möglichkeiten unterhalten, das Getreide zu Mehl und dann zu Brot weiter verarbeiten zu können. Unsere Bergarbeiter haben einen riesengroßen Appetit, was aber aufgrund ihrer schweren Arbeit nicht verwundert. Im Laufe dieses Gespräches überraschte mein Vater mich mit der Feststellung, dass er das Handwerk eines Bäckers gelernt hat, bevor er der König aller Wikinger wurde. Außerdem erzählte er, dass Kristjan, unser Brunnenbauer, Ihm früher als Müller ausgeholfen hätte. Er wüsste also, wie man eine Windmühle bedient.\n\nAnsgar und Ymir waren etwas verlegen, als sie meinen Vater baten, ihnen vorübergehend als Bäcker zur Seite zu stehen. Zusammen studierten sie die erbeuteten Pläne vom letzten Römerlager. Die Pläne für eine Mühle und einem Backofen bereiteten den Dreien kein größeres Kopfzerbrechen, die Pläne für die militärischen Geräte aber schon. Es wurde beschlossen, dass unser König Knut sich vorübergehend im Bäckerhandwerk versuchen sollte. Mein Vater lachte nur über die Verlegenheit seiner Bittsteller und sagte, dass es ihm Vergnügen und Ehre bereite, seinem Volk einen Dienst zu erweisen.',
        msg3    = 'Ich hätte es mir nicht träumen lassen, meinen Vater, den König der Wikinger, in einer Bäckerei tätig zu erleben. Aber er hantiert an seinem Backofen, als ob er nie etwas anderes gemacht hätte. Jetzt dürfen unsere Bergarbeiter einmal etwas anderes essen als Fleisch und Fisch, es ist ihnen zu gönnen. Und gerade, was Fisch anbelangt, ist hier wenig zu erwarten. Die Bergseen sind zwar glasklar, aber kalt und klein.\n\nMein Vater ist wie verwandelt, seitdem er als Bäcker arbeitet. Er scherzt mit dem Müller, den Wasserträgern und den Arbeitern, die Getreide bringen und seine Brote zu den Bergwerkern bringen. Er darf wieder seinem Volk einen Dienst erweisen, und er tut nichts lieber als das.',
        msg4    = 'Da unser Schlupfwinkel nur von Norden und vom Westen angegriffen werden kann, müssen wir diese offenen Flanken schützen, am besten mit Arons Festungen. Die entscheidenden Schlachten werden wohl in der großen Ebene im Nordwesten geschlagen werden. Nach dorthin verläuft ein schmales Tal von Ost nach West, das wir gewinnen müssen, um dorthin kommen zu können.\n\nUnsere Familien erholen sich zusehends in der guten Luft und der gesunden Umgebung. Über die Kälte des Schnees lachen sie nur, weil es viel wärmer als auf den weißen Inseln und viel freundlicher als auf den grauen Inseln ist. Der Schnee schützt uns vor den Feinden, und einem Wikinger ist es eher zu warm als zu kalt.',
        msg5    = 'Im Westen der Hochfläche entdecke ich etwas Unerwartetes. Dort liegt eine fast kreisrunde Fläche mit einem größeren Kreuz auf dem Boden und lauter kleinen Gedenksteinen in Reih und Glied.\n\nAls ich meinen Vater und Ansgar danach fragte, erklärten sie mir, dass dies der Friedhof der Wikinger bis vor etwa dreißig Jahren war, aber wegen seiner kleinen Fläche schließlich aufgegeben wurde. Auf unserer Sandinsel wurde daraufhin ein neuer und größerer Friedhof errichtet, den ich gut kenne, der aber nicht einmal halb so schön gelegen ist, wie dieser hier.\n\nKnut, mein Vater, erklärte mir, dass seine Großeltern und auch meine Großeltern dort ihre letzte Ruhe gefunden haben. Dabei hatte er Tränen in den Augen. Ansgar erzählte mit danach unter vier Augen mit einem Anflug von Resignation und Trauer, dass dieser Ort ein dunkles Geheimnis berge, von welchem er mir später einmal erzählen würde.',
        msg6    = 'Wir haben nach zähem Kampf die Ebene erreicht, sie ist komplett von Feinden besetzt. Wikinger, jetzt gilt es, entweder wir siegen, oder wir gehen unter. Alle starken Soldaten müssen jetzt an diese Front, alle anderen Fronten sind nebensächlich, die müssen wir lediglich halten, damit wir nicht überrannt werden.',
        msg99   = 'Im chinesischen Hauptquartier haben wir einen wichtigen Brief gefunden, aus dem hervorgeht, dass sich ein großer chinesischer Stützpunkt im Felsenmeer befindet. Dieses Felsenmeer ist ein Teil der grauen Inseln und besteht aus einer Vielzahl von kleinen, felsigen Inseln, die allesamt recht schwierig zu erreichen und damit zu erobern sind.\n\nVorerst ist geplant, dass unsere Familien hier in unserem grünen Schlupfwinkel bleiben, unter anderem auch, weil er leicht und wirkungsvoll zu verteidigen ist. Ansgar wird vorerst bei unseren Familien bleiben und ihnen Hilfe und Ratgeber sein, da wir die Bäckerkünste meines Vaters weiterhin benötigen.\n\nVielleicht täusche ich mich, aber die Kämpfe scheinen je intensiver zu werden, je weiter südlich wir vordringen. Die Babylonier sind zähe Kämpfer, die Chinesen sind wendig und schnell, aber wir konnten beide von dieser Insel vertreiben. Jetzt wollen wir Männer zurück ins Felsenmeer, wo uns schon mehrere Schiffe verunglückt sind, weil die Fahrrinnen dazwischen tückisch sind und einem Steuermann alles abverlangen. Aber dieser chinesische Stützpunkt muss fallen, bevor es weiter in den grünen Süden auch zu meiner geliebten Heimatinsel gehen soll.'
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
        addExtraSoldiers(1, 10)
        addExtraBoards(2, 100)
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
        rttr:GetWorld():AddStaticObject(88, 81, 0, 0, 1)
        rttr:GetWorld():AddStaticObject( 4, 36, 0, 0, 1)

        rttr:GetWorld():AddAnimal(24, 29, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(64, 78, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(72, 46, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(52, 21, SPEC_POLARBEAR)
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
            [GD_WOOD      ] = 50,
            [GD_BOARDS    ] = 50,
            [GD_STONES    ] = 50,
            [GD_HAM       ] = 1,
            [GD_GRAIN     ] = 1,
            [GD_FLOUR     ] = 1,

            [GD_FISH      ] = 4,
            [GD_MEAT      ] = 6,
            [GD_BREAD     ] = 8,
            [GD_WATER     ] = 2,
            [GD_BEER      ] = 6,
            [GD_COAL      ] = 10,

            [GD_IRONORE   ] = 10,
            [GD_GOLD      ] = 4,
            [GD_IRON      ] = 10,
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
            [GD_SWORD     ] = 0,
            [GD_SHIELD    ] = 0,

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

            [JOB_PRIVATE            ] = 40,
            [JOB_PRIVATEFIRSTCLASS  ] = 16,
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
            [GD_GRAIN     ] = 5,
            [GD_FLOUR     ] = 0,

            [GD_FISH      ] = 6,
            [GD_MEAT      ] = 6,
            [GD_BREAD     ] = 6,
            [GD_WATER     ] = 6,
            [GD_BEER      ] = 8,
            [GD_COAL      ] = 8,

            [GD_IRONORE   ] = 8,
            [GD_GOLD      ] = 4,
            [GD_IRON      ] = 8,
            [GD_COINS     ] = 10,
            [GD_TONGS     ] = 0,
            [GD_AXE       ] = 6,

            [GD_SAW       ] = 3,
            [GD_PICKAXE   ] = 8,
            [GD_HAMMER    ] = 18,
            [GD_SHOVEL    ] = 0,
            [GD_CRUCIBLE  ] = 4,
            [GD_RODANDLINE] = 8,

            [GD_SCYTHE    ] = 4,
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
    

            [JOB_PRIVATE            ] = 55,
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

    if (eState[3] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_BAKERY) > 0) then
        -- EVENT3
        MissionEvent(3, false)
    end

    if (eState[99] > 0 and (GetNumStorage(1) + GetNumStorage(2)) < 1) then
        -- EVENT7 (maps to 99)
        MissionEvent(99, false)
    end
end

function onOccupied(p, x, y)
    if(p ~= 0) then return end

    if(eState[4] > 0 and x == 50 and y == 37) then
        MissionEvent(4, false)
    end

    if(eState[5] > 0 and x == 29 and y == 44) then
        MissionEvent(5, false)
    end

    if(eState[6] > 0 and x == 28 and y == 9) then
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

    elseif(e == 2) then
        rttr:GetPlayer(0):EnableBuilding(BLD_BAKERY, not onLoad)
        rttr:GetPlayer(0):EnableBuilding(BLD_MILL, not onLoad)

        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                [GD_ROLLINGPIN] = 3
            })
        end

    elseif(e == 3) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                [GD_WATER] = 5,
                [GD_FLOUR] = 5,
                [GD_MEAT] = 5,
                [GD_FISH] = 5
            })
        end

    elseif(e == 4) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                [GD_FISH] = 20,
                [GD_MEAT] = 20,
                [GD_BREAD] = 20
            })
        end

    elseif(e == 5) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                [GD_COAL] = 40,
                [GD_IRON] = 10,
                [GD_GOLD] = 10
            })
        end

    elseif(e == 6) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                [GD_COINS] = 10,
                [GD_SWORD] = 10,
                [GD_SHIELD] = 10
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

function addExtraBoards(plrId, amount)
    rttr:GetPlayer(plrId):AddWares({[GD_BOARDS] = amount})
end

function addExtraSoldiers(plrId, amount)
    rttr:GetPlayer(plrId):AddPeople({[JOB_PRIVATE] = amount})
end