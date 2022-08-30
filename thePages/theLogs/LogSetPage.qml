import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../theControls"
import "../../theScripts/theDataBaseSystem/saveLoadLogs.js" as SaveLogs
Item
{
    signal updateLogsListModel;
    signal btnCancel;

    property int setMaxCharLogName:25;
    property int setMaxCharLogTag:25;


    property variant setPriorityValues:
        ["01","02","03","04","05","06","07","08","09","10",
        "11","12","13","14","15","16","17","18","19","20",
        "21","22","23","24","25","26","27","28","29","30",
        "31","32","33","34","35","36","37","38","39","40",
        "41","42","43","44","45","46","47","48","49","50",
        "51","52","53","54","55","56","57","58","59","60"];

    anchors.fill:parent;


    MyCancelSaveButton
    {
        id:myCancelSaveButtons; //here used as SAVE
        onButtonSaveClicked:
        {
            if(logName.text !== "")
            {
                console.log(logName.text,setPriorityValues[priorityTumbler.currentIndex],logTag.text);

                SaveLogs.set(logName.text,setPriorityValues[priorityTumbler.currentIndex],logTag.text);
                updateLogsListModel();
                btnCancel();
            }




        }
        onButtonCancelClicked: { btnCancel(); }
    }


    Rectangle
    {
        id:baseLogName;
        anchors.horizontalCenter: parent.horizontalCenter;
        width:200;
        height:40;
        color:"red";
        anchors.top:myCancelSaveButtons.bottom;
        TextEdit
        {
            id:logName;
            width: parent.width;
            height:parent.height/1.5;
            font.family: gFontFamily;
            font.pointSize: 12.50;

            color:cTxt_button;
            enabled: true;

            Text
            {
                text: "Enter log name here...";
                color: "#aaa";
                visible: !logName.text;
            }
            onTextChanged:
            {
                if(logName.length >= setMaxCharLogName)
                {
                    logName.text = logName.text.slice(0,setMaxCharLogName);
                    logName.cursorPosition=setMaxCharLogName;
                }
            }
        }
    }//end of log name base









    Rectangle
    {
        id:baseLogTag;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top:baseLogName.bottom;
        width:200;
        height:40;
        color:"green";
        TextEdit
        {
            id:logTag;
            width: parent.width;
            height:parent.height/1.5;
            font.family: gFontFamily;
            font.pointSize: 12.50;

            color:cTxt_button;
            enabled: true;

            Text
            {
                text: "Enter log tags here...";
                color: "#aaa";
                visible: !logTag.text;
            }
            onTextChanged:
            {
                if(logTag.length >= setMaxCharLogTag)
                {
                    logTag.text = logTag.text.slice(0,setMaxCharLogTag);
                    logTag.cursorPosition=setMaxCharLogTag;
                }
            }
        }
    }//end of log name base





    Rectangle
    {
        id:baseLogPriority;
        anchors.horizontalCenter: parent.horizontalCenter;
        width:200;
        height:40;
        color:"yellow";
        anchors.top: baseLogTag.bottom;
        Tumbler
        {
            id: priorityTumbler;
            width: parent.width/3;
            model:setPriorityValues;
            currentIndex: 1;
            font.bold: true;
            font.pointSize: 30;
            visibleItemCount: 4;
        }
    }

}
