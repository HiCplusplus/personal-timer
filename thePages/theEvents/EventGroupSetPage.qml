import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../theControls"
import "../../theScripts/theDataBaseSystem/saveLoadEventGroups.js" as SaveEventGroups
Item
{
    property variant updateModeData: [-1,"","",0]; //id , name , tag , priority.
    signal updateModeEnabledActions;

    onUpdateModeEnabledActions:
    {
        if(updateModeData[0] === -1)
            console.log("(from EventgroupSetPage) updateModeData invalid id.");
        else
        {
            logName.text = updateModeData[1];//name
            logTag.text = updateModeData[2];//tag
            priorityTumbler.currentIndex = updateModeData[3];//priorty
//            myCancelSaveButtons.setTextButtonSave = "Update";
            console.log("(from EventgroupSetPage) updateModeData succsufully data filled.");
        }
    }



    signal updateLogsListModel;
    signal btnCancel;
    onBtnCancel:
    {
        stack_event_titles = "EG/";
        logName.text = logTag.text = "";
        priorityTumbler.currentIndex = 0;
        updateModeData= [-1,"","",0];
    }

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
        setTextButtonSave: updateModeData[0]===-1? "Save":"Update";
        onButtonSaveClicked:
        {
            if(logName.text !== "" &&  updateModeData[0]===-1)
            {
                if(SaveEventGroups.set(logName.text,setPriorityValues[priorityTumbler.currentIndex],logTag.text)==="OK")
                {
                    console.log("(from EventgroupSetPage) eventgroup succesfully created.");
                    updateLogsListModel();
                    btnCancel();
                }
                else
                    console.log("(from EventgroupSetPage) eventgroup failed to create.");

            }
            else
            {

                if(SaveEventGroups.updateElement(updateModeData[0],logName.text,logTag.text,priorityTumbler.currentIndex) === "OK")
                {
                    console.log("(from EventgroupSetPage) eventgroup succesfully updated.");
                    updateLogsListModel();
                    btnCancel();
                }
                else
                    console.log("(from EventgroupSetPage) eventgroup failed to update.");
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
        TextArea//TextEdit
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
                text: "Enter eventgroup title here...";
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

        TextArea//TextEdit
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
                text: "Enter eventgroup tags here...";
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
