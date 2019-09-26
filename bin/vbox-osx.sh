#!/usr/bin/env sh

set -xe

name=$1

VBoxManage modifyvm "$name" --cpuidset 00000001 000106e5 00100800 0098e3fd bfebfbff
VBoxManage modifyvm "$name" --cpu-profile "Intel Core i7-6700K"
#VBoxManage setextradata "$name" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "iMac11,3"
VBoxManage setextradata "$name" "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "MacPro6,1"
VBoxManage setextradata "$name" "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
VBoxManage setextradata "$name" "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Iloveapple"
VBoxManage setextradata "$name" "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
VBoxManage setextradata "$name" "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1
VBoxManage setextradata "$name" VBoxInternal2/EfiGopMode 5
VBoxManage setextradata "$name" VBoxInternal2/EfiGraphicsResolution 1920x1080
VBoxManage setextradata "$name" "VBoxInternal/Devices/efi/0/LUN#0/Config/PermanentSave" 1
