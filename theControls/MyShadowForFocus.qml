import QtQuick 2.0

Item
{
    signal rootclicked;
    property color setcolor: "#292928";
    anchors.fill: parent;
    visible: false;
    Rectangle
    {
        anchors.fill: parent;
        opacity: 0.5;
        color:setcolor;
        MouseArea
        {
            anchors.fill: parent;
            onClicked: rootclicked();
        }
    }
}
