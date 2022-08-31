import QtQuick 2.15
import "../theControls"
//import QtQuick.Shapes
import QtQuick.Controls 2.15
import "../theScripts/theDataBaseSystem/saveLoadAlarm.js" as SaveAlarm
Item
{

    id:mainItem;
    anchors.fill: parent;
    signal resetValues;
    onResetValues:
    {
        alarmName.text = "";
        alarmStatusSwitch.setStatusSwitch = false;
        hoursTumbler.currentIndex = 0;
        minutesTumbler.currentIndex = 0;
        amPmTumbler.currentIndex = 0;
        alarmSoundText.text = "default";
        soundVolume.setCurrentValue = 50;

        weekdaysPick.setAPicked = false; weekdaysPick.setEPicked = false;
        weekdaysPick.setBPicked = false; weekdaysPick.setFPicked = false;
        weekdaysPick.setCPicked = false; weekdaysPick.setGPicked = false;
        weekdaysPick.setDPicked = false;

        alarmName.enabled=true;
    }


    signal btnCancel;
    onBtnCancel:
    {
//        resetValues();
    }

    signal updateAlarmListModel;


    property int setMaxCharAlarmName:25;
    property variant setHourValues :
        ["01","02","03","04","05","06","07","08","09","10","11","12"];

    property variant setAmPmValues:  ["AM", "PM"];

    property variant setMinuteValues:
        ["00","01","02","03","04","05","06","07","08","09","10",
        "11","12","13","14","15","16","17","18","19","20",
        "21","22","23","24","25","26","27","28","29","30",
        "31","32","33","34","35","36","37","38","39","40",
        "41","42","43","44","45","46","47","48","49","50",
        "51","52","53","54","55","56","57","58","59"];


    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:cBG;//"#F6F6F6";

        MyCancelSaveButton
        {
            id:myCancelSaveButtons; //here used as SAVE
            onButtonSaveClicked:
            {
                if(alarmName.text !== "")
                {
                    SaveAlarm.set(alarmName.text,
                                  alarmStatusSwitch.setStatusSwitch,
                                  setHourValues[hoursTumbler.currentIndex],
                                  setMinuteValues[minutesTumbler.currentIndex],
                                  amPmTumbler.currentIndex,
                                  alarmSoundText.text,
                                  soundVolume.outPutVolume,
                                  (weekdaysPick.setAPicked ? 1 : 0) +","+(weekdaysPick.setBPicked ? 1 : 0)+","+(weekdaysPick.setCPicked ? 1 : 0)+","+(weekdaysPick.setDPicked ? 1 : 0)+","+(weekdaysPick.setEPicked ? 1 : 0) +","+(weekdaysPick.setFPicked ? 1 : 0) +","+(weekdaysPick.setGPicked ? 1 : 0));
                    alarmName.enabled=false;
                    updateAlarmListModel();
                    btnCancel();
                }




            }
            onButtonCancelClicked: { btnCancel(); }
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
            }
            radius:7;
        }


        Rectangle
        {
            z:2;
            id:alarmSetValue
            width:parent.width/1.20;
            height:250;
            anchors.horizontalCenter: root.horizontalCenter;
            anchors.top:myCancelSaveButtons.bottom;
            anchors.topMargin: 45;
            radius:7;
            color:cBG_element;

            Rectangle
            {
                id:baseTumblers;
                anchors.fill: parent;
                anchors.topMargin: 25;
                color:cBG_element;


                Row
                {
                    id: row;
                    anchors.fill: parent;
                    anchors.topMargin: 5;


                    Tumbler
                    {
                        id: hoursTumbler;
                        width: parent.width/3;
                        model: setHourValues
                        currentIndex: 1;
                        font.bold: true;
                        font.pointSize: 30;
                        visibleItemCount: 4;
                    }
                    Text
                    {
                        text: ":";
                        anchors.top:parent.top;
                        anchors.topMargin: parent.height/3
                        font.bold: true;
                        font.pointSize: 30;
                        color:cTxt_button;//themeDarkMode? "#353436": "black";
                    }
                    Tumbler
                    {
                        id: minutesTumbler;
                        width: parent.width/3;
                        model: setMinuteValues;
                        font.bold: true;
                        font.pointSize: 30;
                        visibleItemCount: 4;

                    }

                    Tumbler
                    {
                        id: amPmTumbler;
                        width: parent.width/3;
                        model: setAmPmValues;
                        font.bold: true;
                        font.pointSize: 30;
                    }
                }


            }


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
                id:weekdaysPick;
                textAPick: "Monday";
                textBPick: "Tuesday";
                textCPick: "Wednesday";
                textDPick: "Thursday";
                textEPick: "Friday";
                textFPick: "Saturday";
                textGPick: "Sunday";
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
                id:alarmSoundText;
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
                    myCombobox.visible=true;
                    myShadow.visible=true;
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
                    id:soundVolume;
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
                text:"Alarm active";
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
                    id:alarmStatusSwitch;
                    setBorderWidth: 4;
                    setStatusSwitch:false;
                    setStatusBorder:false;
                    setSizeSwitchCircle: 2.80;
                }
            }
        }//end of base alarm mit vibration


        MyShadowForFocus
        {
            id:myShadow;
            z:5;
            onRootclicked:
            {
                myCombobox.btnCancel();
            }
        }
        MyComboBox //#BUG
        {
            id:myCombobox;
            visible: false;
            z:6;
            setColor: cBG_element;
            onBtnCancel:
            {
                myCombobox.visible=false;
                myShadow.visible=false;
            }
            onBtnSave:
            {
                alarmSoundText.text = values[selectedIndex];
                btnCancel();
            }
        }
    }//end of root

}
