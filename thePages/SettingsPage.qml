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

    Rectangle
    {
        id:baseTopToolBar;
        width:parent.width/2
        height:50;
        color:cBG_button;
        Rectangle
        {
            id:buttonStackPop
            width:50
            height:50
            color:cBG_button
            visible: stack.depth>1
            Text
            {
                anchors.centerIn: parent;
                text:"<"
                font.bold:true
                font.pointSize: 25
                color:cTxt_button
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked: anBackPage()
            }
        }

        Rectangle
        {
            id:baseTextSetting
            width:100
            height:50
            anchors
            {
                left:buttonStackPop.right;
                leftMargin:20;
                top:buttonStackPop.top;
            }
            color:cBG_button
            Text
            {
                text: "Settings"
                color:cTxt_button;
                font.bold: true;
                font.pointSize: 20;
                font.family: gFontFamily;
                anchors.centerIn: parent;
            }
        }
    }






//    Button
//    {
//        visible: stack.depth>1
//        anchors.left:parent.left;
//        anchors.top:parent.top;
//        text: "back";
//        onClicked: anBackPage()
//    }

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
                stack.push("./theSettings/DataAndBackupConfiguration.qml");
                console.log("backupConf.qml pushed")
            }
        }
    }
}
