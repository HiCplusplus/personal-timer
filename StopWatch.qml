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
    property variant lastLap: [0,0,0,0];//d,h,m,s

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
                    id:some2; //round time
                    width: some1.width;
                    height: laplabell.height;
                    anchors.left:some1.right;
                    color:cBG_Unknown;
                    Text
                    {
                        anchors.centerIn: some2;
                        text:roundtimee;
                        color:cTxt_button;
                    }
                }
                Rectangle
                {
                    id:some3; //overall
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
                setCenterButtonBG= "red";
            }
            else
            {
                setCenterButtonText= "Resume";
                setCenterButtonBG = cBG_button;
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
            setCenterButtonBG = cBG_button;
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
                var temp_value=0;
                var roundtimeValue=0;
                if(theDay<=0 && theHour<=0)
                     temp_value = txtNumbers.text.slice(6);
                else if(theDay<=0)
                    temp_value = txtNumbers.text.slice(3);
                else
                    temp_value = txtNumbers.text;


                if((lastLap[0] === lastLap[1]) && (lastLap[2] === lastLap[3]) && (lastLap[3]===0))
                {
                    lastLap[0] = theDay;
                    lastLap[1] = theHour;
                    lastLap[2] = theMinute;
                    lastLap[3] = theSecond;
                    roundtimeValue = temp_value;
                }
                else
                {
                    var rday,rhour,rminute,rsecond;

                    rday = theDay - lastLap[0];
                    rhour = theHour - lastLap[1];
                    rminute = theMinute - lastLap[2];
                    rsecond = theSecond - lastLap[3];
                    if(rday<0)
                        rday=0;
                    if(rhour<0)
                        rhour=0;
                    if(rminute<0)
                        rminute=0;
                    if(rsecond<0)
                        rsecond=0;

                    lastLap[0] = theDay;
                    lastLap[1] = theHour;
                    lastLap[2] = theMinute;
                    lastLap[3] = theSecond;
                    roundtimeValue = rday + ":" + rhour + ":" + rminute + ":" + rsecond;
                }

                    listModelData.append
                ({
                    timee: temp_value,
                    roundtimee: roundtimeValue,
                    lapId: ++theLapIndex
                });
            }
        }
    }



}
