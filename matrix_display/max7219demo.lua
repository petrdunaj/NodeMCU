happy = {0x3C, 0x42, 0xA5, 0x81, 0xA5, 0x99, 0x42, 0x3C};
frown = {0x3C, 0x42, 0xA5, 0x81, 0xBD, 0x81, 0x42, 0x3C};
sad = {0x3C, 0x42, 0xA5, 0x81, 0x99, 0xA5, 0x42, 0x3C};
faces = {happy, frown, sad};

function displayFace(faceIndex)
  local face = faces[faceIndex];
  displayPic(face);
end

-- changes the face every two seconds cycling through the array of faces
function moody(i)
  faceIndex = (i % 3) + 1;
  displayFace(faceIndex);
  tmr.alarm(2, 1500, 0, function()
    moody(faceIndex + 1);
  end);
end

tmr.stop(2);
moody(0);
