-- Network Variables
dofile('wifiConfig.lua')

function wifiCreate()
  print('\nset mode=SOFTAP  (mode='..wifi.getmode()..')')
  -- Configure Access Point
  cfg={}
  cfg.ssid=wifiSoftAp[1];
  cfg.pwd=wifiSoftAp[2];
  wifi.ap.config(cfg)
  -- Configure IP Address
  cfg={}
  cfg.ip="192.168.1.1"
  cfg.netmask="255.255.255.0"
  cfg.gateway="192.168.1.1"
  wifi.ap.setip(cfg)
  -- Configure DHCP
  dhcpConfig ={}
  dhcpConfig.start = "192.168.1.10"
  dhcpA,dhcpB = wifi.ap.dhcp.config(dhcpConfig)
  wifi.ap.dhcp.start()

  print('SSID: '..wifiSoftAp[1]..', PASSWORD: '.. wifiSoftAp[2])
  print('MAC Address: '..wifi.ap.getmac())
  print('IP Address: '..wifi.ap.getip())
  print('DHCP range: '..dhcpA..'~'..dhcpB..'\n')

----------------------------------
-- AP was created, start script --
----------------------------------
-- dofile("dunaj.lua"); 

end

wifi.setmode(wifi.SOFTAP)
wifiCreate()

tmr.alarm(0, 500, 1, function()
  if wifi.ap.getip()~=nil then
    startUdpServer()
    startTcpServer()
    tmr.stop(0)
    tmr.unregister(0)
  end
end)
