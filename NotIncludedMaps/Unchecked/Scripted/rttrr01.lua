rttr.Log("Script started!")

title="Threat from the North"
msg1="We have been too complacent. Our discipline has dissipated\nwith the absence of any serious rivals. This cannot and will\nnot continue. Our spies have become aware that the Vikings\nhave estrablished a colony on the island. A fierce and\nproud tribe. They have apparently been industrous for they\nhave built up thriving mining operations and flourishing\nfarms. We will need more reconnaissance. We must know their\nweaknesses, not only their strengths.\nOur priests are disquited. They speak anxously of a dream\nthat has visited not one but several of them - and identical\ndream. The she-wolf of the Tiber appears, her head lowered\nand snarling. It is not yet clear what this portends. But\nfirst we must prepare for meeting the threat of the Vikings."
chat1="Viking Tribe: These Romans are crazy!"
chat2="Viking Tribe: Crush those silly Romans!"
msg2="We conquered the island and found a strange relict. Our priests may know\nwhat it is for!\n\nYou completed this scenario."
chat3="Viking Tribe: ..."
msg3="Spy report:\n\nOur spies report that our ships provoked some other viking tribes! We\nare not sure what this will mean for our future. Some ships have been\nsighted but we were not able to collect enough information about what\nthey transported, but it can't be good.\nOur priests prayed for our fortune, hopefully fortune will shine on us!"

general_timer=100000000
short_way=0

function onStart()
    rttr.SetRestrictedArea(1,33,4,47,38,1,84,7,10)
    rttr.AIConstructionOrder(1,23,51,BLD_WATCHTOWER)
    rttr.AIConstructionOrder(1,31,42,BLD_WATCHTOWER)
    rttr.AIConstructionOrder(1,37,37,BLD_WATCHTOWER)
    rttr.AIConstructionOrder(1,28,21,BLD_WATCHTOWER)
    rttr.AIConstructionOrder(1,32,25,BLD_WATCHTOWER)
    rttr.AIConstructionOrder(1,28,51,BLD_WATCHTOWER)

    rttr.AIConstructionOrder(1,27,17,BLD_GOLDMINE)

    rttr.AIConstructionOrder(1,25,22,BLD_QUARRY)

    rttr.DisableBuilding(1,BLD_FORTRESS,BLD_CATAPULT,BLD_SHIPYARD,BLD_HARBORBUILDING)

    rttr.ClearResources(0)
    rttr.ClearResources(1)

    rttr.AddWares(0,GD_HAMMER,8,GD_AXE,3,GD_SAW,2,GD_PICKAXE,2,GD_RODANDLINE,2,GD_SCYTHE,6,GD_CLEAVER,2,GD_ROLLINGPIN,1,GD_BOW,1,GD_BOAT,4,GD_SWORD,12,GD_SHIELDROMANS,12,GD_WOOD,12,GD_BOARDS,22,GD_STONES,30,GD_GRAIN,12,GD_COINS,5,GD_IRONORE,8,GD_COAL,8,GD_FISH,8,GD_BREAD,8)
    rttr.AddPeople(0,JOB_HELPER,20,JOB_WOODCUTTER,6,JOB_FISHER,0,JOB_FORESTER,2,JOB_CARPENTER,2,JOB_STONEMASON,3,JOB_HUNTER,1,JOB_MINER,6,JOB_BREWER,1,JOB_IRONFOUNDER,2,JOB_MINTER,1,JOB_METALWORKER,1,JOB_ARMORER,2,JOB_BUILDER,10,JOB_PLANER,5,JOB_PRIVATE,8,JOB_PRIVATEFIRSTCLASS,4,JOB_SERGEANT,2,JOB_OFFICER,1,JOB_GEOLOGIST,6,JOB_SHIPWRIGHT,1,JOB_SCOUT,3)

    rttr.AddWares(1,GD_HAMMER,12,GD_AXE,6,GD_SAW,2,GD_PICKAXE,4,GD_RODANDLINE,6,GD_SCYTHE,10,GD_CLEAVER,3,GD_ROLLINGPIN,3,GD_BOW,2,GD_WOOD,30,GD_BOARDS,940,GD_STONES,950,GD_COINS,15,GD_IRONORE,20,GD_COAL,30,GD_GOLD,10,GD_FISH,20,GD_MEAT,5,GD_BREAD,10)
    rttr.AddPeople(1,JOB_HELPER,60,JOB_WOODCUTTER,10,JOB_FISHER,0,JOB_FORESTER,6,JOB_CARPENTER,4,JOB_STONEMASON,6,JOB_HUNTER,4,JOB_FARMER,4,JOB_MILLER,2,JOB_BAKER,2,JOB_BUTCHER,2,JOB_MINER,10,JOB_BREWER,1,JOB_PIGBREEDER,2,JOB_IRONFOUNDER,3,JOB_MINTER,1,JOB_METALWORKER,2,JOB_ARMORER,2,JOB_BUILDER,12,JOB_PLANER,6,JOB_PRIVATE,32,JOB_PRIVATEFIRSTCLASS,16,JOB_SERGEANT,8,JOB_OFFICER,4,JOB_GENERAL,2,JOB_GEOLOGIST,10,JOB_SCOUT,5,JOB_PACKDONKEY,20)

end

function onGameFrame(gf)
    if((gf%20)~=0) then
        return
    end

    if(gf==60) then
        rttr.MissionStatement(0,title,msg1)
    end

    if(gf > general_timer)then
        rttr.AddPeople(1,JOB_GENERAL,1)
        general_timer = rttr.GetGF() + 5000
    end

    if(short_way==0 and rttr.GetBuildingCount(0,BLD_HARBORBUILDING)>1)then
        general_timer = rttr.GetGF() + 5000
        short_way=1
        rttr.MissionStatement(0,title,msg3)
    end
        
end

function onOccupied(p,x,y)
    if(p~=0) then
        return
    end

    if(x==37 and y==11) then
        rttr.SetRestrictedArea(1)
        rttr.Chat(0,chat1)
        general_timer = rttr.GetGF() + 5000
    elseif(x==37 and y==53) then
        rttr.SetRestrictedArea(1)
        rttr.Chat(0,chat2)
        general_timer = rttr.GetGF() + 5000
    elseif(x==24 and y==16) then
        rttr.MissionStatement(0,title,msg2)
        rttr.Chat(0,chat3)
        rttr.AddStaticObject(24,16,561,0xFFFF,2)
    end
end