import QtQuick
import QtQuick.Controls

Item
{
    anchors.fill: parent;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:"gray";
    }

    Rectangle
    {
        id:baseButtons;
        width: root.width;
        height:root.height/12.5;
        color:"red";
        anchors
        {
            bottom:root.bottom;
        }
    }
}
