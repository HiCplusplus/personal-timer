import QtQuick 2.15
import "../theControls"

Item
{
    anchors.fill:parent;
    property variant giveme_days;

    MyShadowForFocus
    {
        id:myShadow;
        z:5;
        onRootclicked:
        {
            myCombobox.btnCancel();
        }
    }
    MyComboBox //#BUG
    {
        id:myCombobox;
        visible: false;
        z:6;
        setColor: cBG_element;
        onBtnCancel:
        {
            myCombobox.visible=false;
            myShadow.visible=false;
        }
        onBtnSave:
        {
            alarmSoundText.text = values[selectedIndex];
            btnCancel();
        }
    }















    Rectangle
    {
        id:baseCalenderStart;
        width: parent.width/1.15;
        height: 300;
        color:cBG_element;
        radius:15;
        anchors
        {
            top:parent.bottom;
            horizontalCenter:parent.horizontalCenter;
            topMargin:25;
        }
        MyCalender
        {
            id:startDaatePickerCalender;
            setCurrentYear: 2022;
            setCurrentMonth: 9;
            setCurrentDays: [0];
            setCalenderOnlyView: false;
//                    setpickmode:2; //1 for solo pick change it later , but currently the solo pick isnt work.
        }
        Rectangle
        {
            id:buttonSavetheDateStart;
            width: 70;
            height:25;
            color:cBG_button;
            anchors
            {
                top:parent.top;
                right:parent.right;
                topMargin:parent.height/10;
                rightMargin: 10;
            }
            Text
            {
                anchors.centerIn:parent;
                text: "Done";
                color:cUnknown;
                font.family: gFontFamily;
                font.bold: true;
                font.pointSize: 12;
            }

        }
    }
}
