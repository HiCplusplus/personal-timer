import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../theControls"
import "../../thePages"
import "../../theScripts/theDataBaseSystem/saveLoadLogs.js" as SaveLoadLogs
import "../../thePages/theLogs/"

Item
{
    signal goToLogSetPage;
    signal refreshListModel;
    signal goToLogMessages;
    signal goBackToLogs;
    signal resetValueMiniMenuEditDelete;
    onResetValueMiniMenuEditDelete:
    {
        selectedElementToDeleteOrEdit=-1;
        miniMenu_edit_delete.visible=false;
    }

    property int selectedElementToDeleteOrEdit:-1;

    onGoBackToLogs:
    {
        logMessagesBase.visible=false;
        resetValueMiniMenuEditDelete();
        root.visible=true;
    }

    onGoToLogMessages:
    {
        root.visible=false;
        resetValueMiniMenuEditDelete();
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
                                         name: allObject.logs[i].name.length > 7 ? allObject.logs[i].name.slice(0,6) + ".." :  allObject.logs[i].name,
                                         priority: allObject.logs[i].priority,
                                         tag: allObject.logs[i].tags,
                                     });

            }
        }
        else //table is empty and json has error
        {
            console.log("(from LogsPage) LOG NOT FOUND(logs are 0)/Table isnt exists");
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
            anchors.topMargin:35;
            clip:true;
            model:
            ListModel
            {
                id:listModelMain;
            }
            delegate:
            Item
            {
                id:itemmm2;
                width: listViewMain.width;
                height: 70;
                Rectangle
                {
                    anchors.fill: parent;
                    color:cBG;
                    Rectangle
                    {
                        width: parent.width/1.10;
                        height: 50;
                        color: cBG_element;
                        radius:15;
                        anchors.horizontalCenter: parent.horizontalCenter;

                        Text
                        {
                            text: name;
                            font.family: gFontFamily;
                            color:cTxt_button;
                            font.pointSize: 18;
                            width:parent.width/3;
                            clip:true;
                            anchors
                            {
                                verticalCenter:parent.verticalCenter;
                                left:parent.left;
                                leftMargin: 30;
                            }

                        }
                        Text
                        {
                            text: tag;
                            font.family: gFontFamily;
                            color:cTxt_button;
                            font.pointSize: 12;
                            width:parent.width/5;
                            clip:true;
                            anchors
                            {
                                verticalCenter:parent.verticalCenter;
                                right:parent.right;
                                rightMargin: 30;
                            }
                        }



                        MouseArea
                        {
                            anchors.fill:parent;
                            onClicked:
                            {
                                logMessages.setLogId = id;
                                logMessages.setLogName = name;
                                logMessages.refreshListModel();
                                stack_log_titles = "Logs/Message";
                                appTitle = stack_log_titles;
                                goToLogMessages();
                            }
                            onPressAndHold:
                            {
                                miniMenu_edit_delete.visible=true;
                                const valY = itemmm2.y;
                                if(valY >= root.height)
                                {
                                    console.log("(from LogsPage) id & x & Y press and holded item id=" + id + "-x=" + itemmm2.x + "-y="+itemmm2.y);
                                    console.log('(from LogsPage) problem: the y is more than view os its going very down + 1 element isnt include (bcz of myIndicator Height)');
                                }
                                else
                                    miniMenu_edit_delete.posYselectedElement=valY;
                                selectedElementToDeleteOrEdit=id;
                            }
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
                stack_log_titles = "Logs/New";
                appTitle = stack_log_titles;
                resetValueMiniMenuEditDelete();
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


    MiniMenuEditAndDelete
    {
        id:miniMenu_edit_delete;
        z:10;

        onCancelButton:
        {
            resetValueMiniMenuEditDelete();
        }

        onRemoveAnElement:
        {
            if(selectedElementToDeleteOrEdit>0)
            {
                if(SaveLoadLogs.removeElement(selectedElementToDeleteOrEdit) === "OK")
                {
                    console.log("(from LogsPage) message success delete element.");
                    refreshListModel();
                    resetValueMiniMenuEditDelete();
                }
                else
                    console.log("(from LogsPage) message faile to delete element.");
            }
            else
            {
                console.log("(from LogsPage) error, wrong element id="+selectedElementToDeleteOrEdit);
            }
        }
    }
}//end of item



