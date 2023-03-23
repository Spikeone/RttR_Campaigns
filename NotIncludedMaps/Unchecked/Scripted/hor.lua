--We don't have much bytes, using short, non saying variable names :-/
--Playercount
p=-1
--General Timer in GF(Mines)
gt=250
--General Amount in pieces
ga=1
--Types
t=5
--Version
v="HoR Version 0.1 by Spike(one)"
s="                                                                "
rttr.Log(v, " script started!\n")

--Graphic Arrays
--Items
--Includes graphic, exhausted graphic (-1 for empty graphic (erase))
ag={20001,20008, 20002,20009}
--Settlers (Jobs)
--Includes graphic, empty graphic (-1 for empty graphic (erase))
bg={20017,-1,20015,-1}
--Buildings
--Includes graphic
cg={20020}
--Upgrades
--Includes graphic
dg={20024}
--Events
--Includes graphic, Event graphic (depends on eventtype, may be ignored, set to -1)
eg={20026,-1}
--Counter
--Counter for a,b,c,d,e - needs to be filled correctly!!!
--Also includes Start for each 'block' items go from 0-16 (0-2*8),settlers go from 16-32 (2*8-2*8+2*8), Buildings go from 32-39 (2*8+2*8-2*8+2*8+1*7) and so on...
--!!!WARNING: Source for problems!!!
ec={2,2,1,1,1,7,16,32,40,48,56}
--Empty Graphic ID
l=20000


--Items (Includes Mines AND treasures)
--All Types have specific arrays, please use correct format!
--Items 1=x, 2=y, 3=timer, 4=good, 5=amount, 6=leftover (-1 inexhaustible, 1 single 'event'), 7=graphic (id of graphic in array), 8=player (-1 unccupied (gamestart))
a={50, 50, gt, GD_GOLD, ga, -1, 20001, -1,  50, 60, gt, GD_IRON, ga, 5, 20002, -1}

--Settlers (Jobs)
--All Types have specific arrays, please use correct format!
--Items 1=x, 2=y, 3=timer, 4=good, 5=amount, 6=leftover (-1 inexhaustible, 1 single 'event'), 7=graphic (id of graphic in array), 8=player (-1 unccupied (gamestart))
b={60, 50, gt, JOB_GENERAL, ga, 1, 20017, -1,  60, 60, gt, JOB_PRIVATE, ga, 5, 20015, -1}

--Buildings (You may disable buildings!)
--All Types have specific arrays, please use correct format!
--Buildings 1=x, 2=y, 3=Eventtype, 4=Eventdata, 5=Eventdata2, 6=Eventdata3, 7=graphic, 8=player (-1 unoccupied (gamestart))
c={70,50, 1, BLD_CATAPULT, 0, 0, 20020, -1}
--Currently there is only 1 type!
--Eventtype=1 (Enables Building for player, does Not disable on occupied lost!)
--Eventdata=Building
--Eventdata2=Internal use, is exectuted (set to -1)

--Upgrades
--All Types have specific arrays, please use correct format!
--Upgrades 1=x, 2=y, 3=Eventtype, 4=Eventdata, 5=Eventdata2, 6=Eventdata3, 7=graphic, 8=player (-1 unoccupied (gamestart))
d={80,50, 1, 1, GD_GOLD, 0, 20024, -1}
--Currently there is only 1 type!
--Eventtype=1 (Increase Income)
--Eventdata=Increase number of items player gets for holding an Items (a) spot
--Eventdata2=Good that should be used, -1 for all

--Events
--All Types have specific arrays, please use correct format!
--Upgrades 1=x, 2=y, 3=Eventtype, 4=Eventdata, 5=Eventdata2, 6=Eventdata3, 7=graphic, 8=player (-1 unoccupied (gamestart))
e={90,50, 1, BLD_FORTRESS, 2500, 0, 20026, -1}
--Currently there is only 1 type!
--Eventtype=1 (Disable Buildings for all other Players)
--Eventdata=Building
--Eventdata2=Duration
--Eventdata3=used to store start GF of event


cmpl={}

function onStart()
    --complete Array for internal use!
for i=0,(ec[11]-1) do
	if(i<=ec[7]) then
		cmpl[i]=a[i]
	elseif(i<=ec[8]) then
		cmpl[i]=b[i-ec[7]]
	elseif(i<=ec[9]) then
		cmpl[i]=c[i-ec[8]]
	elseif(i<=ec[10]) then
		cmpl[i]=d[i-ec[9]]
	elseif(i<=ec[11]) then
		cmpl[i]=e[i-ec[10]]
	else
		rttr.Log("Something went wrong! cmpl={} is longer than expected!(filling)")
	end
end
    
	p=rttr.GetPlayerCount()

	--using enable BLD_CATAPULT event
	for i=0,p do
		--rttr.DisableBuilding(i,BLD_CATAPULT)
	end
	
	--finally add all graphics to the world
	for i=0, (ec[6]-1) do
        --px=cmpl[(i*8+1)]
        --py=cmpl[(i*8+2)]
        --pg=cmpl[(i*8+7)]
		--rttr.Log(" I: ",i," X: ",px," Y: ",py, " G: " ,pg)
		rttr.AddStaticObject(cmpl[i*8+1], cmpl[i*8+2], cmpl[i*8+7], 0xFFFF, 2)
        --rttr.AddStaticObject(50,50,20028,0xFFFF,2)
	end
    --rttr.AddEnvObject(33,61,20002,0xFFFF)
end

--rttr.AddEnvObject(50,50,20028,0xFFFF)

function onOccupied(pid,ox,oy)
	for i=0, ec[6] do
		if(ox==cmpl[i*8+1] and oy==cmpl[i*8+2]) then
			cmpl[i*8+8]=pid
			rttr.PostMessageWithLocation(pid,ox,oy,"You just occupied this!")
			--Event, Type 1, must be executed here!
			if(i>=ec[1]+ec[2]+ec[3]+ec[4]) then
				cmpl[i*8+6]=rttr.GetGf()+cmpl[i*8+5]
				for u=0,p do
					if(cmpl[i*8+8]~=u) then
						rttr.DisableBuilding(u,cmpl[i*8+4])
						rttr.PostMessageWithLocation(u,ox,oy,"Player '",u,"' disabled one of your buildings for ",cmpl[i*8+5],"GF!")
					end
				end
			end
		end
	end
end

function onGameFrame(gf)
	if(gf%50)~=0 then
		return
	end
	
	if(gf==100) then
		for i=0,p do
			rttr.MissionStatement(i, v, "You are playing with Heroes of Return to the Roots Lua-Mod!\n\nAuthor: Spike(one)\nGraphics: Spike(one)\nItem-Locations: ",ec[1],"\nSettler-Locations",ec[2],"\nBuilding-Locations: ",ec[3],"\nUpgrade-Locations: ",ec[4],"\nEvent-Locations: ",ec[5],"\nTotal: ",ec[6],"\n\nThis mode needs additional, non RttR, graphic files!\n\nReport bugs to fvv1@gmx.de or PM Spike on rttr.info!\n\nGood Luck and have fun!\n",s)
		end
	end
	
	--lets loop through all events and execute them
	for i=0, (ec[5]-1) do

		--Items
		if(i<=ec[1]) then
			--only exectute if someone owns this building, there is leftover, timer is reached
			if(cmpl[i*8+8]~=-1 and cmpl[i*8+6]~=0 and (gf%cmpl[i*8+3])==0) then
				--execute upgrades
				for u=ec[1]+ec[2]+ec[3],ec[1]+ec[2]+ec[3]+ec[4] do
					--Player must fit, ware must fit, Evenntype must be 1
					if(cmpl[u*8+3]==1 and cmpl[u*8+8]==cmpl[i*8+8] and (cmpl[u*8+5]==cmpl[i*8+4] or cmpl[u*8+5]==-1)) then
						rttr.AddWares(cmpl[i*8+8],cmpl[i*8+4],cmpl[i*8+5]+cmpl[u*8+4])
						--decrease leftover
						cmpl[i*8+6]=cmpl[i*8+6]-1
						goto continue
					end

					
					--decrease leftover
					cmpl[i*8+6]=cmpl[i*8+6]-1
					rttr.AddWares(cmpl[i*8+8],cmpl[i*8+4],cmpl[i*8+5])
					::continue::
					--emtptied
					if(cmpl[i*8+6]==0) then
						rttr.AddStaticObject(cmpl[i*8+1], cmpl[i*8+2], cmpl[i*8+7]+1, 0xFFFF, 2)
					end
				end
			end
		
		--Settlers
		elseif(i<=(ec[1]+ec[2])) then
			--only exectute if someone owns this building, there is leftover, timer is reached
			if(cmpl[i*8+8]~=-1 and cmpl[i*8+6]~=0 and (gf%cmpl[i*8+3])==0) then
				rttr.AddPeople(cmpl[i*8+8],cmpl[i*8+4],cmpl[i*8+5])
				--decrease leftover
				cmpl[i*8+6]=cmpl[i*8+6]-1
				--emtptied
				if(cmpl[i*8+6]==0) then
					if(cmpl[i*8+7]+1==-1) then
						rttr.AddEnvObject(cmpl[i*8+1], cmpl[i*8+2], l, 0xFFFF)
					elseif(cmpl[i*8+7]+1>0) then
						rttr.AddEnvObject(cmpl[i*8+1], cmpl[i*8+2], cmpl[i*8+7]+1, 0xFFF)
					end
				end
			end


		--Buildings
		elseif(i<=(ec[1]+ec[2]+ec[3])) then
			--Eventtype 1
			if(cmpl[i*8+3]==1 and cmpl[i*8+5]~=-1) then
				rttr.EnableBuilding(cmpl[i*8+8],cmpl[i*8+4])
				--event executed
				cmpl[i*8+5]=-1
			end

		--Upgrades, done in Items/Settlers
		elseif(i<=(ec[1]+ec[2]+ec[3]+ec[4])) then
		
		--Events
		elseif(i<=ec[6]) then
			--Revert Eventype 1
			if(cmpl[i*8+6]>0 and cmpl[i*8+6]>=gf and cmpl[i*8+3]==1) then
				for u=0,p do
					if(cmpl[i*8+8]~=u) then
						rttr.EnableBuilding(u, cmpl[i*8+4])
						rttr.PostNewBuildings(u, cmpl[i*8+4])
					end
				end
				cmpl[i*8+6]=0
			end
		else
			rttr.Log("Something went wrong! cmpl={} is longer than expected!")
            rttr.Log("I:",i)
		end
	end
end
