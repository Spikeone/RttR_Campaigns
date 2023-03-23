stage=0

title="Correspondence"
expl1="\nTodo: We captured some strange ruins, we should develop our own plan.\n\nShaka: Send me your plans when they are finished!"
expl2="\nShaka: There is a strange hole in the ground, where did it come from?\n\nTodo: It looks manmade, maybe... \n\nShaka: There is water in that strange hole.\n\nTodo: We could use such holes for our agriculture."
msg1="Welcome to Spikes Coop-Campaign."
msg2="Tasks are checked every 100GFs!"
msg3="\nShaka: That was rough, but we finally did it!\n\nTodo: I had no idea that you knew how to navigate a ship.\n\nShaka: Hahaha, neither did I!\n\nTodo: This is a strange, dry place.\n\nShaka: It will be night soon, we should build a small camp.\n\nTodo: We need some boards, stones, worker and tools.\n\nShaka: Let's salvage our broken ships and search for survivors.\n\nTodo: Good idea, let's start building our camp!"

msg6="\nTodo: We should explore this island a bit.\n\nShaka: And maybe improve our settlement a bit."
msg7="Expand your country, build at least one barracks!"
msg8="\nTodo: This island seems to be inhabitated.\n\nShaka: Maybe you are right, I guess we could use stones to fortify our barracks.\n\nTodo: Sounds like a great plan! If we hurry we might overpower them fast.\n\nShaka: Let's do it, may the gods help you."
msg9="\nShaka: We finally defeated those slavedrivers!\n\nTodo: Good fight my friend.\n\nShaka: We looted some usefull tools and plans for buildings, we should build some advanced buildings!\n\nTodo: We also called some specialists, they might find some minerals in those mountains."
msg10="\nGeologist: Those mountains are rich, we should start mining gold, iron and coal!"

function onStart()
	--custom startgoods
	rttr.ClearResources(0)
	rttr.ClearResources(1)
	rttr.ClearResources(2)
	rttr.ClearResources(3)

	--custom startbuildings
	rttr.DisableBuilding(0)
	rttr.DisableBuilding(1)
	rttr.DisableBuilding(2)
	rttr.DisableBuilding(3)

	--custom objects
	rttr.AddStaticObject(76,92,700,0xFFFF,0)

	--AI buildings
	rttr.EnableBuilding(2,BLD_BARRACKS,BLD_GUARDHOUSE,BLD_WATCHTOWER,BLD_WOODCUTTER,BLD_FISHERY,BLD_QUARRY,BLD_FORESTER,BLD_HUNTER,BLD_STOREHOUSE,BLD_MILL,BLD_BAKERY,BLD_SAWMILL,BLD_WELL,BLD_FARM)
	rttr.EnableBuilding(3,BLD_BARRACKS,BLD_GUARDHOUSE,BLD_WATCHTOWER,BLD_FORTRESS,BLD_GRANITEMINE,BLD_COALMINE,BLD_IRONMINE,BLD_GOLDMINE,BLD_WOODCUTTER,BLD_FISHERY,BLD_QUARRY,BLD_FORESTER,BLD_HUNTER,BLD_BREWERY,BLD_ARMORY,BLD_METALWORKS,BLD_IRONSMELTER,BLD_STOREHOUSE,BLD_MILL,BLD_BAKERY,BLD_SAWMILL,BLD_MINT,BLD_WELL,BLD_FARM,BLD_DONKEYBREEDER)

	--AI1 Wares/People
	rttr.AddWares(2,GD_WOOD,20,GD_BOARDS,35,GD_STONES,30)
	rttr.AddPeople(2,JOB_HELPER,50,JOB_WOODCUTTER,6,JOB_FISHER,4,JOB_FORESTER,2,JOB_CARPENTER,4,JOB_STONEMASON,4,JOB_HUNTER,4,JOB_FARMER,6,JOB_BAKER,3,JOB_BUTCHER,3,JOB_MINER,10,JOB_IRONFOUNDER,3,JOB_MINTER,1,JOB_METALWORKER,1,JOB_ARMORER,3,JOB_BUILDER,10,JOB_PLANER,6,JOB_PRIVATE,20)

	--AI2 Wares/People
	rttr.AddWares(3,GD_WOOD,25,GD_BOARDS,45,GD_STONES,40)
	rttr.AddPeople(3,JOB_HELPER,50,JOB_WOODCUTTER,6,JOB_FISHER,4,JOB_FORESTER,2,JOB_CARPENTER,4,JOB_STONEMASON,4,JOB_HUNTER,4,JOB_FARMER,6,JOB_BAKER,3,JOB_BUTCHER,3,JOB_MINER,10,JOB_IRONFOUNDER,3,JOB_MINTER,1,JOB_METALWORKER,1,JOB_ARMORER,3,JOB_BUILDER,14,JOB_PLANER,10,JOB_SERGEANT,20)
end

function onGameFrame(gf)
	if(gf==150) then
		rttr.Chat(-1,msg1)
		rttr.Chat(-1,msg2)
	end

	if((gf%100)==0) then
		if(stage==0) then
			rttr.MissionStatement(0,title,msg3)
			rttr.MissionStatement(1,title,msg3)

			rttr.EnableBuilding(0,BLD_BARRACKS,BLD_WOODCUTTER,BLD_FISHERY,BLD_QUARRY,BLD_FORESTER,BLD_HUNTER)
			rttr.EnableBuilding(1,BLD_BARRACKS,BLD_WOODCUTTER,BLD_FISHERY,BLD_QUARRY,BLD_FORESTER,BLD_HUNTER)

			rttr.AddWares(0)
			rttr.AddWares(1)

			rttr.AddPeople(0)
			rttr.AddPeople(1)

			stage=1
		end
		
