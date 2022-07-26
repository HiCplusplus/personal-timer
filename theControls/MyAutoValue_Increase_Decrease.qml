import QtQuick 2.0
import "../theScripts/controllerSpingBoxCountDown.js" as CSBC

Item
{
    property bool setLocalStatusIncreaseOrDecrease: false; //0means decrease(minus), 1means increase(plus)
    property color setColorTexts: "black";
    property int setTextFontSize: 30;
    property int setTimerIntervalValue: 150;
    property int setInputIntValue:0;
    property string outputResultString: "";
    property int outputResultInt:0;

    /*
      use like this for outputResult when use component (example for txtMinute)
                txtMinute.text = CSBC.minusValue(theMinute-1);
                theMinute = txtMinute.text;
    */

    Rectangle
    {
        width: 35;
        height:35;
//        anchors.top: setLocalStatusIncreaseOrDecrease? parent.top: parent;
//        anchors.bottom: setLocalStatusIncreaseOrDecrease? false: parent.bottom;
//        anchors.horizontalCenter: parent.horizontalCenter;
        Text
        {
            text:setLocalStatusIncreaseOrDecrease? "+":"-";
            color:setColorTexts;
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
        MouseArea
        {
            anchors.fill: parent;
            onPressed:
            {
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
