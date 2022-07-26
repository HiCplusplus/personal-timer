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
    property int theSecond:0;

    property int theTimerTriggered: 0;

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
                        Text
                        {
                            text:"+";
                            color:"black";
                            font.pointSize: 30;
                            anchors.centerIn: parent;
                        }
                        Timer
                        {
                            id: timerPlusHour;

                            interval: 150;
                            repeat: true;
                            running: false;

                            onTriggered:
                            {
                                txtHour.text = CSBC.plusValue(theHour+1);
                                theHour = txtHour.text;
                            }
                        }
                        MouseArea
                        {
                            anchors.fill: parent;
                            onPressed:
                            {
                                timerPlusHour.running=true;
                            }

                            onReleased:
                            {
                                timerPlusHour.running=false;
                                txtHour.text = CSBC.plusValue(theHour+1);
                                theHour = txtHour.text;
                            }
                        }
                    }
                    Rectangle
                    {
                        width: 35;
                        height:35;
                        anchors.top: txtHour.bottom;
                        anchors.horizontalCenter: parent.horizontalCenter;
                        Text
                        {
                            text:"-";
                            color:"black";
                            font.pointSize: 30;
                            anchors.centerIn: parent;
                        }

                        Timer
                        {
                            id: timerMinusHour;

                            interval: 150;
                            repeat: true;
                            running: false;

                            onTriggered:
                            {
                                txtHour.text = CSBC.minusValue(theHour-1);
                                theHour = txtHour.text;
                            }
                        }

                        MouseArea
                        {
                            id:mbyn;
                            anchors.fill: parent;

                            onPressed:
                            {

                                timerMinusHour.running=true;
                            }
                            onReleased:
                            {
                                 timerMinusHour.running = false;
                                 txtHour.text = CSBC.minusValue(theHour-1);
                                 theHour = txtHour.text;
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
                        Text
                        {
                            text:"+";
                            color:"black";
                            font.pointSize: 30;
                            anchors.centerIn: parent;
                        }
                        Timer
                        {
                            id: timerPlusMinute;
                            interval: 150;
                            repeat: true;
                            running: false;

                            onTriggered:
                            {
                                txtMinute.text = CSBC.plusValue(theMinute+1);
                                theMinute = txtMinute.text;
                            }
                        }
                        MouseArea
                        {
                            anchors.fill: parent;
                            onPressed:
                            {
                                timerPlusMinute.running = true;
                            }

                            onReleased:
                            {
                                timerPlusMinute.running = false;
                                txtMinute.text = CSBC.plusValue(theMinute+1);
                                theMinute = txtMinute.text;
                            }
                        }
                    }
                    Rectangle
                    {
                        width: 35;
                        height:35;
                        anchors.top: txtMinute.bottom;
                        anchors.horizontalCenter: parent.horizontalCenter;
                        Text
                        {
                            text:"-";
                            color:"black";
                            font.pointSize: 30;
                            anchors.centerIn: parent;
                        }
                        Timer
                        {
                            id: timerMinusMinute;
                            interval: 150;
                            repeat: true;
                            running: false;

                            onTriggered:
                            {
                                txtMinute.text = CSBC.minusValue(theMinute-1);
                                theMinute = txtMinute.text;
                            }
                        }
                        MouseArea
                        {
                            anchors.fill: parent;
                            onPressed:
                            {
                                timerMinusMinute.running = true;
                            }

                            onReleased:
                            {
                                timerMinusMinute.running = false;
                                txtMinute.text = CSBC.minusValue(theMinute-1);
                                theMinute = txtMinute.text;
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
                        Text
                        {
                            text:"+";
                            color:"black";
                            font.pointSize: 30;
                            anchors.centerIn: parent;
                        }
                        MouseArea
                        {
                            anchors.fill: parent;
                            onClicked:
                            {
                                txtSecond.text = CSBC.plusValue(theSecond+1);
                                theSecond = txtSecond.text;
                            }
                        }
                    }
                    Rectangle
                    {
                        width: 35;
                        height:35;
                        anchors.top: txtSecond.bottom;
                        anchors.horizontalCenter: parent.horizontalCenter;
                        Text
                        {
                            text:"-";
                            color:"black";
                            font.pointSize: 30;
                            anchors.centerIn: parent;
                        }
                        MouseArea
                        {
                            anchors.fill: parent;
                            onClicked:
                            {
                                txtSecond.text = CSBC.minusValue(theSecond-1);
                                theSecond = txtSecond.text;
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
