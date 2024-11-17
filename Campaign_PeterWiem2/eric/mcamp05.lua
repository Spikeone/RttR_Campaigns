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
        title   = 'Ymir, der Landwirt',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = 'Durch eine Untiefe wurde unser Schiff stark beschädigt, und wir mussten notgedrungen an Land. Eigentlich gehen wir davon aus, dass es auf dieser kleinen Insel keine Feinde gibt. Trotzdem haben wir einen recht gut verborgenen Hafen gesucht und gefunden, und uns erst einmal hier niedergelassen.\n\nAnsgar war schon einmal auf dieser Insel, um nach Gold zu suchen, und er weiß im äußersten Südwesten um einen abgelegenen Vulkan, der reichliche Bodenschätze verspricht. Normalerweise machen unsere Feinde einen großen Bogen um aktive Vulkane, aber nach meinen Erfahrungen auf unseren letzten Inseln bin ich mir da nicht mehr so sicher.\n\nUnser pflichtbewusster Ymir hat gleich seine Wintergerste ausgesät und wartet nun gespannt auf das Ergebnis. Halvar ist auch schon fleißig dabei, die Gegend zu erkunden. Nur Ole, Bjarki, Elvor, Darvi und Aron machen lange Gesichter, da es hier bis auf ein Hafengebäude momentan keinen Platz für größere Gebäude zu haben scheint.',
        msg2    = 'Halvar fasst seine bisherigen Erkundungen mit dem Gedanken zusammen, das ihm selten eine solche unwirtliche und lebensfeindliche Insel begegnet ist. Man könne quasi keine hundert Meter geradeaus laufen, weil entweder ein Steinhaufen, ein Baum oder ein Wasserlauf im Weg sei.\n\nHier wird wohl das Schiff eine große Rolle spielen müssen. Allerdings scheint beileibe nicht jeder Wasserweg schiffbar, es gibt immer mal wieder Engstellen, Untiefen und Landzungen, wo ein Schiff stranden könnte. Ole überlegt indessen schon laut, wo er gerne seine Werft hinhaben möchte.\n\nNebenbei bemerkt ist diese Insel voll von Hasen und die zahlreichen Gewässer darin voller Fische. Wir schauen, dass wir den großen Kohlefelsen im Süden gewinnen und gründlich ausräumen. Leider ist der Weg nach Süden und nach Osten recht schwierig und hindernisreich.',
        msg3    = 'Diese Insel steckt wirklich voller Überraschungen! Wir sind uns nicht sicher, ob unsere nördliche Anlegestelle bemerkt worden ist, weil wir Schiffsbewegungen in der näheren Umgebung bemerkt haben. Wir wissen auch nicht, ob es klug ist, auf dieser Wasserstraße mit dem Schiff nach geeigneten Häfen Ausschau zu halten, weil wir wahrscheinlich nicht die einzigen Schiffe wären, die dort entlangsegeln.\n\nAber im Süden blieb es bisher ruhig, und vielleicht hilft uns dort ein zweiter Hafen, um Land zu gewinnen? Außerdem habe ich im Hinterkopf, dem Vulkan und seinen Bodenschätze einen Besuch abzustatten. Die könnten ungefähr in der Richtung liegen, die wir weiter verfolgen wollen.',
        msg4    = 'Wir sind längst entdeckt worden, aber wir konnten uns bisher ganz gut einrichten. Ymir hat zu meiner Freude erklärt, dass die Wintergerste und auch der Hopfen auf geeigneten Böden gut wächst und auch guten Ertrag verspricht. Er würde den Versuch wagen, diese Gerste im größeren Stil anzubauen. Außerdem vermisst er, wie wir alle, das Bier, welches ihm gut gemundet hat, und was auch zur Stärkung unserer militärischen Schlagkraft beigetragen hat.\n\nYmir würde es sich zutrauen, jemanden zum Bierbrauen einzulernen, da er damit auf unseren grünen Inseln schon etwas Erfahrung sammeln durfte. Nur bräuchte er ein geeigneten Platz, wo man auch Getreidefelder anlegen könnte, einen Wasserbrunnen und ein Gebäude, welches er als Brauhaus nützen könnte. Gesagt, getan!',
        msg5    = 'Viel Platz gibt es hier nicht, deshalb haben wir schon ein handverlesenes Stückchen Land gebraucht, um hier eine erfolgversprechende Landwirtschaft aufbauen zu können. Dagegen ist der Bau einer Brauerei geradezu ein Kinderspiel.\n\nYmir hat sich Sigvaldi als zukünftigen Brauer ausgeguckt. Sigvaldi ist unter seinem Spitznamen Walross unter uns ein Begriff, gibt es bei uns doch niemand sonst, der solch eine Leibesfülle hat. Wir werden sehen, was er zustande bringt.\n\nEin Brunnen war schnell gebohrt, Kristjan darf ihn jetzt Tag und Nacht bedienen, damit Sigvaldi seine Gerste auch wässern kann.',
        msg6    = 'Inzwischen wissen wir mit Sicherheit, dass die Insel besetzt ist und wo die feindlichen babylonischen Hauptquartiere sich befinden müssen. Sie liegen auf einer östlich gelegenen Ebene, von wo sie sich vor allem per Schiff quasi überallhin ausgebreitet haben. Aber wir müssen und wir werden sie besiegen, wir wissen nur nicht, wie dieser Weg im Detail aussehen wird.\n\nAus meinem eigenen Sold habe ich meine Münzen an die Soldaten verschenkt, damit sie standhalten können, wenn es darauf ankommt. Sigvaldis Gebräu schäumt und schmeckt schrecklich, aber es wirkt.',
        msg99   = 'Und wieder ist eine Insel weniger in Feindeshand. Dabei waren wir uns anfangs gar nicht sicher, ob diese Insel vom Feind besetzt worden ist, oder nicht. Der östliche Teil der Insel ist tatsächlich der einzige Platz hier, wo man nicht andauernd um Hindernisse herumlaufen muss. Aber so viele Fische und Hasen auf einem Haufen muss es auch erst einmal geben.\n\nJetzt wollen wir uns eine größere graue Insel in der Nähe genauer anschauen, von der wir wissen, dass sie ausgezeichnete Hafenplätze in Menge vorweisen kann. Es würde uns nach den bisher gemachten Erfahrungen wundern, wenn ausgerechnet diese Insel nicht besetzt worden wäre.',
    },
    en =
    {
        title   = 'Ymir, the farmer',
        name    = 'Enemy Unknown',
        diary   = 'Diary',

        msg1    = 'Our ship was severely damaged by a shoal, and we were forced to land. We assume that there are no enemies on this small island. Still, we searched for and found a well-hidden harbor, and have settled here for the time being.\n\nAnsgar has been to this island before, looking for gold, and he knows of a remote volcano in the far southwest that promises abundant resources. Normally, our enemies avoid active volcanoes, but after my experiences on our last islands, I´m no longer so sure about that.\n\nOur diligent Ymir has already sown his winter barley and is now eagerly awaiting the results. Halvar is busy exploring the area. Only Ole, Bjarki, Elvor, Darvi, and Aron are looking unhappy, as there doesn´t seem to be space for larger buildings here, except for a harbor building.',
        msg2    = 'Halvar summarizes his previous explorations with the thought that he has rarely encountered such a barren and inhospitable island. One can hardly walk a hundred meters straight without being obstructed by either a pile of stones, a tree, or a waterway.\n\nHere, the ship will likely have to play a major role. However, it seems that not every waterway is navigable; there are occasional narrow passages, shoals, and landmasses where a ship could run aground. Meanwhile, Ole is already loudly considering where he would like to have his shipyard.\n\nBy the way, this island is full of rabbits, and the numerous bodies of water are teeming with fish. We´re focusing on gaining control of the large coal rock in the south and thoroughly exploiting it. Unfortunately, the path to the south and east is quite difficult and obstructed.',
        msg3    = 'This island is truly full of surprises! We´re not sure if our northern docking station has been noticed, as we´ve observed ship movements in the nearby area. We also don´t know if it´s wise to search for suitable harbors along this waterway, because we probably wouldn´t be the only ships sailing through there.\n\nBut so far, the south has remained quiet, and perhaps a second harbor there could help us gain land? Additionally, I have in mind to pay a visit to the volcano and its resources. They might be roughly in the direction we want to pursue.',
        msg4    = 'We have long been discovered, but so far we´ve managed to settle in quite well. To my delight, Ymir has explained that the winter barley and the hops grow well on suitable soils and promise a good yield. He would try to plant the barley on a larger scale. Moreover, he, like all of us, misses the beer, which has also strengthened our military might and tasted good to him.\n\nYmir believes he could teach someone to brew beer, as he has some experience with it from our green islands. However, he would need a suitable place where grain fields could be planted, a water well, and a building that he could use as a brewery. So, we set to work!',
        msg5    = 'There isn´t much space here, so we had to select a carefully chosen piece of land to build a promising agriculture. In comparison, building a brewery is almost child’s play.\n\nYmir has picked Sigvaldi as the future brewer. Sigvaldi, known by his nickname Walross among us, is well-known, as there’s no one else around with such a robust physique. We will see what he can accomplish.\n\nA well was quickly dug, and Kristjan is now tasked with maintaining it day and night so that Sigvaldi can water his barley.',
        msg6    = 'In the meantime, we know for sure that the island is occupied and where the enemy Babylonian headquarters must be located. They lie on an eastern plateau, from where they have spread out almost everywhere by ship. But we must, and we will, defeat them-we just don’t know exactly how this path will look in detail.\n\nFrom my own pay, I have given my coins to the soldiers so they can hold out when it matters. Sigvaldi’s brew foams and tastes terrible, but it works.',
        msg99   = 'And once again, one less island in enemy hands. In the beginning, we weren’t even sure if this island had been occupied by the enemy or not. The eastern part of the island is actually the only place here where you don’t constantly have to walk around obstacles. But there must be quite a few fish and rabbits on one heap.\n\nNow we want to take a closer look at a larger grey island nearby, of which we know it has an abundance of excellent harbor spots. Based on our past experiences, it would surprise us if this island hadn’t been occupied.',
    },
    cs =
    {
        title   = 'Ymir, farmář',
        name    = 'Neznámý soupeř',
        diary   = 'Deník',

        msg1    = 'Naše loď byla vážně poškozena mělčinou, a museli jsme nouzově přistát. Předpokládáme, že na tomto malém ostrově nejsou žádní nepřátelé. I přesto jsme hledali a našli dobře skrytý přístav, a usadili jsme se zde na čas.\n\nAnsgar už na tomto ostrově byl, aby hledal zlato, a ví o odlehlém vulkánu na dalekém jihozápadě, který slibuje bohaté přírodní zdroje. Obvykle se naši nepřátelé velkým obloukem vyhýbají aktivním vulkánům, ale po mých zkušenostech z našich posledních ostrovů už si tím tak jistý nejsem.\n\nNáš pilný Ymir už zasel svou zimní ječmen a nyní netrpělivě čeká na výsledky. Halvar už pilně zkoumá okolí. Jen Ole, Bjarki, Elvor, Darvi a Aron mají dlouhé obličeje, protože zde kromě přístavní budovy zatím není místo pro větší stavby.',
        msg2    = 'Halvar shrnuje své dosavadní průzkumy s myšlenkou, že se mu málokdy stalo, že by narazil na tak nehostinný a nepřívětivý ostrov. Sotva je možné jít sto metrů rovně, aniž by v cestě nebyl nějaký hromada kamenů, strom nebo vodní tok.\n\nZde bude loď pravděpodobně hrát velkou roli. Zdá se však, že ne každá vodní cesta je sjízdná; občas jsou úzké průchody, mělčiny a poloostrovy, kde by loď mohla uvíznout. Mezitím Ole už nahlas uvažuje, kam by rád postavil svou loděnici.\n\nMimochodem, tento ostrov je plný králíků a četné vodní plochy jsou plné ryb. Snažíme se získat velký uhelný skalní masiv na jihu a důkladně ho vyčerpat. Bohužel cesta na jih a na východ je poměrně obtížná a plná překážek.',
        msg3    = 'Tento ostrov je opravdu plný překvapení! Nejsme si jisti, zda byla naše severní přistávací stanice zaznamenána, protože jsme si všimli pohybu lodí v blízkém okolí. Také nevíme, zda je rozumné hledat vhodné přístavy podél této vodní cesty, protože pravděpodobně nejsme jediní, kdo by po ní plul.\n\nNa jihu však zatím panuje klid a možná nám tam druhý přístav pomůže získat území? Mimochodem, mám na paměti, že bychom navštívili sopku a její přírodní bohatství. Mohly by být zhruba v směru, který chceme dál sledovat.',
        msg4    = 'Byli jsme už dávno objeveni, ale zatím jsme se dokázali dobře usadit. K mé radosti Ymir vysvětlil, že zimní ječmen a chmel rostou na vhodných půdách dobře a slibují dobrý výnos. Pokusil by se pěstovat ječmen ve větším měřítku. Navíc nám všem, stejně jako jemu, chybí pivo, které nám také přispělo k posílení vojenské síly a které mu chutnalo.\n\nYmir by si troufl někoho naučit vařit pivo, protože s tím má už nějaké zkušenosti z našich zelených ostrovů. Potřeboval by však vhodné místo, kde by se dala pěstovat obilná pole, studnu na vodu a budovu, kterou by mohl použít jako pivovar. Tak jsme se do toho pustili!',
        msg5    = 'Tady není moc místa, takže jsme museli vybrat pečlivě vybrané kousky země, abychom zde mohli vybudovat slibné zemědělství. Naopak stavba pivovaru je téměř hračka.\n\nYmir si jako budoucího sládka vybral Sigvaldiho. Sigvaldi, známý u nás pod přezdívkou Walross, je u nás pojem, protože nikdo jiný nemá takovou tělesnou stavbu. Uvidíme, co dokáže.\n\nStudna byla rychle vyhloubena a Kristjan ji nyní bude obsluhovat ve dne v noci, aby Sigvaldi mohl zalévat svůj ječmen.',
        msg6    = 'Mezitím víme s jistotou, že je ostrov obsazen a kde se nacházejí hlavní štáby nepřátelských Babylonců. Leží na východní plošině, odkud se rozšířili téměř všude po moři. Ale musíme, a porazíme je, jen nevíme, jak bude vypadat cesta k vítězství v detailech.\n\nZe svého vlastního platu jsem rozdával své mince vojákům, aby vydrželi, když to bude potřeba. Sigvaldiho pivo pěnivě šumí a chutná strašně, ale funguje.',
        msg99   = 'A opět je jedna ostrov méně v rukou nepřítele. Zpočátku jsme si ani nebyli jisti, zda tento ostrov byl obsazen nepřítelem, nebo ne. Východní část ostrova je skutečně jediné místo, kde nemusíte neustále obcházet překážky. Ale tolik ryb a králíků na jednom hromadě to taky není jen tak.\n\nTeď se chceme podívat na větší šedý ostrov v blízkosti, o kterém víme, že má spoustu vynikajících přístavů. Na základě našich dosavadních zkušeností by nás překvapilo, kdyby tento ostrov nebyl obsazen.',
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
    rttr:GetPlayer(1):SetNation(NAT_BABYLONIANS)
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
        rttr:GetWorld():AddStaticObject(35, 38, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(22,  2, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(19, 63, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(46, 19, 0, 0, 1)
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
            [GD_BOARDS    ] = 10,
            [GD_STONES    ] = 10,
            [GD_HAM       ] = 0,
            [GD_GRAIN     ] = 0,
            [GD_FLOUR     ] = 0,

            [GD_FISH      ] = 2,
            [GD_MEAT      ] = 2,
            [GD_BREAD     ] = 2,
            [GD_WATER     ] = 0,
            [GD_BEER      ] = 10,
            [GD_COAL      ] = 8,

            [GD_IRONORE   ] = 8,
            [GD_GOLD      ] = 4,
            [GD_IRON      ] = 8,
            [GD_COINS     ] = 8,
            [GD_TONGS     ] = 0,
            [GD_AXE       ] = 6,

            [GD_SAW       ] = 2,
            [GD_PICKAXE   ] = 8,
            [GD_HAMMER    ] = 14,
            [GD_SHOVEL    ] = 0,
            [GD_CRUCIBLE  ] = 3,
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
            [JOB_MINTER             ] = 1,
            [JOB_METALWORKER        ] = 0,
            [JOB_SHIPWRIGHT         ] = 1,
            [JOB_GEOLOGIST          ] = 5,
            [JOB_SCOUT              ] = 2,

            [JOB_PACKDONKEY         ] = 9,
            [JOB_CHARBURNER         ] = 0,
    

            [JOB_PRIVATE            ] = 20,
            [JOB_PRIVATEFIRSTCLASS  ] = 10,
            [JOB_SERGEANT           ] = 5,
            [JOB_OFFICER            ] = 3,
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
    
    if (eState[3] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_HARBORBUILDING) > 0) then
        -- EVENT3
        MissionEvent(3, false)
    end

    local milBuildingCount = GetNumMilitaryBuilding(0, true)

    if (eState[4] > 0 and milBuildingCount >= 5) then
        -- EVENT4
        MissionEvent(4, false)
    end

    if (eState[5] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_FARM) > 0) then
        -- EVENT5
        MissionEvent(5, false)
    end

    if (eState[6] > 0 and milBuildingCount >= 10) then
        -- EVENT6
        MissionEvent(6, false)
    end

    if ((GetNumStorage(1) + GetNumStorage(2)) < 1) then
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
        rttr:GetPlayer(0):AddWares({
                [GD_HAM] = 20,
                [GD_FISH] = 20
            })

    elseif(e == 3 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
                [GD_RODANDLINE] = 2,
                [GD_PICKAXE] = 2,
                [GD_AXE] = 2
            })
        rttr:GetPlayer(0):AddPeople({
                [JOB_HUNTER] = 2
            })

    elseif(e == 4) then
        rttr:GetPlayer(0):EnableBuilding(BLD_FARM, not onLoad)
        rttr:GetPlayer(0):EnableBuilding(BLD_BREWERY, not onLoad)
        rttr:GetPlayer(0):EnableBuilding(BLD_WELL, not onLoad)

        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({
                    [GD_SCYTHE] = 1
                })
        end

    elseif(e == 5 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
                [GD_BEER] = 5
            })

    elseif(e == 6 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
                [GD_COINS] = 20
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