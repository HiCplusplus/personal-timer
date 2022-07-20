import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia
import QtQuick.Controls
import "theControls"


Rectangle
{
    property int fontSize: 25;
    property color cTitle: "black";
    property color cLine: "black";
    property color cBG: "white";

    clip:true;
    id:root;
    anchors.fill: parent;
    color:cBG;
    Label
    {
        id:labelSettings;
        text: "Settings";
        font.pixelSize: fontSize;
        font.bold: true;
        color:cTitle;
        anchors.horizontalCenter: root.horizontalCenter;
        anchors.top: root.top;
        anchors.topMargin: root.height/100;
    }

    Rectangle
    {
        id:lineSettings;
        color:cLine;
        width:root.width;
        height:root.height/500;
        anchors.top: labelSettings.bottom;
        anchors.topMargin: 20;
        anchors.left: root.left;
        anchors.right: root.right;
        anchors.leftMargin: root.width/10;
        anchors.rightMargin: root.width/10;

    }



    MyButton
    {
        id:myButton;
        btnTextColor: cTitle;
        btnText: "save";
        btnBGcolor: "yellow";
        btnFontSize: 25;
        btnW:90;
        btnH:35;
        btnRadius: 50;

        anchors
        {
            bottom: root.bottom;
            left: root.left;
            right: root.right;
            leftMargin: root.width/7;
            rightMargin: root.width/7;
            bottomMargin: 50;
        }

        MouseArea
        {
            anchors.fill: parent;
            onPressed:
            {
                console.log("pressed");
            }
        }
    }


}
