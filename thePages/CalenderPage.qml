import QtQuick 2.15

Item
{
    anchors.fill: parent;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:cBG;
    }

    Rectangle
    {
        id:coloredRectangle;
        width: parent.width;
        height:parent.height/3;
        color:cBG_button;
    }

    Rectangle
    {

    }
}
