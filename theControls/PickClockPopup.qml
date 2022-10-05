import QtQuick 2.15
import "../theControls"

Item
{
    property int outputHour;
    property int outputMinute;

    id:root;
    visible:false;
    anchors.fill:parent;

    signal btnCancel;
    signal btnSave;


    onBtnCancel:
    {
        root.visible = false;
    }
    onBtnSave:
    {
//        root.visible = false;
        outputHour = hourPicker.theSelectedNumberIndex;
        outputMinute = minutePicker.theSelectedNumberIndex;
        btnCancel();
    }


    Rectangle
    {
        color: cBG_element;
        radius:20;
        anchors.centerIn:parent;
        width: parent.width/1.20;
        height:parent.height/2;
        z:6;

        MyCancelSaveButton
        {
            id:myButtons;
            onButtonCancelClicked:
            {
                btnCancel();
            }
            onButtonSaveClicked:
            {
                btnSave();
            }
        }
        Rectangle
        {
            id:baseClockPickers;
            width: parent.width;
            height: 320;
            color:cBG_element;
            radius:15;
            anchors
            {
                top:myButtons.bottom;
                horizontalCenter:parent.horizontalCenter;
                topMargin:25;
            }
            Rectangle
            {
                width:300;
                height:width;
                radius: width/2;
                anchors.centerIn:parent;
                color:cBG_Unknown;
                MyCircleClockPicker
                {
                    id:hourPicker;
                    setMinNumber: 1;
                    setMaxNumber: 24;
                    Rectangle
                    {
                        width:parent.width/1.50;
                        height:width;
                        radius: width/2;
                        anchors.centerIn:parent;
                        color:cBG_Unknown;
                        MyCircleClockPicker
                        {
                            id:minutePicker;
                            setMinNumber: 0;
                            setMaxNumber: 59;
                            eachBoxSize: 15;
                            setfontTextes: 10;
                            showElemntsWithSpace: 5;
                        }

                    }
                }
            }
        }

    }



    MyShadowForFocus
    {
        id:myShadow;
        visible:true;
        onRootclicked:
        {
            myButtons.buttonCancelClicked();
        }
    }
}
