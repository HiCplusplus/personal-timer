import QtQuick 2.15
import "../../theControls"
import "../../thePages"
import "../../theScripts/theDataBaseSystem/saveLoadAlarm.js" as SaveLoadAlarm
Item
{
//    signal changeStatusSwiperFromTimerDown;
    signal goToAlarmSetPage;
    signal refreshListModel;

    onRefreshListModel:
    {
        listModelMain.clear();
        if(JSON.stringify(SaveLoadAlarm.get()).length > 19) //to avoid Syntax error Json.parse error showsup when table is clear
        {
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

            }
        }
        else //table is empty and json has error
        {
            console.log("ALARMS NOT FOUND(alrms are 0)/Table isnt exists");
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
            appTitle = "Alarms/New";
        }
    }

}//end of item
