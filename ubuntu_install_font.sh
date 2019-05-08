#!/bin/bash
set  -euo pipefail
I1FS=$'\n\t'
cd ~
git clone https://github.com/LHY-iS-Learning/Sauce-Code-Pro
mkdir -p ~/.fonts
cp -v Sauce-Code-Pro/Regular/complete/*Complete.ttf ~/.fonts
apt install fontconfig
fc-cache -f
rm -rf Sauce-Code-Pro
