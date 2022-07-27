import QtQuick
import "theScripts/updateCountUp.js" as UCUP
import "theControls"
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
    property color  colorButtonSecondTexts: "black";

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
//        anchors.verticalCenter: root.verticalCenter;
        anchors.top: root.top;
        anchors.topMargin: parent.height/2.7;
        anchors.horizontalCenter: root.horizontalCenter;

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

    }//end of baseCountup







    MyThreeBottomButtons
    {
        id:idMyThreeBottomButtons;
        width: root.width;
        height:root.height/10.5;
        setCenterButtonText: "Start";
        setLeftButtonText: "Reset";
        setRightButtonText: "Lap";
        anchors
        {
            bottom:root.bottom;
            bottomMargin:15;
        }
        onCenterButtonPressed:
        {
            if(!theCountUpTimer.running && (setCenterButtonText == "Start"||setCenterButtonText=="Resume"))
            {
                theCountUpTimer.start();
                setCenterButtonText= "Pause";
            }
            else
            {
                setCenterButtonText= "Resume";
                theCountUpTimer.stop();
            }
        }
        onLeftButtonPressed:
        {
            if(theCountUpTimer.running)
                theCountUpTimer.stop();

            setCenterButtonText= "Start";
            theDay = theHour = theMinute = theSecond = 0;
            txtNumbers.text = "00:00:00:00";
            baseCountUp.anchors.topMargin= parent.height/5.5;
        }
        onRightButtonPressed:
        {
             baseCountUp.anchors.topMargin= parent.height/8;
        }
    }



}
