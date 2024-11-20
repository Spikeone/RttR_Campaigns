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

rttr:RegisterTranslations(
{
    en =
    {
        title   = 'Ole, ship builder',
        name    = 'Enemy Unknown',
        diary   = 'Diary',

        msg1    = 'Like dogs, they have hunted us down! Like locusts, our enemies, the Babylonians, with their allies, descended upon us. We were in the deepest peace when enemies attacked us from all sides. They gave us no time to catch our breath-driving us from island to island in one battle after another. We were hunted like hares, and some of us managed to hide in the forests. All the others had to flee to save their lives.\n\nFor those of us who remained from our people, the only option left was to retreat to an island in the far north, which we had set aside as a refuge for emergencies. We rendered the only harbor unusable and retreated to our hideout in the middle of this island.\n\nAfter mutual agreement, we decided to build a sawmill because we almost had no building wood left. We also planned to build a hut for woodcutter and a hunting lodge to ensure we would not starve and would always have firewood. It is freezing cold here, and it is unbearable without a fire.',
        msg2    = 'My father Knut, our great and wise king, has become speechless with sorrow and heartbreak. He sits in a room in our refuge, mourning, and will speak to no one about anything.My friends and comrades have asked me, Eric, to make decisions on behalf of my father until he regains his full mental and physical strength.\n\nMy good Ansgar is my best friend and at the same time the oldest of all the Vikings who made it here. He is a goldsmith by trade and knows this area much better than I do because he discovered and developed this hideout about forty years ago. He also knows me better than I know myself, as he has been responsible for my upbringing since I was a child.\n\nHe told me that a training camp for young Babylonian soldiers has been set up nearby, and they are unaware of our presence here. However, we will not be able to hide our presence for long, especially since our fireplaces, both indoors and outdoors, will give us away. Ansgar is aware of a possible harbor site in the southwest of our island and advised me to explore that location.',
        msg3    = 'The potential harbor site has been found, and it it not bad at all. Ole, my companion from childhood, has a keen interest in shipbuilding and has thoroughly examined every shipwreck he could find. He feels confident that he could build a ship that, in his words, would hold its own against others. However, he would need a harbor building, a shipyard, a lot of timber, and some people to assist him. I think we should take this step so that we can explore the surrounding area with the ship. Of course, we will need to be cautious.\nAdditionally, we need fishermen.',
        msg4    = 'The training ground nearby can sometimes be heard and smelled. This greatly increases the likelihood of us being discovered at some point. Our stay here is not safe in the long run! Therefore, we should search for resources to mint coins. The dark surface of mountains on our island suggests there is plenty of coal beneath, but we also need gold so that Ansgar has something to do. A soldier who gains recognition and appreciation through his pay fights better than one without coins. Let us therefore find a place for a mint and locate gold so that we can keep Ansgar occupied.',
        msg5    = 'We found a large chest that was almost completely buried. Inside, there were axes, pickaxes, and other tools that we can make very good use of.',
        msg6    = 'Shipbuilding skills of Ole are truly admirable - all respect to him!\n\nHis ships make us more mobile and flexible. There seem to be enough harbor sites in the area, but with each newly discovered harbor comes the increasing risk of being discovered ourselves. \nHowever, the chances of finding gold also increase, as the newly discovered small islands are all quite mountainous. If necessary, we will send geologists who have learned to identify the type of metal present by the sound of their hammer blows. Unfortunately, we cannot do much with iron at the moment, as we lack both the necessary tools for processing it and the skilled people to work with it. We must change that as soon as possible.',
        msg7    = 'The smaller islands have mostly been explored and are quite depleted in terms of available resources. Only the large island remains, and it is likely home to the training ground of Babylonians. Here, we should gather the resources, both sawmills, our Ansgar with his goldsmithing workshop, and above all, all available soldiers, ensuring they are adequately paid. This works best in a larger military building, as coins can be distributed more evenly there. For that, we need shorter routes than we currently have.',
        msg8    = 'We have indeed reached the point where the future of our people will be decided. The Babylonians wanted to wipe us out, so we must defeat them here and now. For this, we need every single available soldier on the front lines, fully equipped. \nThe paid wages have transformed some of our young fighters- their confidence and readiness are truly impressive. We can expect to face a superior force of enemy fighters, so no soldier should lack his pay down to the very last coin.',
        msg99   = 'We managed to completely destroy the main building of the Babylonians and all their warehouses. We are now thoroughly examining what remains of the training ground to see if there is anything useful for us. Ansgar, in particular, is searching for any tools lying around.',
    },
    de =
    {
        title   = 'Ole, der Schiffsbauer',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = 'Wie Hunde haben sie uns gehetzt! Wie die Heuschrecken sind unsere Feinde, die Babylonier, mit ihren Verbündeten über uns hergefallen. Wir waren im tiefsten Frieden, als von allen Seiten die Feinde uns angegriffen haben. Sie ließen uns keine Zeit, um Luft zu holen – in immer neuen Schlachten haben sie uns von Insel zu Insel getrieben. Wir wurden gejagt wie Hasen und Einzelne von uns haben sich in den Wäldern verstecken können. Alle anderen mussten fliehen, um ihre Haut zu retten.\n\nEs blieb uns Übriggebliebenen von unserem Volk zuletzt nur noch der Rückzug auf eine Insel im hohen Norden, die wir uns für Notfälle als Zuflucht angelegt haben. Den einzige Hafen haben wir unbrauchbar gemacht, und uns in unseren Schlupfwinkel in der Mitte dieser Insel zurückgezogen.\n\nNach gemeinsamer Absprache haben wir uns entschlossen, ein Sägewerk zu bauen, weil wir fast kein Bauholz mehr haben. Auch ein Holzfällerhäuschen und eine Jagdhütte sollten wir bauen, damit wir nicht verhungern und stets etwas Brennholz haben. Es ist eiskalt hier und ohne ein Feuer nicht auszuhalten.',
        msg2    = 'Mein Vater Knut, unser großer und weiser König, ist vor Kummer und Herzeleid sprachlos geworden. Er sitzt in einem Raum in unserer Zuflucht, trauert und ist für nichts und niemandem zu sprechen. Meine Freunde und Kameraden haben mich, Eric, gebeten, so lange für meinen Vater Entscheidungen zu treffen, bis er wieder im Vollbesitz seiner seelischen und körperlichen Kräfte ist.\n\nMein guter Ansgar ist mein bester Freund und gleichzeitig der Älteste aller Wikinger, die es hierher geschafft haben. Er ist Goldschmied von Beruf und kennt diese Gegend viel besser als ich, weil er vor etwa vierzig Jahren diesen Schlupfwinkel entdeckt und ausgebaut hat. Außerdem kennt er mich besser als ich mich selbst, weil er meine Erziehung von Kindesbeinen an verantwortlich begleitet hat.\n\nEr hat mir erzählt, dass in der Nähe ein Trainingslager für junge babylonische Soldaten errichtet wurde, die von unserer Gegenwart hier nichts ahnen. Allzu lange könnten wir unsere Gegenwart hier nicht verbergen, da vor allem unsere Feuerstätten im Haus und im Freien uns verraten werden. Ansgar weiß um einen möglichen Hafenplatz im Südwesten unserer Insel und riet mir, diesen Platz aufzusuchen.',
        msg3    = 'Der mögliche Hafenplatz ist gefunden und er ist gar nicht so schlecht. Da Ole, mein Gefährte aus Kindertagen, sich für den Schiffsbau interessiert, hat er jedes Schiffswrack, das er entdecken konnte, genau besehen. Er würde sich zutrauen, ein Schiff zu bauen, das laut seinen Worten den Vergleich mit anderen Schiffen nicht scheuen müsste. Nur braucht er dazu ein Hafengebäude, eine Werft, viel Bauholz und einige Leute zur Handreichung. Ich denke, wir wagen diesen Schritt, um mit dem Schiff die Umgebung zu erkundigen. Natürlich müssen wir dabei vorsichtig sein. Außerdem brauchen wir Fischer.',
        msg4    = 'Das Trainingsgelände in der Nähe ist manchmal zu hören und zu riechen. Die Wahrscheinlichkeit ist deshalb groß, irgendwann ebenfalls entdeckt zu werden. Unseres Bleibens ist hier auf Dauer nicht sicher! Daher sollten wir uns nach Rohstoffen umschauen, um uns Münzen prägen zu können. Die dunkle Oberfläche unseres Inselgebirges lässt reichlich Kohle darunter vermuten, aber wir brauchen auch Gold, damit Ansgar etwas zu tun bekommt. Ein Soldat, der Anerkennung und Wertschätzung durch seinen Sold erfährt, kämpft besser als ein Soldat ohne Münzen. Schauen wir also, dass wir einen Platz für eine Münzprägerei bekommen, und dass wir Gold finden können, um Ansgar beschäftigen zu können.',
        msg5    = 'Wir haben eine große Kiste gefunden, die fast vollständig eingegraben war. Darin befanden sich Äxte und Spitzhacken und anderes Werkzeug, die wir sehr gut gebrauchen können.',
        msg6    = 'Oles Schiffsbaukunst ist wirklich bewundernswert – alle Achtung! Seine Schiffe machen uns beweglicher und flexibler. Es gibt scheinbar genug Hafenplätze in der Umgebung aber mit jedem gefundenen Hafenplatz steigt die Gefahr, selbst entdeckt zu werden. Allerdings steigt auch die Möglichkeit, Gold zu finden, da die neuentdeckten kleinen Insel alle recht bergig sind. Wir werden bei Bedarf Geologen hinschicken, die gelernt haben, an dem Geräusch ihrer Hammerschläge das jeweilig vorhandene Metall herauszufinden. Leider können wir mit Eisen nichts anfangen, da uns sowohl die notwendigen Werkzeuge zur Bearbeitung, als auch die nötigen Leute fehlen, die damit umgehen können. Das müssen wir baldmöglichst ändern.',
        msg7    = 'Die kleineren Inseln sind allermeist erkundet und ziemlich ausgebeutet, was die vorhandenen Rohstoffe anbetrifft. Nur die große Insel ist noch übrig, und die dürfte das Trainingsgelände der Babylonier beherbergen. Hier sollten wir die Rohstoffe, beide Sägewerke, unseren Ansgar mit seiner Goldschmiede und vor allem sämtliche zur Verfügung stehende Soldaten hier zusammenziehen und sie ausreichend mit Sold ausstatten. Das funktioniert am besten in einem größeren Militärgebäude, weil dort die Münzen gleichmäßiger verteilt werden können. Dazu brauchen wir kürzere Wege, als wir sie bisher haben.',
        msg8    = 'Wir sind tatsächlich an dem Punkt angelangt, wo sich unsere Zukunft als Volk entscheiden wird. Die Babylonier wollten uns ausrotten, deshalb müssen wir sie hier und jetzt besiegen. Darum brauchen wir jeden einzelnen verfügbaren Soldaten an vorderster Front und bestens ausgerüstet. Der ausgezahlte Sold hat einige von unseren jungen Kämpfern geradezu wie verwandelt – ihre Zuversicht und ihre Schlagfertigkeit sind wirklich beeindruckend. Wir können uns ausrechnen, dass wir es mit einer Übermacht von feindlichen Kämpfern zu tun haben werden, deshalb sollte es keinem Soldat an seinem Sold bis zur letzten Münze fehlen.',
        msg99   = 'Wir haben es geschafft, das dortige Hauptgebäude der Babylonier und alle ihre Lagerhäuser vollständig zu zerstören. Was noch übriggeblieben ist von dem Trainingsgelände schauen wir uns genau an, ob für uns etwas Verwertbares darunter ist. Besonders Ansgar sucht nach herumliegenden Werkzeugen.',
    },
    cs =
    {
        title   = 'Ole, stavitel lodí',
        name    = 'Neznámy nepřítel',
        diary   = 'Deník',

        msg1    = 'Jako psi nás pronásledovali! Jako kobylky na nás zaútočili naši nepřátelé, Babylonci, se svými spojenci. Byli jsme v nejhlubším míru, když nás z každé strany napadli. Nedali nám žádný čas na nadechnutí – v neustálých bitvách nás hnali z ostrova na ostrov. Byli jsme pronásledováni jako zajíci a někteří z nás se dokázali skrýt v lesích. Všichni ostatní museli uprchnout, aby si zachránili život.\n\nTěm z nás, kteří zůstali, nezbylo nic jiného než ustoupit na ostrov daleko na severu, který jsme si jako útočiště pro nouzové situace vyhradili. Jediný přístav jsme učinili nepoužitelným a stáhli se do našeho úkrytu uprostřed tohoto ostrova.\n\nPo vzájemné dohodě jsme se rozhodli postavit pilu, protože nám téměř došlo stavební dřevo. Měli bychom také postavit dům pro dřevorubce a loveckou chatku, abychom nezemřeli hlady a měli vždy nějaké dřevo na topení. Je tady ledová zima a bez ohně se to nedá vydržet.',
        msg2    = 'Můj otec Knut, náš velký a moudrý král, zůstal bez slov kvůli žalu a srdcervoucí bolesti. Sedí v místnosti v našem úkrytu, truchlí a nechce mluvit s nikým a o ničem. Moji přátelé a kamarádi mě požádali, abych já, Eric, dočasně přebral rozhodování za svého otce, dokud se opět nevrátí do plné duševní a fyzické síly.\n\nMůj dobrý Ansgar je můj nejlepší přítel a zároveň nejstarší ze všech Vikingů, kteří se sem dostali. Je zlatníkem a tuto oblast zná mnohem lépe než já, protože před asi čtyřiceti lety tento úkryt objevil a rozvinul. Kromě toho mě zná lépe než já sám, protože se od mého dětství odpovědně podílel na mém výchově.\n\nPověděl mi, že v blízkosti bylo zřízeno výcvikové tábor pro mladé babylonské vojáky, kteří o naší přítomnosti tady nic netuší. Příliš dlouho bychom naši přítomnost zde nemohli skrývat, protože zejména naše ohniště v domech a venku nás prozradí. Ansgar ví o možném přístavním místě na jihozápadě našeho ostrova a poradil mi, abych toto místo navštívil.',
        msg3    = 'Možné přístavní místo bylo nalezeno a není vůbec špatné. Ole, můj druh z dětských let, který se zajímá o stavbu lodí, prozkoumal každou vrak, který našel. Věří, že by dokázal postavit loď, která by se podle jeho slov nemusela stydět za srovnání s ostatními loděmi. Potřebuje však přístavní budovu, loděnici, hodně stavebního dřeva a několik lidí k pomoci. Myslím, že se do toho pustíme, abychom s lodí prozkoumali okolí. Samozřejmě musíme být opatrní. Kromě toho potřebujeme rybáře.',
        msg4    = 'Výcvikový tábor v okolí je někdy slyšet a cítit. Pravděpodobnost, že budeme také jednou objeveni, je tedy vysoká. Naše setrvání zde není dlouhodobě bezpečné! Proto bychom se měli poohlédnout po surovinách, abychom si mohli razit mince. Temný povrch našeho ostrovního pohoří naznačuje, že pod ním se skrývá spousta uhlí, ale také potřebujeme zlato, aby měl Ansgar co dělat. Voják, který dostává uznání a ocenění prostřednictvím svého platu, bojuje lépe než voják bez mincí. Podívejme se tedy, jestli najdeme místo pro mincovnu a jestli můžeme najít zlato, abychom mohli Ansgara zaměstnat.',
        msg5    = 'Našli jsme velkou bednu, která byla téměř úplně zakopaná. Uvnitř byly sekery, krumpáče a jiné nástroje, které budeme velmi potřebovat.',
        msg6    = 'Oleho dovednosti ve stavbě lodí jsou skutečně obdivuhodné – klobouk dolů! Jeho lodě nás činí pohyblivějšími a flexibilnějšími. Zdá se, že v okolí je dostatek přístavních míst, ale s každým novým nalezeným přístavem roste i nebezpečí, že budeme objeveni. Avšak také roste možnost najít zlato, protože nově objevené malé ostrovy jsou všechny poměrně hornaté. Pokud bude potřeba, pošleme geology, kteří se naučili rozpoznat kov podle zvuku jejich úderů kladiva. Bohužel nemůžeme s železem nic dělat, protože nám chybí jak potřebné nástroje pro jeho zpracování, tak i potřební lidé, kteří s ním umí pracovat. To musíme co nejdříve změnit.',
        msg7    = 'Menší ostrovy byly většinou prozkoumány a poměrně vyčerpány, co se týče dostupných surovin. Jen velký ostrov je stále volný, a ten pravděpodobně ukrývá výcvikový tábor Babylonců. Tady bychom měli shromáždit suroviny, obě pila, našeho Ansgara s jeho zlatnickou dílnou a především všechny dostupné vojáky a adekvátně je vybavit platem. Nejlépe to funguje v větší vojenské budově, protože tam mohou být mince rovnoměrně rozděleny. K tomu potřebujeme kratší cesty, než jaké máme dosud.',
        msg8    = 'Skutečně jsme dosáhli bodu, kdy se rozhodne naše budoucnost jako národa. Babylonci nás chtěli vyhladit, proto je musíme porazit tady a teď. Proto potřebujeme každého dostupného vojáka na první linii, plně vybaveného. Vyplacený plat některé naše mladé bojovníky doslova proměnil – jejich sebevědomí a pohotovost jsou skutečně působivé. Můžeme si spočítat, že budeme čelit přesile nepřátelských bojovníků, proto by žádnému vojákovi neměl chybět jeho plat až do poslední mince.',
        msg99   = 'Podařilo se nám úplně zničit hlavní budovu Babylonů a všechny jejich skladiště. Nyní pečlivě prozkoumáváme, co zůstalo z výcvikového tábora, abychom zjistili, jestli tam není něco užitečného pro nás. Zejména Ansgar hledá nástroje, které leží kolem.',
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
        rttr:GetPlayer(p):DisableBuilding(BLD_GUARDHOUSE)
        rttr:GetPlayer(p):DisableBuilding(BLD_WATCHTOWER)
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
            [JOB_HUNTER             ] = 3,
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

            [JOB_PRIVATE            ] = 30,
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

    if (x == 6 and y == 53) then
        -- EVENT3
        MissionEvent(3, false)
    end
end

function onOccupied(playerIdx, x, y)
    if(playerIdx ~= 0) then
        return
    end

    if (x == 91 and y == 75) then
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
    
    if (rttr:GetPlayer(0):GetNumBuildings(BLD_SAWMILL) > 0) then
        -- EVENT2
        MissionEvent(2, false)
    end

    if (rttr:GetPlayer(0):GetNumBuildings(BLD_HARBORBUILDING) > 0) then
        -- EVENT4
        MissionEvent(4, false)

    end

    if (rttr:GetPlayer(0):GetNumBuildings(BLD_BARRACKS) > 3) then
        -- EVENT5
        MissionEvent(5, false)
    end

    if (rttr:GetPlayer(0):GetNumBuildings(BLD_HARBORBUILDING) > 1) then
        -- EVENT6
        MissionEvent(6, false)

    end

    if (rttr:GetPlayer(0):GetNumBuildings(BLD_WATCHTOWER) > 0) then
        -- EVENT8
        MissionEvent(8, false)
    end

    if ((rttr:GetPlayer(1):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(1):GetNumBuildings(BLD_HARBORBUILDING) + rttr:GetPlayer(1):GetNumBuildings(BLD_STOREHOUSE)) < 1) then
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

function addExtraBoards(plrId, amount)
    rttr:GetPlayer(plrId):AddWares({[GD_BOARDS] = amount})
end

function addExtraSoldiers(plrId, amount)
    rttr:GetPlayer(plrId):AddPeople({[JOB_PRIVATE] = amount})
end