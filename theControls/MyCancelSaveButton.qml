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
//    property color setColorButtonSave:"#B178FF";
//    property color setColorTextButtonSave:"white";

//    property color setColorTextButtonCancel: "#312B63";
//    property string setFontFamily: "Courier";
//    property color setColorBG: "transparent";

    Rectangle
    {
        id:baseTopButtons;
        anchors.fill: parent;
        color:cBG_Unknown;
        Rectangle
        {
            id:buttonSave;
            color:cBG_button;
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
                color:cUnknown;
                anchors.centerIn: parent;
                font.family: gFontFamily;
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
            color:cBG_Unknown;
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
                color:cBG_button;//color execption 1
                anchors.centerIn: parent;
                font.family: gFontFamily;
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
