import QtQuick
import QtQuick.Controls
import "theControls"
import "theScripts/controllerSpingBoxCountDown.js" as CSBC
import "theScripts/updateCountDown.js" as UCD
import QtMultimedia
import "thePages"

Item
{
//    property color setColorBG: "white";
//    property color colorTexts: "black";


    property int theHour: 0;
    property int theMinute:0;
    property int theSecond:0;



    //for MyAutoValue Increase Decrease.qml
//    property color mavColorTexts: "black";
    property int mavFontSizes: 30;
    property int mavTimerIntervalValue: 200;

    property bool increaseDecreaseControllerStatusEnabled: false;



    anchors.fill: parent;
    clip:true;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:cBG;
    }

    SoundEffect
    {
        id:theSoundEffectTimesUp;
        source: "./theSounds/mixkit-elevator-tone-2863.wav"; //from https://mixkit.co/free-sound-effects/
    }



    Timer
    {
        id: globaTimer;
        interval: 1000;
        repeat: true;
        running: false;

        onTriggered:
        {
            var allObject = JSON.parse(UCD.updateCountDown(theHour,theMinute,theSecond));
            theHour = allObject.h;
            theMinute = allObject.m;
            theSecond = allObject.s;

            if(theHour<10)
                txtHour.text = "0"+theHour;
            else
                txtHour.text = theHour;


            if(theMinute<10)
                txtMinute.text = "0"+theMinute;
            else
                txtMinute.text = theMinute;


            if(theSecond<10)
                txtSecond.text = "0"+theSecond;
            else
                txtSecond.text = theSecond;

            if(theHour<=0&&theMinute<=0&&theSecond<=0)
            {
                theSoundEffectTimesUp.play();
                myDismiss.visible=true;
            }
        }
    }

    Rectangle
    {
        id:addNewTimer;
        width: parent.width/1.2;
        height:parent.height/4;
        color:cBG_Unknown;
        anchors
        {
            horizontalCenter:parent.horizontalCenter;
            verticalCenter:parent.verticalCenter;
        }

        Rectangle
        {
            id:baseSetTimer;
            width: parent.width;
            height: parent.height;
            anchors.centerIn: parent;
            color:cBG_Unknown;
            Row
            {
                anchors.fill: parent;
                Rectangle
                {
                    id:setHour;
                    width: parent.width/3.2;
                    height:parent.height;
                    color:cBG_Unknown;
                    Text
                    {
                        text:"Hours";
                        color:cTxt_button;
                        anchors.horizontalCenter:parent.horizontalCenter;
                    }
                    Text
                    {
                        id:txtHour;
                        text:theHour<10? "0"+theHour: theHour;
                        color:cTxt_button;
                        anchors.horizontalCenter:parent.horizontalCenter;
                        anchors.verticalCenter: parent.verticalCenter;
                        font.pointSize: 40;
                        font.bold:true;
                    }
                    Rectangle
                    {
                        width: 35;
                        height:35;
                        anchors.bottom: txtHour.top;
                        anchors.horizontalCenter: parent.horizontalCenter;
                        color:cBG_Unknown;
                        MyAutoValue_Increase_Decrease
                        {
                            id:hourIncrease;
                            anchors.fill: parent;

                            setLocalStatusIncreaseOrDecrease: true;//false means decrease, true means  increase
                            setTimerIntervalValue: mavTimerIntervalValue;
                            setInputIntValue: theHour;
                            onOutputResultStringChanged:
                            {
                                txtHour.text = outputResultString;
                            }
                            onOutputResultIntChanged:
                            {
                                theHour = outputResultInt;
                            }
                        }
                    }

                    Rectangle
                    {
                        width: 35;
                        height:35;
                        anchors.top: txtHour.bottom;
                        anchors.horizontalCenter: parent.horizontalCenter;
                        color:cBG_Unknown;
                        MyAutoValue_Increase_Decrease
                        {
                            id:hourDecrease;
                            anchors.fill: parent;

                            setLocalStatusIncreaseOrDecrease: false;//false means decrease, true means  increase
                            setTextFontSize: mavFontSizes;
                            setTimerIntervalValue: mavTimerIntervalValue;
                            setInputIntValue: theHour;
                            onOutputResultStringChanged:
                            {
                                txtHour.text = outputResultString;
                            }
                            onOutputResultIntChanged:
                            {
                                theHour = outputResultInt;
                            }
                        }
                    }


                }
                Text
                {
                    text:":";
                    color:cTxt_button;
                    anchors.verticalCenter: parent.verticalCenter;
                    font.pointSize: 40;
                    font.bold:true;
                }
                Rectangle
                {
                    id:setMinute;
                    width: parent.width/3.2;
                    height:parent.height;
                    color:cBG_Unknown;
                    Text
                    {
                        text:"Minutes";
                        color:cTxt_button;
                        anchors.horizontalCenter:parent.horizontalCenter;
                    }
                    Text
                    {
                        id:txtMinute;
                        text:theMinute<10? "0"+theMinute: theMinute;
                        color:cTxt_button;
                        anchors.horizontalCenter:parent.horizontalCenter;
                        anchors.verticalCenter: parent.verticalCenter;
                        font.pointSize: 40;
                        font.bold:true;
                    }

                    Rectangle
                    {
                        width: 35;
                        height:35;
                        anchors.bottom: txtMinute.top;
                        anchors.horizontalCenter: parent.horizontalCenter;
                        color:cBG_Unknown;
                        MyAutoValue_Increase_Decrease
                        {
                            id:minuteIncrease;
                            anchors.fill: parent;

                            setLocalStatusIncreaseOrDecrease: true;//false means decrease, true means  increase
                            setTextFontSize: mavFontSizes;
                            setTimerIntervalValue: mavTimerIntervalValue;
                            setInputIntValue: theMinute;
                            onOutputResultStringChanged:
                            {
                                txtMinute.text = outputResultString;
                            }
                            onOutputResultIntChanged:
                            {
                                theMinute = outputResultInt;
                            }
                        }
                    }
                    Rectangle
                    {
                        width: 35;
                        height:35;
                        anchors.top: txtMinute.bottom;
                        anchors.horizontalCenter: parent.horizontalCenter;
                        color:cBG_Unknown;
                        MyAutoValue_Increase_Decrease
                        {
                            id:minuteDecrease;
                            anchors.fill: parent;

                            setLocalStatusIncreaseOrDecrease: false;//false means decrease, true means  increase
                            setTextFontSize: mavFontSizes;
                            setTimerIntervalValue: mavTimerIntervalValue;
                            setInputIntValue: theMinute;
                            onOutputResultStringChanged:
                            {
                                txtMinute.text = outputResultString;
                            }
                            onOutputResultIntChanged:
                            {
                                theMinute = outputResultInt;
                            }
                        }
                    }

                }
                Text
                {
                    text:":";
                    color:cTxt_button;
                    anchors.verticalCenter: parent.verticalCenter;
                    font.pointSize: 40;
                    font.bold:true;
                }
                Rectangle
                {
                    id:setSecond;
                    width: parent.width/3.2;
                    height:parent.height;
                    color:cBG_Unknown;
                    Text
                    {
                        id:labelSeconds;
                        text:"Seconds";
                        color:cTxt_button;
                        anchors.horizontalCenter:parent.horizontalCenter;
                    }
                    Text
                    {
                        id:txtSecond;
                        text:theSecond<10? "0"+theSecond:theSecond;
                        color:cTxt_button;
                        anchors.horizontalCenter:parent.horizontalCenter;
                        anchors.verticalCenter: parent.verticalCenter;
                        font.pointSize: 40;
                        font.bold:true;
                    }
                    Rectangle
                    {
                        width: 35;
                        height:35;
                        anchors.bottom: txtSecond.top;
                        anchors.horizontalCenter: parent.horizontalCenter;
                        color:cBG_Unknown;
                        MyAutoValue_Increase_Decrease
                        {
                            id:secondIncrease;
                            anchors.fill: parent;

                            setLocalStatusIncreaseOrDecrease: true;//false means decrease, true means  increase
                            setTextFontSize: mavFontSizes;
                            setTimerIntervalValue: mavTimerIntervalValue;
                            setInputIntValue: theSecond;
                            onOutputResultStringChanged:
                            {
                                txtSecond.text = outputResultString;
                            }
                            onOutputResultIntChanged:
                            {
                                theSecond = outputResultInt;
                            }
                        }
                    }



                    Rectangle
                    {
                        width: 35;
                        height:35;
                        anchors.top: txtSecond.bottom;
                        anchors.horizontalCenter: parent.horizontalCenter;
                        color:cBG_Unknown;
                        MyAutoValue_Increase_Decrease
                        {
                            id:secondDecrease;
                            anchors.fill: parent;

                            setLocalStatusIncreaseOrDecrease: false;//false means decrease, true means  increase
                            setTextFontSize: mavFontSizes;
                            setTimerIntervalValue: mavTimerIntervalValue;
                            setInputIntValue: theSecond;
                            onOutputResultStringChanged:
                            {
                                txtSecond.text = outputResultString;
                            }
                            onOutputResultIntChanged:
                            {
                                theSecond = outputResultInt;
                            }
                        }
                    }

                }

            }//end of row

        }//end of base Set Timer

    }//end of add new timer


    MyThreeBottomButtons
    {
        id:idMyThreeBottomButtons
        width: parent.width;
        height:root.height/10.5;
        setCenterButtonText: "Start";
        setLeftButtonText: "Reset";
        setRightButtonText: "";
        anchors
        {
            bottom:root.bottom;
            bottomMargin:15;
        }
        onCenterButtonPressed:
        {
            if((!(theHour<=0&&theMinute<=0&&theSecond<=0)) && idMyThreeBottomButtons.setCenterButtonText == "Start")
            {
                increaseDecreaseControllerStatusEnabled=false;
                idMyThreeBottomButtons.setCenterButtonText = "Pause";

                globaTimer.running=!increaseDecreaseControllerStatusEnabled;
                hourIncrease.visible=increaseDecreaseControllerStatusEnabled;
                hourDecrease.visible=increaseDecreaseControllerStatusEnabled;
                minuteIncrease.visible=increaseDecreaseControllerStatusEnabled;
                minuteDecrease.visible=increaseDecreaseControllerStatusEnabled;
                secondIncrease.visible=increaseDecreaseControllerStatusEnabled;
                secondDecrease.visible=increaseDecreaseControllerStatusEnabled;
            }
            else
            {
                //button pause pressed
                increaseDecreaseControllerStatusEnabled=true;
                idMyThreeBottomButtons.setCenterButtonText = "Start";

                globaTimer.running=!increaseDecreaseControllerStatusEnabled;
                hourIncrease.visible=increaseDecreaseControllerStatusEnabled;
                hourDecrease.visible=increaseDecreaseControllerStatusEnabled;
                minuteIncrease.visible=increaseDecreaseControllerStatusEnabled;
                minuteDecrease.visible=increaseDecreaseControllerStatusEnabled;
                secondIncrease.visible=increaseDecreaseControllerStatusEnabled;
                secondDecrease.visible=increaseDecreaseControllerStatusEnabled;
            }

        }
        onLeftButtonPressed:
        {
            if(theHour>0 || theMinute>0 || theSecond>0)
            {
                increaseDecreaseControllerStatusEnabled=true;
                txtHour.text = txtMinute.text = txtSecond.text = "00";
                theHour = theMinute = theSecond = 0;

                idMyThreeBottomButtons.setCenterButtonText = "Start";

                globaTimer.running=!increaseDecreaseControllerStatusEnabled;
                hourIncrease.visible=increaseDecreaseControllerStatusEnabled;
                hourDecrease.visible=increaseDecreaseControllerStatusEnabled;
                minuteIncrease.visible=increaseDecreaseControllerStatusEnabled;
                minuteDecrease.visible=increaseDecreaseControllerStatusEnabled;
                secondIncrease.visible=increaseDecreaseControllerStatusEnabled;
                secondDecrease.visible=increaseDecreaseControllerStatusEnabled;
            }


        }
    }//end of three buttons

    DismissPage
    {

        id:myDismiss;
        visible: false;
        onStatusDismiss:
        {
            theSoundEffectTimesUp.stop();
            myDismiss.visible=false;
            increaseDecreaseControllerStatusEnabled=true;
            idMyThreeBottomButtons.setCenterButtonText = "Start";
            globaTimer.running=!increaseDecreaseControllerStatusEnabled;
            hourIncrease.visible=increaseDecreaseControllerStatusEnabled;
            hourDecrease.visible=increaseDecreaseControllerStatusEnabled;
            minuteIncrease.visible=increaseDecreaseControllerStatusEnabled;
            minuteDecrease.visible=increaseDecreaseControllerStatusEnabled;
            secondIncrease.visible=increaseDecreaseControllerStatusEnabled;
            secondDecrease.visible=increaseDecreaseControllerStatusEnabled;
        }
    }



}//end of item

