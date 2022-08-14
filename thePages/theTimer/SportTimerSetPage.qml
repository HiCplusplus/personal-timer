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
    property bool statusCDBeforeRoundStart;
    property int secondsCDBeforeRoundSTart;


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

        statusCDBeforeRoundStart = cdBeforeSwitch.setStatusSwitch;
        secondsCDBeforeRoundSTart = countDownBeforeRoundStartTimbler.selectHour;


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
                height: 250*5+70*2; //70 for margin top first and last scrollview
                implicitHeight: height;

                Rectangle
                {
                    id:setupRepeat;
                    clip:true;
                    width: parent.width;
                    height: 310;
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
                    width: parent.width;
                    height: 310;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    anchors.top:setupRepeat.bottom;
                    color:cBG_Unknown;
                    MyThreepleTumbler
                    {
                        id:roundsTumbler;
                        setTextTitle: "SET";
                    }
                }

                Rectangle
                {
                    id:setupBreak;
                    clip:true;
                    width: parent.width;
                    height: 310;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    anchors.top:setupSet.bottom;
                    color:cBG_Unknown;
                    MyThreepleTumbler
                    {
                        id:breaksTumbler;
                        setTextTitle: "Break";

                    }
                }


                Rectangle
                {
                    id: boxSwitchCountDownBeforeRoundStart;
                    width: parent.width/1.20;
                    height: 35;
                    color:cBG_element;
                    radius:15;
                    anchors
                    {
                        horizontalCenter: parent.horizontalCenter;
                        top: setupBreak.bottom;
                    }
                    Text
                    {
                        text:"C.D Before Round";
                        font.family: gFontFamily;
                        font.pointSize: 14;
                        font.bold: true;
                        color:cTxt_button;
                        anchors.verticalCenter: parent.verticalCenter;
                        anchors.left:parent.left;
                        anchors.leftMargin: 5;
                    }

                    Rectangle
                    {
                        width: 50;
                        height: width/2;
                        color:cBG_Unknown;
                        anchors
                        {
                            right:boxSwitchCountDownBeforeRoundStart.right;
                            rightMargin:10;
                            verticalCenter:parent.verticalCenter;
                        }

                        MySwitch
                        {
                            id:cdBeforeSwitch;
                            setBorderWidth: 4;
                            setStatusSwitch:false;
                            setStatusBorder:false;
                            setSizeSwitchCircle: 2.80;
                        }
                    }
                    MouseArea
                    {
                        anchors.fill: parent;
                        onClicked:
                        {
                            if(cdBeforeSwitch.setStatusSwitch)
                            {
                                cdBeforeSwitch.setStatusSwitch=false;
                                setUpCounDownBeforeRoundStart.height=0;
                                setUpCounDownBeforeRoundStart.visible = cdBeforeSwitch.setStatusSwitch;
                            }
                            else
                            {
                                cdBeforeSwitch.setStatusSwitch=true;
                                setUpCounDownBeforeRoundStart.height=310;
                                setUpCounDownBeforeRoundStart.visible = cdBeforeSwitch.setStatusSwitch;
                            }

                        }
                    }

                }





                Rectangle
                {
                    id:setUpCounDownBeforeRoundStart;
                    clip:true;
                    width: parent.width;
                    height: 0;
                    visible: false;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    anchors.top:boxSwitchCountDownBeforeRoundStart.bottom;
                    color:cBG_Unknown;
                    MyThreepleTumbler
                    {
                        //when its single just get output from selectHour
                        //when its single indexes are ++ because we dont have index 0 with value 00
                        id:countDownBeforeRoundStartTimbler;
                        setTextTitle: "CountDown";
                        setSingleTumbler: true;
                        setShowSecondTitle:true;
                    }
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

