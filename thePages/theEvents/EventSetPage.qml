import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../theControls"
import "../../theScripts/theDataBaseSystem/saveLoadEvents.js" as SaveEvents
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
                SaveEvents.set(logName.text,setPriorityValues[priorityTumbler.currentIndex],logTag.text);
                updateLogsListModel();
                btnCancel();
            }
        }
        onButtonCancelClicked: { btnCancel(); }
    }


    Rectangle
    {
        id:baseLogName;
        anchors
        {
            horizontalCenter: parent.horizontalCenter;
            top:myCancelSaveButtons.bottom;
            topMargin: 50;
        }
        width:parent.width/1.10;
        height:50;
        color:cBG_element;
        radius: 15;
        TextEdit
        {
            id:logName;
            anchors.fill:parent;
            horizontalAlignment: TextInput.AlignHCenter;
            verticalAlignment: TextInput.AlignVCenter;
            font.family: gFontFamily;
            font.pointSize: 12.50;
            color:cTxt_button;
            enabled: true;
            clip:true;
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere;

            Text
            {
                text: "Enter Log name here...";
                color: "#aaa";
                visible: !logName.text;
                anchors.centerIn:parent;
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
        anchors
        {
            horizontalCenter: parent.horizontalCenter;
            top:baseLogName.bottom;
            topMargin: 25;
        }
        width:parent.width/1.10;
        height:50;
        color:cBG_element;
        radius: 15;

        TextEdit
        {
            id:logTag;
            anchors.fill:parent;
            horizontalAlignment: TextInput.AlignHCenter;
            verticalAlignment: TextInput.AlignVCenter;
            font.family: gFontFamily;
            font.pointSize: 12.50;
            color:cTxt_button;
            enabled: true;
            clip:true;
            wrapMode: Text.WrapAtWordBoundaryOrAnywhere;
            Text
            {
                text: "Enter log tags here...";
                color: "#aaa";
                visible: !logTag.text;
                anchors.centerIn:parent;
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
        anchors
        {
            horizontalCenter: parent.horizontalCenter;
            top:baseLogTag.bottom;
            topMargin: 25;
        }
        width:parent.width/1.10;
        height:200;
        color:cBG_element;
        radius: 15;
        clip:true;
        Tumbler
        {
            id: priorityTumbler;
            width: parent.width/3;
            model:setPriorityValues;
            currentIndex: 1;
            font.bold: true;
            font.pointSize: 30;
            visibleItemCount: 4;
            anchors
            {
                centerIn:parent;
            }
        }
    }

}
