echo "Downloade Sachen..."
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
apt install unzip -y && unzip Bot.zip -d Bot && cd Bot

echo "Generiere Start Script"
echo "bash TS3AudioBot.exe">startserver.sh
echo "Fertig!"
rm /root/Bot.zip
sudo chmod +x /root/Bot/TS3AudioBot.exe

echo "Starte Server.."
sudo chmod +x /root/Bot/startserver.sh
cd /root/Bot
./startserver.sh

$SHELL
