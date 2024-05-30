# This script can be used to flash a board over Serial Wire Debug with an
# atsamc21 from a Raspberry Pi 4 Model B by using OpenOCD. To run this
# script, do the following:
# 1.  Install OpenOCD on the Pi: openocd.org.
# 2.  Power off and disconnect everything from the board you will be flashing.
# 3.  Power off and disconnect everything from the Pi.
# 4.  Connect GPIO pin 25 on the Pi to the SWCLK pin on the board.
# 5.  Connect GPIO pin 24 on the Pi to the SWDIO pin on the board.
# 6.  Connect GPIO pin 18 on the Pi to the SRST pin on the board.
# 7.  Connect a ground pin on the Pi to ground on the board.
# 8.  Power on the Pi.
# 9.  Power on the board (you may do this by supplying power from the Pi).
# 10. Build klipper by running make.
# 11. On the Pi, make this script executable and run it as root.


# Set proper swd pins here (bcm2835 numbering):
SWCLK=25
SWDIO=24
SRST=18

echo "Exporting SWCLK and SRST pins."
echo $SWCLK > /sys/class/gpio/export
echo $SRST > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio$SWCLK/direction
echo "out" > /sys/class/gpio/gpio$SRST/direction

echo "Setting SWCLK low and pulsing SRST."
echo "0" > /sys/class/gpio/gpio$SWCLK/value
echo "0" > /sys/class/gpio/gpio$SRST/value
echo "1" > /sys/class/gpio/gpio$SRST/value

echo "Unexporting SWCLK and SRST pins."
echo $SWCLK > /sys/class/gpio/unexport
echo $SRST > /sys/class/gpio/unexport

echo "Ready for OpenOCD."

/home/pi/openocd/install/bin/openocd -c "adapter driver bcm2835gpio; \\
bcm2835gpio peripheral_base 0xFE000000; \\
bcm2835gpio speed_coeffs 236181 60; \\
adapter gpio swclk $SWCLK; \\
adapter gpio swdio $SWDIO; \\
adapter gpio srst $SRST; \\
transport select swd; \\
set CHIPNAME samc21; \\
source [find target/at91samdXX.cfg]; \\
reset_config srst_only; \\
adapter speed 276; \\
init; \\
reset; \\
reset halt; \\
at91samd chip-erase; \\
at91samd bootloader 0; \\
program /home/pi/klipper/out/klipper.elf verify; \\
reset; \\
shutdown"

echo "Done. You may power off and disconnect your devices."