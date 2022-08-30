import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../theControls"
import "../../thePages"
import "../../theScripts/theDataBaseSystem/saveLoadLogMessages.js" as SaveLoadLogMessages
Item
{
//    signal changeStatusSwiperFromTimerDown;
    signal refreshListModel;
    property int setLogId: 0;
    property int setMaxCharLogText: 500;
    property int checkLengthText : 1;
    signal goToLogs;

    onRefreshListModel:
    {
        listModelMain.clear();
        if(JSON.stringify(SaveLoadLogMessages.get(setLogId)).length > 24) //to avoid Syntax error Json.parse error showsup when table is clear
        {
            var allObject = JSON.parse(SaveLoadLogMessages.get(setLogId));
            for(var i=0; i<allObject.logMessages.length; i++)
            {
                listModelMain.append({
                                         id:allObject.logMessages[i].id,
                                         logText: allObject.logMessages[i].text,
                                         date: allObject.logMessages[i].date,
                                     });

            }
        }
        else //table is empty and json has error
        {
            console.log("LOG MESSAGES ARE NOT FOUND(logMessages are 0)/Table isnt exists");
        }

    }



    anchors.fill: parent;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:cBG;
    }//end of root

    ListView
    {
        id:listViewMain;
        anchors.fill:parent;

        clip:true;
        model:
        ListModel
        {
            id:listModelMain;
        }
        delegate:
        Item
        {
            width: listViewMain.width;
            height: 160;
            Rectangle
            {
                anchors.fill: parent;
                color:cBG;
                Text
                {
                    id:namename;
                    text: id;
                    color:cTxt_button;
                    anchors.horizontalCenter: parent.horizontalCenter;

                }
                Text
                {
                    id:tagtag;
                    text: logText;
                    color:cTxt_button;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    anchors.top:namename.bottom;
                }
                Text
                {
                    text: date;
                    color:cTxt_button;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    anchors.top:tagtag.bottom;
                }
            }

        }//end of item delegate

    }//end of list view


    Rectangle
    {
        id:writeText;
        anchors.bottom: root.bottom;
        width:parent.width;
        height:45;
        color:"red";
        TextArea
        {
            id:logText;
            width: parent.width-45;
            height:parent.height;
            font.family: gFontFamily;
            font.pointSize: 12.50;
            wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere;

            color:cTxt_button;
            enabled: true;

            Text
            {
                text: "Enter text here...";
                color: "#aaa";
                visible: !logText.text;
            }
            onTextChanged:
            {

                function removeThings(text)
                {
                    text = text.replace("\t","");
                    text = text.replace("\n","");
                    return text;
                }
                logText.text = removeThings(logText.text);

                if(logText.length > logText.width/10-12 && logText.length < setMaxCharLogText)
                    writeText.height += 0.85;


                if(logText.length >= setMaxCharLogText)
                {
                    logText.text = logText.text.slice(0,setMaxCharLogText);
                    logText.cursorPosition=setMaxCharLogText;
                }
            }
        }


        Rectangle
        {
            id:iconSendOrSave;
            width:45;
            height:45;
            color:"yellow";
            anchors.verticalCenter:writeText.verticalCenter;
            anchors.right:writeText.right;


            MouseArea
            {
                anchors.fill:parent;
                onClicked:
                {
                    console.log("send button clicked");
                    SaveLoadLogMessages.set(setLogId,logText.text);
                    logText.text = "";
                    writeText.height = 45;
                    refreshListModel();

                    //code insert text

                }
            }
        }
    }


    Rectangle
    {
        id:backToLogs;
        anchors.left:root.left;
        anchors.top:root.top;
        width:45;
        height:45;
        color:cBG_Unknown;
        Image
        {
            anchors.fill: parent;
            source: "../../"+ path_to_menuIcons + fileIcon_BackNext;
        }

        MouseArea
        {
            anchors.fill:parent;
            onClicked:
            {
                console.log("back to logs");
                goToLogs();
            }
        }
    }




}//end of item
