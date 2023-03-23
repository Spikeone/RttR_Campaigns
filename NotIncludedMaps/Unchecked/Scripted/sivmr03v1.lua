rttr.Log("Script started!")

title="Breaking the Blockade"
msg1="We have succeeded in beating back first the Vikings and\nthen the Nubians. But what have we gained by our efforts?\nThe two tribes have now allied themselves in the hope that\nwhat they were unable to accomplish alone, they can\naccomplish together. Our soldiers are stronger and more\nexperienced with two battles behind them. But victory can\nonly be ours if our planning and coordination are flawless\nand Fortuna smiles upon us.\nThe she-wolf is agitated. The priests report that she is\never on the prowl, her flanks mangy and reeking of decay.\nThis dream certainly augurs ill. We must be prepared for the\nworst.\n\nDemonstrate your might by conquering the Gate held by strong\nenemy forces.\nMake the Vikings' and Nubians' sacred grounds your own."
msg2="We found an old map which may lead us to the gate. If\nour navigators' calculations are right, the sacred Gate\nshould be somewhere here."
post1="Location they guess."
chatv_1="Viking Tribe: We are going to help our proud Nubian brothers!"
chatn_1="Nubian Tribe: We are going to help our proud Viking brothers!"
msg3="We managed to demonstrate our might! We counquered our\nlegitimate land back.\nThe she-wolf can finally feast on our enemys dead bodys\nand find her sleep.\n\n\nYou won!\n\nDid you like this short campaign? Do you have any\nsuggestions how those missions could be improved? Did\nyou find any bug or just want to give some friendly\nfeedback telling all Devs how great this project is?\nvisit www.rttr.info !"

s_u=25000
s_c=400
e_a=0

EnOb=rttr.AddEnvObject
PplC=rttr.GetPeopleCount

ai1_mil_last=0
ai1_mil_curr=0

ai2_mil_last=0
ai2_mil_curr=0

function onStart()
	EnOb(66,27,0,4)

	EnOb(79,115,0,1)
	EnOb(79,116,2,1)
	EnOb(77,117,6,1)

	EnOb(132,88,6,1)
	EnOb(133,90,2,1)
	EnOb(133,89,0,1)
	EnOb(134,88,4,1)

	EnOb(4,116,6,1)
	EnOb(3,114,8,1)
	EnOb(5,115,10,1)

	EnOb(68,46,2,1)

	EnOb(134,102,0,1)
	EnOb(137,102,2,1)
	EnOb(135,103,12,1)

	EnOb(141,19,6,1)
	EnOb(142,21,10,1)
	EnOb(139,19,12,1)
	EnOb(140,17,4,1)

	EnOb(23,84,10,1)
	EnOb(23,72,12,1)

	rttr.DisableBuilding(1,BLD_SHIPYARD,BLD_HARBORBUILDING)
	rttr.DisableBuilding(2,BLD_SHIPYARD,BLD_HARBORBUILDING)
	
	rttr.ClearResources(0)
    rttr.ClearResources(1)
	rttr.ClearResources(2)

	ai2_mil_last=(PplC(2,JOB_PRIVATE)+PplC(2,JOB_PRIVATEFIRSTCLASS)+PplC(2,JOB_SERGEANT)+PplC(2,JOB_OFFICER)+PplC(2,JOB_GENERAL))
    ai1_mil_last=(PplC(1,JOB_PRIVATE)+PplC(1,JOB_PRIVATEFIRSTCLASS)+PplC(1,JOB_SERGEANT)+PplC(1,JOB_OFFICER)+PplC(1,JOB_GENERAL))

	rttr.AddWares(0,GD_HAMMER,8,GD_AXE,6,GD_SAW,3,GD_PICKAXE,6,GD_RODANDLINE,2,GD_SCYTHE,6,GD_CLEAVER,1,GD_ROLLINGPIN,1,GD_BOW,2,GD_BOAT,20,GD_SWORD,0,GD_SHIELDROMANS,0,GD_WOOD,20,GD_BOARDS,40,GD_STONES,40,GD_GRAIN,0,GD_COINS,0,GD_IRONORE,18,GD_COAL,36,GD_FISH,8,GD_BREAD,8)
    rttr.AddPeople(0,JOB_HELPER,30,JOB_WOODCUTTER,6,JOB_FISHER,0,JOB_FORESTER,2,JOB_CARPENTER,2,JOB_STONEMASON,4,JOB_HUNTER,1,JOB_MINER,10,JOB_BREWER,1,JOB_IRONFOUNDER,2,JOB_MINTER,1,JOB_METALWORKER,1,JOB_ARMORER,2,JOB_BUILDER,14,JOB_PLANER,8,JOB_PRIVATE,10,JOB_PRIVATEFIRSTCLASS,1,JOB_SERGEANT,1,JOB_OFFICER,1,JOB_GENERAL,20,JOB_GEOLOGIST,4,JOB_SHIPWRIGHT,0,JOB_SCOUT,4)

    rttr.AddWares(1,GD_HAMMER,24,GD_AXE,12,GD_SAW,4,GD_PICKAXE,20,GD_RODANDLINE,6,GD_SCYTHE,20,GD_CLEAVER,6,GD_ROLLINGPIN,6,GD_BOW,6,GD_WOOD,60,GD_BOARDS,999,GD_STONES,999,GD_COINS,0,GD_IRONORE,50,GD_COAL,150,GD_GOLD,50,GD_FISH,50,GD_MEAT,25,GD_BREAD,12)
    rttr.AddPeople(1,JOB_HELPER,80,JOB_WOODCUTTER,10,JOB_FISHER,5,JOB_FORESTER,6,JOB_CARPENTER,4,JOB_STONEMASON,10,JOB_HUNTER,4,JOB_FARMER,10,JOB_MILLER,4,JOB_BAKER,4,JOB_BUTCHER,4,JOB_MINER,20,JOB_BREWER,1,JOB_PIGBREEDER,4,JOB_IRONFOUNDER,6,JOB_MINTER,2,JOB_METALWORKER,2,JOB_ARMORER,4,JOB_BUILDER,25,JOB_PLANER,15,JOB_PRIVATE,20,JOB_PRIVATEFIRSTCLASS,0,JOB_SERGEANT,0,JOB_OFFICER,0,JOB_GENERAL,0,JOB_GEOLOGIST,20,JOB_SCOUT,5,JOB_PACKDONKEY,60)

	rttr.AddWares(2,GD_HAMMER,24,GD_AXE,12,GD_SAW,4,GD_PICKAXE,20,GD_RODANDLINE,6,GD_SCYTHE,20,GD_CLEAVER,6,GD_ROLLINGPIN,6,GD_BOW,6,GD_WOOD,60,GD_BOARDS,999,GD_STONES,999,GD_COINS,0,GD_IRONORE,50,GD_COAL,150,GD_GOLD,50,GD_FISH,50,GD_MEAT,25,GD_BREAD,12)
    rttr.AddPeople(2,JOB_HELPER,80,JOB_WOODCUTTER,10,JOB_FISHER,5,JOB_FORESTER,6,JOB_CARPENTER,4,JOB_STONEMASON,10,JOB_HUNTER,4,JOB_FARMER,10,JOB_MILLER,4,JOB_BAKER,4,JOB_BUTCHER,4,JOB_MINER,20,JOB_BREWER,1,JOB_PIGBREEDER,4,JOB_IRONFOUNDER,6,JOB_MINTER,2,JOB_METALWORKER,2,JOB_ARMORER,4,JOB_BUILDER,25,JOB_PLANER,15,JOB_PRIVATE,40,JOB_PRIVATEFIRSTCLASS,0,JOB_SERGEANT,0,JOB_OFFICER,0,JOB_GENERAL,0,JOB_GEOLOGIST,20,JOB_SCOUT,5,JOB_PACKDONKEY,60)
end

function onGameFrame(gf)
	if((gf%20)~=0) then
		return
	end

	--MilitaryChecker(AI1)
	ai1_mil_curr=(PplC(1,JOB_PRIVATE)+PplC(1,JOB_PRIVATEFIRSTCLASS)+PplC(1,JOB_SERGEANT)+PplC(1,JOB_OFFICER)+PplC(1,JOB_GENERAL))
    if(ai1_mil_curr<ai1_mil_last and e_a==0) then
        rttr.Chat(0, chatv_1)
		rttr.AddPeople(2,JOB_PRIVATE,10,JOB_GENERAL,20)
        e_a=1
    else
        ai1_mil_last=ai1_mil_curr
    end

	--MilitaryChecker(AI2)
	ai2_mil_curr=(PplC(2,JOB_PRIVATE)+PplC(2,JOB_PRIVATEFIRSTCLASS)+PplC(2,JOB_SERGEANT)+PplC(2,JOB_OFFICER)+PplC(2,JOB_GENERAL))
    if(ai2_mil_curr<ai2_mil_last and e_a==0) then
        rttr.Chat(0, chatn_1)
		rttr.AddPeople(1,JOB_PRIVATE,10,JOB_GENERAL,20)
        e_a=1
    else
        ai2_mil_last=ai2_mil_curr
    end


	if(gf==60) then
		rttr.MissionStatement(0,title,msg1)
	end

	if((gf%s_c)==0 and gf<=s_u) then
		rttr.AddPeople(1,JOB_PRIVATE,1)
		rttr.AddPeople(2,JOB_PRIVATE,1)
	end
end

function onOccupied(p,x,y)
	if(p~=0) then
		return
	end

	if(x==66 and y==27) then
		rttr.MissionStatement(0, title, msg2)
		rttr.PostMessageWithLocation(0, 130, 81, post1)
	elseif(x==127 and y==106) then
		rttr.AddStaticObject(x,y,561,0xFFFF,2)
		rttr.MissionStatement(0,title,msg3)
	end
end