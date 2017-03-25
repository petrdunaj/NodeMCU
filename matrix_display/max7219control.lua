dofile('maxtrixConst.lua');

mx = 1;
my = 1;

tmr.stop(2); -- max7219demo

function move(direction) --  w,s,a,d  1,2,3,4
  if     (direction == 1) then my = my + 1;
  elseif (direction == 2) then my = my - 1;
  elseif (direction == 3) then mx = mx + 1;
  elseif (direction == 4) then mx = mx - 1;
  end
  if (my < 1) then my = 8 end;
  if (my > 8) then my = 1 end;
  if (mx < 1) then mx = 8 end;
  if (mx > 8) then mx = 1 end;
  -- sent new position to matrix-display
  displayPic(matrix[my][mx]);
end
