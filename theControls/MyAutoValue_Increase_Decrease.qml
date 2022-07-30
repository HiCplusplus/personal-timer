import QtQuick 2.0
import "../theScripts/controllerSpingBoxCountDown.js" as CSBC

Item
{
    property bool setLocalStatusIncreaseOrDecrease: false; //0means decrease(minus), 1means increase(plus)
//    property color setColorTexts: "black";
    property int setTextFontSize: 30;
    property int setTimerIntervalValue: 150;
    property int setInputIntValue:0;
    property string outputResultString: "";
    property int outputResultInt:0;
    property int vSpeedCounter: 0;
    property int vSpeedLevel: 1;
//    property color setColorBG: "transparent";

    /*
      use like this for outputResult when use component (example for txtMinute)
                txtMinute.text = CSBC.minusValue(theMinute-1);
                theMinute = txtMinute.text;
    */

    Rectangle
    {
        width: 35;
        height:35;
        color:cBG_Unknown;
        Text
        {
            text:setLocalStatusIncreaseOrDecrease? "+":"-";
            color:cTxt_normal;
            font.pointSize: setTextFontSize;
            anchors.centerIn: parent;
        }
        Timer
        {
            id: theAutoValue_Timer_Increase_Decrease;
            interval: setTimerIntervalValue;
            repeat: true;
            running: false;

            onTriggered:
            {
                vSpeedCounter++;

                if(vSpeedCounter/6>3)
                    vSpeedLevel = 10;
                else if(vSpeedCounter/6>5)
                    vSpeedLevel = 50;
                else if(vSpeedCounter/6>8)
                    vSpeedLevel = 100;
                else
                    vSpeedLevel = 1;


                if(setLocalStatusIncreaseOrDecrease)
                {
                    outputResultString = CSBC.plusValue(setInputIntValue+vSpeedLevel);
                    outputResultInt = outputResultString;
                }
                else
                {
                    outputResultString = CSBC.minusValue(setInputIntValue-vSpeedLevel);
                    outputResultInt = outputResultString;
                }
            }
        }
        MouseArea
        {
            anchors.fill: parent;
            onPressed:
            {
                vSpeedCounter=0;
                theAutoValue_Timer_Increase_Decrease.running = true;
            }

            onReleased:
            {
                theAutoValue_Timer_Increase_Decrease.running = false;
                if(setLocalStatusIncreaseOrDecrease)
                {
                    outputResultString = CSBC.plusValue(setInputIntValue+1);
                    outputResultInt = outputResultString;
                }
                else
                {
                    outputResultString = CSBC.minusValue(setInputIntValue-1);
                    outputResultInt = outputResultString;
                }
            }
        }
    }
}
