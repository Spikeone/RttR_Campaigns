rttr.Log("script started")

function onStart()
-- Enable area
-- rttr.SetRestrictedArea(0, 0,0, 128,0, 128,128, 0,128)
-- disable area
-- rttr.SetRestrictedArea(0, 96,32, 128,32, 128,96, 96,96)
-- To specify multiple polygons, start with a 0,0-pair followed by the first polygon, another 0,0-pair, the second polygon etc. and a final 0,0-pair at the end. For multiple polygons, each polygons first point has to be repeated at the end of it
--    sep pol1.1 pol1.2 pol1.3  pol1.4 pol1.5 sep pol2.1 pol2.2 pol2.3 pol2.4 rep   sep
-- => 0,0 0,0    128,0  128,128 0,128  0,0    0,0 96,32 128,32  128,96 96,96  96,32 0,0
-- WORKING: rttr.SetRestrictedArea(0, 0,0, 0,0, 128,0, 128,128, 0,128, 0,0, 0,0, 96,32, 128,32, 128,96, 96,96, 96,32, 0,0)

rttr.SetRestrictedArea(0, 0,0, 0,0, 128,0, 128,128, 0,128, 0,0, 0,0, 70,32, 128,32, 128,96, 70,96, 96,32, 0,0)

-- I thought maybe those doubled 0,0 are problematic so I also tried
-- rttr.SetRestrictedArea(0, 0,0, 1,1, 128,1, 128,128, 1,128, 1,1, 0,0, 96,32, 128,32, 128,96, 96,96, 96,32, 0,0)
end