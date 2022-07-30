import QtQuick 2.0

Item
{
    signal signalDarkModeTest;
    property color cBGMenu: cUnknown;
    property color colorTextMenu: cTxt_title;
    property color colorMenuLines: "#3E386C";//color exception 4
    property string textTitleMenu: "Timer";
    anchors.fill: parent;

    //icons bar starts
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
                color:colorMenuLines;
                radius:10;
            }
            Rectangle
            {
                width: parent.width;
                height: 5;
                color:colorMenuLines;
                radius:10;
                anchors.centerIn: parent;
            }
            Rectangle
            {
                width: parent.width/2;
                anchors.right: parent.right;
                anchors.bottom: parent.bottom;
                height: 5;
                color:colorMenuLines;
                radius:10;
            }

        MouseArea
        {
            anchors.fill: parent;
            onClicked:
            {
                signalDarkModeTest();
            }
        }
        }
    }
    //icons bar ends
}
