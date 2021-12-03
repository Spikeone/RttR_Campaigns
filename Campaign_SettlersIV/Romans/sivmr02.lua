function getRequiredLuaVersion()
    return 1
end

rttr:RegisterTranslations(
{
    en =
    {

        name    = 'Nubian Tribe',

        title   = 'The Magic of the South',

        msg1    = 'Demonstrate your might by conquering the Gate marked by\nspecial terrain on the south-east coast of the Nubian land.\n\nWe have managed to subdue the plundering tribe of the north.\nMany of our younger recruits have first blood on their swords\nand shields. Exhilaration and fatigue take their turns. We have\nno time to recoup our strength. Another tribe, a bronzed people,\nhas appeared in the south. Some of our thieves were unpleasantly\nsuprised by their stealth. May Jupiter steel our strength and\nresolve to overcome this new threat.\n\nOddly, the dreams of our priests continue. In them the she-wolf\nruns from place to place, rarely finding and opportunity to curl\nand lie down. Our priests are still stymied by these visions.',
        msg2    = 'If marching straight through the Nubians\' territory seems to be\na little too dangerous, maybe there are other ways to reach the\nsanctified relict...',
        msg3    = 'We secured the relict, those nubians surrendered and fled!\n\nApedemak - Nubian god of war\nAnuket - Water-Goddess\nMiket - Goddess',
        msg4    = 'Our medics report that the general we have rescued feels better\nalready and he told us that a small military base he was building\nhas been overun by those nubian babarians! Maybe we can find some\nusefully supplies.',
        msg5    = 'The misery of this land speaks a thousand words...\nWe were not able to find any survivor but uncounted dead\nbodies. At least we could find some swords and shields of\nour fallen comrades. Those Nubians will pay for what they did!',

        chat1   = 'Nubian Tribe: Bloody beasts, Apedemak may help us!',
        chat2   = 'Nubian Priests: Anuket, destroy those heretic water-machines!',
        chat3   = 'Nubian Tribe: We fight for Miket!',
        chat4   = 'Dehydrated General: Water... please...',

        post1   = 'Thats the position.'
    }
})

-- you can edit this
local useExtraEvents = false

-- but not this
local aiStrengthLast = 0
local aiStrengthCurrent = 0

local plrStrengthLast = 0
local plrStrengthCurrent = 0

local aiRageShown = false
local aiTriggered = false
local plrHintShown = false
local aiHarborShown = false
local aiGuardhouseAllowed = true
local plrExtraWaresAdded = false

local timedChatEventGF = 0

function onSave(saveGame)
    saveGame:PushInt(aiStrengthLast)
    saveGame:PushInt(aiStrengthCurrent)

    saveGame:PushInt(plrStrengthLast)
    saveGame:PushInt(plrStrengthCurrent)

    saveGame:PushBool(aiRageShown)
    saveGame:PushBool(aiTriggered)
    saveGame:PushBool(plrHintShown)
    saveGame:PushBool(aiHarborShown)
    saveGame:PushBool(aiGuardhouseAllowed)
    saveGame:PushBool(plrExtraWaresAdded)
    
    saveGame:PushInt(timedChatEventGF)

    return true
end

function onLoad(saveGame)
    aiStrengthLast = saveGame:PopInt()
    aiStrengthCurrent = saveGame:PopInt()

    plrStrengthLast = saveGame:PopInt()
    plrStrengthCurrent = saveGame:PopInt()

    aiRageShown = saveGame:PopBool()
    aiTriggered = saveGame:PopBool()
    plrHintShown = saveGame:PopBool()
    aiHarborShown = saveGame:PopBool()
    aiGuardhouseAllowed = saveGame:PopBool()
    plrExtraWaresAdded = saveGame:PopBool()

    timedChatEventGF = saveGame:PopInt()

    return true
end


function onSettingsReady()
    rttr:Log("-----------------------\n Mission Script loaded... \n-----------------------\n")

    rttr:MsgBox('Information', 'You can change some addons. They have been set to the original intention, so keep that in mind.', false)
    
    rttr:ResetAddons()                          -- S2-settings
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    -- 0 = don't block
    -- 1 = block
    -- 2 = no sea attacks
    rttr:SetAddon(ADDON_SEA_ATTACK, 0)
    rttr:SetAddon(ADDON_CATAPULT_GRAPHICS, true)
    -- EXP_DISABLED
    -- EXP_CLASSIC
    rttr:SetGameSettings({
        ["fow"] = EXP_CLASSIC,
        ["teamView"] = false,
        ["lockedTeams"] = false
    })

    rttr:GetPlayer(0):SetNation(NAT_ROMANS)
    rttr:GetPlayer(0):SetColor(1)
    
    rttr:GetPlayer(1):SetNation(NAT_AFRICANS)
    rttr:GetPlayer(1):SetColor(0)
    rttr:GetPlayer(1):SetAI(3)
    rttr:GetPlayer(1):SetName(_('name'))
end

function getAllowedChanges()
    return  { 
        ["addonsAll"]   = false,
        ["addonsSome"]  = true,
        ["ownNation"]   = false,
        ["ownColor"]    = false,
        ["ownTeam"]     = false,
        ["aiNation"]    = false,
        ["aiColor"]     = false,
        ["aiTeam"]      = false
    }
end

function getAllowedAddons()
    return {
        ADDON_INEXHAUSTIBLE_MINES,
        ADDON_TOOL_ORDERING,
        ADDON_CATAPULT_GRAPHICS,
        ADDON_NO_COINS_DEFAULT,
        ADDON_MANUAL_ROAD_ENLARGEMENT,
        ADDON_METALWORKSBEHAVIORONZERO
    }
end

function calculatePlayerStrength(plrId)
    local plr = rttr:GetPlayer(plrId)

    return (plr:GetNumPeople(JOB_PRIVATE) +
            plr:GetNumPeople(JOB_PRIVATEFIRSTCLASS) +
            plr:GetNumPeople(JOB_SERGEANT) +
            plr:GetNumPeople(JOB_OFFICER) +
            plr:GetNumPeople(JOB_GENERAL))
end

function onStart(isFirstStart)
    if (not aiTriggered) then
        --rttr:GetPlayer(1):SetRestrictedArea(12, 71, 98, 34, 127, 145, 3, 147)
        rttr:GetPlayer(1):SetRestrictedArea(
            46, 96,
            45, 85,
            50, 74,
            61, 73,
            72, 64,
            82, 65,
            91, 72,
            96, 77,
            101, 80,
            104, 90,
            104, 150,
            62, 150,
            59, 127,
            54, 115,
            48, 110
        )
    else
        rttr:GetPlayer(1):SetRestrictedArea()
    end

    rttr:GetPlayer(1):AIConstructionOrder(47, 100, BLD_FORTRESS)
    rttr:GetPlayer(1):AIConstructionOrder(39, 102, BLD_FORTRESS)
    rttr:GetPlayer(1):AIConstructionOrder(74, 125, BLD_GUARDHOUSE)

    if (isFirstStart and useExtraEvents) then
        -- currently buggy
        ----Burnt building
        --rttr:GetWorld():AddEnvObject(21, 48, 2524, 0xFFFF)

        ----shield
        --rttr:GetWorld():AddEnvObject(24, 48, 2271, 0xFFFF)

        ----sword
        --rttr:GetWorld():AddEnvObject(23, 48, 2266, 0xFFFF)

        ----skeletons(white)
        --rttr:GetWorld():AddEnvObject(26, 44, 547, 0xFFFF)
        --rttr:GetWorld():AddEnvObject(20, 43, 547, 0xFFFF)
        --rttr:GetWorld():AddEnvObject(19, 50, 547, 0xFFFF)
        --rttr:GetWorld():AddEnvObject(18, 52, 547, 0xFFFF)
        --rttr:GetWorld():AddEnvObject(14, 47, 547, 0xFFFF)
        --rttr:GetWorld():AddEnvObject(14, 54, 547, 0xFFFF)

        ----skeletons(black)
        --rttr:GetWorld():AddEnvObject(20, 53, 548, 0xFFFF)
        --rttr:GetWorld():AddEnvObject(28, 45, 548, 0xFFFF)
        --rttr:GetWorld():AddEnvObject(16, 41, 548, 0xFFFF)

        ----special markers(roadbuilding)
        --rttr:GetWorld():AddStaticObject(88, 113, 21, 0xFFFF)
        --rttr:GetWorld():AddStaticObject(90, 113, 21, 0xFFFF)
        --rttr:GetWorld():AddStaticObject(91, 115, 21, 0xFFFF)
        --rttr:GetWorld():AddStaticObject(90, 117, 21, 0xFFFF)
        --rttr:GetWorld():AddStaticObject(88, 117, 21, 0xFFFF)
        --rttr:GetWorld():AddStaticObject(87, 115, 21, 0xFFFF)

        ----coal
        --rttr:GetWorld():AddEnvObject(62, 31, 688, 0xFFFF)

        ----iron
        --rttr:GetWorld():AddEnvObject(49, 19, 682, 0xFFFF)

        ----gold
        --rttr:GetWorld():AddEnvObject(25, 45, 685, 0xFFFF)
    end

    rttr:GetPlayer(1):DisableBuilding(BLD_BARRACKS)
    rttr:GetPlayer(1):DisableBuilding(BLD_CATAPULT)
    rttr:GetPlayer(1):DisableBuilding(BLD_SHIPYARD)
    rttr:GetPlayer(1):DisableBuilding(BLD_HARBORBUILDING)

    if (not aiGuardhouseAllowed) then
        rttr:GetPlayer(1):DisableBuilding(BLD_GUARDHOUSE)
    end

    addPlayerRes(0, not isFirstStart)
    addPlayerRes(1, not isFirstStart)

    plrStrengthLast = calculatePlayerStrength(0)
    aiStrengthCurrent = plrStrengthLast

    aiStrengthLast = calculatePlayerStrength(1)
    aiStrengthCurrent = aiStrengthLast
end

function addPlayerRes(p, onLoad)
    if onLoad then return end

    if(p == 0) then
        -- goods
        rttr:GetPlayer(p):ClearResources()

        rttr:GetPlayer(p):AddWares({
            [GD_BEER      ] = 12,
            [GD_TONGS     ] = 0,
            [GD_HAMMER    ] = 8,
            [GD_AXE       ] = 6,
            [GD_SAW       ] = 2,
            [GD_PICKAXE   ] = 6,
            [GD_SHOVEL    ] = 0,
            [GD_CRUCIBLE  ] = 0,
            [GD_RODANDLINE] = 4,
            [GD_SCYTHE    ] = 2,
            [GD_WATER     ] = 12,
            [GD_CLEAVER   ] = 1,
            [GD_ROLLINGPIN] = 1,
            [GD_BOW       ] = 2,
            [GD_BOAT      ] = 20,
            [GD_SWORD     ] = 0,
            [GD_IRON      ] = 0,
            [GD_FLOUR     ] = 0,
            [GD_FISH      ] = 8,
            [GD_BREAD     ] = 8,
            [GD_SHIELD    ] = 0,
            [GD_WOOD      ] = 20,
            [GD_BOARDS    ] = 40,
            [GD_STONES    ] = 40,
            [GD_GRAIN     ] = 0,
            [GD_COINS     ] = 0,
            [GD_GOLD      ] = 0,
            [GD_IRONORE   ] = 18,
            [GD_COAL      ] = 36,
            [GD_MEAT      ] = 0,
            [GD_HAM       ] = 0
        })

        -- people
        rttr:GetPlayer(p):AddPeople({
        [JOB_HELPER             ] = 30,
        [JOB_WOODCUTTER         ] = 6,
        [JOB_FISHER             ] = 0,
        [JOB_FORESTER           ] = 2,
        [JOB_CARPENTER          ] = 2,
        [JOB_STONEMASON         ] = 3,
        [JOB_HUNTER             ] = 1,
        [JOB_FARMER             ] = 6,
        [JOB_MILLER             ] = 3,
        [JOB_BAKER              ] = 3,
        [JOB_BUTCHER            ] = 3,
        [JOB_MINER              ] = 6,
        [JOB_BREWER             ] = 1,
        [JOB_PIGBREEDER         ] = 4,
        [JOB_DONKEYBREEDER      ] = 0,
        [JOB_IRONFOUNDER        ] = 2,
        [JOB_MINTER             ] = 1,
        [JOB_METALWORKER        ] = 1,
        [JOB_ARMORER            ] = 2,
        [JOB_BUILDER            ] = 14,
        [JOB_PLANER             ] = 8,
        [JOB_GEOLOGIST          ] = 4,
        [JOB_PRIVATE            ] = 0,
        [JOB_PRIVATEFIRSTCLASS  ] = 20,
        [JOB_SERGEANT           ] = 0,
        [JOB_OFFICER            ] = 0,
        [JOB_GENERAL            ] = 0,
        [JOB_SCOUT              ] = 4,
        [JOB_SHIPWRIGHT         ] = 1,
        [JOB_PACKDONKEY         ] = 0,
        [JOB_CHARBURNER         ] = 0
        })
    elseif (p == 1) then
        rttr:GetPlayer(p):ClearResources()

        rttr:GetPlayer(p):AddWares({
            [GD_BEER      ] = 12,
            [GD_TONGS     ] = 0,
            [GD_HAMMER    ] = 12,
            [GD_AXE       ] = 6,
            [GD_SAW       ] = 2,
            [GD_PICKAXE   ] = 4,
            [GD_SHOVEL    ] = 0,
            [GD_CRUCIBLE  ] = 0,
            [GD_RODANDLINE] = 6,
            [GD_SCYTHE    ] = 10,
            [GD_WATER     ] = 12,
            [GD_CLEAVER   ] = 3,
            [GD_ROLLINGPIN] = 3,
            [GD_BOW       ] = 2,
            [GD_BOAT      ] = 0,
            [GD_SWORD     ] = 0,
            [GD_IRON      ] = 0,
            [GD_FLOUR     ] = 0,
            [GD_FISH      ] = 20,
            [GD_BREAD     ] = 10,
            [GD_SHIELD    ] = 0,
            [GD_WOOD      ] = 30,
            [GD_BOARDS    ] = 999,
            [GD_STONES    ] = 999,
            [GD_GRAIN     ] = 0,
            [GD_COINS     ] = 15,
            [GD_GOLD      ] = 10,
            [GD_IRONORE   ] = 20,
            [GD_COAL      ] = 30,
            [GD_MEAT      ] = 5,
            [GD_HAM       ] = 0
        })

        -- people
        -- Balancing: Generals 15 to 8
        -- Sergeant: 30 to 24
        rttr:GetPlayer(p):AddPeople({
        [JOB_HELPER             ] = 60,
        [JOB_WOODCUTTER         ] = 10,
        [JOB_FISHER             ] = 0,
        [JOB_FORESTER           ] = 6,
        [JOB_CARPENTER          ] = 4,
        [JOB_STONEMASON         ] = 6,
        [JOB_HUNTER             ] = 4,
        [JOB_FARMER             ] = 4,
        [JOB_MILLER             ] = 2,
        [JOB_BAKER              ] = 2,
        [JOB_BUTCHER            ] = 2,
        [JOB_MINER              ] = 10,
        [JOB_BREWER             ] = 1,
        [JOB_PIGBREEDER         ] = 2,
        [JOB_DONKEYBREEDER      ] = 0,
        [JOB_IRONFOUNDER        ] = 3,
        [JOB_MINTER             ] = 1,
        [JOB_METALWORKER        ] = 2,
        [JOB_ARMORER            ] = 2,
        [JOB_BUILDER            ] = 20,
        [JOB_PLANER             ] = 10,
        [JOB_GEOLOGIST          ] = 10,
        [JOB_PRIVATE            ] = 0,
        [JOB_PRIVATEFIRSTCLASS  ] = 0,
        [JOB_SERGEANT           ] = 24,
        [JOB_OFFICER            ] = 0,
        [JOB_GENERAL            ] = 8,
        [JOB_SCOUT              ] = 5,
        [JOB_SHIPWRIGHT         ] = 0,
        [JOB_PACKDONKEY         ] = 20,
        [JOB_CHARBURNER         ] = 0
        })
    end
end

function onGameFrame(gf)
    if((gf%20)~=0) then
        return
    end

    -- This event is triggered when the AI loses some soldier(s) thus 'enraging' it
    if (not aiRageShown) then
        aiStrengthCurrent = calculatePlayerStrength(1)
        if(aiStrengthCurrent < aiStrengthLast) then
            rttr:Chat(0, _('chat3'))
            aiRageShown = true
        else
            aiStrengthLast = aiStrengthCurrent
        end
    end

    -- This event shows the tip to the player
    if (not plrHintShown) then
        --rttr:Log("plrStrengthCurrent: " ..plrStrengthCurrent.. " plrStrengthLast: " ..plrStrengthLast)
        plrStrengthCurrent = calculatePlayerStrength(0)

        --rttr:Log("plrStrengthCurrent: " ..plrStrengthCurrent.. " plrStrengthLast: " ..plrStrengthLast)
        if(plrStrengthCurrent < plrStrengthLast) then
            rttr:MissionStatement(0, _('title'), _('msg2'))
            plrHintShown = true
        else
            plrStrengthLast = plrStrengthCurrent
        end
    end

    --harbor checker
    if (not aiHarborShown) then
        if(rttr:GetPlayer(0):GetNumBuildings(BLD_HARBORBUILDING) >=1) then
            rttr:Chat(0, _('chat2'))
            aiHarborShown = true
        end
    end

    if (timedChatEventGF > 0 and gf > timedChatEventGF) then
        rttr:MissionStatement(0, _('title'), _('msg4'))
        rttr:PostMessageWithLocation(0, _('post1'), 24, 50)
        timedChatEventGF = -1
    end

    if(gf == 60) then
        rttr:MissionStatement(0, _('title'), _('msg1'))
    end
end

function onOccupied(p,x,y)

    if (p == 1) then
        -- can't remember why
        if (x==50 and y==103) then
            rttr:GetPlayer(1):AIConstructionOrder(x, y, BLD_FORTRESS)
            rttr:GetPlayer(1):DisableBuilding(BLD_GUARDHOUSE)
            aiGuardhouseAllowed = false
        end
        
        --if (x==39 and y == 104) then
        --    rttr:GetPlayer(1):AIConstructionOrder(x, y, BLD_FORTRESS)
        --    --rttr:GetPlayer(1):DisableBuilding(BLD_GUARDHOUSE)
        --    aiGuardhouseAllowed = false
        --end
    elseif (p == 0) then
        -- this shows the chat event and triggers the extra mission statement
        if (x==32 and y==35 and timedChatEventGF == 0 and useExtraEvents) then
            rttr:Chat(0, _('chat4'))
            -- the event should be triggered 1000 GF later
            -- but as onGameFrame is only checked every 20 GF, one has to make sure to hit that one
            timedChatEventGF = math.floor(rttr:GetGF() / 20) * 20 + 1000
            rttr:Log("setting timedChatEventGF to: " ..timedChatEventGF)

        --elseif ((x==31 and y==61) or (x==55 and y==74) and not aiTriggered) then
        elseif (((x == 31 and y == 81) or
                (x == 39 and y == 88) or
                (x == 43 and y == 33) or
                (x == 46 and y == 67) or
                (x == 52 and y == 68) or
                (x == 60 and y == 68) or
                (x == 66 and y == 66)) and
                not aiTriggered) then
            -- lift AI restrictions if player epands towards it
            rttr:Chat(0, _('chat1'))
            rttr:GetPlayer(1):SetRestrictedArea()
            aiTriggered = true

        elseif ((x>= 23 and x<=24) and (y>=47 and y<=50) and not plrExtraWaresAdded and useExtraEvents) then
            -- add wares when reaching the destroyed settlement
            rttr:PostMessageWithLocation(0, _('post1'), 23, 49)
            rttr:MissionStatement(0, _('title'), _('msg5'))
            rttr:GetPlayer(0):AddWares({[GD_SWORD] = 10, [GD_SHIELD] = 10})
            plrExtraWaresAdded = true

        elseif (x==89 and y==115) then
            rttr:MissionStatement(0, _('title'), _('msg3'))
            -- I don't think this message here was correct
            -- rttr:Chat(0, _('chat3'))

            -- currently buggy
            -- rttr:GetWorld():AddStaticObject(89,115,561,0xFFFF,2)
        end
    end
end