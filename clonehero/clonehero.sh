#!/usr/bin/env bash 
#--------------------------------------------------------------------- 
#       DEFINE APP INFO >> 
APPNAME=clonehero 
APPLINK=https://github.com/clonehero-game/releases/releases/download/v1.1.0.4261-PTB/clonehero-linux.tar.xz
APPHOME=github.com/clonehero-game
#---------------------------------------------------------------------
#       DEFINE LAUNCHER COMMAND >>
COMMAND='sysctl -w vm.max_map_count=2097152; ulimit -H -n 819200; ulimit -S -n 819200; ulimit -S -n 819200 clonehero; ulimit -H -l 61634; ulimit -S -l 61634; ulimit -H -s 61634; ulimit -S -s 61634; mkdir "/userdata/system/add-ons/'$APPNAME'/home" 2>/dev/null; mkdir "/userdata/system/add-ons/'$APPNAME'/config" 2>/dev/null; mkdir "/userdata/system/add-ons/'$APPNAME'/roms" 2>/dev/null; HOME="/userdata/system/add-ons/'$APPNAME'/home" XDG_CONFIG_HOME="/userdata/system/add-ons/'$APPNAME'/config" XDG_DATA_HOME="/userdata/system/add-ons/'$APPNAME'/home" XDG_CURRENT_DESKTOP=XFCE DESKTOP_SESSION=XFCE DISPLAY=:0.0 "/userdata/system/add-ons/'$APPNAME'/'$APPNAME'" ${@}'
#--------------------------------------------------------------------- 
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
######################################################################
# --------------------------------------------------------------------
APPNAME="${APPNAME^^}"; ORIGIN="${APPHOME^^}"; appname=$(echo "'$APPNAME'" | awk '{print tolower($0)}'); AppName='$APPNAME'; APPPATH="/userdata/system/add-ons/'$APPNAME'/'$APPNAME'.AppImage"
# --------------------------------------------------------------------
# --------------------------------------------------------------------
# show console/ssh info: 
clear 
echo 
echo 
echo 
echo -e "${X}PREPARING '$APPNAME' INSTALLER . . . ${X}"
echo 
echo 
echo 
# --------------------------------------------------------------------
# -- output colors:
###########################
X='\033[0m'               # 
W='\033[0m'               # 
#-------------------------#
RED='\033[0m'             # 
BLUE='\033[0m'            # 
GREEN='\033[0m'           # 
PURPLE='\033[0m'          # 
DARKRED='\033[0m'         # 
DARKBLUE='\033[0m'        # 
DARKGREEN='\033[0m'       # 
DARKPURPLE='\033[0m'      # 
###########################
# --------------------------------------------------------------------
# -- console theme
L=$X
R=$X
# --------------------------------------------------------------------
# -- prepare paths and files for installation: 
cd ~/
addons="/userdata/system/add-ons/"
mkdir $addons 2>/dev/null
mkdir $addons/extra 2>/dev/null
rm -rf $addons/'$APPNAME' 2>/dev/null
mkdir $addons/'$APPNAME' 2>/dev/null
mkdir $addons/'$APPNAME'/extra 2>/dev/null
# --------------------------------------------------------------------
# -- pass launcher command as cookie for main function: 
command=$addons/'$APPNAME'/extra/command; rm $command 2>/dev/null;
echo "$COMMAND" >> $command 2>/dev/null 
# --------------------------------------------------------------------
# -- prepare dependencies for this app and the installer: 
mkdir -p ~/add-ons/.dep 2>/dev/null && cd ~/add-ons/.dep && wget --tries=10 --no-check-certificate --no-cache --no-cookies -q -O ~/add-ons/.dep/dep.zip https://github.com/uureel/batocera.add-ons/raw/main/.dep/dep.zip && yes "y" | unzip -oq ~/add-ons/.dep/dep.zip && cd ~/
wget --tries=10 --no-check-certificate --no-cache --no-cookies -q -O $addons/'$APPNAME'/extra/icon.png https://github.com/uureel/batocera.add-ons/raw/main/'$APPNAME'/extra/icon.png; chmod a+x $dep/* 2>/dev/null; cd ~/
chmod 777 ~/add-ons/.dep/* && for file in "/userdata/system/add-ons/.dep/lib*"; do sudo ln -s "$file" "/usr/lib/$(basename $file)"; done
# --------------------------------------------------------------------
# // end of dependencies 
#
# --------------------------------------------------------------------
# -- run before installer:  
#killall wget 2>/dev/null && killall '$APPNAME' 2>/dev/null && killall '$APPNAME' 2>/dev/null && killall '$APPNAME' 2>/dev/null
# --------------------------------------------------------------------
cols=$($dep/tput cols); rm -rf "/userdata/system/add-ons/'$APPNAME'/extra/cols"
echo $cols >> "/userdata/system/add-ons/'$APPNAME'/extra/cols"
line(){
echo 1>/dev/null
}
# -- show console/ssh info: 
clear
echo
echo
echo
echo -e "${X}BATOCERA.add-ons/'$APPNAME' INSTALLER${X}"
echo
echo
echo
echo
sleep 0.33
clear
echo
echo
echo -e "${W}- - - - - - -"
echo -e "${X}BATOCERA.add-ons/'$APPNAME' INSTALLER${X}"
echo -e "${W}- - - - - - -"
echo
echo
echo
sleep 0.33
clear
echo
echo -e "${W}- - - - - - -"
line $cols ' '; echo
echo -e "${X}BATOCERA.add-ons/'$APPNAME' INSTALLER${X}"
line $cols ' '; echo
echo -e "${W}- - - - - - -"
echo
echo
sleep 0.33
clear
line $cols '\'; echo
line $cols '/'; echo
line $cols ' '; echo
echo -e "${X}BATOCERA.add-ons/'$APPNAME' INSTALLER${X}"
line $cols ' '; echo
line $cols '/'; echo
line $cols '\'; echo
echo
sleep 0.33
echo -e "${X}THIS WILL INSTALL '$APPNAME' FOR BATOCERA"
echo -e "${X}USING $ORIGIN"
echo
echo -e "${X}'$APPNAME' WILL BE AVAILABLE IN PORTS"
echo -e "${X}AND ALSO IN THE F1->APPLICATIONS MENU"
echo -e "${X}AND INSTALLED IN /USERDATA/system/add-ons/'$APPNAME'"
echo
echo -e "${X}FOLLOW THE BATOCERA DISPLAY"
echo
echo -e "${X}. . .${X}" 
echo
#/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
# --------------------------------------------------------------------
#\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
# -- THIS WILL BE SHOWN ON MAIN BATOCERA DISPLAY:   
function batocera-add-ons-installer {
APPNAME="$1"
appname="$2"
AppName="$3"
APPPATH="$4"
APPLINK="$5"
ORIGIN="$6"
# --------------------------------------------------------------------
# -- colors: 
###########################
X='\033[0m'               # 
W='\033[0m'               # 
#-------------------------#
RED='\033[0m'             # 
BLUE='\033[0m'            # 
GREEN='\033[0m'           # 
PURPLE='\033[0m'          # 
DARKRED='\033[0m'         # 
DARKBLUE='\033[0m'        # 
DARKGREEN='\033[0m'       # 
DARKPURPLE='\033[0m'      # 
###########################
# -- display theme:
L=$W
T=$W
R=$RED
B=$BLUE
G=$GREEN
P=$PURPLE
# --------------------------------------------------------------------
cols=$(cat "/userdata/system/add-ons/.dep/display.cfg" | tail -n 1)
cols=$(bc <<<"scale=0;$cols/1.3") 2>/dev/null
#cols=$(cat /userdata/system/add-ons/'$APPNAME'/extra/cols | tail -n 1)
line(){
echo 1>/dev/null
}
clear
echo
echo
echo
echo -e "${W}BATOCERA.add-ons/${G}'$APPNAME'${W} INSTALLER ${W}"
echo
echo
echo
echo
sleep 0.33
clear
echo
echo
echo
echo -e "${W}BATOCERA.add-ons/${W}'$APPNAME'${W} INSTALLER ${W}"
echo
echo
echo
echo
sleep 0.33
clear
echo
echo
echo -e "${W}- - - - - - -"
echo -e "${W}BATOCERA.add-ons/${G}'$APPNAME'${W} INSTALLER ${W}"
echo -e "${W}- - - - - - -"
echo
echo
echo
sleep 0.33
clear
echo
echo -e "${W}- - - - - - -"
echo; #echo -e "${W}- - -"
echo -e "${W}BATOCERA.add-ons/${W}'$APPNAME'${W} INSTALLER ${W}"
echo; #echo -e "${W}- - -"
echo -e "${W}- - - - - - -"
echo
echo
sleep 0.33
clear
echo -e "${W}- - - - - - -"
echo; #echo -e "${W}- - -"
echo; #echo -e "${W}- - -"
echo -e "${W}BATOCERA.add-ons/${G}'$APPNAME'${W} INSTALLER ${W}"
echo; #echo -e "${W}- - -"
echo; #echo -e "${W}- - -"
echo -e "${W}- - - - - - -"
echo
sleep 0.33

clear
echo;
echo; #echo -e "${W}- - -"
echo; #echo -e "${W}- - -"
echo -e "${W}BATOCERA.add-ons/${G}'$APPNAME'${W} INSTALLER ${W}"
echo; #echo -e "${W}- - -"
echo; #echo -e "${W}- - -"
echo;
echo -e "${W}THIS WILL INSTALL '$APPNAME' FOR BATOCERA"
echo -e "${W}USING $ORIGIN"
echo
echo -e "${W}'$APPNAME' WILL BE AVAILABLE IN PORTS"
echo -e "${W}AND ALSO IN THE F1->APPLICATIONS MENU"
echo -e "${W}AND INSTALLED IN /USERDATA/system/add-ons/'$APPNAME'"
echo 
# --------------------------------------------------------------------
# -- check system before add-onsceeding
if [[ "$(uname -a | grep "x86_64")" != "" ]]; then 
:
else
echo
echo -e "${RED}ERROR: SYSTEM NOT SUPPORTED"
echo -e "${RED}YOU NEED BATOCERA X86_64${X}"
echo
sleep 5
exit 0
# quit
exit 0
fi
# --------------------------------------------------------------------
# -- temp for curl download
addons="/userdata/system/add-ons"
temp=$addons/'$APPNAME'/extra/downloads
rm -rf $temp 2>/dev/null 
mkdir -p $temp 2>/dev/null
# --------------------------------------------------------------------
echo 
echo -e "${G}DOWNLOADING${W}" 
cd $temp 
echo -e "${T}$APPLINK" | sed 's,https://,> ,g' | sed 's,http://,> ,g' 2>/dev/null 
curl --progress-bar --remote-name --location "$APPLINK"
SIZE=$(du -sh $temp | awk '{print $1}') 2>/dev/null 
echo -e "${T}$temp  ${T}$SIZE( )  ${G}OK${W}" | sed 's/( )//g' 
echo 
echo; #echo -e "${W}- - -" 
sleep 1.333 
# --------------------------------------------------------------------
echo -e "${G}INSTALLING${W}" 
# --------------------------------------------------------------------
depurl=https://github.com/uureel/batocera.add-ons/raw/main/.dep
#wget -q -O $addons/.dep/tar $depurl/tar
#wget -q -O $addons/.dep/libselinux.so.1 $depurl/libselinux.so.1
#chmod a+x $addons/.dep/tar; cp $depurl/libselinux.so.1 /lib/ 2>/dev/null 
cd $temp
tar -xf $temp/*.tar.xz
cd $(ls -d */)
chmod 777 ./clonehero 2>/dev/null
chmod 777 ./Clonehero 2>/dev/null
chmod 777 ./*.so 2>/dev/null
mv ./* $addons/'$APPNAME'/
chmod a+x $addons/'$APPNAME'/'$APPNAME' 2>/dev/null
cd $addons
rm -rf $temp
SIZE=$(du -sh $addons/'$APPNAME' | awk '{print $1}') 2>/dev/null
echo -e "${T}$addons/'$APPNAME'  ${T}$SIZE( )  ${G}OK${W}" | sed 's/( )//g'
# --------------------------------------------------------------------
# -- prepare launcher to solve dependencies on each run and avoid overlay, 
launcher="/userdata/system/add-ons/'$APPNAME'/Launcher"
rm -rf $launcher
echo '#!/bin/bash ' >> $launcher
echo '~/add-ons/.dep/mousemove.sh 2>/dev/null' >> $launcher
## -- GET APP SPECIFIC LAUNCHER COMMAND: 
######################################################################
echo "$(cat "/userdata/system/add-ons/'$APPNAME'/extra/command")" >> $launcher
######################################################################
dos2unix $launcher
chmod a+x $launcher
rm "/userdata/system/add-ons/'$APPNAME'/extra/command" 2>/dev/null
# --------------------------------------------------------------------
# get icon
extra=https://github.com/uureel/batocera.add-ons/raw/main/'$APPNAME'/extra
wget --tries=10 --no-check-certificate --no-cache --no-cookies -q -O $addons/'$APPNAME'/extra/icon.png $extra/icon.png
# --------------------------------------------------------------------
# -- prepare f1 - applications - app shortcut, 
shortcut="/userdata/system/add-ons/'$APPNAME'/extra/'$APPNAME'.desktop"
rm -rf $shortcut 2>/dev/null
echo "[Desktop Entry]" >> $shortcut
echo "Version=1.0" >> $shortcut
echo "Icon=/userdata/system/add-ons/'$APPNAME'/extra/icon.png" >> $shortcut
echo "Exec=/userdata/system/add-ons/'$APPNAME'/Launcher" >> $shortcut
echo "Terminal=false" >> $shortcut
echo "Type=Application" >> $shortcut
echo "Categories=Game;batocera.linux;" >> $shortcut
echo "Name='$APPNAME'" >> $shortcut
f1shortcut=/usr/share/applications/'$APPNAME'.desktop
dos2unix $shortcut 
chmod a+x $shortcut 
cp $shortcut $f1shortcut 2>/dev/null
# --------------------------------------------------------------------
# -- prepare Ports file, 
port="/userdata/roms/ports/CloneHero.sh" 
rm "$port"
echo '#!/bin/bash ' >> $port
echo 'killall -9 clonehero' >> $port
echo '/userdata/system/add-ons/'$APPNAME'/Launcher' >> $port
dos2unix "$port"
chmod a+x "$port" 
# --------------------------------------------------------------------
# -- prepare prelauncher to avoid overlay,
pre="/userdata/system/add-ons/'$APPNAME'/extra/startup"
rm -rf $pre 2>/dev/null
echo "#!/usr/bin/env bash" >> $pre
echo "cp /userdata/system/add-ons/'$APPNAME'/extra/'$APPNAME'.desktop /usr/share/applications/ 2>/dev/null" >> $pre
dos2unix $pre
chmod a+x $pre
# -- add prelauncher to custom.sh to run @ reboot
csh=/userdata/system/custom.sh
if [[ -e $csh ]] && [[ "$(cat $csh | grep "/userdata/system/add-ons/'$APPNAME'/extra/startup")" = "" ]]; then
echo -e "\n/userdata/system/add-ons/'$APPNAME'/extra/startup" >> $csh
fi
if [[ -e $csh ]] && [[ "$(cat $csh | grep "/userdata/system/add-ons/'$APPNAME'/extra/startup" | grep "#")" != "" ]]; then
echo -e "\n/userdata/system/add-ons/'$APPNAME'/extra/startup" >> $csh
fi
if [[ -e $csh ]]; then :; else
echo -e "\n/userdata/system/add-ons/'$APPNAME'/extra/startup" >> $csh
fi
dos2unix $csh
# -- done. 
sleep 1
echo -e "${G}> ${W}DONE${W}"
echo
sleep 1
echo; #echo -e "${W}- - -"
echo -e "${W}> '$APPNAME' INSTALLED ${G}OK${W}"
#echo -e "${W}- - -"
sleep 3
# reaload for ports file
curl http://127.0.0.1:1234/reloadgames
}
export -f batocera-add-ons-installer 2>/dev/null
# --------------------------------------------------------------------
# RUN:
# |
  batocera-add-ons-installer "'$APPNAME'" "'$APPNAME'" "'$APPNAME'" "$APPPATH" "$APPLINK" "$ORIGIN"
# --------------------------------------------------------------------
# BATOCERA.add-ons INSTALLER //
##########################
function autostart() {
  csh="/userdata/system/custom.sh"
  pcsh="/userdata/system/add-ons-custom.sh"
  addons="/userdata/system/add-ons"
  rm -f $pcsh
  temp_file=$(mktemp)
  find $addons -type f \( -path "*/extra/startup" -o -path "*/extras/startup.sh" \) > $temp_file
  echo "#!/bin/bash" > $pcsh
  sort $temp_file >> $pcsh
  rm $temp_file
  chmod a+x $pcsh
  temp_csh=$(mktemp)
  grep -vxFf $pcsh $csh > $temp_csh
  mapfile -t lines < $temp_csh
  if [[ "${lines[0]}" != "#!/bin/bash" ]]; then
    lines=( "#!/bin/bash" "${lines[@]}" )
  fi
  if ! grep -Fxq "$pcsh &" $temp_csh; then
    lines=( "${lines[0]}" "$pcsh &" "${lines[@]:1}" )
  fi
  printf "%s\n" "${lines[@]}" > $csh
  chmod a+x $csh
  rm $temp_csh
}
export -f autostart
autostart
exit 0
