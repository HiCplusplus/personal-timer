import QtQuick
import "theScripts/updateCountUp.js" as UCUP

Item
{
    clip:true;
    property int theDay: 0;
    property int theHour: 0;
    property int theMinute: 0;
    property int theSecond: 0;
    anchors.fill: parent;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
    }

    Timer
    {
        id:theCountUpTimer;
        interval: 1000; running: false; repeat: true
        onTriggered:
        {
            var allObject = JSON.parse(UCUP.updateCountUp(theDay,theHour,theMinute,theSecond));
            theDay = allObject.d;
            theHour = allObject.h;
            theMinute = allObject.m;
            theSecond = allObject.s;

            if(theMinute<10 || theHour<10 || theSecond<10 || theDay<10)
            {
                if(theDay<10)
                    txtNumbers.text = "0"+theDay;
                else
                    txtNumbers.text = theDay;

                if(theHour<10)
                    txtNumbers.text += ":0"+theHour;
                else
                    txtNumbers.text += ":"+theHour;


                if(theMinute<10)
                    txtNumbers.text += ":0" + theMinute;
                else
                    txtNumbers.text += ":"+theMinute;


                if(theSecond<10)
                    txtNumbers.text += ":0" + theSecond;
                else
                    txtNumbers.text += ":" + theSecond;
            }
            else
                txtNumbers.text = theDay+ ":" + theHour + ":" + theMinute + ":" +theSecond;

        }
    }

    Rectangle
    {
        id:baseCountUp;
        width: root.width/1.2;
        height:root.height/5.5;
        anchors.verticalCenter: root.verticalCenter;
        anchors.horizontalCenter: root.horizontalCenter;

        color:"white";
        Text
        {
            id:txtNumbers;
            text:"00:00:00:00";
            font.pointSize: 40;
            anchors
            {
                verticalCenter:parent.verticalCenter;
                horizontalCenter:parent.horizontalCenter;

            }
        }

        Text
        {
            text:" Day   Hour   Min    Sec";
            font.pointSize: 20;
            anchors
            {
                verticalCenter:parent.verticalCenter;
                horizontalCenter:parent.horizontalCenter;
                left:txtNumbers.left;
                top:txtNumbers.bottom;
            }
        }

    }

    Rectangle
    {
        id:baseButtonStartStop;
        width: root.width/1.25;
        height:root.height/15;
//        anchors.verticalCenter: root.verticalCenter;
        anchors.horizontalCenter: root.horizontalCenter;
        anchors
        {
            top:baseCountUp.bottom;
            topMargin:50;
//            bottom:root.bottom;
//            bottomMargin: root.height/5;
        }


        Rectangle
        {
            id:btnStart;
            width:parent.width/2.2;
            height:parent.height;
            color:"pink";
            radius:20;
            anchors.left: parent.left;
            anchors.rightMargin: 10;
            Text
            {
                text:"Start";
                font.pointSize: 20;
                font.bold: true;
                anchors
                {
                    verticalCenter:parent.verticalCenter;
                    horizontalCenter:parent.horizontalCenter;
                }
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    theCountUpTimer.start();
                }
            }
        }
        Rectangle
        {
            id:btnStop;
            width:parent.width/2.2;
            height:parent.height;
            color:"pink";
            radius:20;
            anchors.right: parent.right;
            Text
            {
                text:"Stop";
                font.pointSize: 20;
                font.bold: true;
                anchors
                {
                    verticalCenter:parent.verticalCenter;
                    horizontalCenter:parent.horizontalCenter;
                }
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    theCountUpTimer.stop();
                }
            }
        }
    }

}
