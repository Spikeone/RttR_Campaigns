--macro.define('LOG',{'m'},@ (rttr.Log(m)) @)
--function Log(m)
--	rttr.Log(m)
--end

--f=rttr.Log



--rttr.Log("Normaler Log!")
--LOG("Anderer Log!")
--Log("Anderer Log!")
--f("Noch nen anderer!")

function onGameFrame(gf)
	if(gf==200) then
		rttr.ClearResources(0)
		rttr.ClearResources(1)
		rttr.AddPeople(0,JOB_PRIVATE,10)
		rttr.AddPeople(1,JOB_GENERAL,5)
	end
end
		