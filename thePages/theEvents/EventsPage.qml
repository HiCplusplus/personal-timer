import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../theControls"
import "../../thePages"
import "../../theScripts/theDataBaseSystem/saveLoadEvents.js" as SaveLoadEvents
import "../../thePages/theLogs/"

Item
{

    signal refreshListModel;
    signal goToLogMessages;
    signal goBackToLogs;
    signal goBackToEventGroupsFromEvents;
    property int setEventGroupId : 0;

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
        if(setEventGroupId==0)
            console.log("error from EventsPage.qml a property value is not fill complete.");


        if(JSON.stringify(SaveLoadEvents.get(setEventGroupId)).length > 24) //to avoid Syntax error Json.parse error showsup when table is clear
        {
            var allObject = JSON.parse(SaveLoadEvents.get(setEventGroupId));
            for(var i=0; i<allObject.eventGroups.length; i++)
            {
                listModelMain.append({
                                         id: allObject.eventGroups[i].id,
                                         name:allObject.eventGroups[i].name,
                                         priority: allObject.eventGroups[i].priority,
                                         tag: allObject.eventGroups[i].tags,
                                     });

            }
        }
        else //table is empty and json has error
        {
            console.log("Events NOT FOUND(events are 0)/Table isnt exists");
        }

    }

    Component.onCompleted:
    {
//        refreshListModel();
    }


    anchors.fill: parent;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:cBG;
        Rectangle
        {
            id:backToLogs;
            anchors.left:root.left;
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
                    goBackToEventGroupsFromEvents();
                }
            }
        }



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
//                                logMessages.setLogId = id;
//                                logMessages.setLogName = name;
//                                logMessages.refreshListModel();
//                                goToLogMessages();
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
                goToEventSetPage();
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
//            onGoToLogs:
//            {
//                goBackToLogs();
//            }
        }
    }
}//end of item



