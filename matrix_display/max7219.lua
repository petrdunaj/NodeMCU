MAX7219_REG_NOOP        = 0x00
MAX7219_REG_DECODEMODE  = 0x09
MAX7219_REG_INTENSITY   = 0x0A
MAX7219_REG_SCANLIMIT   = 0x0B
MAX7219_REG_SHUTDOWN    = 0x0C
MAX7219_REG_DISPLAYTEST = 0x0F

function sendByte(reg, data)
  spi.send(1,reg * 256 + data)
  tmr.delay(50)
end

function displayPic(picture)
  -- iterates over all 8 columns and sets their values
  for i=1,8 do
    sendByte(i,picture[i]);
  end
end

function setup(intensity) --  0 ~ 15
  spi.setup(1, spi.MASTER, spi.CPOL_LOW, spi.CPHA_LOW, 16, 8)

  sendByte (MAX7219_REG_SHUTDOWN, 1)
  sendByte (MAX7219_REG_SCANLIMIT, 7)
  sendByte (MAX7219_REG_DECODEMODE, 0x00)
  sendByte (MAX7219_REG_DISPLAYTEST, 0)
  sendByte (MAX7219_REG_INTENSITY, intensity)
  sendByte (MAX7219_REG_SHUTDOWN, 1)
end

setup(0);

-- add this to UDP Parser

    -- max7219 control
    --elseif (k=="xy") then
      --move(v)
