function getRequiredLuaVersion()
    return 1
end

rttr:RegisterTranslations(
{
    en =
    {
        nameAI = 'Unknown faction',
        textLogbook = 'Check your logbook for updates.',
    
        salvageCoal = 'You salvaged 20 pieces of coal',

        lookhere = 'Have a look here',

        tasks_main = "Main Goal(s):",
        tasks_sub = "Secondary Goal(s):",
        tasks_hint = "[?] = Keep playing to discover this task\n[ ] = This task is not finished\n[+] = This task has been finished",
        tasks_legend = "Legend:",

        task1_1 = "[ ] Catch up with the thief",
        task1_2 = "[ ] Defeat the guards and search the camp",
        task1_3 = "[+] Follow the thief to the north (next mission)",

        task2_1 = "[ ] Salvage the ships",
        task2_2 = "[+] The ships have been salvaged",

        task3_101 = "[ ] Build at least two samills",

        task4_101 = "[ ] Keep exploring",
        
        task5_1 = "[ ] Recruit a larger army",
        task5_2 = "[+] Your army is growing",

        task6_101 = "[ ] Search for food",
        task6_102 = "[ ] Find a way to get fish from the fishing village",
        task6_103 = "[+] You befriended the fishing village",
        task6_104 = "[+] You pillaged the fishing village",

        task7_101 = "[ ] Brew some beer",
        task7_102 = "[+] You are brewing beer",

        task8_101 = "[ ] Find traces of iron and mine it",
        task8_102 = "[+] You are mining iron",

        task9_101 = "[ ] Build an armory and iron smelter",
        task9_102 = "[+] You are capable of smithing weapons",

        task10_101 = "[ ] Build a harbor for supplies",
        task10_102 = "[+] You received a supply shipping",

        task11_101 = "[ ] Find more charcoal",

        title   = 'The Chase',

        msg1    = 'Event 1\n\nIntroduction, follow thief, need some resources, stole ring from king',
        msg2    = 'Event 2\n\nSome resources for quickly following, note destroyed building nearby',
        msg3    = 'Event 3\n\nBurned camp found, trace seems cold wrong direction, Tools found, wait till they are in your HQ',
        msg4    = 'Event 4\n\nSome fallen trees, need to go east, tools finally arrived, new buildings may reach areas not anble before, salvage coal from burnt buildings',
        msg5    = 'Event 5\n\nA pillaged farm, we cant help the people but use the grain, brutal need more soldiers, grain for beer, build army, find iron',
        msg6    = 'Event 6\n\nTrail got cold, nothing but mountains, crossroads need to decide left or right',
        msg7    = 'Event 7\n\nFound fishing village, seem neutral so far, maybe we can find a way to obtain food',
        msg8    = 'Event 8\n\nfishing village seems interested, but not under the given conditions',
        msg9    = 'Event 9\n\nthey are happy the men of the king finally show up, they hope we get rid of bandits, sent us all food they could spare, warm winter also spare some coal',
        msg10   = 'Event10\n\nThese peasants should obey, I\'m here in the name of the king, showed them who to follow',
        msg11   = 'Event11\n\nPretty advanced for bandits, seems not to function though, where did they get the technology from? maybe king right to send me',
        msg12   = 'Event12\n\nThe thief is not hiding here, no bandits at all, we can use some coal',
        msg13   = 'Event13\n\nWe can finally produce some weapons, charcoal from pillaging or burnt buildings',
        msg14   = 'Event14\n\nFinally some beer, will increase moral and we can train soldiers',
        msg15   = 'Event15\n\nWe will now produce tools, tools of war, having steady iron and coal supply is important, never forget beer',
        msg16   = 'Event16\n\nWe will have some new recruits soon, bandits can throw whatever they want at us',
        msg17   = 'Event17\n\nshallow cove, build harbor, some supplies',
        msg18   = 'Event18\n\nLooks like I can only get a Contubernium to help me fight, king doesn\'t see need for more resources',
        msg19   = 'Event19\n\nLooking like rich bandits, they have been paid gold, maybe thief cam through here, carefull maybe strong',
        msg20   = 'Event20\n\nWrong, thief not came through here, some more peasants who seem to be lucky with some gold, still some coal and coins',
        msg21   = 'Event21\n\nThats their camp, destroy it and catch the thief alive, they rebuilt old watchtowers here, strong fortification',
        msg22   = 'Event22\n\nLooks like produced huge amount of weapons, luckily we were fast enough they can\'t recruit',
        msg23   = 'Event23\n\nSearched the whole camp, didn\'t find the theif nor the stolen ring, must have fled north, can\'t follow now need some more preparation for harsh winter',
        msg24   = 'Event24\n\nLooks like a pagan ritual, wonder what they sacrificed',
        msg25   = 'Event25\n\nAnother pillaged camp, those animals don\'t stop before anything',
        msg26   = 'Event26\n\nWhat happened here, I still know this place as guardpost, yet it seems pillaged',
        msg27   = 'Event27\n\nTransporting material takes quite long, didn\'t remember these mountains so large, may build some camps to hasten up',

        hosttitle = 'Important',
        hosthint = 'Please check the addon settings. You are allowed to change some of them. This may result in a difficulty change which leads to a different experience than expected.\n\n\nReport any bugs you encounter!\n'
    }
})

local tasks = {}
-- state, make sure they are in the order you like
-- if a state is 0 or 100, it is expected to be invisible
-- if a state is > 100, it is expected to be a sub task or hint
tasks = {
0,      -- 1    chase
0,      -- 2    salvage ships
100,    -- 3    build two sawmills
100,    -- 4    keep exploring
0,      -- 5    increase army size
100,    -- 6    search for food
100,    -- 7    brew beer
100,    -- 8    find iron
100,    -- 9    build armory iron smelter
100,    -- 10   build harbor
100     -- 11   find coal
}

function BuildTaskText()
    -- buid header for the main goals
    local taskText = _('tasks_main')
    taskText = taskText .. '\n------------------------------------------------------------------------'

    -- build spacer between main goals and sub goals
    local taskSub = '\n\n\n' .. _('tasks_sub')
    taskSub = taskSub .. '\n------------------------------------------------------------------------'

    for i = 1, #tasks do
        -- ignore inactive tasks
        if(tasks[i] ~= 0 and tasks[i] ~= 100) then
            -- build textfield 'task<ID>_<state>'
            local textField = ('task' .. tostring(i) ..'_' ..tostring(tasks[i]))
            -- get text by field
            local text = _(textField)
            -- if text equals textfield it does not exist
            if(text ~= textField) then
                if(tasks[i] > 100) then
                    taskSub = taskSub .. "\n" .. text
                else
                    taskText = taskText .. "\n" .. text
                end
            else
                rttr:Log("Task: '" ..i.. "' tried to load text '" ..textField.. "' which does not exist!")
            end
        end
    end

    taskText = taskText .. taskSub

    taskText = taskText .. '\n\n\n\n\n' .. _('tasks_legend')
    taskText = taskText .. '\n------------------------------------------------------------------------'
    taskText = taskText .. _('tasks_hint') .. '\n\n'

    rttr:SetMissionGoal(0, taskText)
end

-- format mission texts
function MissionText(e, silent)
    local msg = _('msg' .. tostring(e))

    if(msg ~= ('msg' .. tostring(e))) then
        if not silent then
            rttr:MissionStatement(0, _('Diary'), msg .. '\n\n\n\n\n\n\n' .. _('logbook'), IM_RIDER, true)
        end
    else
        rttr:Log("Error: no Translation found!" .. msg)
    end

    BuildTaskText()
end

eIdx = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36}


function onSettingsReady()
    rttr:Log("-----------------------\n Mission Script loaded... \n-----------------------\n")
   -- rttr:MsgBox('Information', 'You can change some addons. They have been set to the original intention, so keep that in mind.', false)

    rttr:SetAddon(ADDON_AI_DEBUG_WINDOW, false)
    rttr:SetAddon(ADDON_ADJUST_MILITARY_STRENGTH, 1)
    rttr:SetAddon(ADDON_DEFENDER_BEHAVIOR, 2)
    rttr:SetAddon(ADDON_CHANGE_GOLD_DEPOSITS, 0)
    rttr:SetAddon(ADDON_METALWORKSBEHAVIORONZERO, 0)
    rttr:SetAddon(ADDON_STATISTICS_VISIBILITY, 1)
    rttr:SetAddon(ADDON_COINS_CAPTURED_BLD, 0)
    rttr:SetAddon(ADDON_CUSTOM_BUILD_SEQUENCE, false)
    rttr:SetAddon(ADDON_DEMOLISH_BLD_WO_RES, false)
    rttr:SetAddon(ADDON_DEMOLITION_PROHIBITION , 1)
    rttr:SetAddon(ADDON_NO_COINS_DEFAULT, false)
    rttr:SetAddon(ADDON_ECONOMY_MODE_GAME_LENGTH , 0)
    rttr:SetAddon(ADDON_BATTLEFIELD_PROMOTION, false)
    rttr:SetAddon(ADDON_CHARBURNER, true)
    rttr:SetAddon(ADDON_EXHAUSTIBLE_WATER , 2)
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetAddon(ADDON_DURABLE_GEOLOGIST_SIGNS, 0)
    rttr:SetAddon(ADDON_INEXHAUSTIBLE_MINES, false)
    rttr:SetAddon(ADDON_LIMIT_CATAPULTS, 3)
    rttr:SetAddon(ADDON_MANUAL_ROAD_ENLARGEMENT, false)
    rttr:SetAddon(ADDON_MILITARY_AID, false)
    rttr:SetAddon(ADDON_MILITARY_CONTROL, false)
    rttr:SetAddon(ADDON_MILITARY_HITPOINTS, false)
    rttr:SetAddon(ADDON_MORE_ANIMALS, 0)
    rttr:SetAddon(ADDON_NUM_SCOUTS_EXPLORATION, 2)
    rttr:SetAddon(ADDON_PEACEFULMODE, false)
    rttr:SetAddon(ADDON_CATAPULT_GRAPHICS, true)
    rttr:SetAddon(ADDON_REFUND_MATERIALS, 0)
    rttr:SetAddon(ADDON_REFUND_ON_EMERGENCY, false)
    rttr:SetAddon(ADDON_SEA_ATTACK, 2)
    rttr:SetAddon(ADDON_BURN_DURATION, 0)
    rttr:SetAddon(ADDON_MAX_RANK, 0)
    rttr:SetAddon(ADDON_MAX_WATERWAY_LENGTH, 1)
    rttr:SetAddon(ADDON_SHIP_SPEED, 3)
    rttr:SetAddon(ADDON_TOOL_ORDERING, false)
    rttr:SetAddon(ADDON_TRADE, false)

    rttr:SetGameSettings({
        ["teamView"] = true,
        ["lockedTeams"] = false,
        ["objective"] = GO_TOTALDOMINATION,
        ["fow"] = EXP_CLASSIC
    })

    rttr:GetPlayer(1):SetAI(3)
    rttr:GetPlayer(1):SetName(_('nameAI'))
    rttr:GetPlayer(2):SetAI(3)
    rttr:GetPlayer(2):SetName(_('nameAI'))
    rttr:GetPlayer(3):SetAI(3)
    rttr:GetPlayer(3):SetName(_('nameAI'))
    rttr:GetPlayer(4):SetAI(3)
    rttr:GetPlayer(4):SetName(_('nameAI'))

    rttr:GetPlayer(2):SetTeam(TM_TEAM1)
    rttr:GetPlayer(3):SetTeam(TM_TEAM1)
    rttr:GetPlayer(4):SetTeam(TM_TEAM1)

    rttr:GetPlayer(2):SetColor(5)
    rttr:GetPlayer(4):SetColor(2)

    rttr:MsgBox(_('hosttitle'), _('hosthint'), true)
end

function getAllowedChanges()
    return  {
        ["general"]     = false,
        ["addonsAll"]   = false,
        ["addonsSome"]  = true,
        ["ownNation"]   = false,
        ["ownColor"]    = true,
        ["ownTeam"]     = false,
        ["aiNation"]    = false,
        ["aiColor"]     = false,
        ["aiTeam"]      = false,
        ["swapping"]    = false
    }
end

function getAllowedAddons()
    return {
        ADDON_MANUAL_ROAD_ENLARGEMENT,
        ADDON_REFUND_ON_EMERGENCY,
        ADDON_CATAPULT_GRAPHICS,
        ADDON_METALWORKSBEHAVIORONZERO,
        ADDON_CUSTOM_BUILD_SEQUENCE,
        ADDON_NO_COINS_DEFAULT,
        ADDON_TOOL_ORDERING,
        ADDON_MILITARY_AID,
        ADDON_MILITARY_CONTROL,
        ADDON_MILITARY_HITPOINTS,
        ADDON_COINS_CAPTURED_BLD,
        ADDON_DEMOLISH_BLD_WO_RES,
        ADDON_DURABLE_GEOLOGIST_SIGNS
    }
end

function onStart(isFirstStart)
    BuildTaskText()


    addPlayerRes(0, not isFirstStart)
    rttr:GetPlayer(0):ModifyHQ(1)
    rttr:GetPlayer(0):DisableAllBuildings()

    rttr:GetPlayer(0):EnableBuilding(BLD_SAWMILL, false)
    rttr:GetPlayer(0):EnableBuilding(BLD_HARBORBUILDING, false)

    addPlayerRes(1, not isFirstStart)
    rttr:GetPlayer(1):SetRestrictedArea(
    nil, nil,
    114,164,
    110,156,
    111,154,
    117,151,
    120,159,
    117,164,
    nil, nil
    )
    rttr:GetPlayer(1):ModifyHQ(1)
    rttr:GetPlayer(1):DisableAllBuildings()

    rttr:GetPlayer(1):EnableBuilding(BLD_HARBORBUILDING, false)
    rttr:GetPlayer(1):EnableBuilding(BLD_FISHERY, false)

    rttr:GetPlayer(1):AIConstructionOrder(113,159,BLD_HARBORBUILDING)

    rttr:GetPlayer(1):AIConstructionOrder(112,156,BLD_FISHERY)
    rttr:GetPlayer(1):AIConstructionOrder(115,161,BLD_FISHERY)

    addPlayerRes(2, not isFirstStart)
    rttr:GetPlayer(2):ModifyHQ(1)
    rttr:GetPlayer(2):DisableAllBuildings()

    rttr:GetPlayer(2):EnableBuilding(BLD_GUARDHOUSE, false)
    rttr:GetPlayer(2):EnableBuilding(BLD_CATAPULT, false)

    rttr:GetPlayer(2):AIConstructionOrder(90,139,BLD_CATAPULT)
    rttr:GetPlayer(2):AIConstructionOrder(91,137,BLD_GUARDHOUSE)

    -- AI 3 --
    addPlayerRes(3, not isFirstStart)
    rttr:GetPlayer(3):DisableAllBuildings()
    rttr:GetPlayer(3):EnableBuilding(BLD_MINT, false)
    rttr:GetPlayer(3):EnableBuilding(BLD_GUARDHOUSE, false)
    rttr:GetPlayer(3):EnableBuilding(BLD_STOREHOUSE, false)
    rttr:GetPlayer(3):EnableBuilding(BLD_LOOKOUTTOWER, false)

    rttr:GetPlayer(3):AIConstructionOrder(67,114,BLD_GUARDHOUSE)
    rttr:GetPlayer(3):AIConstructionOrder(67,109,BLD_GUARDHOUSE)
    rttr:GetPlayer(3):AIConstructionOrder(64,107,BLD_STOREHOUSE)
    rttr:GetPlayer(3):AIConstructionOrder(68,116,BLD_MINT)
    rttr:GetPlayer(3):AIConstructionOrder(70,117,BLD_LOOKOUTTOWER)

    -- AI 4 --
    rttr:GetPlayer(4):ModifyHQ(1)
    addPlayerRes(4, not isFirstStart)
    rttr:GetPlayer(4):DisableAllBuildings()
    rttr:GetPlayer(4):EnableBuilding(BLD_WATCHTOWER, false)
    rttr:GetPlayer(4):EnableBuilding(BLD_GUARDHOUSE, false)
    rttr:GetPlayer(4):EnableBuilding(BLD_STOREHOUSE, false)
    rttr:GetPlayer(4):EnableBuilding(BLD_IRONSMELTER, false)
    rttr:GetPlayer(4):EnableBuilding(BLD_ARMORY, false)
    rttr:GetPlayer(4):EnableBuilding(BLD_LOOKOUTTOWER, false)

    rttr:GetPlayer(4):AIConstructionOrder(83,70,BLD_WATCHTOWER)
    rttr:GetPlayer(4):AIConstructionOrder(78,71,BLD_GUARDHOUSE)
    rttr:GetPlayer(4):AIConstructionOrder(77,62,BLD_WATCHTOWER)
    
    rttr:GetPlayer(4):AIConstructionOrder(78,59,BLD_STOREHOUSE)
    
    rttr:GetPlayer(4):AIConstructionOrder(79,68,BLD_IRONSMELTER)
    
    rttr:GetPlayer(4):AIConstructionOrder(84,64,BLD_ARMORY)
    rttr:GetPlayer(4):AIConstructionOrder(79,62,BLD_ARMORY)
    
    rttr:GetPlayer(4):AIConstructionOrder(78,78,BLD_LOOKOUTTOWER)

    -- World Objects --
    if(isFirstStart) then
        -- Near AI 4 --
        rttr:GetWorld():AddStaticObject(81, 75, 4, 2, 2)
        rttr:GetWorld():AddStaticObject(77, 81, 4, 2, 2)

        -- Burned camp 1 (near AI 4) --
        rttr:GetWorld():AddEnvObject(87, 87, 2524, 0xFFFF)
        rttr:GetWorld():AddEnvObject(87, 90, 2524, 0xFFFF)
        rttr:GetWorld():AddEnvObject(86, 90, 547, 0xFFFF)
        rttr:GetWorld():AddEnvObject(87, 92, 547, 0xFFFF)
        rttr:GetWorld():AddEnvObject(86, 91, 548, 0xFFFF)
        rttr:GetWorld():AddEnvObject(88, 88, 548, 0xFFFF)
        rttr:GetWorld():AddEnvObject(91, 84, 695, 0xFFFF)

        -- hidden destroyed harbor --
        rttr:GetWorld():AddEnvObject(46, 182, 2525, 0xFFFF)

        -- Burned camp 2 (near AI 3) --
        rttr:GetWorld():AddEnvObject(65, 136, 2524, 0xFFFF)

        -- iron 01 (left of player 2)
        rttr:GetWorld():AddEnvObject(99, 143, 682, 0xFFFF)
        rttr:GetWorld():AddEnvObject(99, 144, 682, 0xFFFF)
        rttr:GetWorld():AddEnvObject(98, 145, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(100, 142, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(99, 145, 680, 0xFFFF)

        -- nothing
        rttr:GetWorld():AddEnvObject(89, 60, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(81, 168, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(69, 175, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(62, 183, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(45, 165, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(55, 169, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(49, 175, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(87, 163, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(108, 141, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(77, 150, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(68, 155, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(62, 137, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(68, 133, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(63, 122, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(65, 103, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(84, 120, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(85, 136, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(90, 146, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(100, 128, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(104, 115, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(108, 124, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(111, 107, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(102, 98, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(85, 107, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(77, 106, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(75, 91, 695, 0xFFFF)
        rttr:GetWorld():AddEnvObject(86, 84, 695, 0xFFFF)

        -- iron 02 (left of player 1)
        rttr:GetWorld():AddEnvObject(56, 180, 682, 0xFFFF)
        rttr:GetWorld():AddEnvObject(54, 179, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(54, 181, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(56, 179, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(56, 181, 680, 0xFFFF)

        -- burned buildings path (left)
        rttr:GetWorld():AddEnvObject(81, 178, 2524, 0xFFFF)
        rttr:GetWorld():AddEnvObject(74, 179, 2524, 0xFFFF)

        -- burned buildings (path right)
        rttr:GetWorld():AddEnvObject(88, 169, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(90, 168, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(93, 161, 531, 0xFFFF)

        -- burned buildings (path top)
        rttr:GetWorld():AddEnvObject(86, 144, 2524, 0xFFFF)
        rttr:GetWorld():AddEnvObject(82, 137, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(79, 131, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(79, 124, 2524, 0xFFFF)

        -- pagan location
        rttr:GetWorld():AddEnvObject(73, 155, 2524, 0xFFFF)
        rttr:GetWorld():AddStaticObject(73, 157, 8, 2, 1)
        rttr:GetWorld():AddEnvObject(72, 155, 547, 0xFFFF)
        rttr:GetWorld():AddEnvObject(73, 154, 548, 0xFFFF)
        rttr:GetWorld():AddEnvObject(74, 154, 547, 0xFFFF)
        rttr:GetWorld():AddEnvObject(74, 155, 548, 0xFFFF)
        rttr:GetWorld():AddEnvObject(73, 153, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(74, 153, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(75, 155, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(75, 154, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(76, 154, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(75, 153, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(72, 154, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(71, 155, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(72, 156, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(71, 156, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(71, 157, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(72, 158, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(72, 159, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(73, 159, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(74, 159, 531, 0xFFFF)
        rttr:GetWorld():AddEnvObject(75, 156, 531, 0xFFFF)

        -- iron 03 (left of player 3)
        rttr:GetWorld():AddEnvObject(70, 146, 682, 0xFFFF)
        rttr:GetWorld():AddEnvObject(70, 147, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(70, 145, 680, 0xFFFF)

        -- iron 04 (under player 4)
        rttr:GetWorld():AddEnvObject(62, 121, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(62, 123, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(63, 124, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(63, 126, 680, 0xFFFF)

        -- iron 05 (over player 3)
        rttr:GetWorld():AddEnvObject(100, 118, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(100, 120, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(99, 121, 680, 0xFFFF)

        -- iron 06 (right of player 3)
        rttr:GetWorld():AddEnvObject(112, 119, 682, 0xFFFF)
        rttr:GetWorld():AddEnvObject(113, 118, 680, 0xFFFF)

        -- iron 07 (over player 3 II)
        rttr:GetWorld():AddEnvObject(98, 98, 682, 0xFFFF)
        rttr:GetWorld():AddEnvObject(97, 99, 682, 0xFFFF)
        rttr:GetWorld():AddEnvObject(98, 100, 682, 0xFFFF)
        rttr:GetWorld():AddEnvObject(99, 100, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(97, 100, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(96, 99, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(97, 98, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(98, 97, 680, 0xFFFF)

        -- iron 08 (under player 5)
        rttr:GetWorld():AddEnvObject(91, 84, 2524, 0xFFFF)
        rttr:GetWorld():AddEnvObject(90, 86, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(91, 85, 680, 0xFFFF)
        rttr:GetWorld():AddEnvObject(91, 82, 680, 0xFFFF)

        -- destroyed ships
        rttr:GetWorld():AddStaticObject(88, 179, 0, 0, 1)
        rttr:GetWorld():AddStaticObject(89, 177, 0, 0, 1)
    end


-- 79,167 -> unlock woodcutter/stonemason
    -- 531 = cut tree
    -- miss0, 0 = tent
    -- miss0, 0 = destroyed ship
    -- miss2, 8 = puppet
    -- 511 = waterstone
    -- 559 = snowman
    -- 680 = shield iron low
    -- 681 = shield iron med
    -- 682 = shield iron
    -- 695 = shield nothing
    -- 2253 = axe
    -- 2255 = pickaxe
    -- 2257 = crucible
    -- 2524 = rubble small
    -- 2525 = rubble large
    -- 535 = grainfield
    -- 547 = corpse 1
    -- 548 = corpse 2

    eState = {}
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
end

-- save callback
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

function onGameFrame(gf)
    if((gf%20)~=0) then
        return
    end

    if (gf == 20) then
        MissionEvent(1)
    end

    if (eState[2] == 1 and rttr:GetPlayer(0):GetNumBuildings(BLD_SAWMILL) >= 2) then
        MissionEvent(2)
    end
    
    if (eState[10] == 1 and (rttr:GetPlayer(1):GetNumBuildings(BLD_HARBORBUILDING) + rttr:GetPlayer(1):GetNumBuildings(BLD_HEADQUARTERS) <= 0)) then
        MissionEvent(10)
    end
    
    if (eState[12] == 1 and (rttr:GetPlayer(2):GetNumBuildings(BLD_GUARDHOUSE) + rttr:GetPlayer(2):GetNumBuildings(BLD_HEADQUARTERS) <= 0)) then
        MissionEvent(12)
    end
    
    if (eState[13] == 1 and rttr:GetPlayer(0):GetNumWares(GD_IRONORE) > 0) then
        MissionEvent(13)
    end
    
    if (eState[14] == 1 and rttr:GetPlayer(0):GetNumBuildings(BLD_WELL) > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_BREWERY) > 0) then
        MissionEvent(14)
    end
    
    if (eState[15] == 1 and rttr:GetPlayer(0):GetNumBuildings(BLD_IRONSMELTER) > 0 and rttr:GetPlayer(0):GetNumBuildings(BLD_ARMORY) > 0) then
        MissionEvent(15)
    end
    
    if (eState[16] == 1 and 
        rttr:GetPlayer(0):GetNumWares(GD_SWORD) > 0 and
        rttr:GetPlayer(0):GetNumWares(GD_SHIELD) > 0 and
        rttr:GetPlayer(0):GetNumWares(GD_BEER) > 0) then
        MissionEvent(16)
    end
    
    if(eState[18] == 1 and rttr:GetPlayer(0):GetNumBuildings(BLD_HARBORBUILDING) > 1) then
        MissionEvent(18)
    end
    
    if(eState[20] == 1  and (rttr:GetPlayer(3):GetNumBuildings(BLD_GUARDHOUSE) + rttr:GetPlayer(3):GetNumBuildings(BLD_HEADQUARTERS) <= 0)) then
        MissionEvent(20)
    end
    
    if (eState[23] == 1 and 
        rttr:GetPlayer(4):GetNumBuildings(BLD_GUARDHOUSE) <= 0 and
        rttr:GetPlayer(4):GetNumBuildings(BLD_WATCHTOWER) <= 0 and
        rttr:GetPlayer(4):GetNumBuildings(BLD_HEADQUARTERS) <= 0) then
        MissionEvent(23)
    end
end

function onOccupied(p, x, y)
    if(p == 3) then
        if(x==64 and (y==107 or y==106)) then
            rttr:GetPlayer(3):AIConstructionOrder(64,107,BLD_STOREHOUSE)
            rttr:Log("Set order again")
        end
    elseif(p==4) then
        if(x==78 and y==78) then
            rttr:GetPlayer(4):AIConstructionOrder(78,78,BLD_LOOKOUTTOWER)
            rttr:Log("Set order again 2")
        end
    end
    
    if(p == 0) then
        if(x==73 and y==186) then
            MissionEvent(3)
        elseif(x==80 and y==167) then
            MissionEvent(4)
        elseif(x==93 and y==163) then
            MissionEvent(5)
        elseif(x==92 and y==155) then
            MissionEvent(6)
        elseif(x==46 and y==182) then
            MissionEvent(17)
        elseif(x==73 and y==155) then
            MissionEvent(24)
        elseif(x==65 and y==135) then
            MissionEvent(25)
        elseif(x==87 and y==90) then
            MissionEvent(26)
        elseif((x==84 and y == 120) or (x==88 and y==108)) then
            MissionEvent(27)
        end
        
        -- those can happen with events above
        -- and some at the same time
        if(x==46 and y==182) then MissionEvent(28) end
        if(x==93 and y==165) then MissionEvent(29) end
        if(x==86 and y==144) then MissionEvent(30) end
        if(x==79 and y==124) then MissionEvent(31) end
        if(x==73 and y==155) then MissionEvent(32) end
        if(x==65 and y==136) then MissionEvent(33) end
        if(x==87 and y==90) then MissionEvent(34) end
        if(x==87 and y==87) then MissionEvent(35) end
        if(x==91 and y==84) then MissionEvent(36) end
    end
end

function onExplored(p, x, y, owner)
    if(p ~= 0 or owner == nil) then
        return
    end

    if (owner == 1) then
        MissionEvent(7)
    end
    
    if (owner == 3) then
        MissionEvent(19)
    end
    
    if (owner == 4) then
        MissionEvent(21)
    end
    
    if(x==90 and y==139) then
        MissionEvent(11)
    end
    
    if((x==84 and y==64) or (x==79 and y==62))then
        MissionEvent(22)
    end
end

function onSuggestPact(PactType, suggestedByPlayerIdx, targetPlayerIdx, duration)
    if(targetPlayerIdx ~= 1) then
        rttr:Log("Pact: Wrong target")
        return false;
    end

    if(eState[7] == 0) then
        if (PactType ~= TREATY_OF_ALLIANCE or duration ~= DURATION_INFINITE) then
            MissionEvent(8)
            rttr:Log("Pact: Wrong type")
            return false;
        else
            MissionEvent(9)
            rttr:Log("Pact: accept")
            return true;
        end
    end
end

function onCancelPactRequest(pactType, fromPlayerIdx, toPlayerIdx)
    return false;
end

function MissionEvent(e, onLoad)
    -- event e is inactive
    if(eState[e] <= 0) then
        rttr:Log("State less or equal 0")
        return
    end

    if(e == 1) then
        -- enable maintask
        tasks[1] = 1
        tasks[2] = 1
        tasks[3] = 101
    elseif(e == 2) then
        -- update task 2
        tasks[2] = 2    -- salvage ships done
        tasks[3] = 100  -- build 2 sawmills
        tasks[4] = 101  -- keep expanding

        -- add barracks
        rttr:GetPlayer(0):EnableBuilding(BLD_BARRACKS, not onLoad)

        -- add wood
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_WOOD] = 30})
        end

        -- remove ships
        rttr:GetWorld():AddStaticObject(88, 179, 551, 0xFFFF, 1)
        rttr:GetWorld():AddStaticObject(89, 177, 551, 0xFFFF, 1)
    elseif(e == 3) then
        if(not onLoad) then
            rttr:PostMessageWithLocation(0, _('lookhere'), 73, 186)
        end

        rttr:GetWorld():AddEnvObject(72, 183, 2524, 0xFFFF)
        rttr:GetWorld():AddEnvObject(75, 184, 2524, 0xFFFF)
        rttr:GetWorld():AddStaticObject(73, 186, 0, 2, 1)
        rttr:GetWorld():AddEnvObject(74, 186, 2255, 0xFFFF)
        rttr:GetWorld():AddEnvObject(73, 187, 2257, 0xFFFF)
        rttr:GetWorld():AddEnvObject(75, 185, 2253, 0xFFFF)
    elseif(e == 4) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 60})
            rttr:GetPlayer(0):AddPeople({
                [JOB_IRONFOUNDER] = 2,
                [JOB_ARMORER    ] = 2,
                [JOB_WOODCUTTER ] = 3,
                [JOB_STONEMASON ] = 3,
                [JOB_MINER      ] = 2
            })
        end
        tasks[4] = 100

        -- remove tools
        rttr:GetWorld():AddEnvObject(74, 186, 551, 0xFFFF)
        rttr:GetWorld():AddEnvObject(73, 187, 551, 0xFFFF)
        rttr:GetWorld():AddEnvObject(75, 185, 551, 0xFFFF)

        -- add quarry and woodcutter
        rttr:GetPlayer(0):EnableBuilding(BLD_WOODCUTTER, not onLoad)
        rttr:GetPlayer(0):EnableBuilding(BLD_QUARRY, not onLoad)
    elseif(e == 5) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_GRAIN] = 130})
        end

        rttr:GetPlayer(0):EnableBuilding(BLD_IRONSMELTER, not onLoad)
        rttr:GetPlayer(0):EnableBuilding(BLD_IRONMINE, not onLoad)
        rttr:GetPlayer(0):EnableBuilding(BLD_ARMORY, not onLoad)
        rttr:GetPlayer(0):EnableBuilding(BLD_WELL, not onLoad)
        rttr:GetPlayer(0):EnableBuilding(BLD_BREWERY, not onLoad)

        -- Burned farm (right of the player) --
        rttr:GetWorld():AddStaticObject(93, 165, 2525, 0xFFFF, 1)
        rttr:GetWorld():AddStaticObject(93, 167, 535, 0xFFFF, 1)
        rttr:GetWorld():AddStaticObject(92, 166, 535, 0xFFFF, 1)
        rttr:GetWorld():AddStaticObject(92, 163, 535, 0xFFFF, 1)
        rttr:GetWorld():AddStaticObject(94, 163, 535, 0xFFFF, 1)

        if(not onLoad) then
            rttr:PostMessageWithLocation(0, _('lookhere'), 93, 163)
        end

        tasks[5] = 1
        tasks[6] = 101
        tasks[7] = 101
        tasks[8] = 101
        tasks[9] = 101
        tasks[11] = 101
    elseif(e == 6) then
        -- nothing happening here
    elseif(e == 7) then
        tasks[6] = 102
    elseif(e == 8) then
        -- just a message
    elseif(e == 9) then
        tasks[6] = 103

        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20, [GD_FISH] = 200})
        end
    elseif(e == 10) then
        task[6] = 104
        
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 40, [GD_FISH] = 100})
        end
    elseif(e == 11) then
        if(not onLoad) then
            rttr:PostMessageWithLocation(0, _('lookhere'), 90, 139)
        end
    elseif(e == 12) then
        if(not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
        end
    elseif(e == 13) then
        tasks[8] = 102
    elseif(e == 14) then
        tasks[7] = 102
    elseif(e == 15) then
        tasks[9] = 102
    elseif(e == 16) then
        tasks[7] = 100
        tasks[8] = 100
        tasks[9] = 100
        tasks[5] = 2
    elseif(e == 17) then
        tasks[10] = 101
    elseif(e == 18) then
        tasks[10] = 102
        if(not onLoad) then
            rttr:GetPlayer(0):AddPeople({
                [JOB_SERGEANT] = 8,
                [JOB_PACKDONKEY] = 20
            })
        end
    elseif(e == 19) then
        -- nothing here
    elseif(e == 20) then
        rttr:GetPlayer(0):AddWares({[GD_COAL] = 20, [GD_COINS] = 3})
    elseif(e == 21) then
        tasks[1] = 2
    elseif(e == 22) then
        -- nothing here
    elseif(e == 23) then
        tasks[1] = 3
    elseif(e == 24) then
        -- nothing here
    elseif(e == 25) then
        -- nothing here
    elseif(e == 26) then
        -- nothing here
    elseif(e == 27) then
        rttr:GetPlayer(0):EnableBuilding(BLD_STOREHOUSE, not onLoad)
    elseif(e == 28) then
        if (not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
            rttr:PostMessageWithLocation(0, _('salvageCoal'), 46, 182)
        end
    elseif(e == 29) then
        if (not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
            rttr:PostMessageWithLocation(0, _('salvageCoal'), 93, 165)
        end
    elseif(e == 30) then
        if (not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
            rttr:PostMessageWithLocation(0, _('salvageCoal'), 86, 144)
        end
    elseif(e == 31) then
        if (not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
            rttr:PostMessageWithLocation(0, _('salvageCoal'), 79, 124)
        end
    elseif(e == 32) then
        if (not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
            rttr:PostMessageWithLocation(0, _('salvageCoal'), 73, 155)
        end
    elseif(e == 33) then
        if (not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
            rttr:PostMessageWithLocation(0, _('salvageCoal'), 65, 136)
        end
    elseif(e == 34) then
        if (not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
            rttr:PostMessageWithLocation(0, _('salvageCoal'), 87, 90)
        end
    elseif(e == 35) then
        if (not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
            rttr:PostMessageWithLocation(0, _('salvageCoal'), 87, 87)
        end
    elseif(e == 36) then
        if (not onLoad) then
            rttr:GetPlayer(0):AddWares({[GD_COAL] = 20})
            rttr:PostMessageWithLocation(0, _('salvageCoal'), 91, 84)
        end
    elseif(e == 99) then
        rttr:GetWorld():AddStaticObject(72, 28, 561, 0xFFFF, 2)
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

function addPlayerRes(p, onLoad)
    if onLoad then return end

    rttr:GetPlayer(p):ClearResources()

    if (p == 0) then
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD        ] = 0,
            [GD_BOARDS      ] = 20,
            [GD_STONES      ] = 16,
            [GD_HAM         ] = 0,
            [GD_GRAIN       ] = 0,
            [GD_FLOUR       ] = 0,
            [GD_FISH        ] = 0,
            [GD_MEAT        ] = 0,
            [GD_BREAD       ] = 0,
            [GD_WATER       ] = 0,
            [GD_BEER        ] = 0,
            [GD_COAL        ] = 0,
            [GD_IRONORE     ] = 0,
            [GD_GOLD        ] = 0,
            [GD_IRON        ] = 0,
            [GD_COINS       ] = 0,
            [GD_TONGS       ] = 0,
            [GD_AXE         ] = 0,
            [GD_SAW         ] = 0,
            [GD_PICKAXE     ] = 0,
            [GD_HAMMER      ] = 0,
            [GD_SHOVEL      ] = 0,
            [GD_CRUCIBLE    ] = 0,
            [GD_RODANDLINE  ] = 0,
            [GD_SCYTHE      ] = 0,
            [GD_CLEAVER     ] = 0,
            [GD_ROLLINGPIN  ] = 0,
            [GD_BOW         ] = 0,
            [GD_SWORD       ] = 0,
            [GD_SHIELD      ] = 0,
            [GD_BOAT        ] = 2
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 10,
            [JOB_WOODCUTTER         ] = 0,
            [JOB_FISHER             ] = 0,
            [JOB_FORESTER           ] = 0,
            [JOB_CARPENTER          ] = 2,
            [JOB_STONEMASON         ] = 0,
            [JOB_HUNTER             ] = 0,
            [JOB_FARMER             ] = 0,
            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 0,
            [JOB_MINER              ] = 0,
            [JOB_BREWER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,
            [JOB_IRONFOUNDER        ] = 0,
            [JOB_MINTER             ] = 0,
            [JOB_METALWORKER        ] = 0,
            [JOB_ARMORER            ] = 0,
            [JOB_BUILDER            ] = 6,
            [JOB_PLANER             ] = 2,
            [JOB_GEOLOGIST          ] = 0,
            [JOB_PRIVATE            ] = 16,
            [JOB_PRIVATEFIRSTCLASS  ] = 0,
            [JOB_SERGEANT           ] = 1,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0,
            [JOB_SCOUT              ] = 0,
            [JOB_SHIPWRIGHT         ] = 0,
            [JOB_PACKDONKEY         ] = 0,
            [JOB_BOATCARRIER        ] = 0,
            [JOB_CHARBURNER         ] = 0
        })
    elseif (p == 1) then
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD        ] = 0,
            [GD_BOARDS      ] = 18,
            [GD_STONES      ] = 16,
            [GD_HAM         ] = 0,
            [GD_GRAIN       ] = 0,
            [GD_FLOUR       ] = 0,
            [GD_FISH        ] = 0,
            [GD_MEAT        ] = 0,
            [GD_BREAD       ] = 0,
            [GD_WATER       ] = 0,
            [GD_BEER        ] = 0,
            [GD_COAL        ] = 0,
            [GD_IRONORE     ] = 0,
            [GD_GOLD        ] = 0,
            [GD_IRON        ] = 0,
            [GD_COINS       ] = 0,
            [GD_TONGS       ] = 0,
            [GD_AXE         ] = 0,
            [GD_SAW         ] = 0,
            [GD_PICKAXE     ] = 0,
            [GD_HAMMER      ] = 0,
            [GD_SHOVEL      ] = 0,
            [GD_CRUCIBLE    ] = 0,
            [GD_RODANDLINE  ] = 0,
            [GD_SCYTHE      ] = 0,
            [GD_CLEAVER     ] = 0,
            [GD_ROLLINGPIN  ] = 0,
            [GD_BOW         ] = 0,
            [GD_SWORD       ] = 0,
            [GD_SHIELD      ] = 0,
            [GD_BOAT        ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 10,
            [JOB_WOODCUTTER         ] = 0,
            [JOB_FISHER             ] = 0,
            [JOB_FORESTER           ] = 0,
            [JOB_CARPENTER          ] = 0,
            [JOB_STONEMASON         ] = 0,
            [JOB_HUNTER             ] = 0,
            [JOB_FARMER             ] = 0,
            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 0,
            [JOB_MINER              ] = 0,
            [JOB_BREWER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,
            [JOB_IRONFOUNDER        ] = 0,
            [JOB_MINTER             ] = 0,
            [JOB_METALWORKER        ] = 0,
            [JOB_ARMORER            ] = 0,
            [JOB_BUILDER            ] = 1,
            [JOB_PLANER             ] = 1,
            [JOB_GEOLOGIST          ] = 0,
            [JOB_PRIVATE            ] = 2,
            [JOB_PRIVATEFIRSTCLASS  ] = 0,
            [JOB_SERGEANT           ] = 0,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0,
            [JOB_SCOUT              ] = 0,
            [JOB_SHIPWRIGHT         ] = 0,
            [JOB_PACKDONKEY         ] = 0,
            [JOB_BOATCARRIER        ] = 0,
            [JOB_CHARBURNER         ] = 0
        })
    elseif (p == 2) then
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD        ] = 0,
            [GD_BOARDS      ] = 13,
            [GD_STONES      ] = 14,
            [GD_HAM         ] = 0,
            [GD_GRAIN       ] = 0,
            [GD_FLOUR       ] = 0,
            [GD_FISH        ] = 0,
            [GD_MEAT        ] = 0,
            [GD_BREAD       ] = 0,
            [GD_WATER       ] = 0,
            [GD_BEER        ] = 0,
            [GD_COAL        ] = 0,
            [GD_IRONORE     ] = 0,
            [GD_GOLD        ] = 0,
            [GD_IRON        ] = 0,
            [GD_COINS       ] = 0,
            [GD_TONGS       ] = 0,
            [GD_AXE         ] = 0,
            [GD_SAW         ] = 0,
            [GD_PICKAXE     ] = 0,
            [GD_HAMMER      ] = 0,
            [GD_SHOVEL      ] = 0,
            [GD_CRUCIBLE    ] = 0,
            [GD_RODANDLINE  ] = 0,
            [GD_SCYTHE      ] = 0,
            [GD_CLEAVER     ] = 0,
            [GD_ROLLINGPIN  ] = 0,
            [GD_BOW         ] = 0,
            [GD_SWORD       ] = 0,
            [GD_SHIELD      ] = 0,
            [GD_BOAT        ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 10,
            [JOB_WOODCUTTER         ] = 0,
            [JOB_FISHER             ] = 0,
            [JOB_FORESTER           ] = 0,
            [JOB_CARPENTER          ] = 0,
            [JOB_STONEMASON         ] = 0,
            [JOB_HUNTER             ] = 0,
            [JOB_FARMER             ] = 0,
            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 0,
            [JOB_MINER              ] = 0,
            [JOB_BREWER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,
            [JOB_IRONFOUNDER        ] = 0,
            [JOB_MINTER             ] = 0,
            [JOB_METALWORKER        ] = 0,
            [JOB_ARMORER            ] = 0,
            [JOB_BUILDER            ] = 1,
            [JOB_PLANER             ] = 1,
            [JOB_GEOLOGIST          ] = 0,
            [JOB_PRIVATE            ] = 4,
            [JOB_PRIVATEFIRSTCLASS  ] = 5,
            [JOB_SERGEANT           ] = 0,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0,
            [JOB_SCOUT              ] = 0,
            [JOB_SHIPWRIGHT         ] = 0,
            [JOB_PACKDONKEY         ] = 0,
            [JOB_BOATCARRIER        ] = 0,
            [JOB_CHARBURNER         ] = 0
        })
    elseif (p == 3) then
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD        ] = 0,
            [GD_BOARDS      ] = 24,
            [GD_STONES      ] = 21,
            [GD_HAM         ] = 0,
            [GD_GRAIN       ] = 0,
            [GD_FLOUR       ] = 0,
            [GD_FISH        ] = 0,
            [GD_MEAT        ] = 0,
            [GD_BREAD       ] = 0,
            [GD_WATER       ] = 0,
            [GD_BEER        ] = 0,
            [GD_COAL        ] = 0,
            [GD_IRONORE     ] = 0,
            [GD_GOLD        ] = 0,
            [GD_IRON        ] = 0,
            [GD_COINS       ] = 0,
            [GD_TONGS       ] = 0,
            [GD_AXE         ] = 0,
            [GD_SAW         ] = 0,
            [GD_PICKAXE     ] = 0,
            [GD_HAMMER      ] = 0,
            [GD_SHOVEL      ] = 0,
            [GD_CRUCIBLE    ] = 0,
            [GD_RODANDLINE  ] = 0,
            [GD_SCYTHE      ] = 0,
            [GD_CLEAVER     ] = 0,
            [GD_ROLLINGPIN  ] = 0,
            [GD_BOW         ] = 0,
            [GD_SWORD       ] = 0,
            [GD_SHIELD      ] = 0,
            [GD_BOAT        ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 10,
            [JOB_WOODCUTTER         ] = 0,
            [JOB_FISHER             ] = 0,
            [JOB_FORESTER           ] = 0,
            [JOB_CARPENTER          ] = 0,
            [JOB_STONEMASON         ] = 0,
            [JOB_HUNTER             ] = 0,
            [JOB_FARMER             ] = 0,
            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 0,
            [JOB_MINER              ] = 0,
            [JOB_BREWER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,
            [JOB_IRONFOUNDER        ] = 0,
            [JOB_MINTER             ] = 1,
            [JOB_METALWORKER        ] = 0,
            [JOB_ARMORER            ] = 0,
            [JOB_BUILDER            ] = 1,
            [JOB_PLANER             ] = 1,
            [JOB_GEOLOGIST          ] = 0,
            [JOB_PRIVATE            ] = 4,
            [JOB_PRIVATEFIRSTCLASS  ] = 8,
            [JOB_SERGEANT           ] = 1,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0,
            [JOB_SCOUT              ] = 1,
            [JOB_SHIPWRIGHT         ] = 0,
            [JOB_PACKDONKEY         ] = 0,
            [JOB_BOATCARRIER        ] = 0,
            [JOB_CHARBURNER         ] = 0
        })
    elseif (p == 4) then
        rttr:GetPlayer(p):AddWares({
            [GD_WOOD        ] = 0,
            [GD_BOARDS      ] = 32,
            [GD_STONES      ] = 33,
            [GD_HAM         ] = 0,
            [GD_GRAIN       ] = 0,
            [GD_FLOUR       ] = 0,
            [GD_FISH        ] = 0,
            [GD_MEAT        ] = 0,
            [GD_BREAD       ] = 0,
            [GD_WATER       ] = 0,
            [GD_BEER        ] = 0,
            [GD_COAL        ] = 3000,
            [GD_IRONORE     ] = 1000,
            [GD_GOLD        ] = 0,
            [GD_IRON        ] = 2000,
            [GD_COINS       ] = 0,
            [GD_TONGS       ] = 0,
            [GD_AXE         ] = 0,
            [GD_SAW         ] = 0,
            [GD_PICKAXE     ] = 0,
            [GD_HAMMER      ] = 0,
            [GD_SHOVEL      ] = 0,
            [GD_CRUCIBLE    ] = 0,
            [GD_RODANDLINE  ] = 0,
            [GD_SCYTHE      ] = 0,
            [GD_CLEAVER     ] = 0,
            [GD_ROLLINGPIN  ] = 0,
            [GD_BOW         ] = 0,
            [GD_SWORD       ] = 0,
            [GD_SHIELD      ] = 0,
            [GD_BOAT        ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
            [JOB_HELPER             ] = 10,
            [JOB_WOODCUTTER         ] = 0,
            [JOB_FISHER             ] = 0,
            [JOB_FORESTER           ] = 0,
            [JOB_CARPENTER          ] = 0,
            [JOB_STONEMASON         ] = 0,
            [JOB_HUNTER             ] = 0,
            [JOB_FARMER             ] = 0,
            [JOB_MILLER             ] = 0,
            [JOB_BAKER              ] = 0,
            [JOB_BUTCHER            ] = 0,
            [JOB_MINER              ] = 0,
            [JOB_BREWER             ] = 0,
            [JOB_PIGBREEDER         ] = 0,
            [JOB_DONKEYBREEDER      ] = 0,
            [JOB_IRONFOUNDER        ] = 1,
            [JOB_MINTER             ] = 0,
            [JOB_METALWORKER        ] = 0,
            [JOB_ARMORER            ] = 2,
            [JOB_BUILDER            ] = 1,
            [JOB_PLANER             ] = 1,
            [JOB_GEOLOGIST          ] = 0,
            [JOB_PRIVATE            ] = 20,
            [JOB_PRIVATEFIRSTCLASS  ] = 10,
            [JOB_SERGEANT           ] = 1,
            [JOB_OFFICER            ] = 0,
            [JOB_GENERAL            ] = 0,
            [JOB_SCOUT              ] = 1,
            [JOB_SHIPWRIGHT         ] = 0,
            [JOB_PACKDONKEY         ] = 0,
            [JOB_BOATCARRIER        ] = 0,
            [JOB_CHARBURNER         ] = 0
        })
    end
end