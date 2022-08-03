import QtQuick 2.0

Item
{
    property int setFontCalender:10;
    property int setFontSizeMonth: 25;
    property string setTextMonth: "January";
    property int setTopMarginMonth: 5;
    property int setLeftRightMarginNextBackMonth:5;

    property bool setCalenderOnlyView: false;//true;


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
                horizontalCenter: parent.horizontalCenter;
                top:root.top;
                topMargin:setTopMarginMonth;
            }
            color:cBG_Unknown;
            width: parent.width;
            height:50;

            Text
            {
                id: textMonth;
                color:cTxt_button;
                text: setTextMonth;
                font.pointSize: setFontSizeMonth;
                font.bold: true;
                font.family: gFontFamily;
                anchors.centerIn: parent;
            }

            Rectangle
            {
                id:baseBackMonth;
                width: 35;
                height:width;
                visible: setCalenderOnlyView?false:true;
                color:cBG_Unknown;
                anchors
                {
                    right:textMonth.left;
                    rightMargin:setLeftRightMarginNextBackMonth;
                    top:textMonth.top;
                    topMargin:setTopMarginMonth*2;
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
                    }
                }
            }//end of back month button

            Rectangle
            {
                id:baseNextMonth;
                width: 35;
                height:width;
                visible: setCalenderOnlyView?false:true;
                color:cBG_Unknown;
                anchors
                {
                    left:textMonth.right;
                    leftMargin:setLeftRightMarginNextBackMonth;
                    top:textMonth.top;
                    topMargin:setTopMarginMonth*2;
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
                        console.log("next month pressed");
                    }
                }
            }//end of next month button

        }


    }

}
