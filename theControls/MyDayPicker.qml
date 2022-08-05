import QtQuick 2.15
import "../theScripts/calculateDates.js" as CD

Item
{
    id:root;
    anchors.fill: parent;

    property int pickMode: 2;
    /*
        1 -> only one pick
        2 -> mutiple pick
    */

    property int setToday: 0;
    /*
      0 -> no select
      (1 t0 29 or 28 or 31 or 30) -> select that day
    */
    property int setMonth: 1;
    property int setYear: 2022;

    property variant monthDays: CD.automaticMonth(setYear,setMonth);
    property int countColumns: CD.calculateColumns_of_MonthDays(monthDays.length);
    property int monthNullDays: CD.dayOfWeek(setYear,setMonth,'nontext');

    property variant monthDaysForShow: CD.automaticMonth(setYear,setMonth,true);//true is for free spacer

//    property color setColorPicked: cBG_button;
//    property color setColorNotPicked: cBG_element;
//    property color setColorTextPicked: "white";
//    property color setColorTextNotPicked: cTxt_button;

//    property int setTextFontSize: 9;
//    property bool setTextBold: true;
//    property int setBaseRadius:10;
//    property int setBaseWidth: parent.width/8;
//    property int setBaseHeight: parent.height/4;
//    property int setLimitForTexts: 50;
    property bool setViewOnlyStatus:false;
    Column
    {
        anchors.fill: parent;
        Rectangle
        {
            width: parent.width;
            height: parent.height/countColumns;
            color:cBG_Unknown;
            MyWeekDayPicker
            {
                setPickMode: pickMode;
                setMonthDayPicker:true;
                emptyTextForAll:"0";
                setBaseRadius:100;
                textAPick:monthDaysForShow[0];
                textBPick:monthDaysForShow[1];
                textCPick:monthDaysForShow[2];
                textDPick:monthDaysForShow[3];
                textEPick:monthDaysForShow[4];
                textFPick:monthDaysForShow[5];
                textGPick:monthDaysForShow[6];
                setViewOnly: setViewOnlyStatus;
            }
        }
        Rectangle
        {
            width: parent.width;
            height: parent.height/countColumns;
            color:cBG_Unknown;
            MyWeekDayPicker
            {
                setPickMode: pickMode;
                setMonthDayPicker:true;
                emptyTextForAll:"0";
                setBaseRadius:100;
                textAPick:monthDaysForShow[7];
                textBPick:monthDaysForShow[8];
                textCPick:monthDaysForShow[9];
                textDPick:monthDaysForShow[10];
                textEPick: monthDaysForShow[11];
                textFPick: monthDaysForShow[12];
                textGPick: monthDaysForShow[13];
                setViewOnly: setViewOnlyStatus;
            }
        }

        Rectangle
        {
            width: parent.width;
            height: parent.height/countColumns;
            color:cBG_Unknown;
            MyWeekDayPicker
            {
                setPickMode: pickMode;
                setMonthDayPicker:true;
                emptyTextForAll:"0";
                setBaseRadius:100;
                textAPick:monthDaysForShow[14];
                textBPick:monthDaysForShow[15];
                textCPick:monthDaysForShow[16];
                textDPick:monthDaysForShow[17];
                textEPick: monthDaysForShow[18];
                textFPick: monthDaysForShow[19];
                textGPick: monthDaysForShow[20];
                setViewOnly: setViewOnlyStatus;
            }
        }


        Rectangle
        {
            width: parent.width;
            height: parent.height/countColumns;
            color:cBG_Unknown;
            MyWeekDayPicker
            {
                setPickMode: pickMode;
                setMonthDayPicker:true;
                emptyTextForAll:"0";
                setBaseRadius:100;
                textAPick:monthDaysForShow[21];
                textBPick:monthDaysForShow[22];
                textCPick:monthDaysForShow[23];
                textDPick:monthDaysForShow[24];
                textEPick: monthDaysForShow[25];
                textFPick: monthDaysForShow[26];
                textGPick: monthDaysForShow[27];
                setViewOnly: setViewOnlyStatus;
            }
        }

        Rectangle
        {
            width: parent.width;
            height: parent.height/countColumns;
            color:cBG_Unknown;
            MyWeekDayPicker
            {
                setPickMode: pickMode;
                setMonthDayPicker:true;
                emptyTextForAll:"0";
                setBaseRadius:100;
                textAPick:monthDaysForShow[28];
                textBPick:monthDaysForShow[29];
                textCPick:monthDaysForShow[30];
                textDPick:monthDaysForShow[31];
                textEPick: monthDaysForShow[32];
                textFPick: monthDaysForShow[33];
                textGPick: monthDaysForShow[34];
                setViewOnly: setViewOnlyStatus;
            }
        }

        Rectangle
        {
            width: parent.width;
            height: parent.height/countColumns;
            color:cBG_Unknown;
            MyWeekDayPicker
            {
                setPickMode: pickMode;
                setMonthDayPicker:true;
                emptyTextForAll:"0";
                setBaseRadius:100;
                textAPick:monthDaysForShow[35];
                textBPick:monthDaysForShow[36];
                textCPick:monthDaysForShow[37];
                textDPick:monthDaysForShow[38];
                textEPick:monthDaysForShow[39];
                textFPick:monthDaysForShow[40];
                textGPick:monthDaysForShow[41];
                setViewOnly: setViewOnlyStatus;
            }
        }

    }
}

