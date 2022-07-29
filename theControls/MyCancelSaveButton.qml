import QtQuick 2.0

Item
{
    width: parent.width/1.20;
    height:30;
    anchors.top: parent.top;
    anchors.topMargin: 14;
    anchors.horizontalCenter: parent.horizontalCenter;
    signal buttonCancelClicked;
    signal buttonSaveClicked;
    property string setTextButtonSave: "Save";
    property color setColorButtonSave:"#B178FF";
    property color setColorTextButtonSave:"white";

    property color setColorTextButtonCancel: "#312B63";
    property string setFontFamily: "Courier";
    property color setColorBG: "transparent";

    Rectangle
    {
        id:baseTopButtons;
        anchors.fill: parent;
        color:setColorBG;
        Rectangle
        {
            id:buttonSave;
            color:setColorButtonSave;
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
                text:setTextButtonSave;
                color:setColorTextButtonSave;
                anchors.centerIn: parent;
                font.family: setFontFamily;
                font.bold: true;
                font.pointSize: 12;
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    buttonSaveClicked();
                }
            }

        }

        Rectangle
        {
            id:buttonCancel;
            color:setColorBG;
            width: height;
            height:parent.height;
            anchors
            {
                top:parent.top;
                left:parent.left;
            }
            Text
            {
                text:"✕";
                color:setColorTextButtonCancel;
                anchors.centerIn: parent;
                font.family: setFontFamily;
                font.pointSize: 25;
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    buttonCancelClicked();
                }
            }
        }

    }//endofbaseButtons
}
