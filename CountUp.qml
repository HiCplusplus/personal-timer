import QtQuick
import "theScripts/updateCountUp.js" as UCUP

Item
{
    clip:true;
    property int theDay: 0;
    property int theHour: 0;
    property int theMinute: 0;
    property int theSecond: 0;


    property color colorButtons: "orange";
    property color colorButtonTexts: "white";


    property color colorButtonSecond: "pink";
    property color colorButtonSecondTexts: "black";

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

    Rectangle
    {
        id:baseButtons;
        width: root.width;
        height:root.height/10.5;
        anchors
        {
            bottom:root.bottom;
            bottomMargin:15;
        }

        Rectangle
        {
            id:btnAddNew;
            width:parent.height;
            height:parent.height;
            anchors
            {
                horizontalCenter:parent.horizontalCenter;
                verticalCenter:parent.verticalCenter;
            }
            color:colorButtons;
            radius:50;
            Text
            {
                font.pointSize: 30;
                text: "+";
                color:colorButtonTexts;
                font.bold: true;
                anchors
                {
                    centerIn:parent;
                }
            }

            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    console.log("add button clicked");
                }
            }
        }

        Rectangle
        {
            id:btnClearAll;
            width:parent.width/1.7;
            height:parent.height/1.7;
            anchors
            {
                verticalCenter:parent.verticalCenter;
                right:btnAddNew.left;
                rightMargin:20;
                left:baseButtons.left;
                leftMargin:-25;
            }
            color:colorButtonSecond;
            radius:50;
            Text
            {
                text:"Clear All";
                color:colorButtonSecondTexts;
                anchors
                {
                    horizontalCenter:parent.horizontalCenter;
                    verticalCenter:parent.verticalCenter;
                }
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    console.log("clearall button clicked");
                }
            }
        }


        Rectangle
        {
            id:btnIdk;
            width:parent.width/1.7;
            height:parent.height/1.7;
            anchors
            {
                verticalCenter:parent.verticalCenter;
                left:btnAddNew.right;
                leftMargin:20;
                right:baseButtons.right;
                rightMargin:-25;
            }
            color:colorButtonSecond
            radius:50;
            Text
            {
                text:"2 Button";
                color:colorButtonSecondTexts;
                anchors
                {
                    horizontalCenter:parent.horizontalCenter;
                    verticalCenter:parent.verticalCenter;
                }
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    console.log("idkAll button clicked");
                }
            }
        }


    }

}
