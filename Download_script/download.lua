http.get("http://petrdunaj.cz/lua/code.txt",nil,function(c,d)if(c==200)then file.open("code.lua","w+");file.write(d);file.close();else print("!E");end;end)
