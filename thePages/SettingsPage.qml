import QtQuick 2.15
import QtQuick.Controls 2.15
import "../theControls"
import "theSettings"

Item
{
    anchors.fill: parent;
    signal anBackPage;
    signal anNextPage;

    onAnBackPage:
    {        
        stack.pop();
        console.log(stack.index + " [] " + stack.currentItem + " [] "+ stack.depth)
    }

    Button
    {
        anchors.left:parent.left;
        anchors.top:parent.top;
        text: "back";
        onClicked: anBackPage()
    }

    Rectangle
    {
        anchors
        {
            top:parent.top;
            topMargin:65;
            left:parent.left;
            right:parent.right;
            bottom:parent.bottom;
        }
        color:cBG;


        StackView
        {
            id: stack;
            initialItem: themainpage;
            anchors.fill: parent;
        }
        TheMainPage
        {
            id:themainpage
            onGotoBackupConfigurationPage:
            {
                stack.push("./theSettings/BackupConfiguration.qml");
                console.log("backupConf.qml pushed")
            }
        }
    }
}
