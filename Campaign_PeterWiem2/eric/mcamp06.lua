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
        title   = "Sigvaldi, der Brauer",
        name    = "Unbekannter Gegner",
        diary   = "Tagebuch",

        msg1    = "Halvar hat für uns dieses versteckte Tal als Ausgangspunkt gewählt. Auf unserem Anmarschweg hierher haben wir eine Menge frische Spuren von Menschen entdeckt, deshalb erschien uns ein verborgener Platz sicherer.\n\nDie ganze Insel scheint durchzogen mit Resten von Lagerfeuern und frisch aufgebrochenem Wild. Allerdings sind die Spuren so unterschiedlich, die wir hier gefunden haben, dass wir mit ziemlicher Sicherheit auf mehrere Völker schließen können, die diese unterschiedlichen Spuren hinterlassen haben. Unter anderem haben wir drei völlig verschiedenartige Pfeilspitzen entdeckt, die offensichtlich bei der Jagd nach Wild verwendet worden sind.",
        msg2    = "Halvars Spürsinn ist bisher bewundernswert, was die Wahl unserer Lageplätze angeht, um uns herum hat es genügend Gold, um eine Münzprägerei für lange Zeit auszulasten. Jetzt sollten wir uns schnell nach Süden ausbreiten, damit unser Schmied Elvor, unser Eisengießer Darvi und ihre Zulieferer genug zu tun bekommen. Wir brauchen Kohle, Eisen, Gold, Verpflegung und genügend Platz, um unsere Wirtschaft zum Laufen zu bringen.\n\nAußerdem sind Halvar und Ole zu zweit unterwegs, um sich ein Bild von der Lage hier zu machen. Ole sucht vor allem geeignete Hafenplätze, Halvar will herausfinden, wo die Feinde lagern und wie stark sie sind.\n\nAnsgar hat schon vor längerer Zeit vorgeschlagen, neben Schwert und Schild noch eine Waffe zu konstruieren, die den Gegner auch auf Distanz schaden könnten. Wir sind schon mit gegnerischen Bauwerken konfrontiert worden, die Steine über eine größere Entfernung schleudern können, und die uns sehr zugesetzt haben. Es wäre eine Hilfe, wenn wir genauere Pläne darüber bekommen könnten.",
        msg3    = "Ymir hat mit Sigvaldi gesprochen und ihm geraten, es einmal mit dem erbeuteten Hopfen aus dem Chinesenlager anstatt mit Brennnesseln beim Brauen zu versuchen. Ymir hat herausgefunden, dass dieser Hopfen auch wächst, wo Wintergerste gedeiht, und schlimmer als das Brennnesselbier kann ein Hopfenbier eigentlich nicht schmecken. Sigvaldi ist etwas skeptisch, aber er will es probieren.\n\nHalvar und Ole sind ziemlich atemlos in der Nacht in Eilmärschen zurückgekehrt, um zu berichten. Es sind drei größere Lager jeweils von Babyloniern, Chinesen und Römern auf der Insel. Sie unterstützen sich gegenseitig, indem sie Handel miteinander treiben, sich schnell ausbreiten und dadurch jederzeit und so gut wie überall in der Lage sind, uns anzugreifen. Selbst unser Hauptquartier sei nicht vor Ihnen sicher, da wir es von Norden nicht verteidigen können.\n\nWir müssen so schnell wie möglich Festungen rund um unser Lager herum bauen, damit wir einigermaßen geschützt sind, wenn ein Gegner angreifen sollte. Unsere Wirtschaft läuft schon ganz gut, aber es gibt eher zu wenig als zu viel Nahrung für unsere Bergarbeiter.",
        msg4    = "Hurra, Sigvaldi hat sein erstes Hopfenbier an die Front geschickt, und es schmeckt tatsächlich! Allerdings darf man nicht mehr als fünf Liter davon auf einmal trinken, sonst lassen die Konzentration und das Gleichgewichtsempfinden auf dem Schlachtfeld spürbar nach und man sieht alles doppelt!\n\nAber diese Konzentration brauchen wir im Moment nötig, denn die feindlichen Fronten schieben sich unaufhaltsam auf uns zu und es gibt wenige Rückzugsmöglichkeiten. Also werden wir dort kämpfen, wo die besten Möglichkeiten bestehen, den Feind zu schwächen und ansonsten versuchen, unsere Front zu halten. Vor allem benötigen wir Land, wo Ymir seine Bauernhöfe bauen und auch bewirtschaften kann.",
        msg5    = "Hier sind wir gefordert bis zum letzten Mann, aber wir geben nicht auf! Wir wollen und wir werden unsere Heimat, die grünen Inseln, wiedersehen.\n\nUnsere starken Soldaten hauen mit dem Schwert drein, das es eine Art hat, aber die Feinde sind militärisch so stark, dass wir eine Vorahnung bekommen, was uns auf den restlichen Inseln erwarten könnte, wenn wir hier siegen.",
        msg99   = "Das war eine Schlacht, aber die Insel ist wieder unser. Im zerstörten römischen Hauptquartier haben wir Pläne für Kriegsmaschinen und weiterverarbeitende Getreidebetriebe gefunden, aber wir können leider nichts damit anfangen, weil uns jemand fehlt, der sie umsetzen kann. Selbst Ansgar hat nur mit dem Kopf geschüttelt, als er einer dieser Pläne  über Steineschleudern genauer studiert hat.\n\nWir werden als nächstes unsere erste grüne Insel betreten. Es ist die Insel des ewigen Schnees, weil die Berge dort so hoch sind, dass der Schnee auf den Gipfeln niemals taut, weil es die nördlichste der grünen Inseln ist. Sie ist der geographische Mittelpunkt unseres Reiches, und wir haben dort einen hochgelegenen versteckten Ruheort, den wir in der wärmeren Jahreszeit gerne aufgesucht haben.\n\nVorher werden wir unseren König Knut und unsere Familien wiedersehen. Auch sie sollen auf die grüne Insel gebracht werden, weil die Luft und die Temperaturen dort wesentlich erträglicher sind. Wie freue ich mich auf das Wiedersehen mit meinem Vater. Ob ich ihm von den Brief über Prainn erzählen soll, der mir im Chinesenlager in die Hände gefallen ist?"
    },
    en =
    {
        title   = "Sigvaldi, the brewer",
        name    = "Enemy Unknown",
        diary   = "Diary",

        msg1    = "Halvar has chosen this hidden valley as our starting point. On our way here, we discovered a lot of fresh human tracks, so a concealed spot seemed safer.\n\nThe entire island seems to be crisscrossed with remnants of campfires and freshly hunted game. However, the tracks we found here are so varied that we can confidently conclude several different peoples have left these distinct traces. Among other things, we discovered three completely different types of arrowheads that were obviously used in hunting game.",
        msg2    = "Halvar's instinct has been admirable so far in choosing our campsites; there's enough gold around us to keep a mint running for a long time. Now we should quickly expand southward so that our blacksmith Elvor, our iron caster Darvi, and their suppliers have enough work to do. We need coal, iron, gold, provisions, and enough space to get our economy running.\n\nAdditionally, Halvar and Ole are out together to survey the situation here. Ole is mainly searching for suitable harbor locations, while Halvar wants to find out where the enemies are camped and how strong they are.\n\nAnsgar suggested some time ago that we construct a weapon in addition to sword and shield that could harm the enemy from a distance. We have already faced enemy structures capable of hurling stones over long distances, which have caused us significant trouble. It would be helpful if we could obtain more detailed plans for such devices.",
        msg3    = "Ymir spoke with Sigvaldi and advised him to try brewing with the captured hops from the Chinese camp instead of nettles. Ymir discovered that these hops also grow where winter barley thrives, and a hop beer can hardly taste worse than nettle beer. Sigvaldi is somewhat skeptical but willing to give it a shot.\n\nHalvar and Ole returned breathless during the night after forced marches to report. There are three large camps on the island-Babylonians, Chinese, and Romans. They support each other by trading, expanding rapidly, and being ready to attack us almost anywhere at any time. Even our headquarters is not safe from them since it cannot be defended from the north.\n\nWe must build fortresses around our camp as quickly as possible to ensure some level of protection if an enemy attacks. Our economy is running quite well, but there's rather too little than too much food for our miners.",
        msg4    = "Hooray, Sigvaldi has sent his first hop beer to the front, and it actually tastes good! However, you shouldn't drink more than five liters at a time, or else concentration and balance on the battlefield noticeably decline, and you'll see everything double!\n\nBut we need that concentration right now, as the enemy fronts are relentlessly closing in on us, and there are few options for retreat. So, we'll fight where we have the best chances of weakening the enemy and otherwise try to hold our line. Above all, we need land where Ymir can build and manage his farms.",
        msg5    = "Here, we are challenged to the last man, but we will not give up! We want and we will see our homeland, the green islands, again.\n\nOur strong soldiers strike with their swords in a way that is impressive, but the enemies are militarily so strong that we get a foretaste of what we might face on the remaining islands if we win here.",
        msg99   = "It was a battle, but the island is ours again. In the destroyed Roman headquarters, we found plans for war machines and grain processing operations, but unfortunately, we cannot do anything with them because we are missing someone who can implement them. Even Ansgar just shook his head when he studied one of these plans for stone-throwing machines more closely.\n\nNext, we will enter our first green island. It is the island of eternal snow because the mountains there are so high that the snow on the peaks never melts, as it is the northernmost of the green islands. It is the geographical center of our realm, and we have a high hidden resting place there, which we used to visit in the warmer seasons.\n\nBefore that, we will reunite with our King Knut and our families. They will also be brought to the green island because the air and temperatures there are much more bearable. How I look forward to seeing my father again. Should I tell him about the letter about Prainn that I found in the Chinese camp?"
    },
    cs =
    {
        title   = "Sigvaldi, sládek",
        name    = "Neznámý soupeř",
        diary   = "Deník",

        msg1    = "Halvar vybral toto skryté údolí jako výchozí bod. Na naší cestě sem jsme objevili spoustu čerstvých lidských stop, takže se nám skryté místo zdálo bezpečnější.\n\nCelý ostrov se zdá být protkaný zbytky táborových ohňů a čerstvě ulovené zvěře. Stopy, které jsme zde našli, jsou však natolik odlišné, že můžeme s jistotou usoudit, že tyto různé stopy zanechalo několik různých národů. Mimo jiné jsme objevili tři zcela odlišné typy hrotů šípů, které byly očividně používány při lovu zvěře.",
        msg2    = "Halvarův instinkt při výběru našich tábořišť byl doposud obdivuhodný; kolem nás je dostatek zlata, aby ražba mincí mohla dlouho běžet. Teď bychom se měli rychle rozšířit na jih, aby měl náš kovář Elvor, náš slévač železa Darvi a jejich dodavatelé dost práce. Potřebujeme uhlí, železo, zlato, zásoby a dostatek prostoru, abychom mohli rozjet naši ekonomiku.\n\nKromě toho jsou Halvar a Ole společně na cestách, aby si udělali obrázek o zdejší situaci. Ole hledá především vhodná přístavní místa, zatímco Halvar chce zjistit, kde nepřátelé táboří a jak jsou silní.\n\nAnsgar už před delší dobou navrhl vytvořit zbraň, která by kromě meče a štítu mohla nepřítele poškodit i na dálku. Už jsme čelili nepřátelským stavbám, které dokážou vrhat kameny na větší vzdálenosti a způsobily nám značné potíže. Bylo by užitečné, kdybychom mohli získat přesnější plány těchto zařízení.",
        msg3    = "Ymir promluvil se Sigvaldím a poradil mu, aby při vaření piva zkusil použít kořistní chmel z čínského tábora místo kopřiv. Ymir zjistil, že tento chmel roste tam, kde se daří zimnímu ječmenu, a chmelové pivo sotva může chutnat hůř než pivo z kopřiv. Sigvaldi je trochu skeptický, ale je ochoten to zkusit.\n\nHalvar a Ole se vrátili zadýchaní během noci po nucených pochodech, aby podali hlášení. Na ostrově jsou tři velké tábory-Babylóňané, Číňané a Římané. Navzájem se podporují obchodem, rychle se rozšiřují a jsou kdykoli a téměř kdekoli připraveni nás napadnout. Dokonce ani naše velitelství není před nimi v bezpečí, protože ho ze severu nelze bránit.\n\nMusíme co nejrychleji postavit pevnosti kolem našeho tábora, abychom měli alespoň nějakou ochranu, pokud by nepřítel zaútočil. Naše ekonomika už běží celkem dobře, ale pro naše horníky je spíše málo než hodně jídla.",
        msg4    = "Hurá, Sigvaldi poslal své první chmelové pivo na frontu a skutečně chutná! Nicméně by se nemělo pít více než pět litrů najednou, jinak koncentrace a pocit rovnováhy na bojišti znatelně klesnou a všechno uvidíte dvakrát!\n\nAle tuto koncentraci teď opravdu potřebujeme, protože nepřátelské fronty se neúprosně přibližují a je málo možností k ústupu. Takže budeme bojovat tam, kde máme nejlepší šance oslabit nepřítele, a jinak se pokusíme udržet naši frontu. Především potřebujeme půdu, kde Ymir může stavět a spravovat své farmy.",
        msg5    = "Zde jsme vyzváni až do posledního muže, ale nevzdáme se! Chceme a znovu uvidíme naši vlast, zelené ostrovy.\n\nNaši silní vojáci sekají mečem tak, že to stojí za to, ale nepřátelé jsou vojensky tak silní, že máme tušení, co nás může čekat na dalších ostrovech, pokud zde zvítězíme.",
        msg99   = "Byla to bitva, ale ostrov je opět náš. V zničené římské centrále jsme našli plány na válečné stroje a zpracovatelské provozy na obilí, ale bohužel s nimi nemůžeme nic dělat, protože nám chybí někdo, kdo je dokáže realizovat. I Ansgar jenom potřásl hlavou, když studoval jeden z těchto plánů na kamenné katapulty.\n\nJako příští vstoupíme na náš první zelený ostrov. Je to ostrov věčného sněhu, protože hory tam jsou tak vysoké, že sníh na vrcholcích nikdy netaje, jelikož je to nejsevernější z těch zelených ostrovů. Je to geografické centrum našeho království a máme tam vysoké, skryté místo k odpočinku, které jsme rádi navštěvovali v teplejších obdobích.\n\nNež tam ale vyrazíme, znovu se setkáme s naším králem Knutem a našimi rodinami. I oni budou převezeni na zelený ostrov, protože vzduch a teploty tam jsou mnohem snesitelnější. Jak se těším na setkání se svým otcem. Mám mu říct o dopise o Prainnovi, který jsem našel v čínském táboře?"
    },
})

-- format mission texts
function MissionText(e, silent)
    local msg = _("msg" .. tostring(e))

    if(msg ~= ("msg" .. tostring(e))) then
        if not silent then
            rttr:MissionStatement(0, _("diary"), msg .. "\n\n\n\n\n\n\n", IM_AVATAR6, true)
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
        rttr:GetPlayer(p):SetName(_("name"))
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

    if (eState[3] > 0 and milBuildingCount >= 5) then
        -- EVENT3
        MissionEvent(3, false)
    end

    if (eState[4] > 0 and milBuildingCount >= 10) then
        -- EVENT4
        MissionEvent(4, false)
    end
    
    if (eState[5] > 0 and milBuildingCount >= 15) then
        -- EVENT5
        MissionEvent(5, false)
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
        -- nothing

    elseif(e == 3 and not onLoad) then
        -- nothing

    elseif(e == 4) then
        -- nothing

    elseif(e == 5 and not onLoad) then
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

function addExtraBoards(plrId, amount)
    rttr:GetPlayer(plrId):AddWares({[GD_BOARDS] = amount})
end

function addExtraSoldiers(plrId, amount)
    rttr:GetPlayer(plrId):AddPeople({[JOB_PRIVATE] = amount})
end