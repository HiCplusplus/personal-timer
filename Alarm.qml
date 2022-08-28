import QtQuick 2.0
import "theControls"
import "thePages"
import "theScripts/theDataBaseSystem/saveLoadAlarm.js" as LoadAlarm
Item
{
//    signal changeStatusSwiperFromTimerDown;
    signal goToAlarmSetPage;
    signal refreshListModel;
    onRefreshListModel:
    {
        listModelMain.clear();
        var allObject = JSON.parse(LoadAlarm.get());
        for(var i=0; i<allObject.alarms.length; i++)
        {
            var tempMinute = (allObject.alarms[i].minute > 9) ? allObject.alarms[i].minute : "0"+allObject.alarms[i].minute; //because if use this condition inside the 'clock:' like hour it would not run this line of code
            var tempHour = (allObject.alarms[i].hour > 9 )? allObject.alarms[i].hour : "0"+allObject.alarms[i].hour;
            listModelMain.append({
                                     name:allObject.alarms[i].name,
                                     clock : tempHour + ":" + tempMinute,
                                     am:allObject.alarms[i].pm,
                                     status: ((allObject.alarms[i].status==='1'||allObject.alarms[i].status === 1) ? true : false),
                                     days:allObject.alarms[i].days,
                                 });
        }
    }

    Component.onCompleted:
    {
        refreshListModel();
    }

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
                    setAlarmName: name;
                    statusSwitch: status;
                    setWeekDays: days;
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
            goToAlarmSetPage();
        }
    }

}//end of item
