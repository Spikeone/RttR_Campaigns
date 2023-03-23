rttr.Log("Script started!\n")

function onStart()
    --rttr.SetRestrictedArea(0, 1,1, 127,1, 127,127, 1,127)
    --rttr.SetRestrictedArea(0, 71,15, 76,24, 71,33, 67,24, 71,15)
    rttr.SetRestrictedArea(0, 0,0,
    1,1, 126,1, 126,126, 1,126, 1,1, 0,0,
    71,15, 76,24, 71,33, 67,24, 71,15, 0,0)
end