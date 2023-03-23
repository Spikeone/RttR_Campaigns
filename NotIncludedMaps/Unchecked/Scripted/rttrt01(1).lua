rttr.Log("Script started!")

title="RttR Tutorial - I (v20150805)"
msg1="Welcome to the RttR Tutorial.\n\nThis first mission will teach you basic information\nabout controls.\nPlease follow all given instructions, report any bugs\nor suggestions you have (www.rttr.info).\n\nThanks for playing Return to the Roots and have fun!"
msg2="Day 1\n\nLucratius:\nFinally, I was promoted but thats not what I got in my\nmind, this place may look beautiful but how could I\ngain power here?\n\nGeneral:\nLucratius, stop talking with who ever you weretalking\nto and build a settlement for the emporerer!\n\nLucratius:\nSure."
msg3="Basic controls:\nLEFT CLICK on any node and the activity window will\nopen according to the context. For example if you\nclick on your Headquarters the inventory of that\nbuilding will be opened, if you click on any building\nspot, the building window will be shown.\n\nRIGHT CLICK on any open window to close it. You can\nalso click in the upper left corner to close any\nwindow.\n\nI'll give you some time to test those functions."
msg4="Great!\n\nTo move around the visible area you can either use\nthe arrow keys on your keyboard or RIGHT CLICK and\nhold the right mouse button to move around.\n\nIf you get lost you can either press 'B' which jumps\nto the last screen position or 'H' which brings you\nback to your Headquarters in no time.\n\nI'll give you some time to test those functions."
msg5="You are really good with computers, aren't you?\n\nOn the bottom of your screen you can find four icons\nwhich all have different and important functions.\nFrom left to right:\nMap:\nThis button opens the map. You can also press 'L'\n\nMain selection:\nThis button opens the main selection where nearly all\nimportant functions can be found. We will explain them\nlater, for now the only important function for you is\nthe buttom button (The Computer), here you can save,\nload and read the keyboardlayout and readme file. You\ncan also press 'M' to open this.\n\nConstruction aid mode:\nIf you enable this function you can see the building\nquality of each spot in your country. More about that\nlater in this mission. You can also press 'Spacebar'\n\nPost office:\nWhenever you get a message with information, you will\nsee a white owl indicating new messages. If you have\nread them, you can press the 'Trashcan' icon (not\nvisible at the moment) to delete those. You can also\npress 'N'\n\nI'll give you some time to test those functions."
msg6="But wait, there is more!\nYou can also display building information (depending\non building type) by either opening the activity\nwindow and select the display options tab and enable\n'House names' or by pressing 'S' and 'C'. That way\ncan see productivity for most buildings or occupying\nsoldiers for military buildings.\n\nI'll give you some time to test those functions."
msg7="You can also open multiple windows at the same time.\nThat way you can check your current stock while bulding\nnew buildings. But be aware, you can not open an\ninformation window for the same building twice at the\nsame time."
msg8="Day 1\n\nLucratius:\nI can't resist, this water looks so blue, I'll take\na break and bathe a bit.\n\n\nCongratulations, now you know how to control everything!\nYou can adavance to the next Tutorial mission now."
msg9="You can leave now, really."

phase=0




function onStart()
    rttr.DisableBuilding(0)
    rttr.ClearResources(0)
    rttr.AddPeople(0,JOB_HELPER,100,JOB_BUILDER,1,JOB_PLANER,1)
    rttr.AddStaticObject(24, 36, 542, 0xFFFF)
    rttr.AddStaticObject(23, 37, 502, 0xFFFF)
    rttr.AddStaticObject(22, 37, 503, 0xFFFF)
    rttr.AddStaticObject(22, 38, 509, 0xFFFF)
    rttr.AddStaticObject(22, 39, 504, 0xFFFF)
    rttr.AddStaticObject(23, 40, 554, 0xFFFF)
    rttr.AddStaticObject(24, 40, 553, 0xFFFF)
    rttr.AddStaticObject(24, 39, 555, 0xFFFF)
    rttr.AddStaticObject(25, 38, 505, 0xFFFF)
    rttr.AddStaticObject(25, 37, 512, 0xFFFF)

    rttr.AddStaticObject(21, 38, 502, 0xFFFF)
    rttr.AddStaticObject(20, 39, 503, 0xFFFF)
    rttr.AddStaticObject(21, 40, 502, 0xFFFF)
    rttr.AddStaticObject(21, 41, 555, 0xFFFF)
end

function onGameFrame(gf)
    if((gf%100)~=0) then
		return
	end

    if(phase==0) then
        rttr.MissionStatement(0,title,msg1)
        phase=1
    end

    if((gf%500)~=0) then
        return
    end

    if(phase==8) then
        rttr.MissionStatement(0,title,msg9)
    end

    if(phase==7) then
        rttr.MissionStatement(0,title,msg8)
        phase=8
    end

    if(phase==6) then
        rttr.MissionStatement(0,title,msg7)
        phase=7
    end
        
    if(phase==5) then
        rttr.MissionStatement(0,title,msg6)
        phase=6
    end

    if(phase==4) then
        rttr.MissionStatement(0,title,msg5)
        phase=5
    end

    if(phase==3) then
        rttr.MissionStatement(0,title,msg4)
        phase=4
    end

    if(phase==2) then
        rttr.MissionStatement(0,title,msg3)
        phase=3
    end

    if(phase==1) then
        rttr.MissionStatement(0,title,msg2)
        phase=2
    end
end