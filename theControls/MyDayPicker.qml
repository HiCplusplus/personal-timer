import QtQuick 2.15
import "../theScripts/calculateDates.js" as CD
import "../theScripts/dayPicker.js" as DP

Item
{
    id:root;
    anchors.fill: parent;

    property int setPickMode: 0;
    /*
        0 -> readonly
        1 -> only one pick
        2 -> mutiple pick (week pick) (whole month pick)
        3 -> range pick
    */

    property int setToday: 0;
    /*
      0 -> no select
      (1 t0 29 or 28 or 31 or 30) -> select that day
    */
    property int setMonth: 1;
    property int setYear: 2022;

    property variant monthDays: CD.automaticMonth(setYear,setMonth);
    property int countColumns: DP.calculateColumns_of_MonthDays(monthDays.length);

    property color setColorPicked: cBG_button;
    property color setColorNotPicked: cBG_element;
    property color setColorTextPicked: "white";
    property color setColorTextNotPicked: cTxt_button;

    property int setTextFontSize: 9;
    property bool setTextBold: true;
    property int setBaseRadius:10;
    property int setBaseWidth: parent.width/8;
    property int setBaseHeight: parent.height/4;
    property int setLimitForTexts: 50;
    property bool seViewOnlyStatus:false;





    Loader
    {
        id:myloader;
        anchors.fill: parent;
        sourceComponent: myComp;
    }



    Component
    {
        id:myComp;
        Rectangle
        {
            id:myRec;
            anchors.fill: parent;
            color:"yellow";
            Component.onCompleted:
            {



            }
        }



    }





}
