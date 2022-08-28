import QtQuick 2.15
import QtQuick.Controls 2.15

Item
{
    signal signalEditAlarm;
    signal switchStatusChanged;
    onSwitchStatusChanged:
    {
        updateStatusSwitchByUserHand = alarmStatus.setStatusSwitch;
    }

    property bool updateStatusSwitchByUserHand: false;
    property bool switchClicked:false;

    property bool setStatusAm:true;//false means it's PM
    property bool statusSwitch:false;
    property string setClock: "00:00";
    property string setAlarmName: "Simple name";
    property string setWeekDays:"Mon";
    property string setPathIconMoon: "../thePictures/icon-moon.png";
    property string setPathIconSun : "../thePictures/icon-sun.png";

    id:baseItemDelegate;
    anchors.fill: parent;
    Rectangle
    {
        id:baseAlarm;
        width: parent.width/1.10;
        height: 145;
        color: cBG_element;

        radius:15;
        anchors
        {
            horizontalCenter: baseItemDelegate.horizontalCenter;
            topMargin: 15;
            top:baseItemDelegate.top;
        }

        MouseArea
        {
            anchors.fill: parent;
            onClicked:
            {
                signalEditAlarm();
            }
        }

        Rectangle
        {
            width: 8;
            height: 8;
            color:cBG_button;
            radius: 50;
            anchors
            {
                top:parent.top;
                topMargin:16;
                left:parent.left;
                leftMargin:18;
            }
        }



        Text
        {
            text:setWeekDays;
            font.family: gFontFamily;
            color:cTxt_button;
            anchors
            {
                top:parent.top;
                topMargin:10;
                left:parent.left;
                leftMargin:30;
            }
        }




        Text
        {
            id:textClock;
            anchors
            {
                verticalCenter:parent.verticalCenter;
                left:parent.left;
                leftMargin: 30;
            }
            font.pointSize: 30;
            font.family: gFontFamily;
            color:cTxt_button;
            text:setClock;
        }



        Rectangle
        {
//
            /*
              iconsfrom https://icons8.com/icon/set/weather/stickers
              https://icons8.com/icon/VzDK0G3Z5kLF/night
              some design from https://dribbble.com/shots/10918806-Smart-Alarm-app/attachments/2552348?mode=media
              */
            width: 25;
            height: 25;
            color:cBG_Unknown;
            Image
            {
                anchors.fill: parent;
                source: setStatusAm>0? setPathIconSun : setPathIconMoon;
            }
            anchors
            {
                bottom:textAmPm.top;
                left:textAmPm.left;
                leftMargin:3;
            }
        }

        Text
        {
            id:textAmPm;
            text:setStatusAm>0 ? "AM" : "PM";
            font.family: gFontFamily;
            anchors.bottom: textClock.bottom;
            anchors.leftMargin: 10;
            anchors.left: textClock.right;
            color:cTxt_button;
            font.pointSize: 20;
        }






        Text
        {
            id:textLabel;
            text:setAlarmName;
            font.family: gFontFamily;
            color:cTxt_button;
            anchors
            {
                verticalCenter:parent.verticalCenter;
                left:parent.left;
                leftMargin: 30;
                top:textClock.bottom;
            }
        }

        Rectangle
        {
            width: 50;
            height: width/2;
            color:cBG_Unknown;
            anchors
            {
                right:baseAlarm.right;
                verticalCenter:baseAlarm.verticalCenter;
                rightMargin:30;
            }


            MySwitch
            {
                id:alarmStatus
                setBorderWidth: 4;
                setStatusSwitch:statusSwitch;
                setStatusBorder:false;
                setSizeSwitchCircle: 2.80;
                onSwitchSignalClicked:
                {
                        switchStatusChanged();
                }

            }
        }//end ofswitch


    }
}
