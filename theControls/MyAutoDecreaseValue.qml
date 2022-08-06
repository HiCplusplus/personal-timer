import QtQuick 2.15
import "../theScripts/controllerSpingBoxCountDown.js" as CSBC

Item
{
    property int setTextFontSize: 30;
    property int setTimerIntervalValue: 150;
    property int setInputIntValue:0;
    property string outputResultString: "";
    property int outputResultInt:0;
    property int vSpeedCounter: 0;
    property int vSpeedLevel: 1;

    Rectangle
    {
        width: 35;
        height:35;
        color:cBG_Unknown;
        Text
        {
            text: "-";
            color:cTxt_button;
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

                outputResultString = CSBC.minusValue(setInputIntValue-vSpeedLevel);
                outputResultInt = outputResultString;

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
                outputResultString = CSBC.minusValue(setInputIntValue-1);
                outputResultInt = outputResultString;
            }
        }
    }
}
