import QtQuick 2.15
import QtQuick.Controls 2.15

Item
{
    signal gotoBackupConfigurationPage;
    anchors.fill:parent;
    ScrollView
    {
        anchors.fill:parent;
        Column
        {
            anchors.fill:parent;
            spacing:10;
            Rectangle
            {
                width:parent.width;
                height:70;
                color:cBG_element;
                Text
                {
                    text:"Backup Configuration";
                    color:cTxt_button;
                    anchors.verticalCenter: parent.verticalCenter;
                    padding: 25
                }

                MouseArea
                {
                    anchors.fill: parent;
                    onClicked:
                    {
                        gotoBackupConfigurationPage();
                        console.log("on gotoBackupConfigurationPage CLICKED")
                    }
                }
            }
            Rectangle
            {
                width:parent.width;
                height:70
                color:"yellow";
            }
            Rectangle
            {
                width:parent.width;
                height:70
                color:"green";
            }

        }
    }
}
