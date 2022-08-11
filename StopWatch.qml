import QtQuick 2.15
import "theScripts/updateCountUp.js" as UCUP
import "theControls"
import QtQuick.Controls 2.15


Item
{
    clip:true;
    property int theDay: 0;
    property int theHour: 0;
    property int theMinute: 0;
    property int theSecond: 0;
    property int theLapIndex:0;

//    property color colorButtons: "orange";
//    property color colorButtonTexts: "white";

//    property color setColorBG: "white";
//    property color colorButtonSecond: "pink";
//    property color  colorButtonSecondTexts: "black";

    anchors.fill: parent;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:cBG;
    }

    Timer
    {
        id:theCountUpTimer;
        interval: 1000; running: false; repeat: true;
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
        color:cBG_Unknown;
        Text
        {
            id:txtNumbers;
            text:"00:00:00:00";
            font.pointSize: 40;
            color:cTxt_button;
            anchors
            {
                verticalCenter:parent.verticalCenter;
                horizontalCenter:parent.horizontalCenter;
            }
        }

        Text
        {
            text:" Day   Hour   Min    Sec";
            color:cTxt_button;
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

    Rectangle
    {
        id:baseLapList;
        width: baseCountUp.width;
        height:parent.height/2.1;
        visible: false;
        color:cBG_Unknown;
        anchors
        {
            top:baseCountUp.bottom;
            topMargin:baseCountUp.height/2.7;
            horizontalCenter:parent.horizontalCenter;
        }

        Rectangle
        {
            id:titleLapList;
            width: parent.width;
            height:50;
            color:cBG_Unknown;
            Rectangle
            {
                id:laplabell;
                width: parent.width/3;
                height: parent.height;
                anchors.left: parent.left;
                color:cBG_Unknown;
                Text
                {
                    text:"Lap No.";
                    font.pointSize: 12;
                    color:cTxt_button;
                    anchors.centerIn:parent;
                }
            }
            Rectangle
            {
                id:laptimeslabel;
                width: parent.width/3;
                height: parent.height;
                anchors.horizontalCenter: parent.horizontalCenter;
                color:cBG_Unknown;
                Text
                {
                    text:"Lap times";
                    font.pointSize: 12;
                    color:cTxt_button;
                    anchors.centerIn:parent;
                }
            }
            Rectangle
            {
                id:overalltimelabel;
                width: parent.width/3;
                height: parent.height;
                anchors.right: parent.right;
                color:cBG_Unknown;
                Text
                {
                    text:"Overall time";
                    font.pointSize: 12;
                    color:cTxt_button;
                    anchors.centerIn:parent;
                }
            }

        }







        ListView
        {
            id:listviewLaps
            anchors
            {
                top:titleLapList.bottom;
                left:parent.left;
                right:parent.right;
                bottom:parent.bottom;
            }
            clip:true;
            model: ListModel
            {
                id:listModelData;
            }
            delegate: Item
            {
                id:something
                width: 100;
                height: 50;
                Rectangle
                {
                    id:some1;
                    width: laplabell.width;
                    height: laplabell.height;
//                    anchors.left:laplabell.left;
                    color:cBG_Unknown;
                    Text
                    {
                        anchors.centerIn: some1;
                        text:lapId;
                        color:cTxt_button;
                    }
                }
                Rectangle
                {
                    id:some2;
                    width: some1.width;
                    height: laplabell.height;
                    anchors.left:some1.right;
                    color:cBG_Unknown;
                    Text
                    {
                        anchors.centerIn: some2;
                        text:timee;
                        color:cTxt_button;
                    }
                }
                Rectangle
                {
                    id:some3;
                    width: some2.width;
                    height: laplabell.height;
                    anchors.left:some2.right;
                    color:cBG_Unknown;
                    Text
                    {
                        anchors.centerIn: some3;
                        text:timee;
                        color:cTxt_button;
                    }
                }


            }

//            Component.onCompleted:
//            {
//                listModelData.append({
//                    timee: "1010",
//                    lapId: 4
//                });
//            }
        }

    }




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
            baseCountUp.anchors.topMargin= parent.height/2.7;
            if(baseLapList.visible)
                baseLapList.visible=false;
            while(theLapIndex>0)
            {
                theLapIndex--;
                listModelData.remove(theLapIndex);
            }


        }
        onRightButtonPressed:
        {
            if(idMyThreeBottomButtons.setCenterButtonText != "Start") //&& idMyThreeBottomButtons.setCenterButtonText != "Resume"
            {
                baseCountUp.anchors.topMargin = parent.height/8;
                baseLapList.visible=true;
                var temp_value;
                if(theDay<=0 && theHour<=0)
                     temp_value = txtNumbers.text.slice(6);
                else if(theDay<=0)
                    temp_value = txtNumbers.text.slice(3);
                else
                    temp_value = txtNumbers.text;


                listModelData.append
                ({
                    timee: temp_value,
                    lapId: ++theLapIndex
                }); //error QML Rectangle: Cannot anchor to an item that isn't a parent or sibling.
            }
        }
    }



}
