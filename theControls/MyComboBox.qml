import QtQuick 2.0

Item
{
    property var values;
    width: parent.width/3;
    height:parent.height/1.5;
    z:10;
    anchors
    {
        centerIn:parent;
    }

    Rectangle
    {
        anchors.fill: parent;
        color: "red";
    }

}
