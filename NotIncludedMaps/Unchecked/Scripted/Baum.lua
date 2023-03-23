--start callback, called after everything is set up
function start()
  --add 100 generals and 10 officers for player 0
  --rttr.AddPeople(1,25,100,24,10)
  rttr.AddPeople(0,25,100,24,10)
end

-- just output a message on stdout for now
function occupied(0,15,0)
  io.write("Point occupied: ", p, ": ", x, ",", y, "\n")
end