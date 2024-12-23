Danger Klipper configuration docs:   
https://dangerklipper.io/Config_Reference.html

Duet 3 6HC overview docs:   
https://docs.duet3d.com/Duet3D_hardware/Duet_3_family/Duet_3_Mainboard_6HC_Hardware_Overview

RepRap Firmware - Duet 3 6HC pinout:   
https://github.com/Duet3D/RepRapFirmware/blob/3.4-dev/src/Config/Pins_Duet3_MB6HC.h

-----------

Duet 6HC Flashing:

Railcore/Duet 3 6HC flashing guide:   
https://github.com/ibash/railcore-klipper

Install BOSSA:
```
git clone https://github.com/shumatech/BOSSA.git
cd BOSSA
make bossac
sudo cp bin/bossac /usr/local/bin
```

Bossac firmware flashing command (from Raspberry Pi):   
```
~/BOSSA/bin/bossac --port=/dev/serial/by-id/usb-03eb_6124-if00 -b -U -e -w -v ~/klipper/out/klipper.bin
```
(must first compile klipper.bin)

Enable CANbus (can0) by making menuconfig with 'USB to CAN bus bridge'.

If the above method fails, use Bossa for Windows:  
https://docs.duet3d.com/User_manual/RepRapFirmware/Updating_firmware#all-other-duet-boards

-----------

PanelDue Setup:

PanelDue Klipper compatible firmware (downgrade to Release 1.24):   
https://github.com/Duet3D/PanelDueFirmware/releases/tag/1.24

Klipper PanelDue configuration docs:  
https://github.com/Arksine/moonraker/blob/master/docs/configuration.md#paneldue

-----------

Local USB GCODE Upload:

Automatically mount a USB Stick and push all files to Moonraker plugin:  
https://github.com/shiftingtech/Moonraker-loader

-----------

Hardware Add-Ons:

Adafruit USB Isolator: https://a.co/d/ivCMPR9   
(Prevents ground loops between Raspberry Pi and Duet 6HC)

Serial Converter Module CP2102 USB to TTL: https://a.co/d/d1dmJC9   
(Connect PanelDue display to Raspberry Pi)
(Configuration docs:
