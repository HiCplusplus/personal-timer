import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../theControls"


Item
{
    anchors.fill: parent;
    property variant roundValues: []; //hour , minute ,second
    property variant breakValues: []; //hour , minute ,second
    property variant repeatValue: []; //only index 0 used
    property bool statusCDBeforeRoundStart:false;
    property int secondsCDBeforeRoundSTart;

    property bool statusSpeech:false;
    property bool statusSoundEffect:false;


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
                height: 250*5+70*2+130; //70 for margin top first and last scrollview . 130 = 65*2 for 2boxsiwtch
                implicitHeight: height;





                // - - - - -- - - - - - - - -- - - - - - Sound SPeech

                Rectangle
                {
                    id: boxSwitchSoundSpeech;
                    width: parent.width/1.20;
                    height: 35;
                    color:cBG_element;
                    radius:15;
                    anchors
                    {
                        horizontalCenter: parent.horizontalCenter;
                        top: rootItem.top;
                        topMargin: 60; //30value , +30 for top margin fist element
                    }
                    Text
                    {
                        text:"Speech";
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
                            right:boxSwitchSoundSpeech.right;
                            rightMargin:10;
                            verticalCenter:parent.verticalCenter;
                        }

                        MySwitch
                        {
                            id:soundSpeechSwitch;
                            setBorderWidth: 4;
                            setStatusSwitch:false;
                            setStatusBorder:false;
                            setSizeSwitchCircle: 2.80;
                            onSetStatusSwitchChanged:
                            {
                                if(!setStatusSwitch && cdBeforeSwitch.setStatusSwitch)
                                {
                                    cdBeforeSwitch.setStatusSwitch = false;
                                    setUpCounDownBeforeRoundStart.height=0;
                                    setUpCounDownBeforeRoundStart.visible = cdBeforeSwitch.setStatusSwitch;
                                }
                                else
                                    statusSpeech  = soundSpeechSwitch.setStatusSwitch;
                            }
                        }
                    }
                }




                // - - - - - - - - - - - - - - - - - Count DOWN BEFORE ROUND
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
                        top: boxSwitchSoundSpeech.bottom;
                        topMargin: 30;
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
                                if(!soundSpeechSwitch.setStatusSwitch) //to avoid turn CDBefore but speech were off
                                {
                                    soundSpeechSwitch.setStatusSwitch = true;
                                    statusSpeech = soundSpeechSwitch.setStatusSwitch;
                                }
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



                //--- - - - - - - - - - - - -- - - SoundEffects

                Rectangle
                {
                    id: boxSwitchSoundEffect;
                    width: parent.width/1.20;
                    height: 35;
                    color:cBG_element;
                    radius:15;
                    anchors
                    {
                        horizontalCenter: parent.horizontalCenter;
                        top: setUpCounDownBeforeRoundStart.bottom;
                        topMargin: 30;
                    }
                    Text
                    {
                        text:"Effect";
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
                            right:boxSwitchSoundEffect.right;
                            rightMargin:10;
                            verticalCenter:parent.verticalCenter;
                        }

                        MySwitch
                        {
                            id:soundEffectSwitch;
                            setBorderWidth: 4;
                            setStatusSwitch:false;
                            setStatusBorder:false;
                            setSizeSwitchCircle: 2.80;
                            onSetStatusSwitchChanged:
                            {
                                statusSoundEffect = setStatusSwitch;
                            }
                        }
                    }
                }

                // - - - - -- - - - - - - - - - - - - -





                // - - - - - - - - -- -  -- - - - -  - Repeat/RoundCount
                Rectangle
                {
                    id:setupRepeat;
                    clip:true;
                    width: parent.width;
                    height: 310;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    anchors.top:boxSwitchSoundEffect.bottom;
                    anchors.topMargin: 50;
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



                // - - - - - - - -- - - - - - - - - - -- Set/Round
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



                // - - - - - - - - - - - - - - - - - -Break:
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

