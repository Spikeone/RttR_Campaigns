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
        title   = "Halvar, der Späher",
        name    = "Unbekannter Gegner",
        diary   = "Tagebuch",

        msg1    = "Leider wurden wir entdeckt, als wir hierher gesegelt sind. Ein babylonisches Lager liegt so exponiert, dass es alle Bewegungen zur See beobachten kann. Wir werden also nicht sehr lang hier unsere Ruhe haben. Glücklicherweise kenne ich die Schlucht aus Kindertagen, die wir aufgesucht haben. Ich weiß um keine ähnlich tiefe und verborgene Schlucht auf allen unseren Inseln, die mit dem Schiff befahren werden kann.\n\nWir haben unsere Familien an einen windgeschützten Ort gebracht, der im Süden von unserem Hauptquartier gelegen ist. Hier stinkt es zwar beständig, aber es ist nicht so lausig kalt wie auf den weißen Inseln. Außerdem haben wir dort den Rest von unseren Bierfässern gelagert, die noch von unseren letzten Abenteuern übriggeblieben sind. Knut soll sich hier mit unseren Frauen und Kindern einrichten, so gut es geht, weil Ansgar und ich noch nicht wissen, wie es langfristig weitergehen wird.",
        msg2    = "Um mir im Klaren zu sein, was jetzt als Nächstes zu tun ist, führte ich ein Gespräch mit Ansgar und Halvar. Sie meinen, die Insel sei zu unübersichtlich, um allein mit Erkundungsgängen die Information über die babylonischen Feinde zu bekommen, die wir hier so dringend benötigen. Wir brauchen ein Bauwerk, was uns eine gute Übersicht verspricht.\n\nIch rief Teitur, unseren Zimmermann und Ole, unseren Schiffsbauer und Künstler, wenn es um den Umgang mit Holz geht. Beide setzten sich mit Ansgar und Halvar zusammen und gemeinsam tauschten sie ihre Vorstellungen über dieses benötigte Bauwerk aus. Am Ende kam ein Holzturm dabei heraus, der zu funktionieren scheint.\n\nAron hat mich auf einen Bauplatz im Norden hingewiesen, auf den eine Festung gerade noch Platz hätte. Allerdings wäre der Weg nach Norden dadurch eine Zeit lang verbaut. Auch Bjarki, unser Münzpräger, Ole unser Schiffsbauer und Elvor unser Schmied brennen geradezu vor Tatendrang. Aber alles auf einmal ist hier aus Platzgründen nicht möglich. Vielleicht lasse ich Ole nur ein Schiff bauen, um beweglich zu sein? Oder sichern wir das Gelände vorrangig durch eine oder gar zwei Festungen?",
        msg3    = "Wir werden wahrscheinlich schneller von unseren Feinden hier heimgesucht werden, als uns lieb sein kann. Deshalb brauchen wir jeden Mann, um die zahlreichen Steinvorkommen und Bäume zu beseitigen und brauchbare Bauplätze freizulegen. Im Süden gibt es eine kleine Hochebene, die gut geeignet scheint, um alle notwendigen Bauten errichten zu können. Auch Nahrung für uns brauchen wir mehr als genug.\n\nUnsere Frauen und Kinder haben unter Knuts Anleitung einige Handwerkzeuge selbst gebaut. Sie sind vielleicht nicht so perfekt gefertigt, wie wir Männer das gewohnt sind, aber trotzdem hochwillkommen.",
        msg4    = "Halvar hat im Nordosten ein Chinesenlager entdeckt. Sie sind vor allem mit dem Schiff sehr beweglich in ihren Aktionen und Manövern. Was aber haben die Chinesen hier verloren?\n\nSie sind uns offensichtlich feindlich gesinnt und scheinen ebenfalls mit den Babyloniern zusammen zu arbeiten. Warum? Und was haben sie gegen uns? Fragen über Fragen! Wir werden ihnen gegenüber sehr vorsichtig sein müssen.",
        msg5    = "Diese Insel ist wirklich unübersichtlich! Sie hat mehrere große Schluchten, die fast nur in Längsrichtung begangen oder zum Teil mit dem Schiff befahren werden können.\n\nDarvi, Elvor, und Bjarki haben das Beste aus der vorhandenen Situation gemacht und schauen, dass sie ihren Aufgaben so schnell wie möglich und so gut wie gewohnt nachkommen können. Glücklicherweise hat es hier genug Bodenschätze, selbst Gold scheint momentan noch ausreichend vorhanden.",
        msg6    = "Die Feinde sind wirklich stark und die Chinesen sind durch ihre schnelle und bewegliche Flotte so gut wie überall auf der Insel vertreten. Hier werden wir wohl auf dem Landweg Meter um Meter erobern müssen, weil alle Häfen besetzt sind. Das verspricht einen langen und zähen Kampf um die Alleinherrschaft auf dieser Insel.\n\nUnsere Familien haben sich den Umständen entsprechend gut eingerichtet. Knut ist dankbar für die Aufgabe, diesen provisorischen Aufenthaltsort für unsere Frauen und Kinder leiten und führen zu können. Er möchte an Ort und Stelle bleiben, bis die Verhältnisse eine Rückkehr zu unseren geliebten grünen Inseln gestatten. Zusammen mit Frauen und Kinder stellt er Werkzeuge her, um sich bei uns Männern nützlich zu machen. Die von ihnen gefertigten Schwerter und Schilde sind ungewohnt leicht und biegsam, aber sehr viel besser als nichts. Außerdem erinnern uns diese Waffen beständig an unsere Verantwortung gegenüber unseren Frauen und Kindern.\n\nMit Ansgar als Zeugen hat Knut mich, seinen Sohn Eric, zum Feldherren aller Wikinger eingesetzt und mir die Verantwortung für die Durchführung der Befreiung aller besetzten Inseln aufgetragen. Ich bin zutiefst bewegt und dankbar darüber und werde alles tun, um sein Vertrauen nicht zu enttäuschen.",
        msg99   = "Endlich ist es uns gelungen, auch das letzte feindliche Lagergebäude auf dieser Insel zu zerstören. Im Lager der Chinesen haben wir neben anderen nützlichen Kleinigkeiten einen verschlossenen und versiegelten Brief, etwas Wintergerste und einen Sack voll Hopfen gefunden, die beide auch bei schlechten Böden und ungünstigen Temperaturen zu wachsen scheinen. Ymir, unser Landwirt, hat sich bereit erklärt, bei Gelegenheit eine Aussaat des Getreides und des Hopfens zu probieren.\n\nIn dem Brief, den ich öffnete und las, wurde ein gewisser Prainn gebeten, so schnell wie möglich zu der Insel der Zusammenkunft zu kommen. Diese Insel ist meine Heimat, aus der wir zuerst vertrieben wurden, und von Prainn erinnere ich mich, als kleiner Junge an unseren Lagerfeuern nichts Gutes gehört zu haben. Ich werde den Inhalt dieses Briefes bei Gelegenheit mit Ansgar und Knut besprechen.\n\nNun verabschieden wir uns von unseren Familien, die bei Knut in guter Obhut sind, und werden von hier aus wieder nach Norden zurücksegeln, um die restlichen grauen und weißen Inseln auf mögliche Feinde hin zu untersuchen. Wann werden wir mit unseren Frauen und Kindern wieder vereint sein?"
    },
    en =
    {
        title   = "Halvar, the spy",
        name    = "Enemy Unknown",
        diary   = "Diary",

        msg1    = "Unfortunately, we were discovered when we sailed here. A Babylonian camp is positioned so exposed that it can observe all movements at sea. So we won't have peace here for long. Fortunately, I know the gorge from my childhood, which we have visited. I don't know of any other gorge on all our islands that is as deep and hidden, and can be navigated by ship.\n\nWe have moved our families to a sheltered spot in the south of our headquarters. It always smells here, but it's not as horribly cold as on the white islands. We have also stored the remaining barrels of beer here, left over from our last adventures. Knut is supposed to settle here with our women and children as best as he can, because Ansgar and I are still uncertain about how things will proceed in the long term.",
        msg2    = "To clarify what we should do next, I had a conversation with Ansgar and Halvar. They think the island is too complicated to gather the necessary information about the Babylonian enemies just by exploration. We need a structure that will give us a good overview.\n\nI called Teitur, our carpenter, and Ole, our shipbuilder and artist when it comes to working with wood. Both met with Ansgar and Halvar, and together they exchanged ideas about the necessary structure. In the end, a wooden tower was agreed upon, which seems to work.\n\nAron pointed out a building site in the north where a fortress would just fit. However, the road north would be blocked for a while as a result. Also, Bjarki, our coin maker, Ole our shipbuilder, and Elvor our blacksmith are all burning with enthusiasm. But due to space constraints, doing everything at once isn't possible. Maybe I'll just let Ole build a ship to stay mobile? Or should we prioritize securing the area with one or even two fortresses?",
        msg3    = "We will likely be visited by our enemies here sooner than we would like. Therefore, we need every man to clear the numerous stone deposits and trees to make room for useful building sites. To the south, there is a small plateau that seems well-suited for building all the necessary structures. We also need more than enough food for ourselves.\n\nOur women and children, under Knut's guidance, have made some tools by hand. They may not be as perfectly crafted as we men are used to, but they are still highly welcome.",
        msg4    = "Halvar has discovered a Chinese camp in the northeast. They are particularly mobile in their actions and maneuvers, especially by ship. But what are the Chinese doing here?\n\nThey are obviously hostile to us and seem to be working with the Babylonians as well. Why? And what do they have against us? Questions upon questions! We will have to be very cautious in dealing with them.",
        msg5    = "This island is really confusing! It has several large ravines that can almost only be traversed lengthwise or partly navigated by ship.\n\nDarvi, Elvor, and Bjarki have made the best of the situation and are ensuring they can carry out their tasks as quickly as possible and as well as usual. Fortunately, there are enough natural resources here, even gold seems to be sufficiently available for now.",
        msg6    = "The enemies are really strong, and the Chinese, with their fast and mobile fleet, are practically everywhere on the island. Here, we will probably have to conquer inch by inch on land, as all the harbors are occupied. This promises to be a long and tough battle for sole dominance of this island.\n\nOur families have settled in as well as possible under the circumstances. Knut is grateful for the task of leading and managing this temporary shelter for our women and children. He wants to stay in place until the situation allows a return to our beloved green islands. Together with the women and children, he is making tools to be useful to us men. The swords and shields they have made are unusually light and flexible, but much better than nothing. Moreover, these weapons constantly remind us of our responsibility towards our women and children.\n\nWith Ansgar as a witness, Knut has appointed me, his son Eric, as the general of all the Vikings and entrusted me with the responsibility of liberating all the occupied islands. I am deeply moved and grateful for this, and I will do everything to ensure I do not disappoint his trust.",
        msg99   = "Finally, we managed to destroy the last enemy camp building on this island. In the Chinese camp, we found, among other useful things, a locked and sealed letter, some winter barley, and a sack of hops, both of which seem to grow well even in poor soils and under unfavorable temperatures. Ymir, our farmer, has agreed to try sowing the grain and hops when the opportunity arises.\n\nIn the letter I opened and read, a certain Prainn was asked to come to the Island of the Gathering as quickly as possible. This island is my homeland, from which we were first driven, and I remember hearing nothing good about Prainn when I was a little boy around our campfires. I will discuss the contents of this letter with Ansgar and Knut when the time is right.\n\nNow, we bid farewell to our families, who are in Knut's good care, and will sail back north from here to investigate the remaining gray and white islands for potential enemies. When will we be reunited with our wives and children?"
    },
    cs =
    {
        title   = "Halvar, zvěd",
        name    = "Neznámý soupeř",
        diary   = "Deník",

        msg1    = "Bohužel jsme byli objeveni, když jsme sem připluli. Babylonský tábor je umístěn tak exponovaně, že může sledovat všechny pohyby na moři. Takže tu nebudeme mít klid na dlouho. Naštěstí znám roklinu z dětství, kterou jsme navštívili. Neznám žádnou jinou roklinu na všech našich ostrovech, která by byla tak hluboká a skrytá, a kterou by bylo možné proplout lodí.\n\nNaše rodiny jsme přemístili na chráněné místo na jihu našeho hlavního stanoviště. Sice tu stále něco páchne, ale není to tak mrazivé jako na bílých ostrovech. Také jsme tu uskladnili zbylé sudy piva, které nám zůstaly z našich posledních dobrodružství. Knut by se tu měl s našimi ženami a dětmi usadit, jak nejlépe umí, protože Ansgar a já ještě nevíme, jak to bude dlouhodobě pokračovat.",
        msg2    = "Abych měl jasno v tom, co je teď potřeba udělat, vedl jsem rozhovor s Ansgarem a Halvarem. Myslí si, že ostrov je příliš nepřehledný na to, abychom získali potřebné informace o babylonských nepřátelích jen pomocí průzkumných výprav. Potřebujeme stavbu, která nám poskytne dobrý přehled.\n\nZavolal jsem Teituru, našeho tesaře, a Oleho, našeho stavitele lodí a umělce, pokud jde o práci se dřevem. Oba se setkali s Ansgarem a Halvarem, a společně si vyměnili názory na potřebnou stavbu. Nakonec jsme se shodli na dřevěné věži, která se zdá fungovat.\n\nAron mě upozornil na stavební místo na severu, kde by se právě tak vešla pevnost. Cesta na sever by však byla nějaký čas uzavřena. Také Bjarki, náš ražebník mincí, Ole, náš stavitel lodí, a Elvor, náš kovář, jsou doslova plní elánu. Ale kvůli nedostatku místa není možné udělat všechno najednou. Možná nechám Oleho postavit jen loď, abychom zůstali mobilní? Nebo bychom měli upřednostnit zabezpečení oblasti jednou nebo dokonce dvěma pevnostmi?",
        msg3    = "Pravděpodobně nás naši nepřátelé navštíví dříve, než bychom si přáli. Proto potřebujeme každého muže, aby odstranil četné ložiska kamene a stromy a uvolnil tak vhodné stavební plochy. Na jihu je malá náhorní plošina, která se zdá být dobře vhodná pro stavbu všech potřebných budov. Také potřebujeme více než dostatek jídla pro nás.\n\nNaše ženy a děti pod Knutovým vedením vyrobily některé nástroje. Možná nejsou tak dokonale zpracované, jak jsme na to u mužů zvyklí, ale i tak jsou velmi vítány.",
        msg4    = "Halvar objevil čínský tábor na severovýchodě. Jsou velmi pohybliví ve svých akcích a manévrech, zejména po moři. Ale co tady dělají Číňané?\n\nOčividně jsou nám nepřátelsky nakloněni a zdá se, že spolupracují i s Babylóňany. Proč? A co mají proti nám? Otázky na otázky! Budeme muset být s nimi velmi opatrní.",
        msg5    = "Tento ostrov je opravdu nepřehledný! Má několik velkých roklí, které lze téměř jen přecházet podél nebo částečně plavit lodí.\n\nDarvi, Elvor a Bjarki udělali to nejlepší z dané situace a zajišťují, že mohou co nejrychleji a co nejlépe vykonávat své úkoly. Naštěstí je zde dostatek přírodních zdrojů, dokonce se zdá, že zlata je zatím dost.",
        msg6    = "Naši nepřátelé jsou skutečně silní a Číňané, díky své rychlé a pohyblivé flotile, jsou téměř všude na ostrově. Zřejmě budeme muset dobývat metr po metru po pevninské cestě, protože všechny přístavy jsou obsazeny. To slibuje dlouhou a tvrdou bitvu o úplnou nadvládu nad tímto ostrovem.\n\nNaše rodiny se podle okolností dobře usadily. Knut je vděčný za úkol vést a spravovat tento dočasný úkryt pro naše ženy a děti. Chce zůstat na místě, dokud podmínky neumožní návrat na naše milované zelené ostrovy. Spolu se ženami a dětmi vyrábí nástroje, aby nám mužům byli užiteční. Meče a štíty, které vyrobili, jsou neobvykle lehké a ohebné, ale mnohem lepší než nic. Kromě toho nás tyto zbraně neustále připomínají naši odpovědnost vůči našim ženám a dětem.\n\nS Ansgarem jako svědkem mě Knut, můj otec, jmenoval generálem všech Vikingů a svěřil mi odpovědnost za osvobození všech obsazených ostrovů. Jsem tím hluboce pohnutý a vděčný a udělám vše, abych nezklamal jeho důvěru.",
        msg99   = "Nakonec se nám podařilo zničit i poslední nepřátelskou budovu tábora na tomto ostrově. V táboře Číňanů jsme kromě jiných užitečných věcí našli uzavřený a zapečetěný dopis, nějaký zimní ječmen a pytel chmele, který se zdá růst i na chudých půdách a při nepříznivých teplotách. Ymir, náš farmář, se rozhodl, že při příležitosti vyzkouší zasít obilí a chmel.\n\nV dopise, který jsem otevřel a přečetl, byl požadavek, aby jistý Prainn co nejrychleji přišel na Ostrov setkání. Tento ostrov je moje rodná země, z níž jsme byli nejprve vyhnáni, a na Prainna si jako malý chlapec pamatuji, že kolem našich táborových ohňů nikdy nezněly nic dobrého. Obsah tohoto dopisu proberu s Ansgarem a Knutem, až to bude možné.\n\nNyní se loučíme s našimi rodinami, které jsou v dobré péči Knuta, a z tohoto místa se opět vydáme na sever, abychom prozkoumali zbylé šedé a bílé ostrovy na možné nepřátele. Kdy budeme opět spojeni se svými ženami a dětmi?"
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
    rttr:GetPlayer(3):SetNation(NAT_BABYLONIANS)

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
        addExtraBoards(1, 50)
        addExtraBoards(2, 50)
        addExtraSoldiers(2, 20)
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
        rttr:GetWorld():AddStaticObject(51, 22, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(26, 86, 0, 0, 1)
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
        rttr:GetPlayer(p):DisableBuilding(BLD_LOOKOUTTOWER)
        rttr:GetPlayer(p):DisableBuilding(BLD_CATAPULT)
        rttr:GetPlayer(p):DisableBuilding(BLD_MILL)
        rttr:GetPlayer(p):DisableBuilding(BLD_BAKERY)
        rttr:GetPlayer(p):DisableBuilding(BLD_FARM)
        rttr:GetPlayer(p):DisableBuilding(BLD_PIGFARM)
        rttr:GetPlayer(p):DisableBuilding(BLD_SLAUGHTERHOUSE)
        rttr:GetPlayer(p):DisableBuilding(BLD_BREWERY)
        rttr:GetPlayer(p):DisableBuilding(BLD_METALWORKS)
        rttr:GetPlayer(p):DisableBuilding(BLD_FORESTER)
        rttr:GetPlayer(p):DisableBuilding(BLD_DONKEYBREEDER)
        rttr:GetPlayer(p):DisableBuilding(BLD_WELL)
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
            [JOB_SERGEANT           ] = 1,
            [JOB_OFFICER            ] = 1,
            [JOB_GENERAL            ] = 1
        })
    elseif (p == 0 and not onLoad) then
        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 15,
            [GD_BOARDS    ] = 25,
            [GD_STONES    ] = 25,
            [GD_HAM       ] = 0,
            [GD_GRAIN     ] = 0,
            [GD_FLOUR     ] = 0,

            [GD_FISH      ] = 2,
            [GD_MEAT      ] = 2,
            [GD_BREAD     ] = 2,
            [GD_WATER     ] = 0,
            [GD_BEER      ] = 200,
            [GD_COAL      ] = 20,

            [GD_IRONORE   ] = 20,
            [GD_GOLD      ] = 8,
            [GD_IRON      ] = 20,
            [GD_COINS     ] = 4,
            [GD_TONGS     ] = 0,
            [GD_AXE       ] = 6,

            [GD_SAW       ] = 2,
            [GD_PICKAXE   ] = 8,
            [GD_HAMMER    ] = 12,
            [GD_SHOVEL    ] = 0,
            [GD_CRUCIBLE  ] = 3,
            [GD_RODANDLINE] = 6,

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
            [JOB_WOODCUTTER         ] = 6,
            [JOB_FORESTER           ] = 0,
            [JOB_STONEMASON         ] = 6,

            [JOB_FISHER             ] = 2,
            [JOB_HUNTER             ] = 6,
            [JOB_CARPENTER          ] = 3,
            [JOB_FARMER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,

            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 0,
            [JOB_BREWER             ] = 0,
            [JOB_MINER              ] = 9,
            [JOB_IRONFOUNDER        ] = 1,

            [JOB_ARMORER            ] = 1,
            [JOB_MINTER             ] = 2,
            [JOB_METALWORKER        ] = 0,
            [JOB_SHIPWRIGHT         ] = 1,
            [JOB_GEOLOGIST          ] = 5,
            [JOB_SCOUT              ] = 2,

            [JOB_PACKDONKEY         ] = 9,
            [JOB_CHARBURNER         ] = 0,
    

            [JOB_PRIVATE            ] = 30,
            [JOB_PRIVATEFIRSTCLASS  ] = 10,
            [JOB_SERGEANT           ] = 5,
            [JOB_OFFICER            ] = 2,
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
    
    if (eState[3] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_LOOKOUTTOWER) > 0) then
        -- EVENT3
        MissionEvent(3, false)
    end

    local milBuildingCount = GetNumMilitaryBuilding(0, true)

    if (eState[4] > 0 and milBuildingCount >= 5) then
        -- EVENT4
        MissionEvent(4, false)
    end

    if (eState[5] > 0 and milBuildingCount >= 7) then
        -- EVENT5
        MissionEvent(5, false)
    end

    if (eState[6] > 0 and milBuildingCount >= 12) then
        -- EVENT6
        MissionEvent(6, false)
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

    elseif(e == 2) then
        rttr:GetPlayer(0):EnableBuilding(BLD_LOOKOUTTOWER, not onLoad)

    elseif(e == 3 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
                [GD_PICKAXE] = 2,
                [GD_AXE] = 2,
                [GD_RODANDLINE] = 2
            })
        rttr:GetPlayer(0):AddPeople({
                [JOB_HUNTER] = 2
            })

    elseif(e == 4 and not onLoad) then
        -- nothing

    elseif(e == 5 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
                [GD_COINS] = 20
            })

    elseif(e == 6 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
                [GD_SWORD] = 10,
                [GD_SHIELD] = 10
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
