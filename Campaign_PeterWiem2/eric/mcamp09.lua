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
eIdx = {1, 2, 3, 4, 5, 99}

local debugTexts = false;

rttr:RegisterTranslations(
{
    de =
    {
        title   = 'Mikkel, der Förster',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = 'Nach einer kurzen, aber stürmischen Überfahrt kamen wir auf unserer Vulkaninsel an. Da ein großer Teil der vorhandenen Lavaquellen aktiv sind, ist es hier wärmer als auf allen anderen Inseln.\n\nDieser Ort ist ein richtiges Kontrastprogramm zu unseren weißen, schneereichen Inseln. Einen lebensfeindlicheren Ort als die Vulkaninsel kann man sich schwerlich vorstellen. Überall gärt und stinkt es, die Gewässer sind sumpfig und tückisch. Es ist so trübe und gleichzeitig so schwül hier, dass sogar Kakteen in Menge hier gedeihen. Über allem erhebt sich der aktivste und größte Vulkan, den wir in unserer Inselwelt haben. Es ist wahrlich ein Ort, um das Fürchten zu lernen.',
        msg2    = 'Wir scheinen hier nicht allein zu sein. Wenn wir uns ruhig verhalten hören wir deutlich Axtschläge und Steinklopfen. Es könnten sich Feinde in unmittelbarer Nähe befinden. Das bedeutet, dass wir innerhalb kürzester Zeit kampfbereit sein müssen, um einen eventuellen Angriff abwehren zu können.\n\nDazu brauchen wir aber rasch Gold, Eisen und Kohle und angemessen große Militärbauwerke, um uns erfolgreich verteidigen zu können. Bjarki, unser Münzpräger, Darvi, unser Eisengießer und Elvor, unser Schmied müssen schnell Münzen und Waffen in größerer Anzahl herstellen. Und auch Sigvaldi und sein Bier werden dringend benötigt. Ein Wikinger ohne Bier ist nicht schlachtentauglich!',
        msg3    = 'Der Angriff musste schnell geplant und durchgeführt werden, obwohl wir noch gar nicht vollständig auf einen Kampf vorbereitet waren. Dementsprechend groß sind unsere Verluste, die wir möglichst schnell wieder ausgleichen müssen. Außerdem fahren ab und zu Schiffe vorbei, deren Besatzungen uns nicht freundlich gesinnt sind. Wir konnten chinesische und römische Schiffe erkennen. Mit beiden werden wir es also über kurz oder lang zu tun bekommen.\n\nUnser Mikkel, der von der grünen Sandinsel stammt, die wir vor diesem Krieg bewohnten, vermisst vor allem seine geliebten Bäume von dort. Das, was hier auf dieser Insel wächst, kann man kaum als Baum bezeichnen, aber Holz liefern sie trotzdem, und das brauchen wir hier.\n\nMikkel hat erkannt, dass diese Bäume sich schneller vermehren, wenn man ihre Samen zu Setzlingen zieht und an geeigneten Stellen eingräbt. Deshalb habe ich ihn vom Soldatendienst befreit, damit er uns neue Bäume heranzieht. Wir brauchen das Holz dieser Bäume, weil es auf dieser lebensfeindlichen Insel nicht übermäßig viele davon gibt.',
        msg4    = 'Wir scheinen den Mittelpunkt dieser unheimlichen Insel erreicht zu haben. Im Nordwesten leuchtet die Lava des Vulkans das Gelände taghell aus. Im Südwesten sind die Römer zu suchen, im Nordosten die Chinesen, und vor uns ist das Gebirge, das reiche Bodenschätze verspricht. Wir werden uns überlegen müssen, welchen Feind wir zuerst angreifen. Und die vielen feindlichen Häfen samt Hafengebäuden sind eine Landplage, mit denen wir auch fertig werden müssen.',
        msg5    = 'In den Trümmern dieses Hauptquartiers fanden wir zwei nagelneue Urkunden mit frischem Siegel, die von einem Feldherrn Apfelmus auf einer weißen Insel unterzeichnet war. Als ich die Erste öffnete und durchlas, wurde darin die vor kurzem stattgefundene Zerstörung der chinesischen Befehlszentrale im Felsenmeer durch uns Wikinger schriftlich bestätigt.\n\nIn der zweiten Urkunde wurde von dem schon früher erwähnten Prainn berichtet, dass er die Insel der Zusammenkunft erreicht hat, um dort mit seinem Wissen und seiner Erfahrung das aktuelle Geschehen besser organisieren zu können. Schau einer an, die Feinde sind gut und schnell informiert über das aktuelle Geschehen! Und dieser Prainn wird mir auch noch irgendwann über den Weg laufen und dann einige Fragen beantworten müssen!\n\nHalvar und ich kennen diese erwähnte weiße Insel, sie ist unmittelbar nördlich der Insel des ewigen Schnees gelegen. Und wo ein Feldherr ist, da ist auch ein bedeutender Stützpunkt. Dem Namen nach des Feldherrn nach zu urteilen müsste es sich um eine römische Niederlassung handeln.',
        msg99   = 'Auch unsere Vulkaninsel ist wieder in unserer Hand. Jetzt werden wir zuerst zur Insel des ewigen Schnees zurückkehren, um unsere Familien wieder zu sehn. Auch unseren König Knut wollen wir bei unseren Familien lassen. Er hat seine Bäckereikünste inzwischen an Magnus, einem unserer fähigsten Mitarbeiter, weitervermittelt.\n\nMein Vater ist mittlerweile in einer so guten seelischen Verfassung, dass er unseren Frauen und Kindern mit Gewinn für alle dienen kann. Dafür wollen wir wieder Ansgar mit uns nehmen, um gemeinsam den Römerstützpunkt im Norden mit unseren Schiffen anzusteuern.'
    },
    en =
    {
        title   = 'Mikkel, the forester',
        name    = 'Enemy Unknown',
        diary   = 'Diary',

        msg1    = 'After a short but stormy crossing, we arrived at our volcanic island. Since a large part of the existing lava sources are active, it is warmer here than on any other island.\n\nThis place is a real contrast to our white, snow-covered islands. It is hard to imagine a more hostile place than the volcanic island. Everywhere it smolders and stinks, the waters are marshy and treacherous. It is so gloomy and at the same time so humid here that even cacti thrive in large numbers. Above it all rises the most active and largest volcano we have in our island world. It is truly a place to learn fear.',
        msg2    = 'We don’t seem to be alone here. If we stay quiet, we can clearly hear the sound of axe blows and stone hitting. There may be enemies nearby. This means we must be ready for battle in a very short time in order to defend ourselves against a potential attack.\n\nFor this, we need gold, iron, and coal quickly, as well as appropriately large military buildings to successfully defend ourselves. Bjarki, our coin maker, Darvi, our iron caster, and Elvor, our blacksmith, must quickly produce coins and weapons in large numbers. And Sigvaldi and his beer are urgently needed as well. A Viking without beer is not fit for battle!',
        msg3    = 'The attack had to be quickly planned and carried out, even though we were not fully prepared for a battle yet. Accordingly, our losses are significant, and we must quickly make up for them. Additionally, ships occasionally pass by, whose crews are not friendly toward us. We were able to identify Chinese and Roman ships. So, we will inevitably have to deal with both of them sooner or later.\n\nOur Mikkel, who comes from the green sand island we inhabited before this war, especially misses the trees he loved there. What grows here on this island can hardly be called trees, but they still provide wood, which we need here.\n\nMikkel has realized that these trees multiply faster if their seeds are grown into seedlings and buried at suitable spots. Therefore, I have freed him from military service so he can raise new trees for us. We need the wood of these trees because there are not many of them on this lifeless island.',
        msg4    = 'It seems we have reached the center of this eerie island. In the northwest, the lava from the volcano illuminates the terrain brightly. In the southwest, the Romans are to be found, in the northeast, the Chinese, and ahead of us is the mountain range, promising rich mineral resources. We will need to decide which enemy to attack first. And the many enemy ports and port buildings are a scourge we will also have to deal with.',
        msg5    = 'In the ruins of this headquarters, we found two brand-new documents with fresh seals, signed by a commander named Apfelmus on a white island. When I opened the first one and read it, it confirmed in writing the recent destruction of the Chinese command center in the Felsenmeer by us Vikings.\n\nThe second document reported that the previously mentioned Prainn had reached the Island of the Gathering, where he intended to use his knowledge and experience to better organize the current events. Well, the enemies are well-informed and quick about what is happening! And this Prainn will cross my path eventually, and he will have to answer some questions!\n\nHalvar and I know this mentioned white island; it is located immediately north of the Island of Eternal Snow. And where there is a commander, there is also a significant outpost. Judging by the name of the commander, it must be a Roman settlement.',
        msg99   = 'Our volcanic island is once again in our hands. Now we will first return to the Island of Eternal Snow to see our families again. We also want to leave our King Knut with our families. He has passed on his baking skills to Magnus, one of our most capable workers.\n\nMy father is now in such a good mental state that he can serve our women and children to the benefit of all. For this, we want to take Ansgar with us again, so we can sail together to the Roman outpost in the north with our ships.'
    },
    cs =
    {
        title   = 'Mikkel, lesník',
        name    = 'Neznámý soupeř',
        diary   = 'Deník',

        msg1    = 'Po krátkém, ale bouřlivém přejezdu jsme dorazili na náš vulkanický ostrov. Jelikož velká část existujících lávových pramenů je aktivní, je zde tepleji než na všech ostatních ostrovech.\n\nToto místo je skutečným kontrastem k našim bílým, sněhem pokrytým ostrovům. Těžko si lze představit životu nepřátelštější místo než vulkanický ostrov. Všude doutná a páchne, vody jsou bažinaté a zrádné. Je zde tak pochmurně a zároveň tak vlhko, že i kaktusy zde hojně rostou. Nad tím vším se tyčí nejaktivnější a největší sopka, jakou máme v naší ostrovní říši. Je to skutečně místo, kde se dá naučit strachu.',
        msg2    = 'Zdá se, že zde nejsme sami. Pokud zůstaneme tiše, jasně slyšíme údery seker a tlučení kamene. Může se nacházet nepřítel v bezprostřední blízkosti. To znamená, že se musíme být schopni rychle připravit na boj, abychom mohli odrazit případný útok.\n\nPro to ale potřebujeme rychle zlato, železo a uhlí a vhodně velké vojenské stavby, abychom se mohli úspěšně bránit. Bjarki, náš mincovník, Darvi, náš slévač železa, a Elvor, náš kovář, musí rychle vyrábět mince a zbraně ve velkém množství. A také Sigvaldi a jeho pivo jsou nezbytně potřeba. Viking bez piva není připraven na bitvu!',
        msg3    = 'Útok musel být rychle naplánován a proveden, i když jsme ještě nebyli na boj zcela připraveni. Odpovídajícím způsobem jsou naše ztráty značné a musíme je co nejrychleji nahradit. Kromě toho kolem nás občas proplouvají lodě, jejichž posádky nám nejsou přátelské. Dokázali jsme rozpoznat čínské a římské lodě. S oběma se tedy dříve nebo později budeme muset vypořádat.\n\nNáš Mikkel, který pochází ze zelené písčité ostrova, který jsme obývali před touto válkou, postrádá především své milované stromy z tohoto místa. To, co zde na tomto ostrově roste, nelze téměř nazvat stromy, ale přesto poskytují dřevo, které zde potřebujeme.\n\nMikkel zjistil, že tyto stromy se rychleji rozmnožují, pokud se jejich semena vysejí do sazenic a zakopou na vhodných místech. Proto jsem ho osvobodil od vojenské služby, aby nám mohl vypěstovat nové stromy. Potřebujeme dřevo těchto stromů, protože na tomto nehostinném ostrově jich není mnoho.',
        msg4    = 'Zdá se, že jsme dosáhli středu tohoto děsivého ostrova. Na severozápadě osvětluje láva z vulkánu krajinu jasně. Na jihozápadě je třeba hledat Římany, na severovýchodě Číňany, a před námi se tyčí pohoří, které slibuje bohaté minerální zdroje. Budeme muset zvážit, kterého nepřítele napadneme jako prvního. A ty mnohé nepřátelské přístavy a přístavní budovy jsou pohromou, se kterou se budeme muset také vypořádat.',
        msg5    = 'V troskách tohoto hlavního štábu jsme našli dva zcela nové dokumenty s čerstvými pečeti, které podepsal velitel Apfelmus na bílém ostrově. Když jsem otevřel první z nich a přečetl ho, bylo v něm písemně potvrzeno nedávné zničení čínského velitelského střediska ve Felsenmeer námi vikingy.\n\nVe druhém dokumentu se psalo o již dříve zmíněném Prainnovi, který dosáhl Ostrova setkání, aby tam se svými znalostmi a zkušenostmi lépe organizoval současné dění. Tak podívejme se, nepřátelé jsou dobře informováni a rychlí v tom, co se děje! A tento Prainn mi ještě jednou zkříží cestu, a pak mi bude muset na některé otázky odpovědět!\n\nHalvar a já tento zmíněný bílý ostrov známe, leží přímo na sever od Ostrova věčného sněhu. A kde je velitel, tam je i významná základna. Podle jména velitele by se mělo jednat o římskou osadu.',
        msg99   = 'Naše vulkanická ostrov je opět v našich rukou. Teď se nejprve vrátíme na Ostrov věčného sněhu, abychom znovu viděli naše rodiny. Také chceme našeho krále Knuta nechat u našich rodin. Své pekařské dovednosti už předal Magnusovi, jednomu z našich nejzdatnějších pracovníků.\n\nMůj otec je nyní v tak dobrém duševním stavu, že může našim ženám a dětem sloužit ku prospěchu všech. Proto chceme vzít Ansgara s sebou, abychom společně s našimi loděmi zamířili na římskou základnu na severu.'
    },
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
    rttr:GetPlayer(2):SetNation(NAT_ROMANS)
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
        addExtraBoards(1, 100)
        addExtraSoldiers(2, 100)
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
        rttr:GetWorld():AddStaticObject( 7, 52, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(65, 29, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(21, 10, 0, 0, 1)
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
        rttr:GetPlayer(p):DisableBuilding(BLD_PIGFARM)
        rttr:GetPlayer(p):DisableBuilding(BLD_SLAUGHTERHOUSE)
        rttr:GetPlayer(p):DisableBuilding(BLD_METALWORKS)
        rttr:GetPlayer(p):DisableBuilding(BLD_FORESTER)
        rttr:GetPlayer(p):DisableBuilding(BLD_DONKEYBREEDER)
    end

    if (p ~= 0 and not onLoad) then
        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 70,
            [GD_BOARDS    ] = 70,
            [GD_STONES    ] = 40,
            [GD_HAM       ] = 5,
            [GD_GRAIN     ] = 5,
            [GD_FLOUR     ] = 5,

            [GD_FISH      ] = 8,
            [GD_MEAT      ] = 8,
            [GD_BREAD     ] = 8,
            [GD_WATER     ] = 8,
            [GD_BEER      ] = 8,
            [GD_COAL      ] = 10,

            [GD_IRONORE   ] = 10,
            [GD_GOLD      ] = 3,
            [GD_IRON      ] = 5,
            [GD_COINS     ] = 2,
            [GD_TONGS     ] = 1,
            [GD_AXE       ] = 5,

            [GD_SAW       ] = 4,
            [GD_PICKAXE   ] = 4,
            [GD_HAMMER    ] = 16,
            [GD_SHOVEL    ] = 4,
            [GD_CRUCIBLE  ] = 4,
            [GD_RODANDLINE] = 4,

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
            [JOB_HELPER             ] = 80,
            [JOB_BUILDER            ] = 15,
            [JOB_PLANER             ] = 8,
            [JOB_WOODCUTTER         ] = 6,
            [JOB_FORESTER           ] = 4,
            [JOB_STONEMASON         ] = 8,

            [JOB_FISHER             ] = 4,
            [JOB_HUNTER             ] = 4,
            [JOB_CARPENTER          ] = 4,
            [JOB_FARMER             ] = 4,
            [JOB_PIGBREEDER         ] = 4,
            [JOB_DONKEYBREEDER      ] = 4,

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
            [JOB_GEOLOGIST          ] = 8,
            [JOB_SCOUT              ] = 2,

            [JOB_PACKDONKEY         ] = 12,
            [JOB_CHARBURNER         ] = 0,

            [JOB_PRIVATE            ] = 42,
            [JOB_PRIVATEFIRSTCLASS  ] = 7,
            [JOB_SERGEANT           ] = 1,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0
        })
    elseif (p == 0 and not onLoad) then
        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 20,
            [GD_BOARDS    ] = 30,
            [GD_STONES    ] = 30,
            [GD_HAM       ] = 0,
            [GD_GRAIN     ] = 8,
            [GD_FLOUR     ] = 8,

            [GD_FISH      ] = 8,
            [GD_MEAT      ] = 8,
            [GD_BREAD     ] = 8,
            [GD_WATER     ] = 8,
            [GD_BEER      ] = 0,
            [GD_COAL      ] = 20,

            [GD_IRONORE   ] = 8,
            [GD_GOLD      ] = 4,
            [GD_IRON      ] = 20,
            [GD_COINS     ] = 8,
            [GD_TONGS     ] = 0,
            [GD_AXE       ] = 6,

            [GD_SAW       ] = 3,
            [GD_PICKAXE   ] = 8,
            [GD_HAMMER    ] = 18,
            [GD_SHOVEL    ] = 0,
            [GD_CRUCIBLE  ] = 4,
            [GD_RODANDLINE] = 4,

            [GD_SCYTHE    ] = 4,
            [GD_CLEAVER   ] = 0,
            [GD_ROLLINGPIN] = 2,
            [GD_BOW       ] = 0,
            [GD_SWORD     ] = 5,
            [GD_SHIELD    ] = 5,

            [GD_BOAT      ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 70,
            [JOB_BUILDER            ] = 15,
            [JOB_PLANER             ] = 8,
            [JOB_WOODCUTTER         ] = 8,
            [JOB_FORESTER           ] = 0,
            [JOB_STONEMASON         ] = 8,

            [JOB_FISHER             ] = 4,
            [JOB_HUNTER             ] = 6,
            [JOB_CARPENTER          ] = 3,
            [JOB_FARMER             ] = 2,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,

            [JOB_MILLER             ] = 2,
            [JOB_BAKER              ] = 2,
            [JOB_BUTCHER            ] = 0,
            [JOB_BREWER             ] = 2,
            [JOB_MINER              ] = 10,
            [JOB_IRONFOUNDER        ] = 2,

            [JOB_ARMORER            ] = 2,
            [JOB_MINTER             ] = 1,
            [JOB_METALWORKER        ] = 0,
            [JOB_SHIPWRIGHT         ] = 1,
            [JOB_GEOLOGIST          ] = 5,
            [JOB_SCOUT              ] = 2,

            [JOB_PACKDONKEY         ] = 20,
            [JOB_CHARBURNER         ] = 0,
    

            [JOB_PRIVATE            ] = 25,
            [JOB_PRIVATEFIRSTCLASS  ] = 25,
            [JOB_SERGEANT           ] = 3,
            [JOB_OFFICER            ] = 2,
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

    if (eState[3] > 0 and (rttr:GetPlayer(1):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(2):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(3):GetNumBuildings(BLD_HEADQUARTERS)) < 3) then
        -- EVENT3
        MissionEvent(3, false)
    end

    if (eState[5] > 0 and (rttr:GetPlayer(1):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(2):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(3):GetNumBuildings(BLD_HEADQUARTERS)) < 2) then
        -- EVENT5
        MissionEvent(5, false)
    end


    if ((GetNumStorage(1) + GetNumStorage(2) + GetNumStorage(3)) < 1) then
        -- EVENT6 (maps to 99)
        MissionEvent(99, false)
    end
end

function onOccupied(p, x, y)
    if(p ~= 0) then return end

    if(eState[4] > 0 and x == 40 and y == 40) then
        -- EVENT4
        MissionEvent(4, false)
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
        -- nothing

    elseif(e == 3) then
        rttr:GetPlayer(0):EnableBuilding(BLD_FORESTER, not onLoad)

        if(not onLoad) then
            rttr:GetPlayer(0):AddPeople({
                [JOB_FORESTER] = 2
            })
        end

    elseif(e == 4) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                [GD_FISH] = 10,
                [GD_BREAD] = 10,
                [GD_MEAT] = 10
            })
        end

    elseif(e == 5 and not onLoad) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                [GD_COINS] = 5
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