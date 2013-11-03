#! /bin/bash

#API Key you get from Steam goes here
APIKey=""

echo "Copy and paste your Steam username URL identifier"
echo "Example: Mine is http://steamcommunity.com/id/legendarybibo"
echo "So I would just copy and paste 'legendarybibo' without the quotes"
echo ""
echo "Username:"
read Username
echo ""

if [[ -a "$Username?xml=1" ]]; then
rm -f "$Username?xml=1"
fi

if [[ -a "SteamUserInfo.xml" ]]; then
rm -f "SteamUserInfo.xml"
fi

wget --quiet "http://steamcommunity.com/id/$Username?xml=1"

IDnum=$(grep "steamID64" $Username\?xml\=1 | sed 's/<steamID64>//g' | sed 's/<\/steamID64>//g' | sed 's/   //g')

wget --quiet --output-document SteamUserInfo.xml "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=$APIKey&steamids=$IDnum&format=xml"

UserImg=$(grep "<avatar>" SteamUserInfo.xml | sed 's/<avatar>//g' | sed 's/<\/avatar>//g' | sed 's/                    //g')
UserName=$(grep "<personaname>" SteamUserInfo.xml | sed 's/<personaname>//g' | sed 's/<\/personaname>//g' | sed 's/			//g' | tr [a-z] [A-Z])
echo "Your display name is $UserName"

wget --quiet --output-document ProfilePic.jpg $UserImg

convert -size 800x85 xc:transparent -colorspace RGB canvas.png && convert -size 560x85 -colorspace RGB xc:transparent -font Helvetica -pointsize 56 -fill "#d2d2d2" -draw "text 1,50 '$UserName'" -trim +repage canvas.png && mv canvas.png UserName.png

Dim=$(file UserName.png | sed 's/UserName.png: PNG image data, //g' | sed 's/,.*//g')
Width=$(echo $Dim | sed 's/ .*//g')
Height=$(echo $Dim |sed 's/.*x //g')

echo "Profile name label width: $Width"
echo "Profile name label height: $Height"
HalfHeight=$(echo $(printf %.$2f $(echo "$Height/2" | bc)))

echo "+ image {
		top = 6%-$HalfHeight
		left = 100%-110-$Width
		width = $Width
		height = $Height
		file = "UserName.png"
}" >> theme.txt

echo "+ image {
		top = 6%-20
		left = 100%-90
		width = 40
		height = 40
		file = "avatarBorder.png"
}" >> theme.txt

echo "+ image {
		top = 6%-16
		left = 100%-86
		width = 32
		height = 32
		file = "ProfilePic.jpg"
}" >> theme.txt


