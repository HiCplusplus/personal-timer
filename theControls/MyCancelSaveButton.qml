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

            Image
            {
                source: path_to_menuIcons + fileIcon_Cancel;
                anchors.fill: parent;
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
