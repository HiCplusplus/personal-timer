import QtQuick 2.0
import "theControls"
import "thePages"
import "theScripts/theDataBaseSystem/saveLoadAlarm.js" as SaveLoadAlarm
import "theScripts/calculateDates.js" as CD
Item
{
//    signal changeStatusSwiperFromTimerDown;
    signal goToAlarmSetPage;
    signal refreshListModel;
//    property var alarmWeekDays : [];
//    property var alarmName: [];
//    property var alarmHour: [];
//    property var alarmMinute: [];
    onRefreshListModel:
    {
        listModelMain.clear();
        var allObject = JSON.parse(SaveLoadAlarm.get());
        for(var i=0; i<allObject.alarms.length; i++)
        {
            var tempMinute = (allObject.alarms[i].minute > 9) ? allObject.alarms[i].minute : "0"+allObject.alarms[i].minute; //because if use this condition inside the 'clock:' like hour it would not run this line of code
            var tempHour = (allObject.alarms[i].hour > 9 )? allObject.alarms[i].hour : "0"+allObject.alarms[i].hour;
            var tempDays = SaveLoadAlarm.convertDaysToText(allObject.alarms[i].days);
            listModelMain.append({
                                     name:allObject.alarms[i].name,
                                     clock : tempHour + ":" + tempMinute,
                                     pm: (allObject.alarms[i].pm === '1') ? false : true, //true false reversed because of in first i tought and saved isAM in database but on runtime i gave problem so reversed this to IsPm
                                     status: ((allObject.alarms[i].status==='1'||allObject.alarms[i].status === 1) ? true : false),
                                     days: tempDays,
                                 });
//            if(allObject.alarms[i].status==='1')
//            {
//                alarmWeekDays[i] = allObject.alarms[i].days;
//                alarmName[i] = allObject.alarms[i].minute;
//                alarmHour[i] = allObject.alarms[i].hour;
//                alarmMinute[i] = allObject.alarms[i].name;
//            }

        }
    }

    Component.onCompleted:
    {
        refreshListModel();
//        alarmTimer.running=true;
    }

//    Timer
//    {
//        id:alarmTimer;
//        interval: 1000; repeat: true; running:false;
//        onTriggered:
//        {
//            const currentDate = new Date();
//            const weekday = CD.weekdayFromDate(currentDate.getFullYear(),currentDate.getMonth() + 1, '',currentDate.getDate());//year month output_type day
//            for()
//            {
//            }
//            const days= alarmWeekDays.split(",");
//            switch(weekday) //0,1,2,3,4,5,6
//            {
//            case 0: checkWeekDayOn();
//            }
//            let cDay = currentDate.getDate();
//            let cMonth = currentDate.getMonth();
//            let cYear = currentDate.getFullYear();
//            let time = currentDate.getHours() + ":" + currentDate.getMinutes() + ":" + currentDate.getSeconds();
//            console.log(cDay);
//            console.log(cMonth);
//            console.log(cYear);
//            console.log(time);
//        }
//    }

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
                    id:myAlarmContents;
                    setClock: clock;
                    setStatusAm: pm;
                    setAlarmName: name;
                    statusSwitch: status;
                    setWeekDays: days;
                    onSignalEditAlarm:
                    {
                        console.log("clicked on "+name);
                    }
                    onSwitchStatusChanged:
                    {
                        SaveLoadAlarm.update(name,'a_status',myAlarmContents.updateStatusSwitchByUserHand);
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
