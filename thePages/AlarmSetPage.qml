import QtQuick 2.0

Item
{
    anchors.fill: parent;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:"transparent";
    }
    Rectangle
    {
        id:baseTopButtons;
        width: parent.width/1.10;
        height:30;
        anchors.top: root.top;
        anchors.topMargin: 14;
        anchors.horizontalCenter: parent.horizontalCenter;

        Rectangle
        {
            id:buttonSave;
            color:"#B178FF";
            width: 70;
            height:30;
            radius:7.50;
            anchors
            {
                top:parent.top;
                right:parent.right;
            }
            Text
            {
                text:"Save";
                color:"white";
                anchors.centerIn: parent;
                font.family: "Courier";
                font.bold: true;
            }

        }

        Rectangle
        {
            id:buttonCancel;
            color:"transparent";
            width: 45;
            height:45;
            anchors
            {
                top:parent.top;
                left:parent.left;
            }
            Text
            {
                text:"✖";
                color:"#312B63";
                anchors.centerIn: parent;
                font.family: "Courier";
                font.pointSize: 25;
            }
        }

    }

}
