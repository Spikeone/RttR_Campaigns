--tested with RTTR 0.95
function getRequiredLuaVersion()
    return 1
end

p1_is_ai = false

----------------------------------BlockageWall_Class-----------------------------------------

local BlockageWall_Class= {}
BlockageWall_Class.__index = BlockageWall_Class

setmetatable(BlockageWall_Class, {
  __call = function (cls, ...)
    return cls:_init(...)
  end,
})

function BlockageWall_Class:_init()
	local o= setmetatable({}, self)
	o.block_id = 2250 --barrels
	--o.block_id = 519 --stone
	--o.block_id = 3105 --"invisible"
	o.wall_breach_started = false
	o.lowest_ai_y = 0
	return o
end

function BlockageWall_Class:insertCoord(x_coord, y_coord)
    coordset = {x=x_coord,y=y_coord}
    table.insert(self, coordset)
end
function BlockageWall_Class:drawOnMap()
    for i,coord in ipairs(self) do
		rttr:GetWorld():AddStaticObject(coord.x, coord.y, self.block_id, 0xFFFF, 1)
    end
end

function BlockageWall_Class:clearBlockageBelow(y_coord)
    for i,coord in ipairs(self) do
		if (coord.y > y_coord)then
			rttr:GetWorld():AddStaticObject(coord.x, coord.y, self.block_id, 0xFFFF, 0)
		end
    end
end
-------------------------------------------------------------------------------------------
blockageWall = BlockageWall_Class()

-- Message-Window (mission statement and hints): 52 chars wide
eIdx = {1, 2, 99}

local debugTexts = false;
rttr:RegisterTranslations(
{
    en =
    {
        title   = 'Ole, der Schiffsbauer',
        name    = 'Unbekannter Gegner',
        diary   = 'Tagebuch',

        msg1    = 'nothing',

		msg2	= 'nothing',
		
        msg99   = 'nothing.',
    }
})

-- format mission texts
function MissionText(e, silent)
    local msg = _('msg' .. tostring(e))

    if(msg ~= ('msg' .. tostring(e))) then
        if not silent then
            rttr:MissionStatement(0, _('diary'), msg .. '\n\n\n\n\n\n\n', IM_SWORDSMAN, true)
        end
        rttr:SetMissionGoal(0, msg)
    else
        rttr:Log("Error: no Translation found!" .. _(msg))
    end
end

function onSettingsReady()
    rttr:Log("-----------------------\n Mission Script loaded... \n-----------------------\n")

    rttr:ResetAddons()                          -- S2-settings
    rttr:SetAddon(ADDON_FRONTIER_DISTANCE_REACHABLE, true)
    rttr:SetAddon(ADDON_CATAPULT_GRAPHICS, true)
	rttr:SetAddon(ADDON_TRADE, true)
	rttr:SetAddon(ADDON_NO_COINS_DEFAULT, true)
	rttr:SetAddon(ADDON_TOOL_ORDERING, true)
	rttr:SetAddon(ADDON_INEXHAUSTIBLE_GRANITEMINES, true)
	rttr:SetAddon(ADDON_METALWORKSBEHAVIORONZERO, true)
	--rttr:SetAddon(ADDON_INEXHAUSTIBLE_FISH, true)
	rttr:SetAddon(ADDON_CHARBURNER, true)

    rttr:SetGameSettings({
        ["fow"] = EXP_FOGOFWAR,--EXP_FOGOFWAREXPLORED,
        ["teamView"] = true,
        ["lockedTeams"] = true,
        ["startWares"] = SWR_NORMAL,
        ["objective"] = GO_TOTALDOMINATION
    })

    rttr:GetPlayer(0):SetNation(NAT_ROMANS)
	rttr:GetPlayer(0):SetTeam(TM_TEAM1)
	--rttr:GetPlayer(p):SetName('Hans')
	rttr:GetPlayer(1):SetNation(NAT_ROMANS)
	rttr:GetPlayer(1):SetTeam(TM_TEAM1)
	--rttr:GetPlayer(p):SetName('Vedat')
	
	rttr:GetPlayer(1):SetAI(3)
	rttr:GetPlayer(1):SetName('AI Catapult Homie (set to Open, Team 1 for Multiplayer)')
	
    for p = 2, 2 do
        rttr:GetPlayer(p):SetNation(NAT_VIKINGS)
        --rttr:GetPlayer(p):SetTeam(TM_TEAM1)
        rttr:GetPlayer(p):SetAI(3)
        --rttr:GetPlayer(p):SetName(_('name'))
		rttr:GetPlayer(p):SetName("Josepherus Joseffson")
    end
end

function getAllowedChanges()
    return  { 
--        ["addonsAll"]   = false,
--        ["addonsSome"]  = true,
--        ["ownNation"]   = false,
--        ["ownColor"]    = true,
        ["ownTeam"]     = false,
        ["aiNation"]    = false,
        ["aiColor"]     = true,
        ["aiTeam"]      = false,
        ["playerState"] = true
		
	}
end

function getAllowedAddons()
    return {
		ADDON_NO_COINS_DEFAULT,		--not accepting coins in military buildings by default
		ADDON_COINS_CAPTURED_BLD,	--not accepting coins in captured buildings by default
        ADDON_TOOL_ORDERING,
        ADDON_CATAPULT_GRAPHICS,
        ADDON_MANUAL_ROAD_ENLARGEMENT,
        ADDON_METALWORKSBEHAVIORONZERO
    }
end

coor = {}
function addStaticLineVertical (x, y_start, y_end, id)
	if (y_end > y_start) then
		increment = 1
	else
		increment = -1
	end
	for i=y_start,y_end,increment
	do
		blockageWall:insertCoord(x, i)
	end
end

function addStaticLineHorizontal (y, x_start, x_end, id)
	if (x_end > x_start) then
		increment = 1
	else
		increment = -1
	end
	for i=x_start,x_end,increment
	do
		blockageWall:insertCoord(i, y)
	end
end

function executeBlock()
	for x,y in pairs(blockagePoints) do
	  print(k,v)
	end
end


function onStart(isFirstStart)
	if(rttr:GetPlayer(1):IsAI()) then
		p1_is_ai = true
	end
	
    addResources(not isFirstStart)
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
        --MissionEvent(1)                         -- initial event / start screen
    end



    if(isFirstStart) then
		--add "invisible wall", so the ai does not attack and build over the mountain
		id = 519 --stone
		--id = 3105 --"invisible"
		--left side
		addStaticLineVertical (24, 6, 19, id)
		addStaticLineVertical (25, 20, 21, id)
		addStaticLineVertical (26, 22, 27, id)
		addStaticLineVertical (27, 28, 54, id)
		--addStaticLineVertical (28, 34, 44, id) --plug hole
		addStaticLineVertical (28, 54, 56, id)
		addStaticLineVertical (29, 56, 70, id)
		--top
		addStaticLineHorizontal (5, 24, 28, id)
		addStaticLineHorizontal (4, 28, 35, id)
		addStaticLineHorizontal (5, 35, 38, id)
		--right side
		addStaticLineVertical (39, 6, 35, id)
		addStaticLineVertical (38, 35, 41, id)
		addStaticLineVertical (37, 41, 48, id)
		addStaticLineVertical (36, 49, 60, id)
		addStaticLineVertical (35, 51, 68, id)
		addStaticLineVertical (34, 55, 55, id)
		--bottom
		addStaticLineHorizontal (68, 29, 34, id)
		blockageWall:drawOnMap()
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

function addPlayerResources()
--[[
	--Host Player (Player 0)
	p = 0
	rttr:GetPlayer(p):ClearResources()

	--rttr:GetPlayer(p):DisableBuilding(BLD_GUARDHOUSE)
	--rttr:GetPlayer(p):DisableBuilding(BLD_WATCHTOWER)
	--rttr:GetPlayer(p):DisableBuilding(BLD_FORTRESS)
	--rttr:GetPlayer(p):DisableBuilding(BLD_CATAPULT)
	--rttr:GetPlayer(p):DisableBuilding(BLD_LOOKOUTTOWER)

	rttr:GetPlayer(p):AddWares({
		[GD_WOOD      ] = 30,
		[GD_BOARDS    ] = 11,
		[GD_STONES    ] = 17,
		[GD_MEAT      ] = 0,
		[GD_GRAIN     ] = 100,  --must be 0, grain quest
		[GD_FLOUR     ] = 0,

		[GD_FISH      ] = 1,
		[GD_HAM       ] = 0,
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
		[GD_HAMMER    ] = 0,
		[GD_SHOVEL    ] = 1,
		[GD_CRUCIBLE  ] = 0,  --must be 0, minter quest
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
		[JOB_HUNTER             ] = 0,
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
		[JOB_MINTER             ] = 1,
		[JOB_METALWORKER        ] = 1,
		[JOB_SHIPWRIGHT         ] = 0,
		[JOB_GEOLOGIST          ] = 2,
		[JOB_SCOUT              ] = 1,

		[JOB_PACKDONKEY         ] = 100, --should be limited
		[JOB_CHARBURNER         ] = 0,


		[JOB_PRIVATE            ] = 30,
		[JOB_PRIVATEFIRSTCLASS  ] = 15,
		[JOB_SERGEANT           ] = 5,
		[JOB_OFFICER            ] = 0,
		[JOB_GENERAL            ] = 0
	})
	]]--
	--Co-Op Player (Player 1)
	p=1
	if(p1_is_ai) then
		--disable big mil buildings so the ai expands faster
		--they are enabled later with onOccupied
		rttr:GetPlayer(p):DisableBuilding(BLD_WATCHTOWER)
		rttr:GetPlayer(p):DisableBuilding(BLD_FORTRESS)
	end
	--[[

	rttr:GetPlayer(p):ClearResources()

	rttr:GetPlayer(p):DisableBuilding(BLD_GUARDHOUSE)
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

	rttr:GetPlayer(p):AddWares({
		[GD_WOOD      ] = 6,
		[GD_BOARDS    ] = 11,
		[GD_STONES    ] = 17,
		[GD_MEAT      ] = 0,
		[GD_GRAIN     ] = 0,
		[GD_FLOUR     ] = 0,

		[GD_FISH      ] = 1,
		[GD_HAM       ] = 0,
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
		[GD_HAMMER    ] = 5,
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
		[JOB_HUNTER             ] = 0,
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
		[JOB_MINTER             ] = 1,
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
]]--
end

function addResources(onLoad)
    if onLoad then return end

	addPlayerResources()
	--addAIResources()

	p=2
	
	rttr:GetPlayer(p):DisableBuilding(BLD_CATAPULT)
	rttr:GetPlayer(p):DisableBuilding(BLD_FORTRESS)
	rttr:GetPlayer(p):DisableBuilding(BLD_WATCHTOWER)
--[[	
	-- goods
	rttr:GetPlayer(p):ClearResources()
	
	rttr:GetPlayer(p):AddWares({
		[GD_WOOD      ] = 24,
		[GD_BOARDS    ] = 44,
		[GD_STONES    ] = 40,
		[GD_MEAT      ] = 0,
		[GD_GRAIN     ] = 0, -- must be 0, wheat quest
		[GD_FLOUR     ] = 0,

		[GD_FISH      ] = 0,
		[GD_HAM       ] = 0,
		[GD_BREAD     ] = 0,
		[GD_WATER     ] = 0,
		[GD_BEER      ] = 0,
		[GD_COAL      ] = 200,

		[GD_IRONORE   ] = 0,
		[GD_GOLD      ] = 50,
		[GD_IRON      ] = 0,
		[GD_COINS     ] = 0,
		[GD_TONGS     ] = 1,
		[GD_AXE       ] = 6,

		[GD_SAW       ] = 4,
		[GD_PICKAXE   ] = 4,
		[GD_HAMMER    ] = 16,
		[GD_SHOVEL    ] = 4,
		[GD_CRUCIBLE  ] = 0,  --must be 0, minter quest
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
		[JOB_MINTER             ] = 0,  --must be 0, minter quest
		[JOB_METALWORKER        ] = 2,
		[JOB_SHIPWRIGHT         ] = 2,
		[JOB_GEOLOGIST          ] = 6,
		[JOB_SCOUT              ] = 2,

		[JOB_PACKDONKEY         ] = 12,
		[JOB_CHARBURNER         ] = 0,

		[JOB_PRIVATE            ] = 0,
		[JOB_PRIVATEFIRSTCLASS  ] = 0,
		[JOB_SERGEANT           ] = 0,
		[JOB_OFFICER            ] = 0,
		[JOB_GENERAL            ] = 1
	})
]]--
end

function aiHomieBuildCatapult(x,y)
	if (x == 41 and y == 16) then
		rttr:GetPlayer(2):AIConstructionOrder(42,18,BLD_GUARDHOUSE)
		rttr:GetPlayer(2):AIConstructionOrder(41,16,BLD_CATAPULT)
		rttr:Chat(0xFFFFFFFF, "[debug] AI Homie has occupied x:"..x..",y:"..y.."order build catapult there was given.")
	elseif (x == 43 and y == 30) then
		rttr:GetPlayer(2):AIConstructionOrder(43,30,BLD_CATAPULT)
		rttr:Chat(0xFFFFFFFF, "[debug] AI Homie has occupied x:"..x..",y:"..y.."order build catapult there was given.")
	elseif (x == 43 and y == 42) then
		rttr:GetPlayer(2):AIConstructionOrder(43,42,BLD_CATAPULT)
		rttr:Chat(0xFFFFFFFF, "[debug] AI Homie has occupied x:"..x..",y:"..y.."order build catapult there was given.")
	elseif (x == 42 and y == 44) then
		rttr:GetPlayer(2):AIConstructionOrder(42,44,BLD_CATAPULT)
		rttr:Chat(0xFFFFFFFF, "[debug] AI Homie has occupied x:"..x..",y:"..y.."order build catapult there was given.")
	elseif (x == 39 and y == 51) then
		rttr:GetPlayer(2):AIConstructionOrder(39,51,BLD_CATAPULT)
		rttr:Chat(0xFFFFFFFF, "[debug] AI Homie has occupied x:"..x..",y:"..y.."order build catapult there was given.")
	elseif (x == 39 and y == 61) then
		rttr:GetPlayer(2):AIConstructionOrder(39,61,BLD_CATAPULT)
		rttr:Chat(0xFFFFFFFF, "[debug] AI Homie has occupied x:"..x..",y:"..y.."order build catapult there was given.")
	end
end
	
function onOccupied(playerIdx, x, y)
	--only proceed if player event
    if(playerIdx == 2) then
		if (x == 33 and y == 29) then
			--give ai Watchtower (ai should build guardhouses close to hq to expand faster.)
			--Maybe it is better to cound guardhouses > 2 ors so and then give the ai watchtower. Well see...
			rttr:GetPlayer(2):EnableBuilding(BLD_WATCHTOWER, false)
		end
		if (x == 33 and y == 38) then
			--further down allow ai to build fortresses
			rttr:GetPlayer(2):EnableBuilding(BLD_FORTRESS, false)
		end
		if (x == 32 and y == 69) then
			--"free" the ai, so that it can attack the players, once it reaches the bottom end of the highway
			blockageWall:clearBlockageBelow(70)
			blockageWall.wall_breach_started = true
			rttr:Chat(0xFFFFFFFF, "Josepherus: I have reached the bottom. Brace yourselves.")
		end
		
		--set lowest point ai has occupied
		for i = blockageWall.lowest_ai_y,80,1
		do
			if (x == 32 and y == i) then
				if (y > blockageWall.lowest_ai_y) then
					blockageWall.lowest_ai_y = y
					rttr:Chat(0xFFFFFFFF, "[debug] Josepherus: I have occupied a new lowest Point on the Map: y="..y)
				end
			end
		end
    end
	
    if(p1_is_ai and playerIdx == 1) then
		if (x == 56 and y == 38) then
			rttr:GetPlayer(2):EnableBuilding(BLD_WATCHTOWER, false)
			rttr:Chat(0xFFFFFFFF, "[debug] AI Homie can now build Watchtowers.")
		end
		if (x == 52 and y == 50) then
			rttr:GetPlayer(2):EnableBuilding(BLD_FORTRESS, false)
			rttr:Chat(0xFFFFFFFF, "[debug] AI Homie can now build Fortresses.")
		end
		aiHomieBuildCatapult(x,y)
    end
	
    if(playerIdx <= 1) then
		if (x == 32 and y == 75) then
			--allow the players to attack the ai, once they reached the bottom of the highway
			--blockageWall:clearBlockageBelow(67)
			blockageWall:clearBlockageBelow(blockageWall.lowest_ai_y + 10)
			blockageWall.wall_breach_started = true
			rttr:Chat(0xFFFFFFFF, "You have reached the bottom. Start pushing up!")
		end
		
		--check if player has occupied ai 
		if (x == 32 and y <= blockageWall.lowest_ai_y) then
			--was occupied by ai, but now by a player
			--so player is advancing up, start clearing side walls
			blockageWall.lowest_ai_y = y - 1
			if (blockageWall.wall_breach_started) then
				blockageWall:clearBlockageBelow(blockageWall.lowest_ai_y)
				rttr:Chat(0xFFFFFFFF, "[debug] You occupied Land on the highway previously owned by the AI:.."..y)
			end
		end
    end
end

rest = 0
function onGameFrame(gf)
    if (gf == 10 and debugTexts) then
        for _, i in ipairs(eIdx) do
            MissionText(i, false)
        end
    end
	
	--continue if it is a full second
    if((gf%20)~=0) then
        return
    end

	--check every minute
    if((gf%1200)==0) then
		--give the ai units. The more mil buildings, the more soldiers per run
		number_ai_mil_buildings = rttr:GetPlayer(2):GetNumBuildings(BLD_BARRACKS) + rttr:GetPlayer(2):GetNumBuildings(BLD_GUARDHOUSE) + rttr:GetPlayer(2):GetNumBuildings(BLD_WATCHTOWER) + rttr:GetPlayer(2):GetNumBuildings(BLD_FORTRESS)
		number_ai_generals = rttr:GetPlayer(2):GetNumPeople(JOB_GENERAL)
		
		--you cant give eg. 2.32 generals. Store 0.32 in "rest" and add it to the next loop. then round down generals_per_minute
		base_val = 0.25
		generals_per_minute = 0.375 * number_ai_mil_buildings + base_val + rest --f(y) = ax + b (min 0.25 generals/minute, 4 gen./min @ 10 mil buildings
		rest = generals_per_minute%1
		generals_per_minute = math.floor(generals_per_minute)
		if (gf >= 12000 and number_ai_mil_buildings == 0) then
			--dont give any generals if the ai has no more mil buildings after 10 min
			return
		end
		rttr:GetPlayer(2):AddPeople({[JOB_GENERAL] = generals_per_minute})
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
