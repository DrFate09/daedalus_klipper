Danger Klipper configuration docs:   
https://dangerklipper.io/Config_Reference.html

Duet 3 6HC overview docs:   
https://docs.duet3d.com/Duet3D_hardware/Duet_3_family/Duet_3_Mainboard_6HC_Hardware_Overview

RepRap Firmware - Duet 3 6HC pinout:   
https://github.com/Duet3D/RepRapFirmware/blob/3.4-dev/src/Config/Pins_Duet3_MB6HC.h

Railcore/Duet 3 6HC flashing guide:   
https://github.com/ibash/railcore-klipper

Bossac firmware flashing command (from Raspberry Pi):   
```/home/pi/klipper/lib/bossac/bin/bossac --port=/dev/serial/by-id/usb-03eb_6124-if00 -b -U -e -w -v /home/pi/klipper/out/klipper.bin```
(must first compile klipper.bin and attempt a flash with ```make flash``` to compile Bossac)

If the above method fails, use Bossa for Windows:  
https://docs.duet3d.com/User_manual/RepRapFirmware/Updating_firmware#all-other-duet-boards

Klipper PanelDue configuration docs:  
https://github.com/Arksine/moonraker/blob/master/docs/configuration.md#paneldue

Automatically mount a USB Stick and push all files to Moonraker plugin:  
https://github.com/shiftingtech/Moonraker-loader

-----------

Adafruit USB Isolator: https://a.co/d/ivCMPR9   
(Prevents ground loops between Raspberry Pi and Duet 6HC)

Serial Converter Module CP2102 USB to TTL: https://a.co/d/d1dmJC9   
(Connect PanelDue display to Raspberry Pi)
(Configuration docs:
