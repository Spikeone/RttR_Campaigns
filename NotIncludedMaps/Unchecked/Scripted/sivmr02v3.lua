rttr.Log("Script started!")

title="The Magic of the South"
msg1="Demonstrate your might by conquering the Gate marked by\nspecial terrain on the south-east coast of the Nubian land.\n\nWe have managed to subdue the plundering tribe of the north.\nMany of our younger recruits have first blood on their swords\nand shields. Exhilaration and fatigue take their turns. We have\nno time to recoup our strength. Another tribe, a bronzed people,\nhas appeared in the south. Some of our thieves were unpleasantly\nsuprised by their stealth. May Jupiter steel our strength and\nresolve to overcome this new threat.\n\nOddly, the dreams of our priests continue. In them the she-wolf\nruns from place to place, rarely finding and opportunity to curl\nand lie down. Our priests are still stymied by these visions."
msg2="If marching straight through the Nubians' territory seems to be\na little too dangerous, maybe there are other ways to reach the\nsanctified relict..."
msg3="We secured the relict, those nubians surrendered and fled!\n\nApedemak - Nubian god of war\nAnuket - Water-Goddess\nMiket - Goddess"
chat1="Nubian tribe: Bloody beasts, Apedemak may help us!"
chat2="Nubian priests: Anuket, destroy those heretic water-machines!"
chat3="Nubian tribe: We fight for Miket!"
chat4="Dehydrated General: Water... please..."
msg4="Our medics report that the general we have rescued feels better\nalready and he told us that a small military base he was building\nhas been overun by those nubian babarians! Maybe we can find some\nusefully supplies."
post1="Thats the position."
msg5="The misery of this land speaks a thousand words...\nWe were not able to find any survivor but uncounted dead\nbodies. At least we could find some swords and shields of\nour fallen comrades. Those Nubians will pay for what they did!"

ai_mil_last=0
ai_mil_current=0

p_mil_last=0
p_mil_current=0

chat1_m=0
chat3_m=0
chat2_m=0
chat4_m=0
msg2_m=0
msg5_m=0
frame1_c=0


function onStart()
    rttr.SetRestrictedArea(1,12,71,98,34,127,145,3,147)
    rttr.AIConstructionOrder(1,47,100,BLD_FORTRESS)
    rttr.AIConstructionOrder(1,39,102,BLD_FORTRESS)

    --Burnt building
    rttr.AddEnvObject(21, 48, 2524, 0xFFFF)
    --shield
    rttr.AddEnvObject(24, 48, 2271, 0xFFFF)
    --sword
    rttr.AddEnvObject(23, 48, 2266, 0xFFFF)
    --skeletons(white)
    rttr.AddEnvObject(26, 44, 547, 0xFFFF)
    rttr.AddEnvObject(20, 43, 547, 0xFFFF)
    rttr.AddEnvObject(19, 50, 547, 0xFFFF)
    rttr.AddEnvObject(18, 52, 547, 0xFFFF)
    rttr.AddEnvObject(14, 47, 547, 0xFFFF)
    rttr.AddEnvObject(14, 54, 547, 0xFFFF)
    --skeletons(black)
    rttr.AddEnvObject(20, 53, 548, 0xFFFF)
    rttr.AddEnvObject(28, 45, 548, 0xFFFF)
    rttr.AddEnvObject(16, 41, 548, 0xFFFF)
    --special markers(roadbuilding)
    rttr.AddStaticObject(88, 113, 21, 0xFFFF)
    rttr.AddStaticObject(90, 113, 21, 0xFFFF)
    rttr.AddStaticObject(91, 115, 21, 0xFFFF)
    rttr.AddStaticObject(90, 117, 21, 0xFFFF)
    rttr.AddStaticObject(88, 117, 21, 0xFFFF)
    rttr.AddStaticObject(87, 115, 21, 0xFFFF)
    --coal
    rttr.AddEnvObject(62, 31, 688, 0xFFFF)
    --iron
    rttr.AddEnvObject(49, 19, 682, 0xFFFF)
    --gold
    rttr.AddEnvObject(25, 45, 685, 0xFFFF)


    rttr.ClearResources(0)
    rttr.ClearResources(1)

    p_mil_last=(rttr.GetPeopleCount(0,JOB_PRIVATE)+rttr.GetPeopleCount(0,JOB_PRIVATEFIRSTCLASS)+rttr.GetPeopleCount(0,JOB_SERGEANT)+rttr.GetPeopleCount(0,JOB_OFFICER)+rttr.GetPeopleCount(0,JOB_GENERAL))
    ai_mil_last=(rttr.GetPeopleCount(1,JOB_PRIVATE)+rttr.GetPeopleCount(1,JOB_PRIVATEFIRSTCLASS)+rttr.GetPeopleCount(1,JOB_SERGEANT)+rttr.GetPeopleCount(1,JOB_OFFICER)+rttr.GetPeopleCount(1,JOB_GENERAL))

    rttr.DisableBuilding(1,BLD_BARRACKS,BLD_CATAPULT,BLD_SHIPYARD,BLD_HARBORBUILDING)

    rttr.AddWares(0,GD_HAMMER,8,GD_AXE,6,GD_SAW,2,GD_PICKAXE,6,GD_RODANDLINE,4,GD_SCYTHE,2,GD_CLEAVER,1,GD_ROLLINGPIN,1,GD_BOW,2,GD_BOAT,20,GD_SWORD,0,GD_SHIELDROMANS,0,GD_WOOD,20,GD_BOARDS,40,GD_STONES,40,GD_GRAIN,0,GD_COINS,0,GD_IRONORE,18,GD_COAL,36,GD_FISH,8,GD_BREAD,8)
    rttr.AddPeople(0,JOB_HELPER,30,JOB_WOODCUTTER,6,JOB_FISHER,0,JOB_FORESTER,2,JOB_CARPENTER,2,JOB_STONEMASON,3,JOB_HUNTER,1,JOB_MINER,6,JOB_BREWER,1,JOB_IRONFOUNDER,2,JOB_MINTER,1,JOB_METALWORKER,1,JOB_ARMORER,2,JOB_BUILDER,14,JOB_PLANER,8,JOB_PRIVATE,0,JOB_PRIVATEFIRSTCLASS,20,JOB_SERGEANT,0,JOB_OFFICER,0,JOB_GEOLOGIST,4,JOB_SHIPWRIGHT,1,JOB_SCOUT,4)

    rttr.AddWares(1,GD_HAMMER,12,GD_AXE,6,GD_SAW,2,GD_PICKAXE,4,GD_RODANDLINE,6,GD_SCYTHE,10,GD_CLEAVER,3,GD_ROLLINGPIN,3,GD_BOW,2,GD_WOOD,30,GD_BOARDS,999,GD_STONES,999,GD_COINS,15,GD_IRONORE,20,GD_COAL,30,GD_GOLD,10,GD_FISH,20,GD_MEAT,5,GD_BREAD,10)
    rttr.AddPeople(1,JOB_HELPER,60,JOB_WOODCUTTER,10,JOB_FISHER,0,JOB_FORESTER,6,JOB_CARPENTER,4,JOB_STONEMASON,6,JOB_HUNTER,4,JOB_FARMER,4,JOB_MILLER,2,JOB_BAKER,2,JOB_BUTCHER,2,JOB_MINER,10,JOB_BREWER,1,JOB_PIGBREEDER,2,JOB_IRONFOUNDER,3,JOB_MINTER,1,JOB_METALWORKER,2,JOB_ARMORER,2,JOB_BUILDER,20,JOB_PLANER,10,JOB_PRIVATE,0,JOB_PRIVATEFIRSTCLASS,0,JOB_SERGEANT,30,JOB_OFFICER,0,JOB_GENERAL,15,JOB_GEOLOGIST,10,JOB_SCOUT,5,JOB_PACKDONKEY,20)

end

function onGameFrame(gf)
    if((gf%20)~=0) then
        return
    end

    --military checker (AI)
    ai_mil_current=(rttr.GetPeopleCount(1,JOB_PRIVATE)+rttr.GetPeopleCount(1,JOB_PRIVATEFIRSTCLASS)+rttr.GetPeopleCount(1,JOB_SERGEANT)+rttr.GetPeopleCount(1,JOB_OFFICER)+rttr.GetPeopleCount(1,JOB_GENERAL))
    --rttr.Log("al:",ai_mil_last, " ac:",ai_mil_current)
    if(ai_mil_current<ai_mil_last and chat3_m==0) then
        rttr.Chat(0, chat3)
        chat3_m=1
    else
        ai_mil_last=ai_mil_current
    end

    --military checker (Player)
    p_mil_current=(rttr.GetPeopleCount(0,JOB_PRIVATE)+rttr.GetPeopleCount(0,JOB_PRIVATEFIRSTCLASS)+rttr.GetPeopleCount(0,JOB_SERGEANT)+rttr.GetPeopleCount(0,JOB_OFFICER)+rttr.GetPeopleCount(0,JOB_GENERAL))
    --rttr.Log("pl:",p_mil_last, " pc:",p_mil_current)
    if(p_mil_current<p_mil_last and msg2_m==0) then
        rttr.MissionStatement(0,title,msg2)
        msg2_m=1
    else
        p_mil_last=p_mil_current
    end

    --harbor checker
    if((rttr.GetBuildingCount(0, BLD_HARBORBUILDING)>=1) and chat2_m==0) then
        chat2_m=1
        rttr.Chat(0, chat3)
    end

    if(gf>=frame1_c and gf<(frame1_c+20) and frame1_c~=0) then
		rttr.MissionStatement(0,title,msg4)
		rttr.PostMessageWithLocation(0,24,50,post1)
    end    

    if(gf==60) then
        rttr.MissionStatement(0,title,msg1)
    end


        
end

function onOccupied(p,x,y)

    if(x==50 and y==103 and p==1)then
        rttr.AIConstructionOrder(1,50,103,BLD_FORTRESS)
        rttr.DisableBuilding(1,BLD_GUARDHOUSE)
    end
    if(x==39 and y == 104 and p==1)then
        rttr.AIConstructionOrder(1,39,104,BLD_FORTRESS)
        rttr.DisableBuilding(1,BLD_GUARDHOUSE)
    end

    if(p~=0) then
        return
    end

    if(x==32 and y==35 and chat4_m==0) then
        rttr.Chat(0,chat4)
        chat4_m=1
        frame1_c=rttr.GetGF()+1000
    elseif(x==31 and y==61 and chat1_m==0) then
        rttr.SetRestrictedArea(1)
        rttr.Chat(0,chat1)
        chat1_m=1
    elseif(x==55 and y==74 and chat1_m==0) then
        rttr.SetRestrictedArea(1)
        rttr.Chat(0,chat1)
        chat1_m=1
    elseif((x>= 23 and x<=24) and (y>=47 and y<=50) and msg5_m==0)then
        rttr.PostMessageWithLocation(0,23,49,post1)
        rttr.MissionStatement(0,title,msg5)
        rttr.AddWares(0,GD_SWORD,10,GD_SHIELDROMANS,10)
        msg5_m=1
    elseif(x==89 and y==115) then
        rttr.MissionStatement(0,title,msg3)
        rttr.Chat(0,chat3)
        rttr.AddStaticObject(89,115,561,0xFFFF,2)
    end
end