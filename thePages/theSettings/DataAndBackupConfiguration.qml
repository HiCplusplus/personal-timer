import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../theScripts/theAPI_v1/syncSettings.js" as SyncSettings
import "../../theScripts/theDataBaseSystem/saveLoadSettings.js" as LoadSettings


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
                    text: "get backup from settings NOW";
                    anchors.centerIn: parent;
                    color:"black";
                }
                MouseArea
                {
                    anchors.fill: parent
                    onClicked:
                    {
                        console.log("on settings backup now clicked");
                        SyncSettings.insertOrUpdate(private_url_api+"saveSettings.php","darkmode",LoadSettings.get("darkmode"),accessKey_api_v1);
                    }
                }
            }
        }
    }
}
