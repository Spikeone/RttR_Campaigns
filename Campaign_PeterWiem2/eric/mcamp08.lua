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
        title   = 'Thorben, the Stone Thrower',
        name    = 'Unknown Enemy',
        diary   = 'Diary',

        msg1    = 'On the way here, we happened to meet a Celtic merchant ship. Its captain was surprised at the numerous foreign ships he had encountered in our kingdom so far. The crew knew nothing about a campaign against us Vikings. We exchanged our captured swords and shields for tools, food and other useful little things. I advised the Celtic merchant to leave as quickly as possible, as there was currently a war going on here.\n\nThe Felsenmeer is notorious among the Vikings as a ship graveyard. There is no part of our empire where we have lost more ships than here. The narrow channels are crooked, have narrow passages and shallows, and the banks are rocky and strewn with sharp-edged stones. What could have prompted the Chinese to build one of their main bases here of all places?\n\nWe have found a landing stage right in the middle of the rocky sea, where we will start our explorations. What will we find here apart from this Chinese trading camp? As befits a gray island, it stinks a lot here, and as befits a Viking, our noses detect the stench, but we don\'t let it make much of an impression on us.',
        msg2    = 'Thorben, the cleverest of all Vikings, is back among us! On the very island where we landed, our genius when it comes to solving tricky questions and confusing matters has found a refuge from our enemies. He is beside himself with joy that he has found his people again.\n\nHe immediately showed us the rabbit traps and fishing rods he had made himself, with which he has managed to get by quite well. Thorben\'s hare traps are mechanical marvels and his fishing rods are also quite something.\n\nHe also had a chat with our king. Thorben was impressed when he heard how naturally my father worked his magic in the bakery. Our genius immediately talked shop with Knut and told him about his thoughts on how a bakehouse could be operated even more effectively with the help of an induction-heated glass ceramic surface. None of us had the slightest idea what this could mean. Once again, our genius seems to be way ahead of his time.',
        msg3    = 'After celebrating the reunion together and enjoying Sigvaldi\'s beer to the full, we asked Thorben how well informed he was about the current situation here. He then told us about several camps not too far away, which had prompted him not to leave the island. He also noticed a conspicuous number of Chinese ships moving very agilely and incredibly quickly through the unsafe waters. The Chinese must have excellent helmsmen in their ranks.\n\nThen my father and I showed Thorben the plans for the war machines we had captured from the Roman camp on the last gray island. He took a close look at them and was immediately fired up to put these plans into practice. In response to our concerns that even Ansgar despaired of these plans, he just smiled. He didn\'t see any problems in constructing such a machine - after all, everything worth knowing was detailed in the plans.',
        msg4    = 'Thorben\'s information about the enemy camps in the immediate vicinity is unfortunately true. There are at least three headquarters around the island, which have virtually surrounded our island with their military buildings. If only it weren\'t for their ships, which have spread from one harbor to another in a flash to set up new fronts against us. And we have not yet found any promising trace of the large Chinese trading base.\n\nWith the help of the plans, suitable building materials and some of our younger soldiers, Thorben has built a catapult. If it works as dangerously as it looks, we have an effective weapon for attacking enemy military buildings.\n\nHe is currently instructing three of our strongest and most skilled men in the operation of this fearsome structure. A catapult like this has to be laboriously preloaded before each shot, and the insertion of large stones into the sling pan also requires muscle power.',
        msg5    = 'The first enemy headquarters is ours. It also contained swords and shields, which we collected straight away. In the smoking rubble we also found a clue to the Chinese trading post, which is supposed to be in the far south-west of the rocky sea.\n\nThorben really is a genius! His catapults are a great help to us because they don\'t let obstacles stand in their way, but destroy all enemy military buildings in their vicinity sooner or later. Now we\'ll see to it that we clear the area around our camp of enemy buildings and raids, and then we\'ll try to get close to this base by land or sea.\n\nElvor came up to me like a heap of misery and told me that the nearest anvil had given up the ghost under his powerful hammer blows. He excused himself by saying that he had been cold and had therefore inadvertently hit it a little harder. I had to smile inwardly, but tried to keep a serious face and an appropriate choice of words towards him.',
        msg6    = 'In the captured headquarters, there were bags of gold dust and coal stored in one room. We quickly got rid of it before the building went up in flames.\n\nIf only the sea of rocks wasn\'t so confusing! We have to search for and destroy each harbor building individually, which is a challenge in itself. Each military building has to be conquered individually, whether directly or by taking a detour via several other rocky islands!',
        msg7    = 'From my youth, I know from a Chinese friend that fast sailing with ships of all kinds is a popular sport in his home country and that the most skillful helmsmen are held in high esteem there. They maneuver their vessels here in these treacherous waters at an almost breathtaking speed. We have also lost quite a few ships here in the past, but I have never experienced so much shipwreck as here. There is a shipwreck on almost every corner here.\n\nBut it is precisely the extremely challenging canals here that seem to have prompted the Chinese to set up their main base here. This is the ideal way for them to combine national sport with the fulfillment of their duties.',
        msg99   = 'The last enemy camp building has been destroyed and the rocky islands have been freed from enemy hands. Before we return to our families on the island of eternal snow, we pay a visit to all the white and gray islands on the way there. Based on our previous experience, we can\'t afford to skip even one island, because there could be enemy settlements everywhere just waiting to be overlooked. So we take a closer look at the neighboring grey volcanic island to see if there is anything for us to do there.\n\nApparently, all Chinese troop movements were planned against us at the large Chinese base, as evidenced by some written remnants found in the smoking rubble. We also found a description of a person called Ahasversos who was being searched for. From the name, it seems to be a Babylonian I have never seen or heard of.'
    },
    de =
    {
        title   = 'Thorben, der Steinewerfer',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = 'Auf der Fahrt hierher trafen wir zufällig ein keltisches Kaufmannsschiff. Dessen Kapitän wunderte sich über die zahlreichen fremden Schiffe, denen er bisher in unserem Reich begegnet ist. Von einem Feldzug gegen uns Wikinger wusste die Besatzung nichts. Wir tauschten unsere erbeuteten Schwerter und Schilde gegen Handwerkszeug, Esswaren und andere nützliche Kleinigkeiten. Dem keltischen Kaufmann riet ich, schnellstens zu verschwinden, da hier momentan Krieg herrsche.\n\nDas Felsenmeer ist berüchtigt unter den Wikingern als Schiffsfriedhof. Es gibt keinen Teil in unserem Reich, wo wir mehr Schiffe verloren haben, als in diesem hier. Die engen Kanäle sind verwinkelt, haben Engstellen und Untiefen, und die Ufer sind felsig  und mit scharfkantigen Steinen übersät. Was mag die Chinesen wohl veranlasst haben, ausgerechnet hier einen ihrer Hauptstützpunkte zu errichten?\n\nZiemlich in der Mitte des Felsenmeeres haben wir eine Anlegestelle gefunden, wo wir unsere Erkundungen starten werden. Was werden wir hier vorfinden außer diesem chinesischen Handelslager?Wie es sich für eine graue Insel gehört, stinkt es hier gewaltig, und wie es sich für einen Wikinger gehört, nehmen unsere Nasen zwar diesen Gestank wahr, aber lassen uns davon nicht groß beeindrucken.',
        msg2    = 'Thorben, der klügste aller Wikinger, ist wieder unter uns! Ausgerechnet auf der Insel, wo wir angelandet sind, hat unser Genie, wenn es um die Lösung von kniffligen Fragen und unübersichtlichen Dingen geht, einen Zufluchtsort vor unseren Feinden gefunden. Er ist ganz außer sich vor Freude, dass er sein Volk wiedergefunden hat.\n\nEr hat uns gleich seine selbstgefertigten Hasenfallen und Angeln gezeigt, mit denen er ganz gut über die Runden gekommen ist. Thorbens Hasenfallen sind geradezu mechanische Wunderwerke und auch seine Angeln haben es in sich.\n\nAuch mit unserem König hat er sich unterhalten. Thorben war beeindruckt, als er hörte, wie selbstverständlich mein Vater im Backhaus seine Handgriffe setzte. Unser Genie hat gleich mit Knut gefachsimpelt und ihm von seinen Überlegungen erzählt, wie man ein Backhaus mit Hilfe einer induktiv beheizbaren Glaskeramikfläche noch effektiver betreiben könnte. Keiner von uns hatte auch nur die leiseste Ahnung, was damit gemeint sein könnte. Unser Genie scheint wieder einmal seiner Zeit weit voraus zu sein.',
        msg3    = 'Nachdem wir gemeinsam das Wiedersehen gefeiert haben, und dabei ausgiebig das Bier Sigvaldis genossen haben, fragten wir Thorben, wie weit er über die aktuelle Situation hier informiert sei. Er berichtete daraufhin von mehreren Lagern, die nicht allzu weit entfernt seien, und die ihn veranlasst hätten, die Insel hier nicht zu verlassen. Er bemerkte überdies auffällig viele chinesische Schiffe, die sich sehr gewandt und ungeheuer schnell durch das unsichere Fahrwasser bewegten. Die Chinesen müssen ausgezeichnete Steuermänner in ihren Reihen haben.\n\nDann legten mein Vater und ich Thorben die Pläne über Kriegsmaschinen vor, die wir aus dem Römerlager auf der letzten grauen Insel erbeutet haben. Er sah sie sich genau an und war sofort Feuer und Flamme, diese Pläne in die Praxis umzusetzen. Auf unsere Bedenken hin, das selbst Ansgar an diesen Plänen verzweifelt ist, schmunzelte er nur. Er sähe keine Probleme, solch eine Maschine zu konstruieren – es stände ja alles Wissenswerte detailliert in den Plänen drin.',
        msg4    = 'Thorbens Angaben von wegen den feindlichen Lagern in der näheren Umgebung entsprechen leider der Wahrheit. Es sind mindestens drei Hauptquartiere um die Insel herum, die quasi unsere Insel mit ihren Militärbauwerken umzingelt haben. Wenn nur ihre Schiffe nicht wären, die sich geradezu blitzartig von einem Hafenplatz zum anderen ausgebreitet haben, um dort neue Fronten gegen uns aufzubauen. Und von dem großen Handelsstützpunkt der Chinesen haben wir noch keine vielversprechende Spur gefunden.\n\nMit Hilfe der Pläne, passendem Baumaterial und einigen unserer jüngeren Soldaten hat Thorben ein Katapult gebaut. Wenn es so gefährlich funktioniert, wie es aussieht, haben wir eine wirkungsvolle Waffe zum Angriff auf feindliche Militärgebäude.\n\nGerade weist er drei unserer stärksten und geschicktesten Männer in die Bedienung dieses furchterregenden Bauwerks ein. So ein Katapult muss vor jedem Schuss mühsam vorgespannt werden, und auch das Einsetzen großer Steine in die Schleuderpfanne erfordert Muskelkraft.',
        msg5    = 'Das erste feindliche Hauptquartier ist unser. Darin lagen auch Schwerter und Schilde, die wir gleich eingesammelt haben. Auch fanden wir in den rauchenden Trümmern einen Hinweis auf den chinesischen Handelsstützpunkt, der im äußersten Südwesten des Felsenmeeres sich befinden soll.\n\nThorben ist wirklich ein Genie! Seine Katapulte sind uns eine große Hilfe, weil sie sich von Hindernissen nicht aufhalten lassen, sondern alle gegnerische Militärgebäude in ihrer Nähe über kurz oder lang zerstören. Jetzt schauen wir, dass wir die Umgebung unseres Lagers frei bekommen von feindlichen Gebäuden und Überfällen, und dann versuchen wir, zu Land oder zu Wasser in die Nähe dieses Stützpunktes zu kommen.\n\nElvor kam auf mich zu wie ein Häufchen Elend und berichtete mir, dass der nächste Amboss unter seinen wuchtigen Hammerschlägen den Geist aufgegeben hätte. Er entschuldigte sich damit, dass es ihm kalt gewesen sei und er deshalb unbeabsichtigt etwas stärker zugeschlagen hätte. Ich musste innerlich schmunzeln, bemühte mich aber um ein ernste Miene und eine angemessene Wortwahl Ihm gegenüber.',
        msg6    = 'In dem eroberten Hauptquartier lagerten in einem Raum säckeweise Goldstaub und Kohle. Das haben wir schnell beiseite geschafft, bevor das Gebäude vollständig in Flammen aufgegangen ist.\n\nWenn das Felsenmeer nur nicht so unübersichtlich wäre! So müssen wir jedes Hafengebäude einzeln aufsuchen und zerstören, und das ist hier schon eine Herausforderung. Jedes Militärgebäude muss für sich erobert werden, egal ob auf direktem Weg oder auf dem Umweg über mehrere andere Felseninseln!',
        msg7    = 'Aus meiner Jugend weiß ich von einem chinesischen Kamerad, dass schnelles Segeln mit Schiffen aller Art in seiner Heimat ein Volkssport sei, und die geschicktesten Steuermänner dort in hohem Ansehen ständen. Sie manövrieren ihre Wasserfahrzeuge hier in diesem tückischen Fahrwasser in einem geradezu atemberaubenden Tempo. Auch wir haben hier früher etliche Schiffe verloren, aber so viel Schiffbruch wie hier habe ich noch nicht erlebt. Hier hat es fast an jeder Ecke ein Schiffswrack liegen.\n\nAber gerade die äußerst anspruchsvoll zu fahrenden Kanäle hier scheinen die Chinesen dazu veranlasst haben, hier ihren Hauptstützpunkt zu errichten. So können sie Volkssport und Pflichterfüllung ideal miteinander verbinden.',
        msg99   = 'Das letzte feindliche Lagergebäude wurde zerstört, die Felseninseln sind befreit aus Feindeshand.Bevor wir wieder zu unseren Familien auf der Insel des ewigen Schnees zurückkehren, statten wir allen weißen und grauen Inseln auf dem Weg dorthin einen Besuch ab. Wir können es aufgrund  unserer bisherigen Erfahrungen nicht leisten, auch nur eine Insel auszulassen, weil überall feindliche Siedlungen bestehen könnten, die nur darauf warten, dass man sie übersieht. Deshalb schauen wir uns die benachbarte graue Vulkaninsel einmal genauer an, ob es dort für uns etwas zu tun gibt.\n\nIm dem großen chinesischen Stützpunkt wurden anscheinend alle chinesischen Truppenbewegungen gegen uns geplant, wie einige gefundene schriftliche Überbleibsel in den rauchenden Trümmern bezeugen. Außerdem fanden wir eine Personenbeschreibung namens Ahasversos, nach dem gesucht wurde. Dem Namen nach scheint es ein Babylonier zu sein, von dem ich noch nie etwas gehört oder gesehen habe.'
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
    rttr:GetPlayer(1):SetNation(NAT_ROMANS)
    rttr:GetPlayer(2):SetNation(NAT_BABYLONIANS)
    rttr:GetPlayer(3):SetNation(NAT_BABYLONIANS)
    rttr:GetPlayer(4):SetNation(NAT_JAPANESE)

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
        addExtraBoards(2, 100)
        addExtraSoldiers(2, 10)
        addExtraSoldiers(3, 10)
        addExtraBoards(4, 50)
        addExtraSoldiers(4, 20)
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
        rttr:GetWorld():AddStaticObject(74, 80, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(55, 88, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(51, 56, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(40, 93, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(25, 32, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(81, 31, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(69, 20, 0, 0, 1)
        rttr:GetWorld():AddStaticObject( 9, 24, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(94, 36, 0, 0, 1)
        rttr:GetWorld():AddStaticObject( 6, 62, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(94, 78, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(10, 89, 0, 0, 1)

        rttr:GetWorld():AddAnimal(39, 19, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(18, 62, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(13,  4, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(29, 81, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(77,  3, SPEC_POLARBEAR)
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
            [GD_HAM       ] = 4,
            [GD_GRAIN     ] = 4,
            [GD_FLOUR     ] = 4,

            [GD_FISH      ] = 4,
            [GD_MEAT      ] = 6,
            [GD_BREAD     ] = 8,
            [GD_WATER     ] = 2,
            [GD_BEER      ] = 6,
            [GD_COAL      ] = 10,

            [GD_IRONORE   ] = 10,
            [GD_GOLD      ] = 8,
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
            [GD_BOW       ] = 4,
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
            [JOB_PRIVATEFIRSTCLASS  ] = 7,
            [JOB_SERGEANT           ] = 3,
            [JOB_OFFICER            ] = 3,
            [JOB_GENERAL            ] = 3
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

            [GD_FISH      ] = 20,
            [GD_MEAT      ] = 20,
            [GD_BREAD     ] = 20,
            [GD_WATER     ] = 6,
            [GD_BEER      ] = 8,
            [GD_COAL      ] = 30,

            [GD_IRONORE   ] = 20,
            [GD_GOLD      ] = 8,
            [GD_IRON      ] = 8,
            [GD_COINS     ] = 8,
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
            [GD_ROLLINGPIN] = 2,
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
            [JOB_OFFICER            ] = 1,
            [JOB_GENERAL            ] = 1
        })
    end
end

function onGameFrame(gf)
    if (gf == 10 and debugTexts) then
        for _, i in ipairs(eIdx) do
            MissionText(i, false)
        end
    end

    if(eState[4] == 0) then
        enforceBuildingCount(0, BLD_CATAPULT, 3, false)
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

    if (eState[4] > 0 and milBuildingCount >= 5) then
        -- EVENT4
        MissionEvent(4, false)
    end

    if (eState[5] > 0 and (rttr:GetPlayer(1):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(2):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(3):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(4):GetNumBuildings(BLD_HEADQUARTERS)) < 4) then
        -- EVENT5
        MissionEvent(5, false)
    end

    if (eState[6] > 0 and (rttr:GetPlayer(1):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(2):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(3):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(4):GetNumBuildings(BLD_HEADQUARTERS)) < 3) then
        -- EVENT6
        MissionEvent(6, false)
    end

    if (eState[7] > 0 and (rttr:GetPlayer(1):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(2):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(3):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(4):GetNumBuildings(BLD_HEADQUARTERS)) < 3) then
        -- EVENT7
        MissionEvent(7, false)
    end

    if (eState[99] > 0 and (GetNumStorage(1) + GetNumStorage(2) + GetNumStorage(3) + GetNumStorage(4)) < 1) then
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
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                [GD_FISH] = 20,
                [GD_MEAT] = 20
            })
        end

    elseif(e == 3) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                [GD_BEER] = 10,
                [GD_BREAD] = 20
            })
        end

    elseif(e == 4) then
        rttr:GetPlayer(0):EnableBuilding(BLD_CATAPULT, not onLoad)

        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                [GD_COAL] = 20,
                [GD_IRON] = 10,
                [GD_GOLD] = 10
            })
        end

    elseif(e == 5) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                [GD_SWORD] = 10,
                [GD_SHIELD] = 10
            })
        end

    elseif(e == 6) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                [GD_COAL] = 20,
                [GD_GOLD] = 20
            })
        end

    elseif(e == 7) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                [GD_FISH] = 3,
                [GD_MEAT] = 3,
                [GD_BREAD] = 3
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

function addExtraBoards(plrId, amount)
    rttr:GetPlayer(plrId):AddWares({[GD_BOARDS] = amount})
end

function addExtraSoldiers(plrId, amount)
    rttr:GetPlayer(plrId):AddPeople({[JOB_PRIVATE] = amount})
end