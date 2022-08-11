import QtQuick 2.15
import QtQuick.Controls 2.15

Item
{
    anchors.fill: parent;
    property bool setSingleTumbler: false;
    //when its single just get output from selectHour
    //when its single indexes are ++ because we dont have index 0 with value 00



    property string setTextTitle: "Empty";
    property int selectHour;
    property int selectMinute;
    property int selectSecond;

    property variant setRepeatValues :
        ["01","02","03","04","05","06","07","08","09","10",
        "11","12","13","14","15","16","17","18","19","20",
        "21","22","23","24","25","26","27","28","29","30",
        "31","32","33","34","35","36","37","38","39","40",
        "41","42","43","44","45","46","47","48","49","50",
        "51","52","53","54","55","56","57","58","59","60",
        "61","62","63","64","65","66","67","68","69","70",
        "71","72","73","74","75","76","77","78","79","80",
        "81","82","83","84","85","86","87","88","89","90",
        "91","92","93","94","95","96","97","98","99","100"];


    property variant setHourValues :
        ["00","01","02","03","04","05","06","07","08","09","10",
        "11","12","13","14","15","16","17","18","19","20",
        "21","22","23","24","25","26","27","28","29","30",
        "31","32","33","34","35","36","37","38","39","40",
        "41","42","43","44","45","46","47","48","49","50",
        "51","52","53","54","55","56","57","58","59","60",
        "61","62","63","64","65","66","67","68","69","70",
        "71","72","73","74","75","76","77","78","79","80",
        "81","82","83","84","85","86","87","88","89","90"];

    property variant setSecond_MinutesValues:
        ["00","01","02","03","04","05","06","07","08","09","10",
        "11","12","13","14","15","16","17","18","19","20",
        "21","22","23","24","25","26","27","28","29","30",
        "31","32","33","34","35","36","37","38","39","40",
        "41","42","43","44","45","46","47","48","49","50",
        "51","52","53","54","55","56","57","58","59"];



    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:cBG;
        Rectangle
        {
            id:titleTumblers;
            width: parent.width;
            height: 35;
            color:cBG_Unknown;
            anchors.top: root.top;
//            anchors.horizontalCenter: parent.horizontalCenter;
            Text
            {
                id: textTitle;
                text: setTextTitle;
                font.family: gFontFamily;
                font.pointSize: 20;
                font.bold: true;
                color:cTxt_button;
                anchors.verticalCenter: parent.verticalCenter;
                anchors.left:parent.left;
//                anchors.leftMargin: 15;
            }
            Rectangle
            {
                id:baseIconA; //A -> right 1
                width: 25;
                height:25;
                color:cBG_Unknown;
                anchors.verticalCenter: parent.verticalCenter;
                anchors.right: parent.right;
//                anchors.rightMargin: parent.width/10;
                Image
                {
                    anchors.fill:parent;
                    source: path_to_menuIcons + fileIcon_Reset;
                }
                MouseArea
                {
                    anchors.fill:parent;
                    onClicked:
                    {
                        if(setSingleTumbler)
                        {
                            hoursTumbler.currentIndex = 0;
                        }
                        else
                        {
                            hoursTumbler.currentIndex = 0;
                            minutesTumbler.currentIndex = 0;
                            secondsTumbler.currentIndex = 0;
                        }

                    }
                }
            }
        }


        Rectangle
        {
            anchors.fill: parent;
            anchors.top: titleTumblers.bottom;
            anchors.topMargin: 35;
//            border.width: 0.50;
            color:cBG_Unknown;
            Row
            {
                id: row;
                anchors.fill: parent;

                Tumbler
                {
                    id: hoursTumbler;
                    width: setSingleTumbler? parent.width: parent.width/3.15 ;
                    model: setSingleTumbler? setRepeatValues: setHourValues;
    //                currentIndex: 1;
                    font.bold: true;
                    font.pointSize: 30;
                    visibleItemCount:4;
                    onCurrentIndexChanged:
                    {
                        selectHour = hoursTumbler.currentIndex;
                        if(setSingleTumbler)
                        {
                            selectHour++; //++ because index is from 0 to 99 and values start from 1 to 100, only index 0 used
                        }
                    }
                    Text
                    {
                        text: "Hour";
                        anchors.horizontalCenter: hoursTumbler.horizontalCenter;
//                        font.bold: true;
                        visible: setSingleTumbler?false:true;
                        font.pointSize: 15;
                        font.family: gFontFamily;
                        color:cTxt_button;//themeDarkMode? "#353436": "black";
                    }
                }
                Text
                {
                    text: ":";
                    //anchors.verticalCenter: parent.verticalCenter;
                    anchors.top:parent.top;
                    anchors.topMargin: parent.height/2.20;
                    font.bold: true;
                    visible: setSingleTumbler?false:true;
                    font.pointSize: 30;
                    color:cTxt_button;//themeDarkMode? "#353436": "black";
                }
                Tumbler
                {
                    id: minutesTumbler;
                    width: parent.width/3.15;
                    model: setSecond_MinutesValues;
                    visible: setSingleTumbler?false:true;
                    font.bold: true;
                    font.pointSize: 30;
                    visibleItemCount: 4;
                    onCurrentIndexChanged:
                    {
                        selectMinute = minutesTumbler.currentIndex;
                    }
                    Text
                    {
                        text: "Min";
                        anchors.horizontalCenter: minutesTumbler.horizontalCenter;
//                        font.bold: true;
                        visible: setSingleTumbler?false:true;
                        font.pointSize: 15;
                        font.family: gFontFamily;
                        color:cTxt_button;//themeDarkMode? "#353436": "black";
                    }

                }
                Text
                {
                    text: ":";
                    visible: setSingleTumbler?false:true;
//                    anchors.verticalCenter: parent.verticalCenter;
                    anchors.top:parent.top;
                    anchors.topMargin: parent.height/2.20;
                    font.bold: true;
                    font.pointSize: 30;
                    color:cTxt_button;//themeDarkMode? "#353436": "black";
                }
                Tumbler
                {
                    id: secondsTumbler;
                    width: parent.width/3.15;
                    model: setSecond_MinutesValues;
                    visible: setSingleTumbler?false:true;
                    font.bold: true;
                    font.pointSize: 30;
                    visibleItemCount: 4;
                    onCurrentIndexChanged:
                    {
                        selectSecond = secondsTumbler.currentIndex;
                    }
                    Text
                    {
                        text: "Sec";
                        anchors.horizontalCenter: secondsTumbler.horizontalCenter;
//                        font.bold: true;
                        visible: setSingleTumbler?false:true;
                        font.pointSize: 15;
                        font.family: gFontFamily;
                        color:cTxt_button;//themeDarkMode? "#353436": "black";
                    }
                }

            }
        }
    }
}
