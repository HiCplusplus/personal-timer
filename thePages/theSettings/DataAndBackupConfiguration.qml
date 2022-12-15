import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../theScripts/theAPI_v1/connectionInfo.js" as GetApiInfo

import "../../theScripts/theAPI_v1/syncSettings.js" as SyncSettings
import "../../theScripts/theDataBaseSystem/saveLoadSettings.js" as LoadSettings


import "../../theScripts/theAPI_v1/syncLogs.js" as SyncLogs
import "../../theScripts/theDataBaseSystem/saveLoadLogs.js" as SaveLoadLogs


import "../../theScripts/theAPI_v1/syncLogMessages.js" as SyncLogMessage
import "../../theScripts/theDataBaseSystem/saveLoadLogMessages.js" as SaveLoadLogMessages

Item
{
    anchors.fill: parent;
    ScrollView
    {
        anchors.fill:parent;
        Column
        {
            anchors.fill:parent;
            spacing:10;
            Rectangle
            {
                width:parent.width
                height:50;
                color:"gray"
                Text
                {
                    text: "get backup from settings";
                    anchors.centerIn: parent;
                    color:"black";
                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        console.log("on settings backup clicked");
                        SyncSettings.insertOrUpdate(GetApiInfo.get_api_url()+"saveSettings.php","darkmode",LoadSettings.get("darkmode"),GetApiInfo.get_AccessKey_Api_v1());
                    }
                }
            }


            Rectangle
            {
                width:parent.width
                height:50;
                color:"gray"
                Text
                {
                    text: "get backup from logs+messages\n";
                    anchors.centerIn: parent;
                    color:"black";
                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        console.log("on logs+messages backup clicked");
                        /*
                            first fetch the api info, check the local table logs, if its not empty or existed then round inside the table logs
                            on each round send collected data to api then with that LogId fetch exists data
                            with that logId inside LogMessages table. then send those into api.
                            with that senario will first get backup from log(i mean somehting like log group/ or imagen something like chat)
                            then going on that selected chat and fetch and get backup from those messages inside that chat.
                            after rounds we got backup from chats, we have backup from messages too.

                        */
                        const userAccessKey = GetApiInfo.get_AccessKey_Api_v1();
                        const userApiURL = GetApiInfo.get_api_url();
                        const mydata = [];
                        if(JSON.stringify(SaveLoadLogs.get()).length > 17) //to avoid Syntax error Json.parse error showsup when table is clear
                        {
                            var allObject = JSON.parse(SaveLoadLogs.get());
                            console.log(allObject.logs[0]+"\t"+allObject.logs[1]+"\t"+allObject.logs[2]+"\n\n\n\n");
                            for(var i=0; i<allObject.logs.length; i++)
                            {
                                mydata[i] = "id="+allObject.logs[i].id+"&name="+ allObject.logs[i].name+"&priority="+allObject.logs[i].priority+"&tag="+allObject.logs[i].tags+"&ukey="+userAccessKey;
                                 console.log("mydata["+i+"]=" + mydata[i]);
//                                if(SyncLogs.insertOrUpdate(userApiURL+"saveLog.php",mydata[i])<0)
//                                    console.log("DataAndBackup.qml -> syncLogs -> insert/update index " + i + " failed, data= "+mydata[i]);
                                console.log(SyncLogs.insertOrUpdate(userApiURL+"saveLog.php",mydata[i]))

                                //do that log id , backup messages
                                if(JSON.stringify(SaveLoadLogMessages.get(allObject.logs[i].id)).length > 24) //to avoid Syntax error Json.parse error showsup when table is clear
                                {
                                    var allObject_logMessage = JSON.parse(SaveLoadLogMessages.get(allObject.logs[i].id));
                                    for(var x=0; x<allObject_logMessage.logMessages.length; x++)
                                    {
                                        const logMessage_data = "id="+allObject_logMessage.logMessages[x].id+"&lid="+allObject.logs[i].id+"&text="+allObject_logMessage.logMessages[x].text+"&date="+allObject_logMessage.logMessages[x].date+"&ukey="+userAccessKey;
                                        console.log("\nmessagedata="+logMessage_data+"\n");
                                        SyncLogMessage.insertOrUpdate(userApiURL+"saveLogMessage.php",logMessage_data);
                                    }

                                }
                                else //table is empty and json has error
                                {
                                    console.log("syncLogs ERROR : -> syncLogMessage -> LOG MESSAGES ARE NOT FOUND(logMessages are 0)/Table isnt exists \t log_id=" +i);
                                }


                            }                        
                        }
                        else //table is empty and json has error
                        {
                            console.log("syncLogs ERROR : (from LogsPage) LOG NOT FOUND(logs are 0)/Table isnt exists");
                        }
                    }
                }
            }
        }
    }
}
