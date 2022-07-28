import QtQuick 2.0

Item
{
    property color cBGMenu: "red";
    property color colorTextMenu: "black";
    property string textTitleMenu: "Timer1";
    anchors.fill: parent;

    //icons bar starts
    Rectangle
    {
        anchors.fill: parent;
        color:cBGMenu;
        Text
        {
            text: textTitleMenu;
            color:colorTextMenu;
            font.bold: true;
            anchors
            {
                left:parent.left;
                leftMargin:15;
                verticalCenter: parent.verticalCenter;
            }

        }
    }
    //icons bar ends
}
