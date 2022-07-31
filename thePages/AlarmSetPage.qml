import QtQuick 2.15
import "../theControls"
//import QtQuick.Shapes
import QtQuick.Controls 2.15

Item
{
    anchors.fill: parent;
    signal buttonSave;
    signal buttonCancel;
    signal buttonAlarmSound;
    property int setMaxCharAlarmName:25;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:cBG;//"#F6F6F6";
    }
    MyCancelSaveButton//1380
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
        color:cBG_element;
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
        color:cBG_element;
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
            font.family: gFontFamily;
            anchors.centerIn: parent;
            font.pointSize: 10;
            color:cTxt_button;
        }
    }
    Rectangle
    {
        width:45;
        height:30;
        color:cBG_element;
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
        color:cBG_Unknown;
        anchors.top:alarmSetValue.bottom;
        anchors.topMargin: 20;
        anchors.horizontalCenter: parent.horizontalCenter;
        Text
        {
            text:"Repeat";
            font.family: gFontFamily;
            anchors.verticalCenter: parent.verticalCenter;
            color:cTxt_button;
        }
        Text
        {
            text:"Weekdays";
            font.family: gFontFamily;
            anchors.verticalCenter: parent.verticalCenter;
            anchors.right:parent.right;
            color:cTxt_button;
        }
    }
    Rectangle
    {
        id:basePickWeekdays;
        width: parent.width/1.20;
        height:70;
        color:cBG_Unknown;
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
        color:cBG_Unknown;
        anchors.top:basePickWeekdays.bottom;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.topMargin: 15;
        clip:true;
        Text
        {
            id:labelAlarmName;
            text:"Alarm name";
            font.family: gFontFamily;
            font.bold: true;
            color:cTxt_button;
        }
        TextEdit
        {
            id:alarmName;
            width: parent.width;
            height:parent.height/1.5;
            anchors.top:labelAlarmName.bottom;
            font.family: gFontFamily;
            font.pointSize: 12.50;

            color:cTxt_button;
            enabled: true;

            Text
            {
                text: "Enter alarm name here...";
                color: "#aaa";
                visible: !alarmName.text;
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
        color:cBG_Unknown;
        anchors
        {
            horizontalCenter:parent.horizontalCenter;
            top:baseAlarmName.bottom;
            topMargin:20;
        }
        Text
        {
            text:"Alarm sound";
            font.family: gFontFamily;
            anchors.left: parent.left;
            font.bold: true;
            color:cTxt_button;
        }
        Text
        {
            text:"default";
            font.family: gFontFamily;
            anchors.right: parent.right;
            //color:"#787499";
            color:cTxt_button;
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
        color:cBG_Unknown;
        anchors
        {
            top:baseAlarmSound.bottom;
            horizontalCenter:parent.horizontalCenter;
            topMargin:15;
        }
        Text
        {
            text:"Alarm volume";
            font.family: gFontFamily;
            anchors.left: parent.left;
            font.bold: true;
            color:cTxt_button;
        }
        Rectangle
        {
            width: parent.width;
            height:20;
            anchors.bottom: parent.bottom;
            color:cBG_Unknown;
            MySlider
            {
                onOutPutVolumeChanged:
                {

                }
            }
        }
    }//end of basealarmvolume


    Rectangle
    {
        id:baseAlarmWithVibration;
        width: parent.width/1.20;
        height:35;
        color:cBG_Unknown;
        anchors
        {
            top:baseAlarmVolume.bottom;
            horizontalCenter:parent.horizontalCenter;
            topMargin:15;
        }
        Text
        {
            text:"Alarm with vibration";
            font.family: gFontFamily;
            anchors.left: parent.left;
            font.bold: true;
            color:cTxt_button;
        }

        Rectangle
        {
            width: 50;
            height: width/2;
            color:cBG_Unknown;
            anchors
            {
                right:baseAlarmWithVibration.right;
                rightMargin:10;
            }

            MySwitch
            {
                setBorderWidth: 4;
                setStatusSwitch:false;
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
