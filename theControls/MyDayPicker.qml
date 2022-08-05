import QtQuick 2.15
import "../theScripts/calculateDates.js" as CD
Item
{
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

    property variant monthDays: [CD.automaticMonth(setYear,setMonth)];

    property color setColorPicked: cBG_button;
    property color setColorNotPicked: cBG_element;
    property color setColorTextPicked: "white";
    property color setColorTextNotPicked: cTxt_button;

    property int setTextFontSize: 9;
    property bool setTextBold: true;
    property int setBaseRadius:10;
    property int setBaseWidth: theRow.width/8;
    property int setBaseHeight: theRow.height/4;
    property int setLimitForTexts: 50;
    property bool setViewOnly:false;
    Rectangle
    {
        width: parent.width;
        height: parent.height/4;


    }

    /*
      style 7 day in a row

      TITLES are :
      (spaced/nulled) (table columns) -> (max day of month) //NOTE start '*' means anyday (28 29 30 31)
            0                5        -> 29 30 31
            0                4        -> 28

            1                5        -> *
            2                5        -> *
            3                5        -> *
            4                5        -> *


            5                5        -> 28 29 30
            5                6        -> 31


            6                5        -> 28 29
            6                6        -> 30 31
      */


    MyWeekDayPicker
    {

    }


}
