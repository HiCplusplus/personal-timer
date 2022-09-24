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
    property string setEventGroupName: "";

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
            for(var i=0; i<allObject.events.length; i++)
            {
                listModelMain.append({
                                         id: allObject.events[i].id,
                                         name:allObject.events[i].name,
                                         priority: allObject.events[i].priority,
                                         tag: allObject.events[i].tags,
                                         estart: allObject.events[i].start,
                                         eend: allObject.events[i].end,
                                         eactive: allObject.events[i].active,
                                         elocation: allObject.events[i].location,
                                         edescription : allObject.events[i].description,
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
            id:baseLocalMenuBar;
            width: parent.width;
            height: 45;
            color:cBG;
            Text
            {
                text: setEventGroupName.length > 10 ? setEventGroupName.slice(0,9) + "..'s events" :  setEventGroupName + "'s events";
                font.pointSize: 15;
                font.family: gFontFamily;
                font.bold: true;
                anchors.centerIn: parent;
                color: cTxt_button;
            }

            Rectangle
            {
                id:backToEventGroups;
                anchors.left:baseLocalMenuBar.left;
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
                        stack_event_titles = "EventGroups";
                        appTitle = stack_event_titles;
                    }
                }
            }
        }




        ListView
        {
            id:listViewMain;
            anchors.fill:parent;
            anchors.topMargin:50; //35 to 45,50 for backbutton to eventgorups
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
                height: 145;
                Rectangle
                {
                    anchors.fill: parent;
                    color:cBG;
                    Rectangle
                    {
                        width: parent.width/1.10;
                        height: 125;
                        color: cBG_element;
                        radius:15;
                        anchors.horizontalCenter: parent.horizontalCenter;

                        Text
                        {
                            text: name + "\n" + estart + "\n" + eend + "\n" + eactive;
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
                            text: tag + "\n" + priority + "\n" + elocation + "\n"+ edescription;
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
                                console.log("on eventid " + id + " clicked");
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
                stack_event_titles = "EG/E/New";
                appTitle = stack_event_titles;
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



