rttr.Log("Script started!")

title="Shores of Gold"
"Demonstrate your might by conquering the Gate marked by\n
msg1="Stone for stone we have built our noble civilisation. Our\nfields of corn reach as far as the eye can see. For generations\nwe have tolerated no obstacles in the pursuit of our birthright.\nBut now the eagle-beaked ones - Romans, they call themselves - have\nlanded on our shores and now spread like a disease across our lands.\nOur stone and our wood they plunder for their strange dwellings.\nEven worse is their wanton greed for our gold. They must be driven\nback.\nThe jaguar is also among us. It came to our priests in visions,\nits ears flattened back and hissing. This vision is certainly a\nform of warning not only to the priests but to all the sons of\nour fathers before us. We must make ready for the Romans. May\nthe blood of our forefathers course through our veins. May we\nexact a high price for the blood we shed.\n\nUnfortunately the raw materials at the base of our settlement\nare a little thin on the ground. But we should not ignore the\nisland to the south-east: it is home to large amounts of all\nthe important ores."
post1="Island Location"
msg2="You should move your goods and settlers quickly to our\nIsland. When you are strong enough you should reclaim\nEverything those romans have taken!"
msg3="We have proven that we are worth living here!"

m_msg2=0

NextSoldier=1000
SoldierIntervall=1000

EnOb=rttr.AddEnvObject

function onStart()

    --Shields, showing that there is really nothing
    rttr.AddEnvObjenct(38, 65, 695, 0xFFFF)
    rttr.AddEnvObject(39, 52, 695, 0xFFFF)
    rttr.AddEnvObject(44, 60, 695, 0xFFFF)
    rttr.AddEnvObject(48, 64, 695, 0xFFFF)
    --S4 like water objects
    EnOb(66,27,0,4)

	EnOb(24,50 ,0,1)
	EnOb(21,52,2,1)
	EnOb(21,50,6,1)

	EnOb(49,107,6,1)
	EnOb(47,106,2,1)
	EnOb(46,105,0,1)

	EnOb(90,78,4,1)
	EnOb(90,81,6,1)
	EnOb(86,81,8,1)
	EnOb(92,80,10,1)

	EnOb(75,69,2,1)
	EnOb(55,69,0,1)
	EnOb(58,70,2,1)

	EnOb(56,17,12,1)
	EnOb(55,15,6,1)

	EnOb(99,24,10,1)
	EnOb(97,21,12,1)
	EnOb(101,20,4,1)

	rttr.ClearResources(0)
    rttr.ClearResources(1)
	rttr.DisableBuilding(1,BLD_SHIPYARD,BLD_HARBORBUILDING)

    rttr.AddWares(0,GD_HAMMER,0,GD_AXE,0,GD_SAW,0,GD_PICKAXE,0,GD_RODANDLINE,0,GD_SCYTHE,0,GD_CLEAVER,0,GD_ROLLINGPIN,0,GD_BOW,2,GD_BOAT,0,GD_SWORD,0,GD_SHIELDROMANS,0,GD_WOOD,20,GD_BOARDS,30,GD_STONES,30,GD_GRAIN,0,GD_COINS,0,GD_IRONORE,0,GD_COAL,0,GD_FISH,8,GD_BREAD,8)
    rttr.AddPeople(0,JOB_HELPER,30,JOB_WOODCUTTER,6,JOB_FISHER,4,JOB_FORESTER,3,JOB_CARPENTER,3,JOB_STONEMASON,4,JOB_HUNTER,2,JOB_MINER,12,JOB_BREWER,1,JOB_IRONFOUNDER,2,JOB_MINTER,1,JOB_METALWORKER,1,JOB_ARMORER,2,JOB_BUILDER,14,JOB_PLANER,8,JOB_PRIVATE,12,JOB_PRIVATEFIRSTCLASS,0,JOB_SERGEANT,0,JOB_OFFICER,0,JOB_GEOLOGIST,6,JOB_SHIPWRIGHT,0,JOB_SCOUT,4)

    rttr.AddWares(1,GD_HAMMER,12,GD_AXE,6,GD_SAW,2,GD_PICKAXE,4,GD_RODANDLINE,6,GD_SCYTHE,10,GD_CLEAVER,3,GD_ROLLINGPIN,3,GD_BOW,2,GD_WOOD,30,GD_BOARDS,999,GD_STONES,999,GD_COINS,15,GD_IRONORE,20,GD_COAL,30,GD_GOLD,10,GD_FISH,20,GD_MEAT,5,GD_BREAD,10)
    rttr.AddPeople(1,JOB_HELPER,60,JOB_WOODCUTTER,10,JOB_FISHER,0,JOB_FORESTER,6,JOB_CARPENTER,4,JOB_STONEMASON,6,JOB_HUNTER,4,JOB_FARMER,4,JOB_MILLER,2,JOB_BAKER,2,JOB_BUTCHER,2,JOB_MINER,10,JOB_BREWER,1,JOB_PIGBREEDER,2,JOB_IRONFOUNDER,3,JOB_MINTER,1,JOB_METALWORKER,2,JOB_ARMORER,2,JOB_BUILDER,20,JOB_PLANER,10,JOB_PRIVATE,32,JOB_PRIVATEFIRSTCLASS,0,JOB_SERGEANT,0,JOB_OFFICER,0,JOB_GENERAL,0,JOB_GEOLOGIST,10,JOB_SCOUT,5,JOB_PACKDONKEY,20)
end

function onGameFrame(gf)
    if((gf%20)~=0) then
        return
    end

    if(rttr.GetBuildingCount(0, BLD_HARBORBUILDING)>1 and m_msg2==0)
        rttr.MissionStatement(0,title,msg2)
        m_msg2=1
    end

    if(gf==60) then
        rttr.MissionStatement(0,title,msg1)
        rttr.PostMessageWithLocation(0,47,84,post1)
    end

    if(gf==NextSoldier)
        rttr.AddPeople(1,JOB_PRIVATE,1)
        NextSoldier=NextSoldier+SoldierIntervall
        SoldierIntervall=SoldierIntervall+100
    end
end

function onOccupied(p,x,y)
	if(p~=0) then
		return
	end

    if(x==77 and y==36)
        rttr.AddStaticObject(x,y,561,0xFFFF,2)
		rttr.MissionStatement(0,title,msg3)
	end
end