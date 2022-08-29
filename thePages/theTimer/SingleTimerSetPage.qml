import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../theControls"

Item
{
    anchors.fill: parent;
    clip:true;
    signal buttonStartClicked;
    property int selectHour;
    property int selectMinute;
    property int selectSecond;

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
    }

    Rectangle
    {
        id:baseSetClock;
        width: parent.width/1.50;
        height:parent.height/3;
        anchors.centerIn: parent;
        color:cBG_Unknown;
        Row
        {
            id: row;
            anchors.fill: parent;
            Tumbler
            {
                id: hoursTumbler;
                width: parent.width/3.15;
                model: setHourValues;
                font.bold: true;
                font.pointSize: 30;
                visibleItemCount: 4;
            }
            Text
            {
                text: ":";
                anchors.top:parent.top;
                anchors.topMargin: parent.height/3
                font.bold: true;
                font.pointSize: 30;
                color:cTxt_button;//themeDarkMode? "#353436": "black";
            }
            Tumbler
            {
                id: minutesTumbler;
                width: parent.width/3.15;
                model: setSecond_MinutesValues;
                font.bold: true;
                font.pointSize: 30;
                visibleItemCount: 4;

            }
            Text
            {
                text: ":";
                anchors.top:parent.top;
                anchors.topMargin: parent.height/3
                font.bold: true;
                font.pointSize: 30;
                color:cTxt_button;//themeDarkMode? "#353436": "black";
            }
            Tumbler
            {
                id: secondsTumbler;
                width: parent.width/3.15;
                model: setSecond_MinutesValues;
                font.bold: true;
                font.pointSize: 30;
                visibleItemCount: 4;
            }

        }
    }
    MyThreeBottomButtons
    {
        id:sportButtons;
        width: root.width;
        height:root.height/10.5;
        setCenterButtonText: "Start";
        setLeftButtonText: "Reset";
        setRightButtonText: "";
        anchors
        {
            bottom:root.bottom;
            bottomMargin:15;
        }
        onCenterButtonPressed:
        {
            selectHour = hoursTumbler.currentIndex;
            selectMinute = minutesTumbler.currentIndex;
            selectSecond = secondsTumbler.currentIndex;
            buttonStartClicked();
        }
        onLeftButtonPressed:
        {
            hoursTumbler.currentIndex=0;
            minutesTumbler.currentIndex=0;
            secondsTumbler.currentIndex=0;
        }
    }
}
