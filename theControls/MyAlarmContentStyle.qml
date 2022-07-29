import QtQuick

Item
{
    signal signalEditAlarm;

    property bool setStatusAm:true;//false means it's PM
    property bool setStatusSwitch:false;
    property string setClock: "00:00";
    property string setAlarmName: "Simple name";
    property string setWeekDays:"Mon";
    property color setColorBG: "white";
    property string setFontFamily: "Courier";
    property string setPathIconMoon: "../thePictures/icon-moon.png";
    property string setPathIconSun : "../thePictures/icon-sun.png";

    id:baseItemDelegate;
    anchors.fill: parent;
    Rectangle
    {
        id:baseAlarm;
        width: parent.width/1.10;
        height: 145;
        color: setColorBG;

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
            color:"#B178FF";
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
            font.family: setFontFamily;
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
            font.family: setFontFamily;
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
            color:"transparent";
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
            font.family: setFontFamily;
            anchors.bottom: textClock.bottom;
            anchors.leftMargin: 10;
            anchors.left: textClock.right;
            font.pointSize: 20;
        }






        Text
        {
            id:textLabel;
            text:setAlarmName;
            font.family: setFontFamily;
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
            color:"transparent";
            anchors
            {
                right:baseAlarm.right;
                verticalCenter:baseAlarm.verticalCenter;
                rightMargin:30;
            }

            MySwitch
            {
                setBorderWidth: 4;
                setStatusSwitch:setStatusSwitch;
                setColorActived: "#B178FF";
                setColorDeactived: "#EBDDFF";
                setStatusBorder:false;
                setSizeSwitchCircle: 2.80;
                onStatusSwitch:
                {
                    //HERE LEAVE NOTHING =-=================================================================================s
                }
            }
        }//end ofswitch


    }
}
