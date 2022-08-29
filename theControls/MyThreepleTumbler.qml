import QtQuick 2.15
import QtQuick.Controls 2.15

Item
{
    anchors.fill: parent;
    property bool setSingleTumbler: false;
    property bool setShowSecondTitle: false;
    //when its single just get output from selectHour
    //when its single indexes are ++ because we dont have index 0 with value 00



    property string setTextTitle: "Empty";
    property int selectHour;
    property int selectMinute;
    property int selectSecond;
    property int selectSecondCountDownBeforeRoundStart;

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
        "91","92","93","94","95","96","97","98","99"];


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


    Text
    {
        id:textTitle;
        text: setTextTitle;
        font.family: gFontFamily;
        font.pointSize: setTextTitle.length > 6 ? 15:18;
        color:cTxt_button;
        z:3;
        anchors.centerIn:tabAlarmSetValue;
    }



    Rectangle
    {
        id:baseIconA; //A -> right 1
        width: 17;
        height:17;
        z:3;
        color:cBG_Unknown;
        anchors.right:tabAlarmSetValue.right;
        anchors.top:textTitle.top;
        anchors.topMargin: setTextTitle.length > 6 ? 5 : 10;

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


    Rectangle
    {
        id:tabAlarmSetValue;
        width:parent.width/2.50; //3.50;
        height:25;
        color:cBG_element;
        anchors
        {
            left:alarmSetValue.left;
            bottom:alarmSetValue.top;
            bottomMargin:-8;
        }
        radius:7;

    }
    Rectangle
    {
        width:45;
        height:30;
        color:cBG_element;
        rotation: 55;
        anchors
        {
            left:tabAlarmSetValue.right;
            leftMargin:-22;
            topMargin:8.80;
            top:tabAlarmSetValue.top;
        }
        radius:7;
    }


    Rectangle
    {
        z:2;
        id:alarmSetValue
        width:parent.width/1.20;
        height:250;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top:parent.top
        anchors.topMargin: 30;
        radius:7;
        color:cBG_element;

        Rectangle
        {
            id:baseTumblers;
            anchors.fill: parent;
            anchors.topMargin: 25;
            color:cBG_element;

            Row
            {
                id: row;
                anchors.fill: parent;

                Tumbler
                {
                    id: hoursTumbler;
                    width: setSingleTumbler? parent.width: parent.width/3.15 ;
                    model: setSingleTumbler? (setShowSecondTitle ? setHourValues : setRepeatValues) : setHourValues;
                    font.bold: true;
                    font.pointSize: 30;
                    visibleItemCount:4;
                    onCurrentIndexChanged:
                    {
                        selectHour = hoursTumbler.currentIndex;
                        if(setSingleTumbler && !setShowSecondTitle)
                        {
                            selectHour++; //++ because index is from 0 to 99 and values start from 1 to 100, only index 0 used
                        }
                    }
                    Text
                    {
                        text: setShowSecondTitle? "Sec":"Hour";
                        anchors.horizontalCenter: hoursTumbler.horizontalCenter;
                        visible: setSingleTumbler? (setShowSecondTitle ? true : false) : true;
                        font.pointSize: 15;
                        font.family: gFontFamily;
                        color:cTxt_button;//themeDarkMode? "#353436": "black";
                    }
                }
                Text
                {
                    text: ":";
                    anchors.top:parent.top;
                    anchors.topMargin: parent.height/3;
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
                    anchors.top:parent.top;
                    anchors.topMargin: parent.height/3;
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
