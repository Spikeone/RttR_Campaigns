--This script enables economic 'Quests'
--Messages
msg0 = "Script Started"
msg1 = "Mode used: "
msg2 = "Mission length: "
msg3 = "Players: "
msg4 = "Requires: "
msg5 = "Quest Finished!"
msg6 = "Winner: "
msg7 = "Playing Spikes Quest-Mode"
msg8 = "Your Player ID is: "
newline = "\n"
endspacer = "                                                "
msg9 = "No player won!"
msg10 = "You are not the winner!"
msg11 = "Increased the requested good by: "
msg12 = "You are the Winner!"
msg13 = "Next mode: "
msg14 = "Version: 0.1"
msg15 = "Mission delay: "
msg16 = "Win good: "
msg17 = "Win amount: "

--Time you got for a 'Quest' | Default: 10000 | MUST be a multiple of 100
m_lenght = 10000
--Modes used, 0 you want to disable 'Quests', currently only mode 1 is working | Default: 1
m_modes = 1
--Quest delay, time until first Quest starts! | Default: 500 | MUST be a multiple of 100
m_delay = 500
--Amount of Goods player wins | Default: 1
m_winamount = 300
--GoodID!!! Player wins | Default: 25
m_wingood = 25
--Do not edit this!
m_playercount = 0
m_currentmode = -1
m_helpervariable = 0
m_questid = 0
m_diff = 0
m_playerid = -2

m_modescount = 7
modes_text = {"1 - Wares", "2 - People", "3 - Buildings", "4 - Wares and People", "5 - Wares and Buildings", "6 - People and Buildings", "7 - Wares, Peoples and Buildings"}

m_warescount = 30
wares_text = {"Beer", "Tongs", "Hammer", "Axe", "Saw", "Pickaxe", "Shovel", "Crucible", "Rodandline", "Scythe", "Water", "Cleaver", "Rollingpin", "Bow", "Boat", "Sword", "Iron", "Flour", "Fish", "Bread", "Wood", "Boards", "Stones", "Grain", "Coins", "Gold", "Ironore", "Coal", "Meat", "Ham"}
wares_id = {GD_BEER, GD_TONGS, GD_HAMMER, GD_AXE, GD_SAW, GD_PICKAXE, GD_SHOVEL, GD_CRUCIBLE, GD_RODANDLINE, GD_SCYTHE, GD_WATER, GD_CLEAVER, GD_ROLLINGPIN, GD_BOW, GD_BOAT, GD_SWORD, GD_IRON, GD_FLOUR, GD_FISH, GD_BREAD, GD_WOOD, GD_BOARDS, GD_STONES, GD_GRAIN, GD_COINS, GD_GOLD, GD_IRONORE, GD_COAL, GD_MEAT, GD_HAM}

function onStart()
    m_playercount=rttr.GetPlayerCount()
    rttr.Log(msg0)
end

--Do not edit this!
player_goods = {}

function onGameFrame(gf)

    --Do not Check everything that often
    if(((gf % 100) ~= 0) or m_modes==0) then
        return
    end

    --Tell Players, that we are playing with Quest-Mode
    if(gf==100 and m_modes~=0) then
        for i=0, m_playercount-1 do
            rttr.MissionStatement(i,msg7,msg14,newline, msg1,modes_text[m_modes],newline,msg2,m_lenght,newline,msg3,m_playercount,newline,msg8,i,newline,msg15,m_delay,newline,msg16,wares_text[m_wingood],newline,msg17,m_winamount,newline,endspacer)
        end
    end

    --Check if a Quest is finished
    if((gf%(m_lenght+m_delay))==0 and gf>(m_delay-1)) then

        rttr.Chat(-1, msg5)
        m_diff = 0
        m_playerid = -1

        if(m_currentmode==0) then
            for i=0, m_playercount-1 do

            --rttr.Chat(-1, "PlayerID: ", i)
            --rttr.Chat(-1, "OldGoods: ", player_goods[i])
            --rttr.Chat(-1, "New Goods: ", rttr.GetWareCount(i, wares_id[m_questid+1]))
            --rttr.Chat(-1, "Diff: ", (rttr.GetWareCount(i, wares_id[m_questid+1])-player_goods[i]))

                if(m_diff < (rttr.GetWareCount(i, wares_id[m_questid+1])-player_goods[i])) then
                    m_playerid=i
                    m_diff=(rttr.GetWareCount(i, wares_id[m_questid+1])-player_goods[i])
                end
            end
        end

        m_currentmode=-1

    end

    if(m_currentmode==-1 and gf>(m_delay-1)) then
        m_helpervariable = 0
        for i=0, m_playercount-1 do
            m_helpervariable = m_helpervariable + rttr.GetPeopleCount(i,0)
        end

        m_currentmode = m_helpervariable % m_modes

        if(m_currentmode==0) then
            m_questid = m_helpervariable % m_warescount
            --rttr.Chat(-1, msg4, wares_text[m_questid+1])
            for i=0, m_playercount-1 do
                player_goods[i]=rttr.GetWareCount(i, wares_id[m_questid+1])
            end
        end

         --Winner, loser, next Quest
        for i=0, m_playercount-1 do
            if(i==m_playerid and m_playerid ~= -2) then
                rttr.PostMessage(i, msg12, newline, msg13, modes_text[m_currentmode+1], newline, msg4, wares_text[m_questid+1])
                rttr.AddWares(i, m_wingood, m_winamount)
            elseif(m_playerid ~= -2) then
                rttr.PostMessage(i, msg10, newline, msg13, modes_text[m_currentmode+1], newline, msg4, wares_text[m_questid+1])
            else
                rttr.PostMessage(i, msg13, modes_text[m_currentmode+1], newline, msg4, wares_text[m_questid+1])
            end
        end
    end
end