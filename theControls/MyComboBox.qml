import QtQuick 2.15
import QtQuick.Controls 2.15
//didnt use bug were here import QtGraphicalEffects 1.15
Item
{
    id:root;
    signal btnCancel;
    signal btnSave;
    property color setColor: "black";
    property var values: ["default","beffegioermhgmerep","ding","dang"];
    property int selectedIndex: 0;
//    property string setTitle:"Alarm sound:";
    width: parent.width/1.20;
    height:parent.height/2;
    z:3;
    anchors
    {
        centerIn:parent;
    }

    Rectangle
    {
        anchors.fill: parent;
        color: setColor;
        radius:20;
        MyCancelSaveButton
        {
            id:myButtons;
            onButtonCancelClicked:
            {
                btnCancel();
            }
            onButtonSaveClicked:
            {
                btnSave();
            }
        }

        Tumbler
        {
            id: comoboTumbler;
            anchors.centerIn: parent;
            anchors.top:myButtons.bottom;
            width: parent.width;
            model: values;
            currentIndex: selectedIndex;
            font.bold: true;
            font.pointSize: 20;
            onCurrentIndexChanged:
            {
                selectedIndex = comoboTumbler.currentIndex;
            }
        }
    }

}
