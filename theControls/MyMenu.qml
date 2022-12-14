import QtQuick 2.15
import "../theScripts/theDataBaseSystem/saveLoadSettings.js" as SaveSettings


Item
{
    signal signalDarkMode;
    signal signalOpenMenu;

    property color cBGMenu: cUnknown;
    property color colorTextMenu: cTxt_title;
//    property color colorMenuLines: "#3E386C";//color exception 4
    property string textTitleMenu: "Timer";
    anchors.fill: parent;

    onSignalDarkMode:
    {

        if(!themeDarkMode)
        {
            themeDarkMode = true;
            cTxt_normal = "black";
            cTxt_title = "#3E386C";
            cBG = "#23272A";//darked
            cBG_element= "#565578";//darked
            cTxt_button = "white";//darked
            cBG_button = "#7289DA";//darked
            cBG_button_activated= "#7289DA";//darked
            cBG_button_deactivated= "#313447";//"gray";//darked
            gFontFamily="Courier";//ok
            cBG_Unknown= "transparent";
            cUnknown = "white";//o99AAB5k
            path_to_menuIcons= directory_Icons + direcotry_WhiteIcons;
            SaveSettings.set("darkmode", 1);
        }
        else
        {
            themeDarkMode = false;
            cTxt_normal = "black";
            cTxt_title = "#3E386C";
            cBG = "#dedede";
            cBG_element= "white";
            cTxt_button = "black";
            cBG_button = "#B178FF";
            cBG_button_activated= "#B178FF";
            cBG_button_deactivated= "#dcd3e8";
            gFontFamily="Courier";
            cBG_Unknown= "transparent";
            cUnknown= "white";
            themeDarkMode = false;
            path_to_menuIcons= directory_Icons + direcotry_BlackIcons;
            SaveSettings.set("darkmode", 0);

        }


    }


    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:cBGMenu;
        Text
        {
            text: textTitleMenu;
            color:colorTextMenu;
            font.bold: true;
            font.pointSize: 20;
            font.family: gFontFamily;
            anchors
            {
                left:parent.left;
                leftMargin:15;
                verticalCenter: parent.verticalCenter;
            }

        }

        //menu button shapes start
        Rectangle
        {
            id:baseOpenMenuIcon;
            width:25;
            height:25;
            color:cBG_Unknown;
            anchors
            {
                right:parent.right;
                rightMargin:15;
                verticalCenter:parent.verticalCenter;
            }
            Rectangle
            {
                width: parent.width/2;
                anchors.left: parent.left;
                height: 5;
                color:cTxt_button;
                radius:10;
            }
            Rectangle
            {
                width: parent.width;
                height: 5;
                color:cTxt_button;
                radius:10;
                anchors.centerIn: parent;
            }
            Rectangle
            {
                width: parent.width/2;
                anchors.right: parent.right;
                anchors.bottom: parent.bottom;
                height: 5;
                color:cTxt_button;
                radius:10;
            }

        MouseArea
        {
            anchors.fill: parent;
            onClicked:
            {
                signalOpenMenu();
            }
        }
        }//menu button shapes end

        Rectangle
        {
            id:baseDarkLightModeButton;
            width:35;
            height:35;
            color:cBG_Unknown;
            anchors
            {
                right:baseOpenMenuIcon.left;
                rightMargin:15;
                verticalCenter:parent.verticalCenter;
            }

            Image
            {
                id:iconDarkLight;
                source: (!themeDarkMode)? path_to_menuIcons+fileIcon_DarkMode : path_to_menuIcons+fileIcon_LightMode;
                anchors
                {
                    centerIn:parent;
                    fill: parent;
                }
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    signalDarkMode();
                }
            }

        }
    }
    //icons bar ends
}
