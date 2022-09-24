import QtQuick 2.15
import "../theControls"

Item
{
    id:root;
    signal btnCancel;
    signal btnSave;


    visible:false;
    onBtnCancel:
    {
        root.visible = false;

    }
    onBtnSave:
    {
        root.visible = false;
    }

    property variant giveme_picked_days;
    signal whatsOutput;
    onWhatsOutput:
    {
        startDaatePickerCalender.checkoutPuts();
        giveme_picked_days = startDaatePickerCalender.give_OutputPickedDays;
    }

    anchors.fill: parent;







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
            id:baseCalenderStart;
            width: parent.width;
            height: 300;
            color:cBG_element;
            radius:15;
            anchors
            {
                top:myButtons.bottom;
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
//    MyComboBox //#BUG
//    {
//        id:myCombobox;
//        visible: false;
//        z:6;
//        setColor: cBG_element;
//        onBtnCancel:
//        {
//            myCombobox.visible=false;
//            myShadow.visible=false;
//        }
//        onBtnSave:
//        {
//            alarmSoundText.text = values[selectedIndex];
//            btnCancel();
//        }
//    }
