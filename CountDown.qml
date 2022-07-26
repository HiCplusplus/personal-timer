import QtQuick
import QtQuick.Controls
import "theControls"
import "theScripts/controllerSpingBoxCountDown.js" as CSBC

Item
{
    property color colorBG: "white";
    property color colorTexts: "black";


    property int theHour: 10;
    property int theMinute:994;
    property int theSecond:502;



    //for MyAutoValue Increase Decrease.qml
    property color mavColorTexts: "black";
    property int mavFontSizes: 30;
    property int mavTimerIntervalValue: 150;




    anchors.fill: parent;
    clip:true;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:colorBG;
    }

    Rectangle
    {
        id:addNewTimer;
        width: parent.width/1.2;
        height:parent.height/2;
        color:"yellow"
        anchors
        {
            horizontalCenter:parent.horizontalCenter;
            verticalCenter:parent.verticalCenter;

        }



        Rectangle
        {
            id:baseSetTimer;
            width: parent.width;
            height: parent.height/2;
            Row
            {
                anchors.fill: parent;
                Rectangle
                {
                    id:setHour;
                    width: parent.width/3.2;
                    height:parent.height;
                    Text
                    {
                        text:"Hours";
                        color:"black";
                        anchors.horizontalCenter:parent.horizontalCenter;
                    }
                    Text
                    {
                        id:txtHour;
                        text:theHour<10? "0"+theHour: theHour;
                        color:"black";
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
                        MyAutoValue_Increase_Decrease
                        {
                            id:hourIncrease;
                            anchors.fill: parent;

                            setLocalStatusIncreaseOrDecrease: true;//false means decrease, true means  increase
                            setColorTexts: mavColorTexts;
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

                    Rectangle
                    {
                        width: 35;
                        height:35;
                        anchors.top: txtHour.bottom;
                        anchors.horizontalCenter: parent.horizontalCenter;
                        MyAutoValue_Increase_Decrease
                        {
                            id:hourDecrease;
                            anchors.fill: parent;

                            setLocalStatusIncreaseOrDecrease: false;//false means decrease, true means  increase
                            setColorTexts: mavColorTexts;
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
                    color:"black";
                    anchors.verticalCenter: parent.verticalCenter;
                    font.pointSize: 40;
                    font.bold:true;
                }
                Rectangle
                {
                    id:setMinute;
                    width: parent.width/3.2;
                    height:parent.height;
                    Text
                    {
                        text:"Minutes";
                        color:"black";
                        anchors.horizontalCenter:parent.horizontalCenter;
                    }
                    Text
                    {
                        id:txtMinute;
                        text:theMinute<10? "0"+theMinute: theMinute;
                        color:"black";
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
                        MyAutoValue_Increase_Decrease
                        {
                            id:minuteIncrease;
                            anchors.fill: parent;

                            setLocalStatusIncreaseOrDecrease: true;//false means decrease, true means  increase
                            setColorTexts: mavColorTexts;
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
                        MyAutoValue_Increase_Decrease
                        {
                            id:minuteDecrease;
                            anchors.fill: parent;

                            setLocalStatusIncreaseOrDecrease: false;//false means decrease, true means  increase
                            setColorTexts: mavColorTexts;
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
                    color:"black";
                    anchors.verticalCenter: parent.verticalCenter;
                    font.pointSize: 40;
                    font.bold:true;
                }
                Rectangle
                {
                    id:setSecond;
                    width: parent.width/3.2;
                    height:parent.height;
                    Text
                    {
                        id:labelSeconds;
                        text:"Seconds";
                        color:"black";
                        anchors.horizontalCenter:parent.horizontalCenter;
                    }
                    Text
                    {
                        id:txtSecond;
                        text:theSecond<10? "0"+theSecond:theSecond;
                        color:"black";
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
                        MyAutoValue_Increase_Decrease
                        {
                            id:secondIncrease;
                            anchors.fill: parent;

                            setLocalStatusIncreaseOrDecrease: true;//false means decrease, true means  increase
                            setColorTexts: mavColorTexts;
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
                        MyAutoValue_Increase_Decrease
                        {
                            id:secondDecrease;
                            anchors.fill: parent;

                            setLocalStatusIncreaseOrDecrease: false;//false means decrease, true means  increase
                            setColorTexts: mavColorTexts;
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


            }

        }
        Rectangle
        {
            width: parent.width/2.5;
            height: parent.height/6;
            color:"black";
            anchors.top:  baseSetTimer.bottom;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.topMargin: 10;
            radius:50;
            Text
            {
                text:"Start";
                anchors.centerIn: parent;
                color:"white";
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    console.log("button add new timer added");
                    InputContext.priv.inputItem.text = InputContext.priv.inputItem.textBeforeEditing
                }
            }
        }


    }



}
