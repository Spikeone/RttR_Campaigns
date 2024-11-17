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
        title   = 'Lars, der Schlosser',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = 'Ansgar und Knut haben sich auf unserer Insel des ewigen Schnees abgesprochen, dass diesmal mein Vater mit mir auf die letzte graue Insel zieht, und Ansgar bei unseren Frauen und Kinder bleibt. Knut hat Lars mitgenommen, der zwar schon im fortgeschrittenen Alter ist und eigentlich keinen Kriegsdienst mehr leisten muss. Lars hat aber um Mitnahme gebeten und meinen Vater dadurch überzeugt, dass er so gut wie jedes beliebige Handwerkszeug aus Holz und Eisen herstellen kann.\n\nBin ich froh, wenn wir die grauen Inseln hinter uns haben. Es gibt hier kein direktes Sonnenlicht, keine grüne Landschaft, keine blauen Gewässer, nur einen diesigen und stinkenden Mix aus braunen und dunkelroten Elementen. Aber es wäre die erste Insel, auf der keine Feinde wären.\n\nAuf dieser geräumigen Insel sind wir alle drei Monate für einen Tag unsere Lieblingsbeschäftigung nachgegangen, dem Filzkugelkicken. Ein mit Stoffen prall gefüllter Filzsack von etwa einem Meter Durchmesser wird dabei von zwei Mannschaften von jeweils 200 Mann mit den Füßen vorwärts getreten. Jede Mannschaft versucht dabei, ihre Filzkugel jeweils zwischen zwei markierten Bäumen per Fuß durch zu kicken.',
        msg2    = 'Mein Vater hat mir aufgrund meiner Frage an Ihn etwas über seinem Amtsvorgänger Prainn erzählt. Er war ein junger, aber kluger Kopf und ein strategisch außerordentlich begabter König. Leider war er jähzornig und auch etwas hochmütig, deshalb war er bei allen Taten, die er zum Besten für uns Wikinger gewirkt hat, nicht sonderlich beliebt beim Volk.\n\nAls er aus Wut einen Menschen erschlug, dessen Botschaft er nicht hören wollte, musste er sein Amt niederlegen und unser Volk verlassen. Es sind Viele mit ihm gegangen, die ähnlich dachten wie er. Danach wurde das übrige Volk befragt nach einem neuen König, und auch auf Ansgars Fürsprache wurde der bisherige Bäcker Knut nunmehr zum neuen König Knut gewählt. Für ihn sei das alles sehr überraschend und unerwartet gekommen.\n\nIch habe meinem Vater nichts über den Brief im Chinesenlager erzählt, wo dieser Prainn auf meine Heimatinsel,  die Insel der Versammlung, zu kommen gebeten wurde, um dort etwas zu organisieren. Ich werde das Gefühl nicht los, das wir diesem Menschen noch begegnen werden, und er uns Einiges über den momentanen Krieg erklären könnte.',
        msg3    = 'Unser Späher Halvar kam ganz aufgeregt von seinem Erkundungsgang zurück! Es wimmle hier geradezu von Feinden, und sie bewegen sich geschlossen auf uns zu. Da das Gelände keinerlei Schutz bietet, sollte sofort der Rückzug angetreten werden mit allem, was sich transportieren lässt.\n\nHalvar hat im Südwesten der Insel einen Ort ausgemacht, der noch unentdeckt sei, und uns dringend geraten, so schnell wie nur möglich dorthin zu flüchten. Dort gäbe es etwas Deckung und genügend Bodenschätze, um sich für eine Schlacht zu rüsten, die hier unweigerlich auf uns zukommen würde.',
        msg4    = 'Es wird höchste Zeit, von hier zu verschwinden! Von fast allen Seiten rücken Feinde heran und wir sind nicht stark und schon gar nicht geschützt genug, ihnen zu widerstehen. Wir müssen im Südwesten der Insel ein Lagerhaus bauen und hoffen, soviel Werkzeug wie möglich dorthin bekommen zu können.',
        msg5    = 'Das war eine Hetzerei, aber hier haben wir eine Chance zum Überleben! Das Gelände ist nicht sehr geräumig, bietet aber Rohstoffe und natürlichen Schutz. Hier sollten wir uns erst einmal niederlassen und diesen Platz mit Thorbens Katapulten und Arons Festungen um uns herum bestmöglich verteidigen.\n\nDann müssen wir schauen, was in den Hügeln um uns herum an Kohle, Eisen und Gold vorhanden ist, um unsere Wirtschaft in Gang zu bringen. Darvi, Bajrki und Elvor warten schon sehnsüchtig auf ihre vertrauten Werkstattgebäuden, um sich handwerklich betätigen zu können. Und auch Lars ist bereit, seine Handwerkskunst praktisch unter Beweis zu stellen. Und vor allem brauchen wir Sigvaldis Bier, unser flüssiger Mutmacher in allen Kämpfen gegen unsere Feinde.',
        msg6    = 'An dieser Stelle standen zwei der vier Bäume, deren Zwischenraum uns als Zielobjekt für unsere Filzsäcke gedient hat, die wir quer über die Ebene gedroschen haben. Mancher von uns Wikinger denkt an die unvergesslichen Stunden während des Spieles und an etliche blaue Flecken, die in dem wilden Getümmel um diese Kugel entstanden sind.\n\nJetzt sind es blutige Kämpfe, die uns hierher geführt haben. Es ist ein Ende der Schlacht abzusehen, obwohl der Widerstand der Feinde noch nicht vollständig gebrochen ist. Aber die weite Ebene ist zum großen Teil zurück erobert und mit den restlichen Gegnern in den umliegenden Hügeln werden wir auch noch ein Hühnchen miteinander rupfen.\n\nAus unserem Lager kam die Mitteilung, dass erneut ein Amboss von Elvor versehentlich zerstört wurde. Ich wies zwei unserer Soldaten an, in den rauchenden Trümmern der feindlichen Gebäude nach einem brauchbaren Ersatz zu suchen und ihn in unser Lager zu bringen.',
        msg99   = 'Endlich ist auch diese Schlacht zu unseren Gunsten geschlagen worden und die letzte graue Insel zurück erobert. Mein Vater war sichtlich betroffen, als er im letzten zerstörten Hauptquartier eine Suchmeldung über  eine Person namens Ahasversos zu Gesicht bekam. Ansgar und ich waren diese Suchmeldungen ja schon bekannt, wir haben aber nie mit meinem Vater darüber gesprochen.\n\nÜber diesen Ahasversos müsse er mit mir zusammen mit Ansgar reden, meinte er nur. Ich bin ehrlich gespannt, was er mir als Vater und König der Wikinger darüber zu sagen hat.'
    },
    en =
    {
        title   = 'Lars, the locksmith',
        name    = 'Enemy Unknown',
        diary   = 'Diary',

        msg1    = 'Ansgar and Knut have agreed on our Island of Eternal Snow that this time my father will accompany me to the last gray island, and Ansgar will stay with our women and children. Knut has brought Lars along, who, although of advanced age and no longer required to serve in the military, asked to come and convinced my father by demonstrating that he can make almost any kind of tool from wood and iron.\n\nI will be glad when we have the gray islands behind us. There is no direct sunlight here, no green landscape, no blue waters, just a misty and stinking mix of brown and dark red elements. But it would be the first island without any enemies.\n\nOn this spacious island, we have spent one day every three months pursuing our favorite pastime, kicking felt balls. A felt sack filled with cloth, about a meter in diameter, is kicked forward by two teams of 200 men each with their feet. Each team tries to kick their felt ball between two marked trees with their feet.',
        msg2    = 'My father told me something about his predecessor, Prainn, in response to my question. He was a young but clever mind and an extraordinarily gifted strategic king. Unfortunately, he had a quick temper and was somewhat arrogant, so despite all the good he did for us Vikings, he was not very popular with the people.\n\nWhen he killed a man out of anger, someone whose message he didn’t want to hear, he had to step down from his position and leave our people. Many people who thought like him left with him. After that, the remaining people were asked to choose a new king, and through Ansgar’s recommendation, the former baker Knut was elected as the new King Knut. It all came as a great surprise and shock to him.\n\nI didn’t tell my father about the letter I found in the Chinese camp, where this Prainn was invited to my homeland island, the Island of the Assembly, to come and organize something. I have the feeling that we will encounter this man again, and he could explain a lot to us about the current war.',
        msg3    = 'Our scout Halvar returned from his reconnaissance mission all excited! The island is literally swarming with enemies, and they are moving in unison towards us. Since the terrain offers no protection, we should immediately retreat with everything we can transport.\n\nHalvar has spotted a place in the southwest of the island that is still undiscovered, and he urgently advised us to flee there as quickly as possible. There, we would have some cover and enough resources to prepare for the battle that will inevitably come our way.',
        msg4    = 'It’s high time we leave this place! Enemies are closing in from almost all sides, and we are not strong enough, nor protected enough, to resist them. We need to build a warehouse in the southwest of the island and hope to get as much equipment there as possible.',
        msg5    = 'That was a mad rush, but here we have a chance to survive! The terrain is not very spacious, but it offers resources and natural protection. We should settle here for now and defend this place with Thorben´s catapults and Aron’s fortifications around us as best as we can.\nThen, we need to look into what coal, iron, and gold are available in the hills around us to get our economy moving. Darvi, Bjarki, and Elvor are already eagerly waiting for their familiar workshops to start working again. And Lars is also ready to put his craftsmanship to practical use. Most importantly, we need Sigvaldi’s beer, our liquid motivator in all battles against our enemies.',
        msg6    = 'At this spot stood two of the four trees, whose space between them served as the target for our felt sacks that we hammered across the plain. Many of us Vikings think back to the unforgettable hours during the game and the many bruises that were earned in the wild scramble for the ball.\nNow, it is bloody battles that have brought us here. An end to the battle is in sight, although the resistance of the enemies has not been completely broken. But the vast plain has been largely recaptured, and with the remaining enemies in the surrounding hills, we will also pluck a chicken together.\nA report came from our camp that once again an anvil from Elvor was accidentally destroyed. I instructed two of our soldiers to search the smoking rubble of the enemy buildings for a usable replacement and bring it to our camp.',
        msg99   = 'Finally, this battle has also been won in our favor, and the last gray island has been recaptured. My father was visibly affected when he saw a search notice for a person named Ahasversos in the last destroyed headquarters. Ansgar and I were already familiar with these search notices, but we had never discussed them with my father.\nHe only said that he needed to talk to me and Ansgar about this Ahasversos. I am honestly curious to hear what he, as a father and king of the Vikings, has to say about it.'
    },
    cs =
    {
        title   = 'Lars, zámečník',
        name    = 'Neznámý soupeř',
        diary   = 'Deník',

        msg1    = 'Ansgar a Knut se na našem Ostrově věčného sněhu dohodli, že tentokrát půjde můj otec se mnou na poslední šedý ostrov, a Ansgar zůstane s našimi ženami a dětmi. Knut vzal sebou Larse, který je sice ve pokročilém věku a už není povinen sloužit v armádě, ale požádal o účast a přesvědčil mého otce tím, že dokáže vyrobit téměř jakékoliv nářadí ze dřeva a železa.\n\nBudu rád, když budeme mít šedé ostrovy za sebou. Není tu žádné přímé sluneční světlo, žádná zelená krajina, žádné modré vody, jen mlhavá a smrdící směs hnědých a tmavě červených prvků. Ale byl by to první ostrov, na kterém by nebyli žádní nepřátelé.\n\nNa tomto prostorném ostrově jsme každý třetí měsíc strávili jeden den naší oblíbenou činností, kopáním do plstěných míčků. Plstěný pytel naplněný látkou, o průměru přibližně jeden metr, je kopán vpřed dvěma týmy po 200 mužích, přičemž každý tým se snaží kopnout svůj plstěný míč mezi dvě označené stromy.',
        msg2    = 'Můj otec mi na základě mé otázky o jeho předchůdci Prainnu něco pověděl. Byl to mladý, ale chytrý myslitel a mimořádně nadaný strategický král. Bohužel měl výbušnou povahu a byl i trochu arogantní, takže i přes všechno dobré, co udělal pro nás Vikingy, nebyl mezi lidmi příliš oblíbený.\n\nKdyž v záchvatu hněvu zabil muže, jehož zprávu nechtěl slyšet, musel odstoupit ze svého úřadu a opustit náš lid. Mnozí, kteří s ním mysleli stejně, odešli s ním. Poté byl zbytek lidu požádán o volbu nového krále, a na Ansgarovu doporučení byl bývalý pekař Knut zvolen novým králem Knutem. Bylo to pro něj velké překvapení a šok.\n\nO dopise, který jsem našel v čínském táboře, kde tento Prainn byl pozván na mou domovskou ostrov, Ostrov shromáždění, aby tam něco zorganizoval, jsem otci neřekl. Mám pocit, že se s tímto člověkem ještě setkáme, a on nám může mnoho vysvětlit o současné válce.',
        msg3    = 'Náš špeh Halvar se vrátil ze svého průzkumu celý vzrušený! Ostrov je doslova plný nepřátel, kteří se pohybují jednotně směrem k nám. Jelikož terén nenabízí žádnou ochranu, měli bychom okamžitě začít ustupovat se vším, co můžeme přepravit.\n\nHalvar objevil místo na jihozápadě ostrova, které je ještě neobjevené, a naléhavě nám doporučil, abychom tam co nejrychleji utekli. Tam by bylo nějaké krytí a dostatek surovin, abychom se mohli připravit na bitvu, která nevyhnutelně přijde.',
        msg4    = 'Je nejvyšší čas, abychom отсud zmizeli! Nepřátelé přicházejí téměř ze všech stran a nejsme dost silní, ani dostatečně chráněni, abychom jim odolali. Musíme postavit sklad na jihozápadě ostrova a doufat, že tam dostaneme co nejvíce nářadí.',
        msg5    = 'Byla to šílená honička, ale tady máme šanci na přežití! Terén není příliš prostorný, ale nabízí suroviny a přirozenou ochranu. Měli bychom se tu usadit a tuto oblast co nejlépe bránit Thorbenovými katapulty a Aronovými pevnostmi kolem nás.\nPak musíme zjistit, jaké uhlí, železo a zlato je k dispozici v kopcích kolem nás, abychom nastartovali naši ekonomiku. Darvi, Bjarki a Elvor už netrpělivě čekají na své oblíbené dílny, aby se mohli pustit do práce. A Lars je také připraven ukázat své řemeslné schopnosti v praxi. A především potřebujeme Sigvaldiho pivo, náš tekutý motivátor ve všech bitvách proti našim nepřátelům.',
        msg6    = 'Na tomto místě stály dva ze čtyř stromů, jejichž prostor mezi nimi sloužil jako cíl pro naše filcové pytle, které jsme přehazovali přes celou planinu. Mnozí z nás Vikingů si vzpomínají na nezapomenutelné hodiny během hry a na spoustu modřin, které vznikly v divokém shonu kolem této koule.\nNyní nás sem dovedly krvavé boje. Konec bitvy je na dohled, ačkoliv odpor nepřátel ještě nebyl zcela zlomen. Ale široká planina byla z větší části znovu dobyta a s těmi zbývajícími nepřáteli v okolních kopcích si ještě vyřídíme účty.\nZ našeho tábora přišla zpráva, že opět byl omylem zničen jeden z Elvorových kovadlín. Nařídil jsem dvěma našim vojákům, aby v kouřících troskách nepřátelských budov hledali použitelnou náhradu a přinesli ji do našeho tábora.',
        msg99   = 'Konečně byla i tato bitva vyhraná v náš prospěch a poslední šedý ostrov byl znovu dobyt. Můj otec byl zjevně zasažen, když v posledním zničeném hlavním štábu uviděl hledací oznámení o osobě jménem Ahasversos. Ansgar a já jsme těmto hledacím oznámením už byli obeznámeni, ale nikdy jsme o nich s mým otcem nemluvili.\nOn jen řekl, že o tomto Ahasversos musí mluvit se mnou a Ansgarem. Upřímně jsem zvědavý, co mi k tomu řekne jako otec a král Vikingů.'
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
    rttr:GetPlayer(2):SetNation(NAT_BABYLONIANS)
    rttr:GetPlayer(3):SetNation(NAT_AFRICANS)
    rttr:GetPlayer(4):SetNation(NAT_ROMANS)

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
        addExtraSoldiers(2, 10)
        addExtraBoards(3, 100)
        addExtraSoldiers(4, 10)
        addExtraBoards(4, 50)
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
        rttr:GetWorld():AddStaticObject(13,  8, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(95, 92, 0, 0, 1)
        rttr:GetWorld():AddStaticObject( 4, 40, 0, 0, 1)
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
    end

    if (p ~= 0 and not onLoad) then
        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 50,
            [GD_BOARDS    ] = 30,
            [GD_STONES    ] = 30,
            [GD_HAM       ] = 5,
            [GD_GRAIN     ] = 5,
            [GD_FLOUR     ] = 5,

            [GD_FISH      ] = 8,
            [GD_MEAT      ] = 8,
            [GD_BREAD     ] = 8,
            [GD_WATER     ] = 8,
            [GD_BEER      ] = 0,
            [GD_COAL      ] = 15,

            [GD_IRONORE   ] = 15,
            [GD_GOLD      ] = 2,
            [GD_IRON      ] = 10,
            [GD_COINS     ] = 2,
            [GD_TONGS     ] = 1,
            [GD_AXE       ] = 5,

            [GD_SAW       ] = 5,
            [GD_PICKAXE   ] = 5,
            [GD_HAMMER    ] = 16,
            [GD_SHOVEL    ] = 5,
            [GD_CRUCIBLE  ] = 4,
            [GD_RODANDLINE] = 5,

            [GD_SCYTHE    ] = 8,
            [GD_CLEAVER   ] = 2,
            [GD_ROLLINGPIN] = 2,
            [GD_BOW       ] = 5,
            [GD_SWORD     ] = 5,
            [GD_SHIELD    ] = 5,

            [GD_BOAT      ] = 8
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 80,
            [JOB_BUILDER            ] = 10,
            [JOB_PLANER             ] = 6,
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

            [JOB_PACKDONKEY         ] = 30,
            [JOB_CHARBURNER         ] = 0,

            [JOB_PRIVATE            ] = 40,
            [JOB_PRIVATEFIRSTCLASS  ] = 6,
            [JOB_SERGEANT           ] = 4,
            [JOB_OFFICER            ] = 2,
            [JOB_GENERAL            ] = 1
        })
    elseif (p == 0 and not onLoad) then
        rttr:GetPlayer(p):ClearResources()
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD      ] = 20,
            [GD_BOARDS    ] = 40,
            [GD_STONES    ] = 20,
            [GD_HAM       ] = 30,
            [GD_GRAIN     ] = 4,
            [GD_FLOUR     ] = 4,

            [GD_FISH      ] = 8,
            [GD_MEAT      ] = 8,
            [GD_BREAD     ] = 8,
            [GD_WATER     ] = 0,
            [GD_BEER      ] = 0,
            [GD_COAL      ] = 15,

            [GD_IRONORE   ] = 8,
            [GD_GOLD      ] = 8,
            [GD_IRON      ] = 15,
            [GD_COINS     ] = 2,
            [GD_TONGS     ] = 0,
            [GD_AXE       ] = 2,

            [GD_SAW       ] = 4,
            [GD_PICKAXE   ] = 2,
            [GD_HAMMER    ] = 10,
            [GD_SHOVEL    ] = 2,
            [GD_CRUCIBLE  ] = 4,
            [GD_RODANDLINE] = 4,

            [GD_SCYTHE    ] = 6,
            [GD_CLEAVER   ] = 0,
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
            [JOB_FARMER             ] = 2,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,

            [JOB_MILLER             ] = 2,
            [JOB_BAKER              ] = 2,
            [JOB_BUTCHER            ] = 1,
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

            [JOB_PRIVATE            ] = 50,
            [JOB_PRIVATEFIRSTCLASS  ] = 1,
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

    if (eState[3] > 0 and GetNumMilitaryBuilding(0, true) == 2) then
        -- EVENT3
        MissionEvent(3, false)
    end

    if ((GetNumStorage(1) + GetNumStorage(2) + GetNumStorage(3) + GetNumStorage(4)) < 1) then
        -- EVENT8 (maps to 99)
        MissionEvent(99, false)
    end
end

function onOccupied(p, x, y)
    if(p ~= 0) then return end

    if(eState[4] > 0 and x == 22 and y == 63) then
        -- EVENT4
        MissionEvent(4, false)
    end

    if(eState[5] > 0 and x == 12 and y == 75) then
        -- EVENT5
        MissionEvent(5, false)
    end

    if(eState[6] > 0 and x == 73 and y == 48) then
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
        rttr:GetPlayer(0):AddWares({
            [GD_PICKAXE ] = 10
        })

    elseif(e == 4 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_FISH    ] = 10,
            [GD_MEAT    ] = 10
        })

    elseif(e == 5) then
        rttr:GetPlayer(0):EnableBuilding(BLD_METALWORKS, not onLoad)

        if(not onLoad) then
            rttr:GetPlayer(0):AddPeople({
                [JOB_METALWORKER] = 1
            })
        end
    elseif(e == 6 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_COAL    ] = 10,
            [GD_GOLD    ] = 10
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