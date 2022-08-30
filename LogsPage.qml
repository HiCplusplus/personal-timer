import QtQuick 2.15
import "theControls"
import "thePages"
import "theScripts/theDataBaseSystem/saveLoadLogs.js" as SaveLoadLogs
import "thePages/theLogs/"

Item
{
    signal goToLogSetPage;
    signal refreshListModel;
    signal goToLogMessages;
    signal goBackToLogs;
    onGoBackToLogs:
    {
        logMessagesBase.visible=false;
        root.visible=true;
    }

    onGoToLogMessages:
    {
        root.visible=false;
        logMessagesBase.visible=true;
    }

    onRefreshListModel:
    {
        listModelMain.clear();
        if(JSON.stringify(SaveLoadLogs.get()).length > 17) //to avoid Syntax error Json.parse error showsup when table is clear
        {
            var allObject = JSON.parse(SaveLoadLogs.get());
            for(var i=0; i<allObject.logs.length; i++)
            {
                listModelMain.append({
                                         id: allObject.logs[i].id,
                                         name:allObject.logs[i].name,
                                         priority: allObject.logs[i].priority,
                                         tag: allObject.logs[i].tags,
                                     });

            }
        }
        else //table is empty and json has error
        {
            console.log("LOG NOT FOUND(logs are 0)/Table isnt exists");
        }

    }

    Component.onCompleted:
    {
        refreshListModel();
    }


    anchors.fill: parent;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:cBG;

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
                        text: name;
                        color:cTxt_button;
                        anchors.horizontalCenter: parent.horizontalCenter;

                    }
                    Text
                    {
                        id:tagtag;
                        text: tag;
                        color:cTxt_button;
                        anchors.horizontalCenter: parent.horizontalCenter;
                        anchors.top:namename.bottom;
                    }
                    Text
                    {
                        text: priority;
                        color:cTxt_button;
                        anchors.horizontalCenter: parent.horizontalCenter;
                        anchors.top:tagtag.bottom;
                    }

                    MouseArea
                    {
                        anchors.fill:parent;
                        onClicked:
                        {
                            console.log("on log " + name + " id=" + id + " clicked.");
                            logMessages.setLogId = id;
                            logMessages.refreshListModel();
                            goToLogMessages();
                        }
                    }
                }

            }//end of item delegate

        }//end of list view





        MyThreeBottomButtons
        {
            id:idMyThreeBottomButtons;
            width: root.width;
            height:root.height/10.5;
            setCenterButtonText: "+";
            setLeftButtonText: "";
            setRightButtonText: ""; //null string make em invisible
            setCenterButtonCircleStyled: true;

            anchors
            {
                bottom:root.bottom;
                bottomMargin:15;
            }
            onCenterButtonPressed:
            {
                goToLogSetPage();
            }
        }
    }//end of root

    Rectangle
    {
        id:logMessagesBase;
        anchors.fill:parent;
        visible:false;
        LogMessages
        {
            id:logMessages;
            onGoToLogs:
            {
                goBackToLogs();
            }
        }
    }
}//end of item



