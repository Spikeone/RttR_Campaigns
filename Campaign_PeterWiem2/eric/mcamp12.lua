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
        title   = "Jon, der Eselzüchter",
        name    = "Unbekannter Gegner",
        diary   = "Tagebuch",

        msg1    = "Die sandige Insel, die Heimat unseres Försters Mikkel, haben wir stets als Rohstofflieferant für die anderen Inseln genützt. Vor allem natürlich Sand, aber auch Kies und Steine haben wir für unsere Wege und Bauten von hier mit dem Schiff geholt. Ein paar dieser Baugruben sind seit langem abgesoffen, andere waren bis zur feindlichen Invasion im Betrieb. Ein gut schiffbarer Kanal und viele geeignete Hafenplätze haben uns den Sandabbau leicht gemacht. Allerdings werden sie auch das Besiedeln leicht gemacht haben, deshalb ist hier recht sicher mit Feinden zu rechnen.\n\nAnsgar hat auf Empfehlung meines Vaters Knut einen pfiffigen Burschen von der Insel des ewigen Schnees mitgenommen. Jon ist noch zu jung zum Militärdienst, aber seine Familie hat vor etwa drei Jahren mit der Eselszucht angefangen, um den Lastentransport zu vereinfachen. Das kann uns nur nützen. Die Esel aus seiner Zucht sind eher klein, aber zäh und lange nicht so störrisch wie so viele ihrer Artgenossen. Außerdem sind sie ungewöhnlich geschickt beim auf- und abladen ihrer Lasten.",
        msg2    = "So eine grüne Insel ist eine wahre Wohltat für das Auge und für die Nase. Hier riecht nichts, höchstens ein klein wenig die abgesoffenen Sandgruben. Und der Kanal ist wie geschaffen, darin zu Segeln. Also: rasch einen Hafen gesucht, damit Ole seine Schiffsbaukunst unter Beweis stellen kann.\n\nViele Bodenschätze hat es hier nicht, aber es sollte reichen, um Schmied und Eisengießerei gut zu beschäftigen. Und Gold hat es hier sicherlich auch, wie eigentlich so gut wie auf jeder unserer Inseln.",
        msg3    = "Irgendetwas scheint auf dieser Insel anders zu sein als auf allen anderen vorhergehenden Inseln. Ab und zu weht der Wind den Geruch von feindlichen Lagerfeuern in unsere Nasen. Es müssen also Feinde auf dieser Insel sein. Aber diese Lagerfeuer riechen anders wie alle anderen bisher in unserem Feldzug. Sie stinken geradezu bestialisch, als ob Pferdemist oder Eselsmist verbrannt wird.\n\nDas habe ich bisher nur bei den Nubiern erlebt, als sie von meinem Vater Knut und Ansgar zu uns Wikingern eingeladen wurden und mit dem Schiff hergefahren sind, um neue Abnehmer für ihre Handelswaren zu suchen. Da haben wir dunkelhäutige Menschen getroffen mit Kraushaar und wulstigen Lippen, die während ihres Besuchs bei uns teilweise jämmerlich froren. Ihre Lagerfeuer qualmen und stinken unerträglich, weil sie vorwiegend den Mist ihrer Tiere verbrennen.\n\nDamals war ich noch ein kleiner Knabe und Ansgar hat mir beim Besuch der Nubier erklärt, dass es auch Menschen mit gelber und roter Haut geben würde. Damals fand ich das faszinierend und unerklärlich zugleich!",
        msg4    = "Inzwischen wissen wir um mindestens vier feindlichen Völkern auf dieser Insel, zwei Nubierlager und zwei babylonische Stellungen. Sie sind militärisch und wirtschaftlich gut aufgestellt, aber wir kennen unsere Insel viel besser als sie.\n\nIch hatte ein Gespräch unter vier Augen mit Ansgar, wo ich ihn habe, ob er mit dem Namen Prainn etwas anfangen könnte. Ansgar erschrak, fasste sich aber schnell und erzählte mir, dass Prainn bis vor etwa dreißig Jahren unser König war, sich aber einem Verbrechen hat zuschulden kommen lassen, und er deshalb abgesetzt wurde und das Land verlassen musste. Ein großer Teil seiner Untertanen sei damals mit ihm weggezogen.\n\nDanach wurde mein Vater Knut zum König der Wikinger gewählt und, so fügte er schmunzelnd hinzu, unser Volk verlor damals ihren besten Bäcker, bekam aber einen guten König dafür. Er wollte wissen, wie ich zu diesem Namen gekommen sei, und ich antwortete vorsichtig, ich hätte in einem Brief davon gelesen. Er fragte nicht weiter nach, und auch ich hatte danach keinen Mut, ihm weitere Fragen zu stellen.",
        msg5    = "In dem zerstörten Hauptquartier fanden wir detaillierte Angriffspläne der Nubier gegen uns und die Kopie eines Vertrags, der im Auftrag der Babylonier geschlossen wurde, und der die Babylonier, Römer, Chinesen, Nubier und noch ein fünftes Volk, dessen Namen unleserlich war, auf einem gemeinsamen und umfassenden Feldzug gegen uns verpflichtet.\n\nAuch einen wiederholten Steckbrief des Ahasversos, der von den Babyloniern zur Suche bei uns Wikingern ausgeschrieben worden war, und etwas Werkzeug fanden wir in dem zerstörten Hafengebäude.\n\nAnsgar wurde auffallend blass im Gesicht, als er diese Dokumente studierte. Jetzt bin ich mir sicher, dass Ansgar viel mehr über diesen ganzen Kriegsfeldzug gegen uns Wikinger weiß als wir anderen, und dass er mir bewusst etwas verheimlicht, was ich anscheinend nicht erfahren darf. Ich werde mit meinem Vater Knut, unserem Wikingerkönig darüber sprechen, sobald sich die Gelegenheit dazu ergibt.",
        msg6    = "Wir haben unseren neuen Friedhof erreicht, der nach der Aufgabe des alten Friedhofs hier neu errichtet worden ist. Leider erinnern uns nur noch schemenhafte Überreste an diese letzte Ruhestätte. Alle Grabsteine sind geschleift worden und alle Würde, die dieser Ort einstmals hatte, wurde mutwillig zerstört.\n\nIch habe Aron, unseren Baumeister und Teitur, unseren Zimmermann gebeten, die Würde dieses Ortes wieder herzustellen. Unsere älteren Soldaten sollten noch wissen, wo ihre verstorbenen Verwandten begraben worden sind. Da wären einfache Gedenksteine und Grabeinfassungen ein Anfang, um diese verwahrloste Fläche wieder in einen Friedhof zu verwandeln.\n\nFür diese Arbeit und auch für den Warentransport auf den mittlerweile langen Wegen brauchen wir die Esel aus Jons Zucht. Ich habe ihn gebeten, uns so schnell wie möglich zusätzliche Esel bereitzustellen.",
        msg99   = "Die letzte Schlacht ist auf dieser Insel geschlagen - wir haben gesiegt und die Sandinsel, wie wir sie immer genannt haben, und auch unser neuer Friedhof darin sind wieder vollständig in unserem Besitz. Das macht es uns auch mit dem zukünftigen Gebäudebau einfacher, weil wir jetzt genügend Rohstoffe beieinander haben, um auch größere Bauwerke sicher bauen zu können. Der Sand hilft uns vor allem, den Untergrund eben und tragfähig zu bekommen. Das hat vor allem den Katapultbau bisher so mühsam gemacht.\n\nWir werden gemeinsam zu der Insel des ewigen Schnees zurückkehren, um uns dort etwas zu erholen, danach stehen zuerst die letzte und größte graue Insel, danach unsere Schlossinsel und zuletzt meine Heimatinsel auf unserer Rückeroberungsliste. Wir rechnen besonders auf den zwei grünen Inseln mit größerem Widerstand, da diese Inseln leichter und besser zu besiedeln sind als die weißen und grauen Inseln.\n\nIch freue mich sehr auf die Gemeinschaft mit meinem Vater Knut. Ich habe überdies einige ungelöste Fragen an ihn, was diesen Krieg angeht, und erhoffe von ihm Antworten, besonders über das teilweise rätselhafte Verhalten von Ansgar. Was weiß Ansgar, was ich nicht wissen darf?"
    },
    en =
    {
        title   = "Jon, the donkey breeder",
        name    = "Enemy Unknown",
        diary   = "Diary",

        msg1    = "The sandy island, home to our forester Mikkel, has always been used by us as a source of raw materials for the other islands. Primarily sand, but also gravel and stones have been transported here by ship for our roads and constructions. Some of these quarries have long since flooded, while others were in operation until the enemy invasion. A navigable canal and many suitable harbor sites have made sand mining easy for us. However, they will also have made settling easier, so it is quite likely we will encounter enemies here.\n\nOn the recommendation of my father Knut, Ansgar took a clever young man from the Island of Eternal Snow with him. Jon is still too young for military service, but his family started breeding donkeys about three years ago to simplify cargo transport. This can only benefit us. The donkeys from his breeding are rather small but tough and not nearly as stubborn as many of their kind. Moreover, they are unusually skilled at loading and unloading their cargo.",
        msg2    = "Such a green island is a true delight for the eyes and the nose. There's no smell here, maybe just a little from the flooded sand pits. And the canal is perfect for sailing. So, we quickly searched for a harbor so Ole can showcase his shipbuilding skills.\n\nThere aren't many raw materials here, but it should be enough to keep the blacksmith and iron foundry busy. And there is certainly gold here too, just like almost every other one of our islands.",
        msg3    = "Something seems different on this island compared to all the others we've encountered before. Occasionally, the wind blows the smell of enemy campfires into our noses. So, there must be enemies on this island. But these campfires smell different from all the others we've encountered in our campaign. They smell downright disgusting, as if horse manure or donkey manure is being burned.\n\nI've only experienced this with the Nubians when they were invited by my father Knut and Ansgar to join us Vikings. They traveled here by ship to find new buyers for their trade goods. We met dark-skinned people with curly hair and thick lips, who froze terribly during their visit. Their campfires smoke and stink unbearably because they mostly burn the manure of their animals.\n\nAt that time, I was just a little boy, and Ansgar explained to me during the visit of the Nubians that there were also people with yellow and red skin. At the time, I found it both fascinating and inexplicable!",
        msg4    = "By now, we are aware of at least four enemy tribes on this island: two Nubian camps and two Babylonian positions. They are well-organized militarily and economically, but we know our island much better than they do.\n\nI had a private conversation with Ansgar, asking him if he could make anything of the name Prainn. Ansgar was startled, but quickly composed himself and told me that Prainn had been our king until about thirty years ago. However, he had committed a crime and was therefore deposed and had to leave the country. A large part of his subjects had left with him at that time.\n\nAfter that, my father Knut was elected king of the Vikings, and, as he added with a smile, our people lost their best baker, but gained a good king in return. He wanted to know how I had come across this name, and I cautiously answered that I had read about it in a letter. He didn't ask any further questions, and I didn't have the courage to ask him any more after that.",
        msg5    = "In the destroyed headquarters, we found detailed attack plans from the Nubians against us, as well as a copy of a contract, which had been made on behalf of the Babylonians. This contract committed the Babylonians, Romans, Chinese, Nubians, and a fifth people, whose name was illegible, to a joint and extensive campaign against us.\n\nWe also found a repeated wanted poster for Ahasversos, who had been sought by the Babylonians among us Vikings, along with some tools in the destroyed harbor building.\n\nAnsgar turned noticeably pale as he studied these documents. Now, I am sure that Ansgar knows much more about this entire campaign against us Vikings than the rest of us, and that he is deliberately hiding something from me that I apparently am not allowed to know. I will talk to my father Knut, our Viking king, about this as soon as the opportunity arises.",
        msg6    = "We have reached our new cemetery, which has been established here after the abandonment of the old one. Unfortunately, only vague remnants remain to remind us of this final resting place. All the tombstones have been ground down, and all the dignity this place once had has been willfully destroyed.\n\nI have asked Aron, our master builder, and Teitur, our carpenter, to restore the dignity of this place. Our older soldiers should still know where their deceased relatives are buried. Simple memorial stones and grave enclosures would be a good start to turn this neglected area back into a cemetery.\n\nFor this work, and also for the transport of goods on the now long paths, we need the donkeys from Jon's breeding. I have asked him to provide us with additional donkeys as soon as possible.",
        msg99   = "The final battle has been fought on this island - we have won, and the Sand Island, as we always called it, as well as our new cemetery, are once again fully under our control. This also makes future building projects easier for us, as we now have enough raw materials to safely construct larger buildings. The sand helps us, above all, to create a stable and solid foundation. This is what has made the construction of catapults so laborious until now.\n\nWe will return together to the Island of Eternal Snow to rest for a while, and then the last and largest gray island will be our first target, followed by our castle island, and finally my homeland island on our list of reconquests. We expect greater resistance, especially on the two green islands, as these islands are easier and better for settlement than the white and gray islands.\n\nI am looking forward to being with my father Knut. I also have some unresolved questions for him regarding this war, and I hope for answers from him, especially about Ansgar's somewhat mysterious behavior. What does Ansgar know that I am not allowed to know?"
    },
    cs =
    {
        title   = "Jon, chovatel oslíků",
        name    = "Neznámý soupeř",
        diary   = "Deník",

        msg1    = "Písečný ostrov, domov našeho lesníka Mikkela, jsme vždy využívali jako dodavatele surovin pro ostatní ostrovy. Především písek, ale také štěrk a kameny jsme odtud lodí vozili na naše cesty a stavby. Některé z těchto těžebních jam jsou už dlouho zaplavené, jiné byly v provozu až do nepřátelské invaze. Dobře plavební kanál a mnoho vhodných přístavů nám usnadnily těžbu písku. Nicméně, to také usnadnilo osidlování, takže je docela pravděpodobné, že zde budeme čelit nepřátelům.\n\nNa doporučení mého otce Knuta vzal Ansgar s sebou šikovného mladíka z Ostrova věčného sněhu. Jon je ještě příliš mladý na vojenskou službu, ale jeho rodina začala před asi třemi lety chovat osly, aby zjednodušila přepravu nákladů. To nám může jenom prospět. Osli z jeho chovu jsou spíše malí, ale vytrvalí a rozhodně nejsou tak tvrdohlaví jako mnozí jejich soukmenovci. Navíc jsou neobvykle zruční při nakládání a vykládání svého nákladu.",
        msg2    = "Takový zelený ostrov je skutečnou radostí pro oči i nos. Tady nic nezapáchá, maximálně trochu zaplavené pískovny. A kanál je jako stvořený pro plachtění. Takže jsme rychle hledali přístav, aby Ole mohl předvést své loděnice.\n\nNení tu mnoho surovin, ale mělo by to stačit k tomu, aby se kovář a slévárna železa měli co zaměstnat. A určitě je tu i zlato, jako vlastně na téměř každém z našich ostrovů.",
        msg3    = "Něco na tomto ostrově se zdá jiného než na všech ostatních předchozích ostrovech. Občas vítr zanese do našich nosů pach nepřátelských táborových ohňů. Musí tu tedy být nepřátelé. Ale tyto ohně voní jinak než všechny ostatní, se kterými jsme se setkali během našeho tažení. Páchají přímo odporně, jako by se spaloval koňský nebo oslí hnůj.\n\nTohle jsem zažil pouze u Nubijců, když je můj otec Knut a Ansgar pozvali k nám Vikingům. Přijeli sem lodí, aby našli nové odběratele pro své obchodní zboží. Potkali jsme tmavé lidi s kudrnatými vlasy a silnými rty, kteří během své návštěvy u nás strašně mrzli. Jejich táborové ohně kouří a páchají nesnesitelně, protože většinou spalují hnůj svých zvířat.\n\nTehdy jsem byl ještě malý chlapec a Ansgar mi během návštěvy Nubijců vysvětlil, že existují i lidé se žlutou a červenou pletí. Tehdy mi to přišlo fascinující a zároveň nepochopitelné!",
        msg4    = "Mezitím víme o nejméně čtyřech nepřátelských národech na tomto ostrově, dvou nubijských táborech a dvou babylonských pozicích. Jsou vojensky i ekonomicky dobře připraveni, ale my svou ostrov mnohem lépe než oni.\n\nMěl jsem soukromý rozhovor s Ansgarem, kde jsem se ho zeptal, zda by mohl něco vědět o jménu Prainn. Ansgar se lek, ale rychle se vzpamatoval a řekl mi, že Prainn byl naším králem až do před asi třiceti lety. Nicméně spáchal zločin a byl proto sesazen a musel opustit zemi. Velká část jeho poddaných tehdy odešla s ním.\n\nPoté byl mým otcem Knutem zvolen králem Vikingů, a jak dodal s úsměvem, náš lid tehdy ztratil svého nejlepšího pekaře, ale získal dobrého krále. Chtěl vědět, jak jsem se o tomto jménu dozvěděl, a já jsem opatrně odpověděl, že jsem o něm četl v dopise. Už se dál neptal, a ani já neměl odvahu mu klást další otázky.",
        msg5    = "V zničeném hlavním štábu jsme našli podrobné plány útoků Nubijců proti nám a kopii smlouvy, která byla uzavřena jménem Babylonianů. Tato smlouva zavazovala Babyloniany, Římany, Číňany, Nubijce a ještě jeden pátý národ, jehož název byl nečitelný, k společnému a rozsáhlému tažení proti nám.\n\nTaké jsme našli opakovanou pátrací zprávu o Ahasversosovi, který byl Babyloniany hledán mezi námi Vikingy, spolu s nějakými nástroji v zničené přístavní budově.\n\nAnsgar zbledl, když studoval tyto dokumenty. Teď jsem si jistý, že Ansgar ví mnohem více o celé této válce proti nám Vikingům než my ostatní, a že mi úmyslně něco tají, co očividně nemám vědět. O tomto promluvím s mým otcem Knutem, naším vikingským králem, jakmile se naskytne příležitost.",
        msg6    = "Dosáhli jsme našeho nového hřbitova, který byl zde zřízen po opuštění starého hřbitova. Bohužel nás jen nejasné zbytky připomínají toto poslední místo odpočinku. Všechny náhrobky byly obroušeny a veškerá důstojnost, kterou tento místo kdysi mělo, byla úmyslně zničena.\n\nPožádal jsem Arona, našeho stavitele, a Teitura, našeho tesaře, aby obnovili důstojnost tohoto místa. Naši starší vojáci by ještě měli vědět, kde jsou pochováni jejich zesnulí příbuzní. Jednoduché pamětní kameny a hrobové ohrady by byly dobrým začátkem k tomu, abychom tuto zanedbanou plochu přeměnili zpět na hřbitov.\n\nPro tuto práci a také pro přepravu zboží po nyní dlouhých cestách potřebujeme osly z Jonovy chovné stanice. Požádal jsem ho, aby nám co nejdříve poskytl další osly.",
        msg99   = "Poslední bitva byla vedena na tomto ostrově - zvítězili jsme a Písečný ostrov, jak jsme mu vždy říkali, stejně jako náš nový hřbitov, jsou opět zcela pod naším kontrolou. To nám také usnadňuje budoucí stavby, protože nyní máme dostatek surovin na bezpečnou výstavbu větších staveb. Písek nám především pomáhá zajistit rovný a nosný podklad. To byla hlavní příčina, proč bylo dosud tak náročné stavět katapulty.\n\nSpolečně se vrátíme na Ostrov věčného sněhu, abychom si tam trochu odpočinuli, a poté bude naší první cílovou destinací poslední a největší šedý ostrov, následovaný naším hradním ostrovem a nakonec mým domovským ostrovem na seznamu našich zpětných dobyvatelských cílů. Očekáváme větší odpor, zejména na těch dvou zelených ostrovech, protože tyto ostrovy jsou snadnější a lepší pro osídlení než bílé a šedé ostrovy.\n\nVelmi se těším na společnost svého otce Knuta. Mám také několik nevyřešených otázek ohledně této války a doufám, že mi na ně odpoví, zejména ohledně Ansgarova poněkud tajemného chování. Co ví Ansgar, co bych neměl vědět?"
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
    rttr:GetPlayer(1):SetNation(NAT_AFRICANS)
    rttr:GetPlayer(2):SetNation(NAT_AFRICANS)
    rttr:GetPlayer(3):SetNation(NAT_BABYLONIANS)
    rttr:GetPlayer(4):SetNation(NAT_BABYLONIANS)

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
        addExtraSoldiers(2, 10)
        addExtraBoards(3, 50)
        addExtraBoards(4, 100)
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
        rttr:GetWorld():AddStaticObject(76, 55, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(32, 40, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(24, 94, 0, 0, 1)
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
        rttr:GetPlayer(p):DisableBuilding(BLD_METALWORKS)
        rttr:GetPlayer(p):DisableBuilding(BLD_DONKEYBREEDER)
    end

    if (p ~= 0 and not onLoad) then
        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 40,
            [GD_BOARDS    ] = 40,
            [GD_STONES    ] = 40,
            [GD_HAM       ] = 2,
            [GD_GRAIN     ] = 2,
            [GD_FLOUR     ] = 2,

            [GD_FISH      ] = 4,
            [GD_MEAT      ] = 6,
            [GD_BREAD     ] = 8,
            [GD_WATER     ] = 2,
            [GD_BEER      ] = 0,
            [GD_COAL      ] = 10,

            [GD_IRONORE   ] = 10,
            [GD_GOLD      ] = 3,
            [GD_IRON      ] = 10,
            [GD_COINS     ] = 3,
            [GD_TONGS     ] = 1,
            [GD_AXE       ] = 5,

            [GD_SAW       ] = 5,
            [GD_PICKAXE   ] = 5,
            [GD_HAMMER    ] = 15,
            [GD_SHOVEL    ] = 5,
            [GD_CRUCIBLE  ] = 5,
            [GD_RODANDLINE] = 5,

            [GD_SCYTHE    ] = 5,
            [GD_CLEAVER   ] = 3,
            [GD_ROLLINGPIN] = 3,
            [GD_BOW       ] = 5,
            [GD_SWORD     ] = 3,
            [GD_SHIELD    ] = 3,

            [GD_BOAT      ] = 5
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
            [JOB_PIGBREEDER         ] = 3,
            [JOB_DONKEYBREEDER      ] = 2,

            [JOB_MILLER             ] = 2,
            [JOB_BAKER              ] = 2,
            [JOB_BUTCHER            ] = 2,
            [JOB_BREWER             ] = 2,
            [JOB_MINER              ] = 8,
            [JOB_IRONFOUNDER        ] = 2,

            [JOB_ARMORER            ] = 2,
            [JOB_MINTER             ] = 2,
            [JOB_METALWORKER        ] = 2,
            [JOB_SHIPWRIGHT         ] = 2,
            [JOB_GEOLOGIST          ] = 8,
            [JOB_SCOUT              ] = 2,

            [JOB_PACKDONKEY         ] = 20,
            [JOB_CHARBURNER         ] = 0,

            [JOB_PRIVATE            ] = 50,
            [JOB_PRIVATEFIRSTCLASS  ] = 1,
            [JOB_SERGEANT           ] = 1,
            [JOB_OFFICER            ] = 1,
            [JOB_GENERAL            ] = 1
        })
    elseif (p == 0 and not onLoad) then
        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 30,
            [GD_BOARDS    ] = 30,
            [GD_STONES    ] = 30,
            [GD_HAM       ] = 2,
            [GD_GRAIN     ] = 2,
            [GD_FLOUR     ] = 2,

            [GD_FISH      ] = 3,
            [GD_MEAT      ] = 4,
            [GD_BREAD     ] = 5,
            [GD_WATER     ] = 3,
            [GD_BEER      ] = 6,
            [GD_COAL      ] = 40,

            [GD_IRONORE   ] = 20,
            [GD_GOLD      ] = 4,
            [GD_IRON      ] = 20,
            [GD_COINS     ] = 3,
            [GD_TONGS     ] = 0,
            [GD_AXE       ] = 8,

            [GD_SAW       ] = 4,
            [GD_PICKAXE   ] = 8,
            [GD_HAMMER    ] = 15,
            [GD_SHOVEL    ] = 2,
            [GD_CRUCIBLE  ] = 4,
            [GD_RODANDLINE] = 3,

            [GD_SCYTHE    ] = 4,
            [GD_CLEAVER   ] = 3,
            [GD_ROLLINGPIN] = 2,
            [GD_BOW       ] = 0,
            [GD_SWORD     ] = 0,
            [GD_SHIELD    ] = 0,

            [GD_BOAT      ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 50,
            [JOB_BUILDER            ] = 15,
            [JOB_PLANER             ] = 8,
            [JOB_WOODCUTTER         ] = 4,
            [JOB_FORESTER           ] = 2,
            [JOB_STONEMASON         ] = 4,

            [JOB_FISHER             ] = 3,
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

            [JOB_PACKDONKEY         ] = 10,
            [JOB_CHARBURNER         ] = 0,

            [JOB_PRIVATE            ] = 45,
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

    if (eState[3] > 0 and GetNumMilitaryBuilding(0, true) == 3) then
        -- EVENT3
        MissionEvent(3, false)
    end

    if (eState[4] > 0 and (rttr:GetPlayer(1):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(2):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(3):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(4):GetNumBuildings(BLD_HEADQUARTERS)) < 4) then
        -- EVENT4
        MissionEvent(4, false)
    end

    if (eState[5] > 0 and (rttr:GetPlayer(1):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(2):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(3):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(4):GetNumBuildings(BLD_HEADQUARTERS)) < 3) then
        -- EVENT5
        MissionEvent(5, false)
    end

    if ((GetNumStorage(1) + GetNumStorage(2) + GetNumStorage(3) + GetNumStorage(4)) < 1) then
        -- EVENT8 (maps to 99)
        MissionEvent(99, false)
    end
end

function onOccupied(p, x, y)
    if(p ~= 0) then return end

    if(eState[6] > 0 and x == 85 and y == 75) then
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
        rttr:GetPlayer(0):AddWares({
            [GD_MEAT    ] = 10
        })

    elseif(e == 3 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_BOARDS    ] = 20
        })

    elseif(e == 4 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_PICKAXE ] = 10
        })

    elseif(e == 5 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_SWORD   ] = 10,
            [GD_SHIELD  ] = 10
        })

    elseif(e == 6 and not onLoad) then
        rttr:GetPlayer(0):EnableBuilding(BLD_DONKEYBREEDER, not onLoad)

        if(not onLoad) then
            rttr:GetPlayer(0):AddPeople({
                [JOB_DONKEYBREEDER] = 2
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