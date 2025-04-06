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
        title   = 'Aron, the Castle Builder',
        name    = 'Unknown Enemy',
        diary   = 'Diary',

        msg1     = 'We had observed intensive shipping traffic in connection with this island. Among them were ships of a different design and flag than those of the Babylonians. It could therefore be possible to find other invaders on this island in addition to the Babylonians.\n\nBut we, Ansgar, Knut and I, kept this from our wives and children so that they wouldn\'t worry about us unnecessarily. That\'s why we left them on the last island with a few men and our king. Knut has to be able to fend off an enemy attack there if necessary. And he can do that because he has enough time and material to make his preparations.\n\nWe left three barrels of beer behind for our king and our families and took all the rest with us. For a soldier, beer seems to be something irreplaceable. Even our young men, who have never handled a sword and shield before, have suddenly set off into battle and fought like seasoned soldiers. That\'s why we need this beer and what\'s more, it doesn\'t taste bad!',
        msg2     = 'We have spotted a good and sheltered harbor in the nearby east, which we should be able to reach, but we have to clear the way there first.\n\nThere are some pineapple trees here, and so far even Elvor, with his bear strength, hasn\'t managed to cut one down. The trunk is thick and iron-hard, so we have to make our way around these pineapple trees. Besides, there is plenty of wood and stone here, so our stonecutters and woodcutters don\'t have to complain about a lack of work.\n\nAnsgar has set off with Halvar, a young but intelligent lad, to take a closer look at the island. They have to be careful because enemy ships and soldiers can appear anywhere.',
        msg3     = 'On a small hill in the south-west, there seems to be good, level ground to erect our necessary buildings. But we have to get there first. Elvor has been walking around with a blacksmith\'s hammer in his hand the whole time, and our ever-freezing Darvi is also longing for his high-temperature room.\n\nOur newly trained coin minter Bjarki wouldn\'t mind doing his newly learned job either. So let\'s make sure that we clear the building sites and that our miners get rich sources of raw materials.',
        msg4     = 'Our hunters have discovered Aron completely exhausted in the woods above our harbor. Aron is our master builder and we lost him while fleeing from the Babylonians. He managed to save himself here with a boat and some tools and has been living more or less on ducks, mushrooms and water.\n\nWe first gave him something to eat and some of our beer so that he could regain his strength. When he was full, he told us about at least two camps that he had discovered on this island. However, they had not been too big so far.\n\nIt is interesting to note that he had seen self-made snowmen, which were quite numerous in the northern part of the island. Since the Babylonians do not build snowmen, there must be another people on the island. This could explain the foreign ships that we have observed in connection with this island.',
        msg5     = 'Aron inspected our existing military buildings and expressed his amazement that we have come so far with them. He asked us to build a larger building so that our soldiers could stay in it with nine of them without kicking each other to death. We all like nothing better than that!\n\nAron explained how much wood and, above all, how many stones he would need. Of course, we got them for him straight away.\n\nElvor dismantled the next anvil in his forge. He is the best and strongest blacksmith I can imagine, but he could work even more effectively if he only used his forging hammer at half power. I have asked Darvi to teach him this discreetly.',
        msg6     = 'Aron has put up a box, a real house number! You can defend and attack in a completely different way with these castles. It\'s just a shame that they take up so much space, but you can\'t have everything. I think we\'ll make sure that we prefer to build fortresses like this, especially on the front lines.',
        msg7     = 'Ansgar has returned with Halvar. Both confirm the presence of a Babylonian camp, but so far it does not appear to be too dangerous. All the more reason to be wary of a large Roman supply camp in the north of the island. They are working with the Babylonians, supporting them mainly with food and weapons, and are considered to be very strong economically and militarily. They could really hurt us if it came to an open battle between us and them.\n\nIncidentally, our two have discovered a Babylonian camp near the shore on the neighboring grey island. This could be our next target after recapturing this island.\n\nHalvar and Ansgar in particular were very impressed by our newly built fortresses. He advised us to ramp up our economy and our military as much as possible and to fight the Romans on all fronts where we encountered them. But we have to be careful, because the Romans know how to wage war. So first of all, we mobilize everything that can hold a fishing rod and carry a bow so that our miners don\'t starve.',
        msg99    = 'Finally, this island is back in our hands. We will leave behind a small military base so that this island remains ours. All the craftsmen will return with us to the last island to see our king and our wives and children again.\n\nWe plan to travel with you to the gray island in the west, where Ansgar and Halvar discovered the Babylonian camp.'
    },
    de =
    {
        title   = 'Aron, der Burgenbauer',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1     = 'Wir hatten intensiven Schiffsverkehr in Verbindung mit dieser Insel beobachtet. Darunter waren auch Schiffe von anderer Bauart und anderer Beflaggung als die der Babylonier. Es könnte deshalb möglich sein, noch andere Eindringlinge zusätzlich zu den Babyloniern auf dieser Insel anzutreffen.\n\nDas haben wir, Ansgar, Knut und ich, aber unseren Frauen und Kindern verschwiegen, damit sie sich nicht unnötig Sorgen um uns machen. Deshalb haben wir sie auch mit einigen Männern und unserem König auf der letzten Insel zurückgelassen. Knut muss dort notfalls einen feindlichen Angriff abwehren können. Und das kann er, weil er genügend Zeit und Material hat, seine Vorbereitungen dafür zu treffen.\n\nUnserem König und unseren Familien haben wir drei Fässer Bier zurückgelassen, alle anderen haben wir mit uns genommen. Für einen Soldaten scheint Bier etwas Unersetzliches zu sein. Selbst unsere Jünglinge, die noch nie mit Schwert und Schild hantiert haben, sind auf einmal losgezogen in die Schlachten und haben wie gestandene Soldaten gekämpft. Deshalb benötigen wir dieses Bier und überdies schmeckt es nicht übel!',
        msg2     = 'Im nahegelegenen Osten haben wir einen guten und geschützten Hafenplatz gesichtet, den wir erreichen sollten, aber wir müssen uns den Weg dorthin erst einmal frei räumen.\n\nHier hat es einige Ananasbäume, und bisher hat es selbst Elvor mit seiner Bärenkraft nicht fertiggebracht, solch einen Baum zu fällen. Der Stamm ist dick und eisenhart, deshalb müssen wir unsere Wege um diese Ananasbäume herum legen. Nebenbei hat es hier jede Menge Holz und Steine, so dass unsere Steinhauer und Holzfäller sich nicht über Mangel an Arbeit beklagen müssen.\n\nAnsgar ist mit Halvar, einem jungen, aber verständigen Burschen losgezogen, um die Insel genauer in Augenschein zu nehmen. Sie müssen vorsichtig sein, weil die feindlichen Schiffe und Soldaten überall auftauchen können.',
        msg3     = 'Auf einer kleinen Anhöhe im Südwesten scheint es guten und ebenen Baugrund, zu haben um unsere notwendigen Gebäude errichten zu können. Aber da müssen wir erst einmal hinkommen. Elvor läuft schon die ganze Zeit mit dem Schmiedehammer in der Hand herum, und unser stets frierender Darvi hat ebenfalls spürbar Sehnsucht nach seinem Hochtemperaturraum.\n\nAuch unser neu angelernter Münzpräger Bjarki hätte nichts dagegen, wenn er seiner neugelernten Tätigkeit nachkommen könnte. Also schauen wir, dass wir die Bauplätze geräumt kriegen, und unsere Bergwerker ergiebige Rohstoffquellen bekommen.',
        msg4     = 'Unsere Jäger haben Aron völlig entkräftet in den Wäldern oberhalb unseres Hafenplatzes entdeckt. Aron ist unser Baumeister, und wir haben ihn auf der Flucht vor den Babyloniern verloren. Er konnte sich mit einem Boot und etwas Handwerkzeug hierhin retten und hat mehr schlecht als recht von Enten, Pilzen und Wasser gelebt.\n\nWir haben ihm erst einmal etwas zu Essen und von unserem Bier gegeben, damit er wieder zu Kräften kommt. Als er satt war, berichtete er uns von mindestens zwei Lagern, die er auf dieser Insel entdeckt hat. Sie seien aber bisher nicht allzu groß gewesen.\n\nInteressant ist die Tatsache, dass er selbstgebaute Schneemänner gesehen hat, die recht zahlreich im nördlichen Teil der Insel vorhanden seien. Da die Babylonier keine Schneemänner bauen, muss also noch ein weiteres Volk auf der Insel sein. Das könnte die fremden Schiffe erklären, die wir im Zusammenhang mit dieser Insel beobachtet haben.',
        msg5     = 'Aron hat unsere bisherigen Militärgebäude besichtigt und seine Verwunderung darüber geäußert, dass wir damit so weit gekommen sind. Er hat uns gebeten, ein größeres Gebäude bauen zu dürfen, damit unsere Soldaten auch einmal zu neunt sich darin aufhalten könnten, ohne sich gegenseitig totzutreten. Uns allen ist nichts lieber als das!\n\nAron hat erklärt wieviel Holz und vor allem wieviel Steine er dazu benötigen würde. Die haben wir ihm natürlich sofort herbeigeschafft.\n\nElvor hat in seiner Schmiede den nächsten Amboss zerlegt. Er ist der beste und stärkste Schmied, den ich mir vorstellen kann, aber er könnte noch effektiver arbeiten, wenn er nur mit halber Kraft seinen Schmiedehammer gebrauchen würde. Ich habe Darvi gebeten, ihm das diskret beizubringen.',
        msg6     = 'Aron hat einen Kasten hingestellt, eine richtige Hausnummer! Mit diesen Burgen kann man ganz anders verteidigen und angreifen. Nur schade, dass sie so viel Platz brauchen, aber man kann nicht alles haben. Ich denke, wir werden vor allem an den Fronten schauen, dass wir vorzugsweise solche Festungen errichten werden.',
        msg7     = 'Ansgar ist mit Halvar zurückgekommen. Beide bestätigen das Vorhandensein von einem babylonischen Lager, die aber bis jetzt nicht allzu gefährlich erscheint. Umso mehr sollten wir uns vor einem großen römischen Versorgungslager im Norden der Insel in Acht nehmen. Sie arbeiten mit den Babyloniern zusammen, unterstützen sie vor allem mit Nahrung und Waffen, und sind wirtschaftlich und militärisch als sehr stark einzuschätzen. Sie können uns richtig wehtun, wenn es zu einer offenen Schlacht zwischen uns und ihnen kommen würde.\n\nNebenbei haben unsere Zwei auf der benachbarten grauen Insel ein babylonisches Lager in Ufernähe entdeckt. Das könnte unser nächstes Ziel nach der Rückeroberung dieser Insel werden.\n\nVon unseren neugebauten Festungen waren Halvar und vor allem Ansgar schwer beeindruckt. Er riet uns, unsere Wirtschaft und unser Militär so weit wie möglich hochzufahren und die Römer an allen Fronten zu bekämpfen, wo wir auf sie stoßen würden. Dabei müssen wir uns aber vorsehen, denn die Römer wissen, wie man Kriege führt. Also mobilisieren wir zuerst einmal alles, was eine Angel halten und einen Bogen führen kann, um unsere Bergwerker nicht verhungern zu lassen.',
        msg99    = 'Endlich ist auch diese Insel wieder in unserer Hand. Wir werden einen kleinen Militärstützpunkt zurücklassen damit diese Insel auch unser bleibt. Alle Handwerker werden mit uns zur letzten Insel zurückfahren, um unseren König und unsere Frauen und Kinder wiederzusehen.\n\nWir haben vor, mit Ihnen zusammen zu der grauen Insel im Westen zu fahren, wo Ansgar und Halvar das babylonische Lager entdeckt haben.'
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
    rttr:GetPlayer(1):SetNation(NAT_ROMANS)
    rttr:GetPlayer(2):SetNation(NAT_BABYLONIANS)

    for p = 1, rttr:GetNumPlayers() - 1 do
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
        addExtraSoldiers(1, 10)
        addExtraBoards(2, 100)
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
        rttr:GetWorld():AddAnimal(80, 32, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(85, 76, SPEC_POLARBEAR)
        rttr:GetWorld():AddAnimal(26, 80, SPEC_POLARBEAR)

        rttr:GetWorld():AddStaticObject(22, 71, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(89, 20, 0, 0, 1)
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
        rttr:GetPlayer(p):DisableBuilding(BLD_FORTRESS)
        rttr:GetPlayer(p):DisableBuilding(BLD_CATAPULT)
        rttr:GetPlayer(p):DisableBuilding(BLD_LOOKOUTTOWER)
        rttr:GetPlayer(p):DisableBuilding(BLD_WELL)
        rttr:GetPlayer(p):DisableBuilding(BLD_MILL)
        rttr:GetPlayer(p):DisableBuilding(BLD_BAKERY)
        rttr:GetPlayer(p):DisableBuilding(BLD_FARM)
        rttr:GetPlayer(p):DisableBuilding(BLD_DONKEYBREEDER)
        rttr:GetPlayer(p):DisableBuilding(BLD_METALWORKS)
        rttr:GetPlayer(p):DisableBuilding(BLD_BREWERY)
        rttr:GetPlayer(p):DisableBuilding(BLD_SLAUGHTERHOUSE)
        rttr:GetPlayer(p):DisableBuilding(BLD_PIGFARM)
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
            [GD_BOARDS    ] = 20,
            [GD_STONES    ] = 50,
            [GD_HAM       ] = 0,
            [GD_GRAIN     ] = 0,
            [GD_FLOUR     ] = 0,

            [GD_FISH      ] = 5,
            [GD_MEAT      ] = 5,
            [GD_BREAD     ] = 5,
            [GD_WATER     ] = 0,
            [GD_BEER      ] = 100,
            [GD_COAL      ] = 8,

            [GD_IRONORE   ] = 8,
            [GD_GOLD      ] = 4,
            [GD_IRON      ] = 4,
            [GD_COINS     ] = 4,
            [GD_TONGS     ] = 0,
            [GD_AXE       ] = 4,

            [GD_SAW       ] = 4,
            [GD_PICKAXE   ] = 4,
            [GD_HAMMER    ] = 14,
            [GD_SHOVEL    ] = 0,
            [GD_CRUCIBLE  ] = 0,
            [GD_RODANDLINE] = 1,

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
            [JOB_HELPER             ] = 20,
            [JOB_BUILDER            ] = 8,
            [JOB_PLANER             ] = 5,
            [JOB_WOODCUTTER         ] = 6,
            [JOB_FORESTER           ] = 0,
            [JOB_STONEMASON         ] = 4,

            [JOB_FISHER             ] = 2,
            [JOB_HUNTER             ] = 2,
            [JOB_CARPENTER          ] = 2,
            [JOB_FARMER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,

            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 0,
            [JOB_BREWER             ] = 0,
            [JOB_MINER              ] = 4,
            [JOB_IRONFOUNDER        ] = 1,

            [JOB_ARMORER            ] = 1,
            [JOB_MINTER             ] = 1,
            [JOB_METALWORKER        ] = 0,
            [JOB_SHIPWRIGHT         ] = 0,
            [JOB_GEOLOGIST          ] = 4,
            [JOB_SCOUT              ] = 2,

            [JOB_PACKDONKEY         ] = 20,
            [JOB_CHARBURNER         ] = 0,
    

            [JOB_PRIVATE            ] = 50,
            [JOB_PRIVATEFIRSTCLASS  ] = 0,
            [JOB_SERGEANT           ] = 0,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0
        })
    end
end

function onExplored(playerIdx, x, y, owner)
    if(playerIdx ~= 0) then
        return
    end
end

function onOccupied(playerIdx, x, y)
    if(playerIdx ~= 0) then
        return
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

    if (eState[3] > 0 and milBuildingCount >= 3) then
        -- EVENT3
        MissionEvent(3, false)
    end

    if (eState[4] > 0 and milBuildingCount >= 6) then
        -- EVENT4
        MissionEvent(4, false)
    end

    if (eState[5] > 0 and milBuildingCount >= 9) then
        -- EVENT5
        MissionEvent(5, false)
    end

    if (eState[6] > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_FORTRESS) > 0) then
        -- EVENT6
        MissionEvent(6, false)
    end

    if (eState[7] > 0 and milBuildingCount >= 12) then
        -- EVENT7
        MissionEvent(7, false)
    end

    if (eState[99] > 0 and (GetNumStorage(1) + GetNumStorage(2)) < 1) then
        -- EVENT8 (maps to 99)
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

    elseif(e == 4 and not onLoad) then
        rttr:GetPlayer(0):AddWares({
            [GD_HAMMER] = 10,
            [GD_AXE] = 10,
            [GD_PICKAXE] = 10
            })

    elseif(e == 5) then
        rttr:GetPlayer(0):EnableBuilding(BLD_FORTRESS, not onLoad)

    elseif(e == 6 and not onLoad) then
        -- nothing

    elseif(e == 7) then
        rttr:GetPlayer(0):AddPeople({
            [JOB_FISHER] = 2,
            [JOB_HUNTER] = 2
            })

    elseif(e == 99) then
        -- TODO: EnableNextMissions()
    end

    -- update event state
    eState[e] = eState[e] - 1

    -- no history update or mission texts while loading
    -- no history update or mission texts while loading
    if not onLoad then
        rttr:Log(">> Event: " .. e .. ",\teState[" .. e .. "] = " .. eState[e])
        eHist["n"] = eHist["n"] + 1
        eHist[eHist["n"]] = e
    end

    MissionText(e, onLoad)
end

function GetNumMilitaryBuilding(plr, withHarbor)
    local numBld = rttr:GetPlayer(plr):GetNumBuildings(BLD_BARRACKS) + rttr:GetPlayer(plr):GetNumBuildings(BLD_GUARDHOUSE) + rttr:GetPlayer(plr):GetNumBuildings(BLD_WATCHTOWER) + rttr:GetPlayer(plr):GetNumBuildings(BLD_FORTRESS)

    if(withHarbor) then
        numBld = numBld + rttr:GetPlayer(plr):GetNumBuildings(BLD_HARBORBUILDING)
    end

    return numBld
end

function GetNumStorage(plr)
    return rttr:GetPlayer(plr):GetNumBuildings(BLD_HEADQUARTERS) + rttr:GetPlayer(plr):GetNumBuildings(BLD_HARBORBUILDING) + rttr:GetPlayer(plr):GetNumBuildings(BLD_STOREHOUSE)
end

function addExtraBoards(plrId, amount)
    rttr:GetPlayer(plrId):AddWares({[GD_BOARDS] = amount})
end

function addExtraSoldiers(plrId, amount)
    rttr:GetPlayer(plrId):AddPeople({[JOB_PRIVATE] = amount})
end