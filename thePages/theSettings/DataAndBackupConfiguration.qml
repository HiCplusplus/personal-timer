import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../theScripts/theAPI_v1/connectionInfo.js" as GetApiInfo

import "../../theScripts/theAPI_v1/syncSettings.js" as SyncSettings
import "../../theScripts/theDataBaseSystem/saveLoadSettings.js" as LoadSettings


import "../../theScripts/theAPI_v1/syncLogs.js" as SyncLogs
import "../../theScripts/theDataBaseSystem/saveLoadLogs.js" as SaveLoadLogs


//import "../../theScripts/theAPI_v1/syncLogMessages.js" as SyncLogMessage
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
                        const userAccessKey = GetApiInfo.get_AccessKey_Api_v1();
                        const userApiURL = GetApiInfo.get_api_url();
                        const mydata = [];
                        if(JSON.stringify(SaveLoadLogs.get()).length > 17) //to avoid Syntax error Json.parse error showsup when table is clear
                        {
                            var allObject = JSON.parse(SaveLoadLogs.get());
                            for(var i=0; i<allObject.logs.length; i++)
                            {
                                mydata[i] = "id="+allObject.logs[i].id+"&name="+ allObject.logs[i].name+"&priority="+allObject.logs[i].priority+"&tag="+allObject.logs[i].tags+"&ukey="+userAccessKey;
                                 console.log("mydata["+i+"]=" + mydata[i]);
//                                if(SyncLogs.insertOrUpdate(userApiURL+"saveLog.php",mydata[i])<0)
//                                    console.log("DataAndBackup.qml -> syncLogs -> insert/update index " + i + " failed, data= "+mydata[i]);
                                console.log(SyncLogs.insertOrUpdate(userApiURL+"saveLog.php",mydata[i]))
                            }
                            console.log("DataAndBackup.qml -> syncLogs -> all done, ready to insert/update log messages.");
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
