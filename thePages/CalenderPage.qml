import QtQuick 2.15
import QtGraphicalEffects 1.15
 import QtQuick.Controls 1.4
import "../theControls"
Item
{
    anchors.fill: parent;
    property int c_day : 20;
    property int c_month: 8;
    property int c_year: 2022;
    property variant c_picked_day: [c_day];//it must be filled [2,...] !!!! not an int/string
    property bool c_viewOnly: true;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:cBG;


        Rectangle
        {
            id:coloredRectangle;
            width: parent.width;
            height:parent.height/4;
            color:cBG_button;
        }

        Rectangle
        {
            id:circleBase;
            width: root.height/3.50;
            height:width;
            color:cTxt_title;
            radius:width;
            anchors
            {
                horizontalCenter:parent.horizontalCenter;
                top:coloredRectangle.top;
                topMargin:coloredRectangle.height/2.50;
            }
            border.width: 0.25;
            border.color:"black";

            Rectangle
            {
                id:circleMiddle;
                width: circleBase.height/1.20;
                height:width;
                color:cTxt_title;
                radius:width;
                anchors
                {
                    centerIn:parent;
                }
                border.width: 0.25;
                border.color:"black";
                Rectangle
                {
                    width:parent.width/2;
                    height:parent.height/1.60;
                    color:cBG_Unknown;
                    anchors.centerIn:parent;
                    Text
                    {
                        id:textDayNumber;
                        text:c_day;
                        color:"white";
                        font.pointSize: 35;
                        font.bold: true;
                        font.family: gFontFamily;
                        anchors
                        {
                            horizontalCenter:parent.horizontalCenter;
                            top:parent.top;
                        }
                    }
                    Text
                    {
                        id: textWeekDay;
                        text: "Wednesday";
                        color:"white";
                        font.pointSize: 15.50;
                        font.bold: true;
                        font.family: gFontFamily;
                        anchors
                        {
                            horizontalCenter:parent.horizontalCenter;
                            bottom:parent.bottom;
                        }
                    }

                }
            }
            DropShadow
            {
                anchors.fill: circleMiddle;
                horizontalOffset: 3;
                verticalOffset: 3;
                radius: 8.0;
                samples: 17;
                color: "#80000000";
                source: circleMiddle;
            }

        }//end of circlebase
        DropShadow
        {
            anchors.fill: circleBase;
            horizontalOffset: 3;
            verticalOffset: 3;
            radius: 16.0;
            samples: 17;
            color: "#80000000";
            source: circleBase;
        }


        Rectangle
        {
            id:baseCalender;
            width: parent.width/1.15;
            height: parent.height/1.85;
            color:cBG_element;
            radius:15;
            anchors
            {
                top:circleBase.bottom;
                horizontalCenter:parent.horizontalCenter;
                topMargin:25;
            }
            MyCalender
            {
                setCurrentYear: c_year;
                setCurrentMonth: c_month;
                setCurrentDays: c_picked_day;
                setCalenderOnlyView: c_viewOnly;
//                setTextWeek: ["شنبه"
//                    ,"یکشنبه"
//                    ,"دوشنبه"
//                    ,"سه شنبه"
//                    ,"چهارشنبه"
//                    ,"5shnbe"
//                    ,"jome"];
            }

        }
    }//end of root
}
