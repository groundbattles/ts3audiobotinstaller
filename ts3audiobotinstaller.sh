echo "Downloade Sachen..."
echo "Fixe wahrscheinliche Fehler"
sudo lsof /var/lib/dpkg/lock
sudo lsof /var/lib/apt/lists/lock
sudo lsof /var/cache/apt/archives/locksudo rm /var/lib/apt/lists/lock
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
echo "Weiter mit der eigentlichen Installation"
sudo dpkg --configure -a
apt-get install gpg -y
wget wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
wget -q https://packages.microsoft.com/config/debian/9/prod.list
mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
chown root:root /etc/apt/sources.list.d/microsoft-prod.list
apt-get install apt-transport-https -y
apt-get update -y
apt-get install dotnet-sdk-2.2 -y
apt-get install libopus-dev ffmpeg -y
wget -O Bot.zip https://splamy.de/api/nightly/ts3ab/master/download
apt-get install sudo -y
sudo apt install apt-transport-https dirmngr gnupg ca-certificates -y
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/debian stable-buster main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt update -y
sudo apt install mono-devel -y
apt install unzip -y && unzip Bot.zip -d Bot && cd Bot

echo "Generiere Start Script"
echo "mono TS3AudioBot.exe">startserver.sh
echo "Fertig!"
rm /root/Bot.zip
sudo chmod +x /root/Bot/TS3AudioBot.exe

echo "Starte Server.."
sudo chmod +x /root/Bot/startserver.sh
cd /root/Bot
./startserver.sh

$SHELL
