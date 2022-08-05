import QtQuick 2.0
import "theControls"
import "thePages"
Item
{
    signal changeStatusSwiperFromTimerDown;
    anchors.fill: parent;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:cBG;
    }//end of root

    ListView
    {
        id:listViewMain;
        anchors.fill:parent;

        clip:true;
        model:
        ListModel
        {
            id:listModelMain;
            ListElement
            {
                clock:"02:12";
                am:false;
            }
            ListElement
            {
                clock:"11:21";
                am:true;
            }


        }
        delegate:
        Item
        {
            width: listViewMain.width;
            height: 160;
            Rectangle
            {
                anchors.fill: parent;
                color:cBG;
                MyAlarmContentStyle
                {
                    setClock: clock;
                    setStatusAm: am;

                    onSignalEditAlarm:
                    {
                        console.log("clicked on "+clock);
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
            if(!baseAlarmSet.visible)
            {
                baseAlarmSet.visible=true;
                listViewMain.visible=false;
                changeStatusSwiperFromTimerDown();
            }
        }
    }//end of mytheebuttons



    Rectangle
    {
        id:baseAlarmSet;
        anchors.fill: parent;
        color:"transparent";
        visible: false;
        AlarmSetPage
        {
            onButtonCancel:
            {
                baseAlarmSet.visible=false;

                listViewMain.visible=true;
                changeStatusSwiperFromTimerDown();
            }
        }

    }


}//end of item
