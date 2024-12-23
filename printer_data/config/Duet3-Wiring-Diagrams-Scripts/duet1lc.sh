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
 
openocd -c "adapter driver bcm2835gpio; \\
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
reset; \\
at91samd chip-erase; \\
at91samd bootloader 0; \\
program Duet3Bootloader-SAMC21.elf verify; \\
reset; \\
shutdown"
 
echo "Done."