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
    de =
    {
        title   = "Ansgar, der Kanzler",
        name    = "Unbekannter Gegner",
        diary   = "Tagebuch",

        msg1    = "Genau an der Stelle, wo jetzt unser neues Hauptquartier steht, stand früher unser Königsschloss. Es wurde, wie alle anderen Gebäude hier, dem Erdboden gleichgemacht. Unter der Führung von Ansgar und Knut und unter tatkräftiger Mithilfe von Aron, Teitur und Thorben hat unser Volk sogleich ein angemessenes Gebäude als Ersatz für unser zerstörtes Schloss errichtet. Hier regierte mein Vater und hier war und ist der Mittelpunkt unseres Reiches.\n\nHier wurde auch Gericht gehalten, als Prainn als König der Wikinger abgesetzt und aus unserem Volk verstoßen wurde. Da Prainn einen unschuldigen Menschen erschlagen hatte, durfte er nicht länger König und Mitbürger unseres Volkes sein.\n\nMein Vater und Ansgar erzählen mir diese Geschichte, als sei sie erst gestern passiert. Prainn hatte einen Gast aus Wut über seine Worte umgebracht, sein Name war Ahasversos. Der unschuldig Erschlagene wurde damals auf unserem kleinen Friedhof auf der Insel des ewigen Schnees unter großer Anteilnahme unseres Volkes beerdigt.",
        msg2    = "Prainn war vor etwa dreißig Jahren mit seinen etwa zweihundert Getreuen von uns verbannt worden. Zum Abschied sagte er zu Ansgar in stolzem Zorn, dass er ihn wiedersehen würde!\nDa erinnerte ich mich an den Brief vom Chinesenhauptquartier auf unserer grauen Schluchteninsel, wo Prainn zur Insel der Zusammenkunft gebeten wurde, und legte ihn meinem Vater und Ansgar vor. Daraufhin sahen sich mein Vater und Ansgar lange schweigend und betroffen an. Mein Vater sagte nach etwa einer Minute nur: 'Ach so hat er sich das Wiedersehen gedacht; mit Krieg und Vergeltung!'\n\nAnsgar und ich ließen meinen Vater in seiner Betroffenheit eine Zeit lang allein. In einem Gespräch unter vier Augen dankte Ansgar mir für mein bisheriges Verhalten in diesem Krieg und versprach mir, zu gelegener Zeit etwas über diesen Ahasversos zu erzählen. So, wie es in seinen Augen aussieht, ist Prainn der Hauptverantwortliche für diesen Krieg, und es müsse jetzt darum gehen, ihn auf meiner Heimat, der Insel der Zusammenkunft, in unsere Gewalt zu bekommen.  Zuerst aber sollten wir meinem Vater und unserem König beistehen in seiner Betroffenheit, und unsere Schlossinsel von allen Feinden räumen.",
        msg3    = "Nicht wenige Schiffe sind von unserem Hauptquartier aus zu sehen. Diese Insel muss also von mehreren Feinden belagert sein, und deren Wirtschaften scheinen allesamt gut zu funktionieren. Von vielen Leuten auf den vorbeifahrenden Schiffen kann man erstaunte und erschrockene Gesichter sehen, als sie unser neues Hauptquartier an seinem ursprünglichen Platz wieder aufgebaut entdeckt haben. Das bedeutet, dass sie uns mittlerweile als Gegner fürchten gelernt haben.\n\nMein Vater ist immer noch bedrückt über Prainn, und was er alles unternommen hat, um sich an uns zu rächen. Da er in dem Brief aus dem Chinesenhauptquartier gebeten wurde, die Sachen gegen uns neu zu ordnen, scheint er eine herausragende Rolle in dem Vernichtungsfeldzug gegen uns zu spielen.\n\nAber wie hat er es geschafft, ganze Völker gegen uns Wikinger aufzuwiegeln? Fragen über Fragen! Prainn wird sie uns beantworten müssen, wenn wir ihn auf meiner Heimatinsel zu fassen kriegen!",
        msg4    = "Ringsherum um uns sind Feinde, allerdings werden die meisten davon durch das tiefe Wasser um uns herum abgehalten, uns sofort an den Kragen zu gehen. Wir werden sie allesamt auf dem Landweg oder zu Wasser irgendwann erreichen, und dann wollen wir ihnen beweisen, wer hier der Stärkere ist.\n\nEin babylonisches Lager hat Halvor im Osten ausgespäht. Es scheint militärisch so stark zu sein, dass wir es wahrscheinlich nicht einfach überrennen können. Wir warten, bis wir stark genug sind, und schauen dann nach einem schwächeren Punkt in der Abwehr des  Feindes, den wir dann angreifen werden.",
        msg5    = "Bjarki, unser Münzpräger, macht wieder einmal einen fantastischen Job, unsere Soldaten sind aufgrund seiner guten Arbeit reichlich mit Sold versehen und sprühen deswegen vor Kampfeslust. Und auch Elvor und Darvi treiben sich gegenseitig zu Höchstleistungen an. Elvor haut nunmehr etwas vorsichtiger auf seinen neuen Amboss, dennoch fliegen die Funken nur so, und Darvi liefert zuverlässig Roheisen in rauen Mengen. Elvor und Darvy erinnern mich aufgrund ihrer Statur und ihres Auftretens ein wenig an die zwei Gallier, die in der römischen Provinz Aremorica zusammen mit den restlichen Dorfbewohnern den Römern das Leben richtig schwer machen, und von denen man schon viele erheiternde Geschichten gehört hat.\n\nDas erste feindliche Hauptquartier auf dieser Insel wurde zerstört und die Bedrohung für unsere Familien, die wir im neuen Stammschloss zurückgelassen haben, ist etwas geringer geworden. Jetzt werden wir schauen, wie wir den anderen feindlichen Lagern auf dieser Insel beikommen können.",
        msg6    = "Von diesem Flecken Land kann man gleichzeitig im Norden unser neues Königsschloss und im äußersten Südwesten die Insel der Zusammenkunft erkennen. Wenn wir diese Insel von Feinden geräumt haben, wird sie unser letztes Ziel in diesem Feldzug sein. Aber zuerst müssen wir noch einige gegnerische Stützpunkte und etliche Hafengebäude hier erobern.\n\nDa sich die Schlossinsel sich wie eine gigantische Spirale um unser Königsschloss herumwindet, sind die Wege weit und der Transport von Nachschub und Bodenschätzen mühsam und aufwendig. Gut, dass wir Jon und seine Esel haben, die leisten uns hier gute Dienste.",
        msg99   = "Auch diese Insel ist zurückerobert und wir Wikinger haben unser Königsschloss wieder. Unser geliebter und allseits geschätzter Ansgar wurde einstimmig als neuer Schlossherr und Kanzler von unserem Volk gewählt und in einer feierlichen Zeremonie sogleich in sein Amt eingesetzt. Da wir aber seinen Rat in unseren Schlachten schätzen gelernt haben, geht es jetzt gemeinsam mit Knut und ihm und dem gesamten Kriegsvolk zur letzten Insel, nämlich meiner Heimat.\n\nSie scheint das Zentrum zu sein, wo alles zu unserer Vernichtung geplant und in die Wege geleitet wurde. Hier wurden die Kriege gegen uns organisiert und hier werden wir Prainn antreffen und Antworten auf unsere Fragen bekommen. Ich bin schon ganz aufgeregt, meine geliebte Heimat wieder zu sehen."
    },
    en =
    {
        title   = "Ansgar, the Chancellor",
        name    = "Enemy Unknown",
        diary   = "Diary",

        msg1    = "Exactly at the spot where our new headquarters stands now, there used to be our royal castle. It was, like all the other buildings here, leveled to the ground. Under the leadership of Ansgar and Knut, and with the active help of Aron, Teitur, and Thorben, our people immediately built a proper building as a replacement for our destroyed castle. This was where my father ruled, and it remains the center of our kingdom.\n\nIt was also here that the trial took place when Prainn was deposed as king of the Vikings and cast out of our people. Since Prainn had killed an innocent man, he could no longer be king or a citizen of our people.\n\nMy father and Ansgar tell me this story as if it happened just yesterday. In a fit of rage, Prainn killed a guest over his words, a man named Ahasversos. The innocent man who was killed was buried on our small cemetery on the Island of Eternal Snow, with great sympathy from our people.",
        msg2    = "Prainn had been banished from our people about thirty years ago, along with his two hundred followers. As a farewell, he said to Ansgar in proud anger that they would meet again! That reminded me of the letter from the Chinese headquarters on our Gray Gorge Island, where Prainn had been invited to the Island of the Gathering, and I showed it to my father and Ansgar. After reading it, my father and Ansgar stared at each other in silence, deeply affected. After about a minute, my father simply said, 'So this is how he imagined the reunion; with war and vengeance!'\n\nAnsgar and I left my father alone in his dismay for a while. In a private conversation, Ansgar thanked me for my conduct in this war so far and promised to tell me something about Ahasversos in due time. From his perspective, Prainn is the main one responsible for this war, and now it was essential to take control of him on my homeland, the Island of the Gathering. But first, we should support my father, our king, in his distress and clear our Castle Island of all enemies.",
        msg3    = "Not a few ships are visible from our headquarters. This island must be besieged by several enemies, and their economies seem to be functioning well. Many people on the passing ships show astonished and frightened faces when they discover that our new headquarters has been rebuilt at its original location. This means that they have now come to fear us as adversaries.\n\nMy father is still troubled by Prainn and all that he has done to take revenge on us. Since he was asked in the letter from the Chinese headquarters to reorganize the efforts against us, it seems he plays a prominent role in the annihilation campaign against us.\n\nBut how did he manage to incite entire peoples against us Vikings? Questions upon questions! Prainn will have to answer them when we capture him on my homeland island!",
        msg4    = "Enemies are all around us, but most of them are held back by the deep waters surrounding us, preventing them from immediately going for our throats. We will eventually reach them, either by land or by sea, and then we will show them who the stronger one is.\n\nHalvor has spotted a Babylonian camp to the east. It seems to be so militarily strong that we probably won't be able to simply overrun it. We will wait until we are strong enough, and then look for a weak point in the enemy's defenses, which we will then attack.",
        msg5    = "Bjarki, our coin maker, is once again doing a fantastic job. Our soldiers are richly paid thanks to his good work, and this has made them eager for battle. Elvor and Darvi are also pushing each other to achieve the highest performance. Elvor now strikes more cautiously on his new anvil, but sparks still fly, and Darvi reliably delivers raw iron in large quantities. Elvor and Darvi remind me a bit of the two Gauls in the Roman province of Aremorica, who, together with the rest of the villagers, make life really difficult for the Romans, and about whom many amusing stories have been told.\n\nThe first enemy headquarters on this island has been destroyed, and the threat to our families, whom we left behind in the new clan castle, has diminished a little. Now we will see how we can deal with the other enemy camps on this island.",  
        msg6    = "From this patch of land, one can see both our new royal castle to the north and, in the far southwest, the Island of the Gathering. Once we have cleared this island of enemies, it will be our final objective in this campaign. But first, we still need to capture several enemy strongholds and numerous harbor buildings here.\n\nSince the castle island spirals around our royal castle like a gigantic coil, the paths are long, and the transport of supplies and resources is laborious and time-consuming. It's a good thing we have Jon and his donkeys, who are proving very useful to us here.",
        msg99   = "This island has also been recaptured, and we Vikings have our royal castle back. Our beloved and highly respected Ansgar was unanimously elected as the new castle lord and chancellor by our people, and he was immediately installed in his office during a ceremonial event. However, since we have come to value his counsel in our battles, we now head together with Knut, him, and the entire war force to the last island, namely my homeland.\n\nIt seems to be the center where everything for our destruction was planned and set into motion. Here, the wars against us were organized, and here we will encounter Prainn and get answers to our questions. I am already excited to see my beloved homeland again."
    },
    cs =
    {
        title   = "Ansgar, kancléř",
        name    = "Neznámý soupeř",
        diary   = "Deník",

        msg1    = "Přesně na místě, kde nyní stojí naše nové hlavní sídlo, stával náš královský hrad. Byl, stejně jako všechna ostatní budova zde, srovnán se zemí. Pod vedením Ansgara a Knuta a s aktivní pomocí Arona, Teitura a Thorben naše národ okamžitě postavil náležitou budovu jako náhradu za náš zničený hrad. Zde můj otec vládnul a je to i dnes střed našeho království.\n\nTaké zde se konalo soudní řízení, když byl Prainn sesazen z funkce krále Vikingů a vyloučen z našeho národa. Protože Prainn zabil nevinného člověka, nemohl být už králem ani občanem našeho národa.\n\nMůj otec a Ansgar mi tuto historii vyprávějí, jako by se stala teprve včera. V záchvatu hněvu Prainn zabil hosta kvůli jeho slovům, jeho jméno bylo Ahasversos. Nevinný člověk, který byl zabit, byl pochován na našem malém hřbitově na Ostrově věčného sněhu za velkého soucitu našeho národa.",
        msg2    = "Prainn byl před asi třiceti lety vyhnán z našeho národa se svými asi dvěma sty věrnými. Při rozloučení řekl Ansgarovi ve vzteku, že se znovu setkají! To mi připomnělo dopis z čínské centrály na naší šedé útesové ostrově, kde byl Prainn pozván na Ostrov shromáždění, a ukázal jsem ho mému otci a Ansgarovi. Po přečtení si můj otec a Ansgar dlouho v tichosti a zasaženi hleděli do očí. Asi po minutě můj otec jen řekl: 'Tak tohle si představoval to setkání; válkou a pomstou!'\n\nAnsgar a já jsme nechali mého otce na chvíli samotného v jeho zasažení. V soukromém rozhovoru mi Ansgar poděkoval za mé dosavadní chování v této válce a slíbil, že mi v pravý čas poví něco o Ahasversosovi. Podle jeho názoru je Prainn hlavní zodpovědný za tuto válku a teď je nutné ho dostat na mém rodném ostrově, Ostrově shromáždění, zpět pod naši kontrolu. Nejdříve bychom ale měli podpořit našeho otce, našeho krále, v jeho zasažení a vyčistit náš hradní ostrov od všech nepřátel.",
        msg3    = "Z našeho hlavního velitelství je vidět nemálo lodí. Tento ostrov musí být tedy obléhán několika nepřáteli a jejich hospodářství se zdá být dobře fungující. Na mnoha lidech na projíždějících lodích je vidět udivené a vystrašené tváře, když objeví, že naše nové hlavní velitelství bylo znovu postaveno na původním místě. To znamená, že nás nyní začali považovat za protivníky, které se naučili respektovat.\n\nMůj otec je stále zarmoucený Prainnem a tím, co všechno udělal, aby se nám pomstil. Protože byl v dopise z čínské centrály požádán, aby znovu uspořádal věci proti nám, zdá se, že hraje zásadní roli v genocidní kampani proti nám.\n\nAle jak se mu podařilo popudit celé národy proti nám Vikingům? Otázky na otázky! Prainn nám je bude muset odpovědět, až ho dostaneme na mém rodném ostrově!",
        msg4    = "Okolo nás jsou nepřátelé, ale většina z nich je odražena hlubokými vodami kolem nás, což jim zabraňuje okamžitě nám jít po krku. Nakonec je dostihneme, buď po zemi, nebo po moři, a pak jim ukážeme, kdo je silnější.\n\nHalvor na východě zahlédl babylonský tábor. Zdá se, že je vojensky tak silný, že ho pravděpodobně nebudeme moci snadno přepadnout. Počkáme, až budeme dost silní, a pak se podíváme na slabé místo v obraně nepřítele, které pak napadneme.",
        msg5    = "Bjarki, náš mincovní mistr, opět odvádí fantastickou práci. Naši vojáci jsou díky jeho dobré práci bohatě odměněni a to je činí plnými bojové chuti. Elvor a Darvi se navzájem motivují k maximálním výkonům. Elvor teď bije opatrněji na svůj nový kovadlina, ale jiskry létají pořád, a Darvi spolehlivě dodává surové železo ve velkém množství. Elvor a Darvi mi trochu připomínají dva Galové v římské provincii Aremorika, kteří spolu s ostatními vesničany pořádně znepříjemňují život Římanům a o kterých už bylo vyprávěno mnoho zábavných příběhů.\n\nPrvní nepřátelské hlavní stanoviště na tomto ostrově bylo zničeno a hrozba pro naše rodiny, které jsme nechali v novém rodovém zámku, se trochu snížila. Teď uvidíme, jak si poradíme s ostatními nepřátelskými tábory na tomto ostrově.",
        msg6    = "Z tohoto kousku země je vidět jak náš nový královský zámek na severu, tak na dalekém jihozápadě Ostrov Setkání. Jakmile tento ostrov vyčistíme od nepřátel, bude to náš poslední cíl v této kampani. Ale nejprve musíme ještě dobýt několik nepřátelských základen a spoustu přístavních budov zde.\n\nJelikož ostrov zámku se vinul jako obrovská spirála kolem našeho královského zámku, cesty jsou dlouhé a přeprava zásob a surovin je namáhavá a časově náročná. Ještě štěstí, že máme Jona a jeho osly, kteří nám zde dobře slouží.",
        msg99   = "Tento ostrov byl také znovu dobyt a my Vikingové máme zpět náš královský hrad. Náš milovaný a všemi vážený Ansgar byl jednomyslně zvolen novým pánem hradu a kancléřem naším lidem a byl ihned uveden do svého úřadu při slavnostní ceremonii. Jelikož jsme si však jeho rady v našich bitvách velmi oblíbili, teď se společně s Knutem, jím a celým válečným lidem vydáme na poslední ostrov, totiž na mou vlast.\n\nZdá se, že je to centrum, kde bylo všechno plánováno a uvedeno do chodu k naší zkáze. Zde byly organizovány války proti nám a zde se setkáme s Prainnem a dostaneme odpovědi na naše otázky. Už se nemůžu dočkat, až znovu uvidím svou milovanou vlast."
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
    rttr:GetPlayer(3):SetNation(NAT_AFRICANS)
    rttr:GetPlayer(4):SetNation(NAT_ROMANS)
    rttr:GetPlayer(5):SetNation(NAT_BABYLONIANS)

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
        addExtraSoldiers(1, 10)
        addExtraBoards(2, 50)
        addExtraSoldiers(3, 10)
        addExtraSoldiers(4, 20)
        addExtraBoards(5, 100)
        addExtraSoldiers(6, 10)
        addExtraBoards(6, 50)
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
    if(p ~= 0 and not onLoad) then
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
    elseif (p == 0 and not onLoad) then
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

function addExtraBoards(plrId, amount)
    rttr:GetPlayer(plrId):AddWares({[GD_BOARDS] = amount})
end

function addExtraSoldiers(plrId, amount)
    rttr:GetPlayer(plrId):AddPeople({[JOB_PRIVATE] = amount})
end