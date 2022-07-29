import QtQuick 2.0
import "../theControls"
import QtQuick.Shapes
Item
{
    anchors.fill: parent;
    signal buttonSave;
    signal buttonCancel;
    property string setFontFamily: "Courier";
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:"#F6F6F6";
    }
    MyCancelSaveButton
    {
        id:myCancelSaveButtons;
        onButtonSaveClicked: { buttonSave(); }
        onButtonCancelClicked: { buttonCancel(); }
    }


    Rectangle
    {
        id:alarmSetValue
        width:parent.width/1.20;
        height:250;
        color:"white";
        anchors.horizontalCenter: root.horizontalCenter;
        anchors.top:myCancelSaveButtons.bottom;
        anchors.topMargin: 45;
        radius:7;
    }
    Rectangle
    {
        id:tabAlarmSetValue;
        width:parent.width/3.50;
        height:25;
        color:"white";
        anchors
        {
            left:alarmSetValue.left;
            bottom:alarmSetValue.top;
            bottomMargin:-8;
        }
        radius:7;
        Text
        {
            text: "Alarm Set";
            font.family: setFontFamily;
            anchors.centerIn: parent;
            font.pointSize: 10;
        }
    }
    Rectangle
    {
        width:45;
        height:30;
        color:"white";
        rotation: 55;
        anchors
        {
            left:tabAlarmSetValue.right;
            leftMargin:-22;
            topMargin:8.80;
            top:tabAlarmSetValue.top;
//            right:alarmSetValue.top;
        }
        radius:7;
    }

    Rectangle
    {
        id:baseLabelRepeat;
        width: parent.width/1.20;
        height:15;
        color:"transparent";
        anchors.top:alarmSetValue.bottom;
        anchors.topMargin: 20;
        anchors.horizontalCenter: parent.horizontalCenter;
        Text
        {
            text:"Repeat";
            font.family: setFontFamily;
            anchors.verticalCenter: parent.verticalCenter;
        }
        Text
        {
            text:"Weekdays";
            font.family: setFontFamily;
            anchors.verticalCenter: parent.verticalCenter;
            anchors.right:parent.right;
        }
    }
    Rectangle
    {
        id:basePickWeekdays;
        width: parent.width/1.20;
        height:70;
        color:"red";
        anchors.top:baseLabelRepeat.bottom;
        anchors.topMargin: 10;
        anchors.horizontalCenter: parent.horizontalCenter;
    }



}
