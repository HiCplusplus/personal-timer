import QtQuick 2.15
import QtQuick.Controls 2.15
//import "../../thePages"
import "../../theControls"


Item
{
    anchors.fill: parent;
    property variant roundValues: []; //hour , minute ,second
    property variant breakValues: []; //hour , minute ,second
    property variant repeatValue: []; //only index 0 used

    signal startSportTimer;

    onStartSportTimer:
    {
        //repeat
        repeatValue[0] = repeatTumbler.selectHour;

        roundValues[0] = roundsTumbler.selectHour;
        roundValues[1] = roundsTumbler.selectMinute;
        roundValues[2] = roundsTumbler.selectSecond;

        breakValues[0] = breaksTumbler.selectHour;
        breakValues[1] = breaksTumbler.selectMinute;
        breakValues[2] = breaksTumbler.selectSecond;
    }

    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color: cBG;




    ScrollView
    {
        anchors.fill: parent
        clip: true
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn;
        Item
        {
            id:rootItem;
            width: parent.width;
            height: 222*5+70;
            implicitHeight: height;

            Rectangle
            {
                id:setupRepeat;
                clip:true;
                width: parent.width/1.50;
                height: 200;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top:rootItem.top;
                anchors.topMargin: 70;
                color:cBG_Unknown;
                MyThreepleTumbler
                {
                    //when its single just get output from selectHour
                    //when its single indexes are ++ because we dont have index 0 with value 00
                    id:repeatTumbler;
                    setTextTitle: "Repeat";
                    setSingleTumbler: true;

                }
            }


            Rectangle
            {
                id:setupSet;
                clip:true;
                width: parent.width/1.50;
                height: 200;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top:setupRepeat.bottom;
                anchors.topMargin: 30;
                color:cBG_Unknown;
                MyThreepleTumbler
                {
                    id:roundsTumbler;
                    setTextTitle: "SET:";
                }
            }

            Rectangle
            {
                id:setupBreak;
                clip:true;
                width: parent.width/1.50;
                height: 200;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top:setupSet.bottom;
                anchors.topMargin: 30;
                color:cBG_Unknown;
                MyThreepleTumbler
                {
                    id:breaksTumbler;
                    setTextTitle: "Break:";

                }
            }



            Rectangle{
                id: rect3
                width: parent.width
                height: 500
                color: "#00ffff"
                anchors.top: setupBreak.bottom
            }
        }//end of item

    }//end of scroll view





    MyThreeBottomButtons
    {
        id:sportButtons;
        width: root.width;
        height:root.height/10.5;
        setCenterButtonText: "Start";
        setLeftButtonText: "";
        setRightButtonText: "";
        anchors
        {
            bottom:root.bottom;
            bottomMargin:15;
        }
        onCenterButtonPressed:
        {
            startSportTimer();
        }
    }

    }//end of rec root
}//end of item root
































































//    ScrollView
//    {
//        anchors.fill: parent;
//        //        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
//        //            ScrollBar.vertical.policy: ScrollBar.AlwaysOn
//        //            contentHeight: parent.height
//        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
////        property double valRecs : baseSetRound.height+baseSetBreak.height+emptyRec.height;
//        contentHeight:valRecs
        //                        implicitHeight: height
//        Row
//        {
//            id:rowdata;
//            anchors.fill: parent;






//            Rectangle
//            {
//                id:emptyRec
//                width: parent.width;
//                height:100;
//                color:"blue"
//    //            anchors.top: baseSetBreak.bottom;
//            }

//            Rectangle
//            {
//                id:baseSetBreak;
//                width: parent.width/1.50;
//                height:parent.height/3;
////                anchors.horizontalCenter: parent.horizontalCenter;
//                anchors
//                {
////                    top:baseSetRound.bottom;
//                }

//                color:"red";//cBG_Unknown;
//                Row
//                {
//                    anchors.fill: parent;
//                    Tumbler
//                    {
//                        width: parent.width/3.15;
//                        model: setHourValues;
//                        font.bold: true;
//                        font.pointSize: 30;
//                        visibleItemCount: 4;
//                    }
//                    Text
//                    {
//                        text: ":";
//                        anchors.top:parent.top;
//                        anchors.topMargin: parent.height/3
//                        font.bold: true;
//                        font.pointSize: 30;
//                        color:cTxt_button;//themeDarkMode? "#353436": "black";
//                    }
//                    Tumbler
//                    {
//                        width: parent.width/3.15;
//                        model: setSecond_MinutesValues;
//                        font.bold: true;
//                        font.pointSize: 30;
//                        visibleItemCount: 4;

//                    }
//                    Text
//                    {
//                        text: ":";
//                        anchors.top:parent.top;
//                        anchors.topMargin: parent.height/3
//                        font.bold: true;
//                        font.pointSize: 30;
//                        color:cTxt_button;//themeDarkMode? "#353436": "black";
//                    }
//                    Tumbler
//                    {
//                        width: parent.width/3.15;
//                        model: setSecond_MinutesValues;
//                        font.bold: true;
//                        font.pointSize: 30;
//                        visibleItemCount: 4;
//                    }

//                }
//            }//end of set break


//        }

//    }

