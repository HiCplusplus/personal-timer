import QtQuick 2.0
import "../theControls"
//import QtQuick.Shapes
import QtQuick.Controls

Item
{
    anchors.fill: parent;
    signal buttonSave;
    signal buttonCancel;
    signal buttonAlarmSound;
    property string setFontFamily: "Courier";
    property int setMaxCharAlarmName:25;
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
        color:"transparent";
        anchors.top:baseLabelRepeat.bottom;
        anchors.topMargin: 10;
        anchors.horizontalCenter: parent.horizontalCenter;
        clip:true;
        MyWeekDayPicker
        {
            onAPick: {}
            onBPick: {}
            onCPick: {}
            onDPick: {}
            onEPick: {}
            onFPick: {}
            onGPick: {}
        }
    }
    Rectangle
    {
        id:baseAlarmName;
        width: parent.width/1.20;
        height:40;
        color:"transparent";
        anchors.top:basePickWeekdays.bottom;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.topMargin: 15;
        clip:true;
        Text
        {
            id:labelAlarmName;
            text:"Alarm name";
            font.family: setFontFamily;
            font.bold: true;
        }
        TextEdit
        {
            id:alarmName;
            width: parent.width;
            height:parent.height/1.5;
            anchors.top:labelAlarmName.bottom;
            font.family: setFontFamily;
            font.pointSize: 12.50;

            color: "black";
            enabled: true;

            Text
            {
                text: "Enter alarm name here...";
                color: "#aaa";
                visible: !alarmName.text
            }
            onTextChanged:
            {
                if(alarmName.length >= setMaxCharAlarmName)
                {
                    alarmName.text = alarmName.text.slice(0,setMaxCharAlarmName);
                    alarmName.cursorPosition=setMaxCharAlarmName;
                }
            }
        }

    }

    Rectangle
    {
        id:baseAlarmSound;
        width: parent.width/1.20;
        height:30;
        color:"transparent";
        anchors
        {
            horizontalCenter:parent.horizontalCenter;
            top:baseAlarmName.bottom;
            topMargin:20;
        }
        Text
        {
            text:"Alarm sound";
            font.family: setFontFamily;
            anchors.left: parent.left;
            font.bold: true;
        }
        Text
        {
            text:"default";
            font.family: setFontFamily;
            anchors.right: parent.right;
            color:"#787499";
        }
        MouseArea
        {
            anchors.fill: parent;
            onClicked:
            {
                buttonAlarmSound();
            }
        }


    }//endof base alarmsound


    Rectangle
    {
        id:baseAlarmVolume;
        width: parent.width/1.20;
        height:40;
        color:"transparent";
        anchors
        {
            top:baseAlarmSound.bottom;
            horizontalCenter:parent.horizontalCenter;
            topMargin:15;
        }
        Text
        {
            text:"Alarm volume";
            font.family: setFontFamily;
            anchors.left: parent.left;
            font.bold: true;
        }
        Rectangle
        {
            width: parent.width;
            height:20;
            anchors.bottom: parent.bottom;
            MySlider
            {

            }
        }
    }//end of basealarmvolume


    Rectangle
    {
        id:baseAlarmWithVibration;
        width: parent.width/1.20;
        height:35;
        color:"transparent";
        anchors
        {
            top:baseAlarmVolume.bottom;
            horizontalCenter:parent.horizontalCenter;
            topMargin:15;
        }
        Text
        {
            text:"Alarm with vibration";
            font.family: setFontFamily;
            anchors.left: parent.left;
            font.bold: true;
        }

        Rectangle
        {
            width: 50;
            height: width/2;
            color:"transparent";
            anchors
            {
                right:baseAlarmWithVibration.right;
                rightMargin:10;
            }

            MySwitch
            {
                setBorderWidth: 4;
                setStatusSwitch:false;
                setColorActived: "#B178FF";
                setColorDeactived: "#EBDDFF";
                setStatusBorder:false;
                setSizeSwitchCircle: 2.80;
                onStatusSwitch:
                {
                    //HERE LEAVE NOTHING =-=================================================================================s
                }
            }
        }
    }//end of base alarm mit vibration




}
