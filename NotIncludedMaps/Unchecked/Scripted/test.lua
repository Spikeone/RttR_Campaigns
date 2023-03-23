rttr.Log("script started")

--id=6000
--Creating an Array for graphics
--START | END | STEPS | 
ga={2500,2507,1,2508,2515,1}
--Creating an Array for animated graphics locations
--X | Y | ACTIVE | STEP | ID
gl={30,30,1,8,0, 32,32,1,0,1, 40,40,1,0,0}

function onStart()
	--rttr.AddStaticObject(55, 63, id, 0xFFFF)
end

function onGameFrame(gf)
    if((gf%8)==0) then
        for i=0, (#gl/5)-1 do
            if(gl[3+i*5]==1) then
                --if(currentgraphic >= endgraphic) then
                if(ga[1+gl[5+i*5]*3]+gl[4+i*5] >= ga[2+gl[5+i*5]*3]) then
                    rttr.Log("Current>End")
                end
                --rttr.Log("Start:",ga[1+gl[5+i*5]*3])
                --rttr.Log("Step:",gl[4+i*5])
                --rttr.Log("CurrentGraphic:",ga[1+gl[5+i*5]*3]+gl[4+i*5])
                --rttr.Log("EndGraphic:",ga[2+gl[5+i*5]*3])
                --if(gl[4+i*5]+ga[gl[(5+i*5)*3]]==ga[gl[(5+i*5)*3+1]]) then
                --    rttr.Log("Endgraphic")
                --end
                rttr.Log("Object at ",gl[1+i*5],":",gl[2+i*5])
            end
        --rttr.Log("I:",i)
        --rttr.Log("To:",(#gl/5)-1)
        --rttr.Log("Object at ",gl[1+i*5],":",gl[2+i*5])
        --rttr.Log("\nga0:",ga[0])
        --rttr.Log("\nga1:",ga[1])
        --rttr.Log("\ngllen:",#gl)
        end
    end

	if((gf%100)~=0) then
		return
	end
	
	--if(id<6018) then
		--id=id+2
		--rttr.AddStaticObject(55, 63, id, 0xFFFF)
		--rttr.PostMessageWithLocation(0, 55, 63, "A neutral town\nhas grown")
	--end
end