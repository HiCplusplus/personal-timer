import QtQuick

Rectangle
{
    id:root;
    property color btnTextColor: "black";
    property string btnText: "Press Me";
    property color btnBGcolor: "gray";
    property int btnW: 100;
    property int btnH: 70;
    property int btnX: 0;
    property int btnY: 0;
    property int btnFontSize:12;
    property int btnRadius: 10;

    color:btnBGcolor;

    x:btnX;
    y:btnY;
    width:btnW;
    height:btnH;
    radius: btnRadius;
    Text
    {
        text: btnText;
        color:btnTextColor;
        anchors.centerIn: root;
        font.pixelSize: btnFontSize;
    }
}
