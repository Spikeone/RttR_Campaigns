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
        title   = 'Ymir, the Farmer',
        name    = 'Unknown Enemy',
        diary   = 'Diary',

        msg1    = 'Our ship was badly damaged by a shoal and we had to get ashore quickly. We actually assumed that there were no enemies on this small island. Nevertheless, we searched for and found a well-hidden harbor within a few minutes and settled here for the time being.\n\nAnsgar has been to this island before to look for gold, and he knows of a remote volcano in the far southwest that promises rich mineral resources. Normally our enemies give active volcanoes a wide berth, but after my experiences on our last islands, I\'m not so sure.\n\nOur dutiful Ymir has sown his winter barley and is now eagerly awaiting the results. Halvar is also busy exploring the area. Only Ole, Bjarki, Elvor, Darvi and Aron are making long faces, as there doesn\'t seem to be any room for larger buildings here at the moment, apart from a harbor building.',
        msg2    = 'Halvar summarizes his explorations so far with the thought that he has never encountered such an inhospitable and hostile island. You couldn\'t walk a hundred meters straight ahead because there was either a pile of stones, a tree or a stream in the way.\n\nThe ship will probably have to play a major role here. However, not every waterway seems to be navigable; there are always narrow places, shallows and headlands where a ship could get stranded. Meanwhile, Ole is already thinking out loud about where he would like his shipyard to be.\n\nIncidentally, this island is full of rabbits and the numerous waters are full of fish. We make sure that we win the large coal rock in the south and clear it out thoroughly. Unfortunately, the path to the south and east in particular is quite difficult and full of obstacles. And nothing works on foot to the west. We only make some progress to the north.',
        msg3    = 'This island really is full of surprises! We are not sure whether our mooring has been noticed because we have noticed ship movements in the immediate vicinity. We also don\'t know whether it\'s wise to look for suitable harbors on these waterways by boat, because we probably wouldn\'t be the only ships sailing along there.\n\nBut it\'s been quiet in the south so far, and maybe a port there will help us gain land? I\'m also thinking of paying a visit to the volcano and its mineral resources. They could lie roughly in the direction we want to pursue.',
        msg4    = 'We\'ve probably already been discovered, but so far we\'ve managed to settle in quite well. To my delight, Ymir explained that winter barley and hops grow well in suitable soil and promise a good yield. He would like to try growing barley on a larger scale. Like all of us, he also misses the beer, which he enjoyed and which also contributed significantly to strengthening our military power.\n\nYmir would have the confidence to train someone to brew beer, as he has already gained some experience with it on our green islands. The only thing he would need is a suitable place to plant grain fields, a water well and a building that he could use as a brewery.',
        msg5    = 'There isn\'t much space here, so we need a hand-picked piece of land to be able to set up a promising farm. Building a brewery, on the other hand, is child\'s play because it requires much less space.\n\nYmir has chosen Sigvaldi as his future brewer. Sigvaldi is a household name among us under his nickname Walrus, as there is no one else with such a full body. We\'ll see what he can do.\n\nA well is quickly drilled and Kristjan is allowed to work it day and night so that Sigvaldi can water his barley.',
        msg6    = 'We now know with certainty where the enemy Babylonian headquarters must be located. They are on a plain to the east, from where they have spread almost everywhere, especially by ship. But we must and we will defeat them, we just don\'t know what that route will look like in detail.\n\nFrom my own pay, I have given away my coins to the soldiers so that they can hold out when it counts. Sigvaldi\'s brew foams and tastes terrible, but it works.\n\nOur blacksmith Elvor has finished the next anvil. I visited him in his forge, admired the wreckage of our former anvil and advised Elvor to use his forge hammer with either less force or less momentum. Elvor was contrite about the new loss and promised to curb his drive a little.',
        msg99   = 'And yet another island is one less in enemy hands. At first we weren\'t even sure whether this island had been occupied by the enemy or not. The eastern part of the island is actually the only place here where you don\'t have to run around obstacles all the time. But there have to be so many fish and rabbits in one place.\n\nAnsgar has rowed back to my father Knut\'s gorge island with a boat and two of our men to tell him and our wives and children the news of our victory.\n\nNow we want to take a closer look at a larger gray island nearby, which we know has plenty of excellent harbor spots. Based on our experiences so far, we would be surprised if this island of all places had not been occupied.'
    },
    de =
    {
        title   = 'Ymir, der Landwirt',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = 'Durch eine Untiefe wurde unser Schiff stark beschädigt, und wir mussten notgedrungen schnell an Land. Eigentlich gehen wir davon aus, dass es auf dieser kleinen Insel keine Feinde gibt. Trotzdem haben wir innerhalb weniger Minuten einen recht gut verborgenen Hafen gesucht und gefunden, und uns erst einmal hier niedergelassen.\n\nAnsgar war schon einmal auf dieser Insel, um nach Gold zu suchen, und er weiß im äußersten Südwesten um einen abgelegenen Vulkan, der reichliche Bodenschätze verspricht. Normalerweise machen unsere Feinde einen großen Bogen um aktive Vulkane, aber nach meinen Erfahrungen auf unseren letzten Inseln bin ich mir da nicht mehr so sicher.\n\nUnser pflichtbewusster Ymir hat gleich seine Wintergerste ausgesät und wartet nun gespannt auf das Ergebnis. Halvar ist auch schon fleißig dabei, die Gegend zu erkunden. Nur Ole, Bjarki, Elvor, Darvi und Aron machen lange Gesichter, da es hier bis auf ein Hafengebäude momentan keinen Platz für größere Gebäude zu haben scheint.',
        msg2    = 'Halvar fasst seine bisherigen Erkundungen mit dem Gedanken zusammen, das ihm noch nie eine solche unwirtliche und lebensfeindliche Insel begegnet ist. Man könne quasi keine hundert Meter geradeaus laufen, weil entweder ein Steinhaufen, ein Baum oder ein Wasserlauf im Weg sei.\n\nHier wird wohl das Schiff eine große Rolle spielen müssen. Allerdings scheint beileibe nicht jeder Wasserweg schiffbar, es gibt immer mal wieder Engstellen, Untiefen und Landzungen, wo ein Schiff stranden könnte. Ole überlegt indessen schon laut, wo er gerne seine Werft hinhaben möchte.\n\nNebenbei bemerkt ist diese Insel voll von Hasen und die überaus zahlreichen Gewässer darin voller Fische. Wir schauen, dass wir den großen Kohlefelsen im Süden gewinnen und gründlich ausräumen. Leider ist der Weg besonders nach Süden und nach Osten recht schwierig und hindernisreich. Und in Richtung Westen geht zu Fuß gar nichts. Nur Richtung Norden kommt man einigermaßen voran.',
        msg3    = 'Diese Insel steckt wirklich voller Überraschungen! Wir sind uns nicht sicher, ob unsere Anlegestelle bemerkt worden ist, weil wir Schiffsbewegungen in der näheren Umgebung bemerkt haben. Wir wissen auch nicht, ob es klug ist, auf diesen Wasserstraßen mit dem Schiff nach geeigneten Häfen Ausschau zu halten, weil wir wahrscheinlich nicht die einzigen Schiffe wären, die dort entlangsegeln.\n\nAber im Süden blieb es bisher ruhig, und vielleicht hilft uns dort ein Hafen, um Land zu gewinnen? Außerdem habe ich im Hinterkopf, dem Vulkan und seinen Bodenschätze einen Besuch abzustatten. Die könnten ungefähr in der Richtung liegen, die wir weiter verfolgen wollen.',
        msg4    = 'Wir sind wahrscheinlich schon entdeckt worden, aber wir konnten uns bisher ganz gut einrichten. Ymir hat zu meiner Freude erklärt, dass die Wintergerste und auch der Hopfen auf geeigneten Böden gut wachsen und auch guten Ertrag versprechen. Er würde den Versuch wagen, die Gerste im größeren Stil anzubauen. Außerdem vermisst er, wie wir alle, das Bier, welches ihm gut gemundet hat, und was auch erheblich zur Stärkung unserer militärischen Schlagkraft beigetragen hat.\n\nYmir würde es sich zutrauen, jemanden zum Bierbrauen einzulernen, da er damit auf unseren grünen Inseln schon etwas Erfahrung sammeln durfte. Nur bräuchte er ein geeigneten Platz, wo man auch Getreidefelder anlegen könnte, einen Wasserbrunnen und ein Gebäude, welches er als Brauhaus nützen könnte.',
        msg5    = 'Viel Platz gibt es hier nicht, deshalb brauchen wir schon ein handverlesenes Stückchen Land, um hier eine erfolgversprechende Landwirtschaft aufbauen zu können. Dagegen ist der Bau einer Brauerei geradezu ein Kinderspiel, weil sie viel weniger Platz benötigt.\n\nYmir hat sich Sigvaldi als zukünftigen Brauer ausgeguckt. Sigvaldi ist unter seinem Spitznamen Walross unter uns ein Begriff, gibt es bei uns doch niemand sonst, der solch eine Leibesfülle hat. Wir werden sehen, was er zustande bringt.\n\nEin Brunnen ist schnell gebohrt, Kristjan darf ihn Tag und Nacht bedienen, damit Sigvaldi seine Gerste auch wässern kann.',
        msg6    = 'Inzwischen wissen wir mit Sicherheit, wo die feindlichen babylonischen Hauptquartiere sich befinden müssen. Sie liegen auf einer östlich gelegenen Ebene, von wo sie sich vor allem per Schiff quasi überallhin ausgebreitet haben. Aber wir müssen und wir werden sie besiegen, wir wissen nur nicht, wie dieser Weg im Detail aussehen wird.\n\nAus meinem eigenen Sold habe ich meine Münzen an die Soldaten verschenkt, damit sie standhalten können, wenn es darauf ankommt. Sigvaldis Gebräu schäumt und schmeckt schrecklich, aber es wirkt.\n\nUnser Schmied Elvor hat den nächsten Amboss erledigt. Ich habe ihn in seiner Schmiede besucht, die Trümmer unseres ehemaligen Ambosses bewundert und Elvor geraten, seinen Schmiedehammer entweder mit weniger Kraft oder mit weniger Schwung zu gebrauchen. Elvor war zerknirscht über den erneuten Verlust und versprach, seinen Tatendrang etwas zu zügeln.',
        msg99   = 'Und wieder ist eine Insel weniger in Feindeshand. Dabei waren wir uns anfangs gar nicht sicher, ob diese Insel vom Feind besetzt worden ist, oder nicht. Der östliche Teil der Insel ist tatsächlich der einzige Platz hier, wo man nicht andauernd um Hindernisse herumlaufen muss. Aber so viele Fische und Hasen auf einem Haufen muss es auch erst einmal geben.\n\nAnsgar ist mit einem Boot und zwei von unseren Männern zur Schluchteninsel zu meinem Vater Knut zurückgerudert, um ihn und unseren Frauen und Kindern die Siegesbotschaft zu verkünden.\n\nJetzt wollen wir uns eine größere graue Insel in der Nähe genauer anschauen, von der wir wissen, dass sie ausgezeichnete Hafenplätze in Menge vorweisen kann. Es würde uns nach den bisher gemachten Erfahrungen wundern, wenn ausgerechnet diese Insel nicht besetzt worden wäre.'
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

    if (eState[6] > 0 and milBuildingCount >= 12) then
        -- EVENT6
        MissionEvent(6, false)
    end

    if (eState[99] > 0 and (GetNumStorage(1) + GetNumStorage(2)) < 1) then
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
                [GD_MEAT] = 20,
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
    local numBld = rttr:GetPlayer(plr):GetNumBuildings(BLD_BARRACKS) + rttr:GetPlayer(plr):GetNumBuildings(BLD_GUARDHOUSE) + rttr:GetPlayer(plr):GetNumBuildings(BLD_WATCHTOWER) + rttr:GetPlayer(plr):GetNumBuildings(BLD_FORTRESS)

    if(withHarbor) then
        numBld = numBld + rttr:GetPlayer(plr):GetNumBuildings(BLD_HARBORBUILDING)
    end

    return numBld
end

function addExtraBoards(plrId, amount)
    rttr:GetPlayer(plrId):AddWares({[GD_BOARDS] = amount})
end

function addExtraSoldiers(plrId, amount)
    rttr:GetPlayer(plrId):AddPeople({[JOB_PRIVATE] = amount})
end