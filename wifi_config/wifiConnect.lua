-- Network Variables
dofile('wifiConfig.lua')

function selectap(t)
  for k,v in pairs(t) do
    for a in pairs(wifiStaConfig) do
      if (wifiStaConfig[a][1] == k) then
        wifiConnect(wifiStaConfig[a][1],wifiStaConfig[a][2])
        break
      end
    end
  end
end

function wifiConnect(ssid,pass)
  print('\nset mode=STATION (mode='..wifi.getmode()..')')
  print('MAC Address: ',wifi.sta.getmac())

  -- Connect to WiFi
  wifi.sta.config(ssid,pass)
  print('Connecting to '..ssid)
end

wifi.setmode(wifi.STATION)
wifi.sta.getap(selectap)

tmr.alarm(0, 500, 1, function()
  if wifi.sta.getip()~=nil then
    print('IP Address: '..wifi.sta.getip()..'\n')

------------------------------------------
-- Connection was created, start script --
------------------------------------------
-- dofile("dunaj.lua");

    tmr.stop(0)
    tmr.unregister(0)
  end
end)
