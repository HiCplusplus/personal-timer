import QtQuick 2.15
import "../theScripts/calculateDates.js" as CD


Item
{
    property int setFontCalender:10;
    property int setFontSizeMonth: 25;
    property variant setTextMonth: ["","January","February","March","April","May","June"
                                    ,"July","August","September","October","November","December"];
    property int setTopMarginMonth: 5;
    property int setLeftRightMarginNextBackMonth:5;

    property bool setCalenderOnlyView: false;

    property int setCurrentYear: 2022;
    property int setCurrentMonth:1;
    anchors.fill: parent;

    Rectangle
    {
        id:root;
        color: cBG_element;
        radius:15;
        anchors.fill: parent;
        Rectangle
        {
            id:baseTextMonth;
            anchors
            {
                top:root.top;
                topMargin:setTopMarginMonth;
            }
            color:cBG_Unknown;
            width: parent.width;
            height:50;
            Rectangle
            {
                anchors.centerIn: parent;
                width: parent.width/1.20;
                height:parent.height;
                color:cBG_Unknown;
                Rectangle
                {
                    id:baseYearText;
                    width: parent.width;
                    height:parent.height/2;
                    color:cBG_Unknown;
                    Text
                    {
                        id: textYear;
                        color: cTxt_button;
                        text: setCurrentYear;
                        font.pointSize: setFontSizeMonth/2;
                        font.bold: true;
                        font.family: gFontFamily;
                        anchors.horizontalCenter: parent.horizontalCenter;
                        anchors.top:parent.top;
                    }

                    //---- buttons
                    Rectangle
                    {
                        id:baseBackYear;
                        width: 20;
                        height:width;
                        visible: setCalenderOnlyView?false:true;
                        opacity: setCurrentMonth==1? 0.5 : 1;
                        enabled: setCurrentMonth==1? false:true;
                        color:cBG_Unknown;
                        anchors
                        {
                            right:textYear.left;
                            rightMargin:setLeftRightMarginNextBackMonth;
                            top:textYear.top;
                            verticalCenter:parent.verticalCenter;
                        }
                        Image
                        {
                            id: iconBackYear;
                            source: path_to_menuIcons + fileIcon_BackNext;
                            anchors.fill: parent;
                        }
                        MouseArea
                        {
                            anchors.fill: parent;
                            onClicked:
                            {
                                console.log("back month pressed");
                                test();
                            }
                        }
                    }//end of back month button

                    Rectangle
                    {
                        id:baseNextYear;
                        width: 20;
                        height:width;
                        visible: setCalenderOnlyView?false:true;
                        color:cBG_Unknown;
                        opacity: setCurrentMonth==11? 0.5 : 1;
                        enabled: setCurrentMonth==11? false:true;
                        anchors
                        {
                            left:textYear.right;
                            leftMargin:setLeftRightMarginNextBackMonth;
                            top:textYear.top;
                            verticalCenter:parent.verticalCenter;
                        }
                        Image
                        {
                            id: iconNextYear
                            source: path_to_menuIcons + fileIcon_BackNext;
                            anchors.fill: parent;
                            rotation: 180;
                        }
                        MouseArea
                        {
                            anchors.fill: parent;
                            onClicked:
                            {
                                console.log("next month pressed" + setCurrentMonth);
                                console.log("value = "+ CD.dayofweek(2001,9,9));
                            }
                        }
                    }//end of next month button
                }


                Rectangle
                {
                    id:baseMonthText;
                    width: parent.width;
                    height:parent.height/2;
                    anchors.top:baseYearText.bottom;
                    color:cBG_Unknown;
                    Text
                    {
                        id: textMonth;
                        color: cTxt_button;
                        text: setTextMonth[setCurrentMonth];
                        font.pointSize: setFontSizeMonth/2;
                        font.bold: true;
                        font.family: gFontFamily;
                        anchors.centerIn: parent;
                    }//end of text month






                    //---- buttons
                    Rectangle
                    {
                        id:baseBackMonth;
                        width: 20;
                        height:width;
                        visible: setCalenderOnlyView?false:true;
                        opacity: setCurrentMonth==1? 0.5 : 1;
                        enabled: setCurrentMonth==1? false:true;
                        color:cBG_Unknown;
                        anchors
                        {
                            right:textMonth.left;
                            rightMargin:setLeftRightMarginNextBackMonth;
                            top:textMonth.top;
//                            topMargin:setTopMarginMonth*2;
                            verticalCenter:parent.verticalCenter;
                        }
                        Image
                        {
                            id: iconBackMonth;
                            source: path_to_menuIcons + fileIcon_BackNext;
                            anchors.fill: parent;
                        }
                        MouseArea
                        {
                            anchors.fill: parent;
                            onClicked:
                            {
                                console.log("back month pressed");
                                test();
                            }
                        }
                    }//end of back month button

                    Rectangle
                    {
                        id:baseNextMonth;
                        width: 20;
                        height:width;
                        visible: setCalenderOnlyView?false:true;
                        color:cBG_Unknown;
                        opacity: setCurrentMonth==11? 0.5 : 1;
                        enabled: setCurrentMonth==11? false:true;
                        anchors
                        {
                            left:textMonth.right;
                            leftMargin:setLeftRightMarginNextBackMonth;
                            top:textMonth.top;
//                            topMargin:setTopMarginMonth*2;
                            verticalCenter:parent.verticalCenter;
                        }
                        Image
                        {
                            id: iconNextMonth
                            source: path_to_menuIcons + fileIcon_BackNext;
                            anchors.fill: parent;
                            rotation: 180;
                        }
                        MouseArea
                        {
                            anchors.fill: parent;
                            onClicked:
                            {
                                console.log("next month pressed" + setCurrentMonth);
//                                console.log("value = "+ CD.dayofweek(2001,9,9));
                            }
                        }
                    }//end of next month button
                }




            }




        }//end of base month

        Rectangle
        {
            id:baseWeekDays;
            width: parent.width/1.20;
            height: baseTextMonth.height/1.5;
            color: cBG_Unknown;
            anchors.top:baseTextMonth.bottom;
            anchors.horizontalCenter: parent.horizontalCenter;

            MyWeekDayPicker
            {
                setLimitForTexts:50;
                setViewOnly:setCalenderOnlyView;
                textAPick:"Monday";
                textBPick:"Tuesday";
                textCPick:"Wednesday";
                textDPick: "Thursday";
                textEPick: "Friday";
                textFPick: "Saturday";
                textGPick: "Sunday";
            }
        }

        Rectangle
        {
            id:baseDays;
            width: parent.width/1.20;
            height: setCalenderOnlyView? parent.height/1.42 :parent.height/1.52;
            color:cBG_Unknown;
            anchors
            {
                horizontalCenter:parent.horizontalCenter;
                top:baseWeekDays.bottom;
            }
            MyDayPicker
            {
                setViewOnlyStatus : setCalenderOnlyView;
                setYear: setCurrentYear;
                setMonth: setCurrentMonth;
            }
        }


    }

}
