import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia 5.15
import QtQuick.Controls 2.15
import "theControls"
import "thePages"

Window
{
    id: mainWindow;
//    width: Screen.width;
//    height: Screen.height;
    width:720/2+10;
    height:1339/1.7;
    visible: true;
    property string appTitle: "MeinAlarm v.5";

    title: qsTr(appTitle);
    color:cBG;

    /*
    thanks to :

    icons8.com

    menu down idea from
            https://dribbble.com/shots/17686848-Alarm-Clock-App-UI

    alarm style / page set alarm  idee from
            https://dribbble.com/shots/10918806-Smart-Alarm-app

    calender base from
            https://dribbble.com/shots/9709600-Daily-UI-Events-Dark-Version
    */


    /* My fav styles

    i wish do this https://dribbble.com/shots/14896001-Alarm-App-Concept


    good looking color and theme https://dribbble.com/shots/17279416-Sleepzy-Sleep-tracker-app


    https://dribbble.com/shots/4894371-Dashboard-Graph

    good looking calneders
        https://dribbble.com/shots/16390127-Schedule-App
        https://dribbble.com/shots/15628214-Calendar-app
        https://dribbble.com/shots/16618447-Falop-Project
        https://dribbble.com/shots/6291859-Date-Picker
        https://dribbble.com/shots/3769275-Calendar-Daily-UI-038
        https://dribbble.com/shots/5554215-Task-manage-app-concept
        https://dribbble.com/shots/9622078-Daily-UI-Events-App-Design
        https://dribbble.com/shots/18098594-Delivery-Components
        https://dribbble.com/shots/4749823-Calender-Screen
        https://dribbble.com/shots/5642817-Calender-with-Background-Gradient
        https://dribbble.com/shots/5811377-5-100-Calender-of-the-day
        https://dribbble.com/shots/3870315-Event-Listing-Daily-UI-070
        https://dribbble.com/shots/3671877-Calender
        https://dribbble.com/shots/8945197-Minimal-Calender-Modul-1
        https://dribbble.com/shots/10924372-UI-design-for-calender
        https://dribbble.com/shots/4129451-Time-Tracker-Concept
        https://dribbble.com/shots/4994794-Flight-Booking-App-Freebie
        https://dribbble.com/shots/16710172-Task-Management-App-to-do-calender-events
        https://dribbble.com/shots/10170477-Date-Picker-Exploration-Part-1
        https://dribbble.com/shots/11751267-DailyUI-Day42-ToDo-List





    */

    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:cBG;
    }


    property int iconWidthAndHeight: mainWindow.width<700? 40:50; //for button iconBackToHome &  iconSettings
    property int fontSizeTitles: mainWindow.width<700 ? 45:65;
    property int swipeLunchIndex: 0;


    //icons
    property string directory_Icons: "../thePictures/";
    property string direcotry_BlackIcons: "dark-25px/";
    property string direcotry_WhiteIcons: "white-25px/";
    property string path_to_menuIcons: directory_Icons + direcotry_BlackIcons;//(!themeDarkMode? direcotry_BlackIcons:direcotry_WhiteIcons);

    property string fileIcon_Settings: "icon-settings.png";
    property string fileIcon_backToHome: "icon-back.png";
    property string fileIcon_Countdown: "icon-countdown.png";
    property string fileIcon_Stopwatch: "icon-stopwatch.png";
    property string fileIcon_Alarm: "icon-alarm.png";
    property string fileIcon_Calender: "icon-calender.png";
    property string fileIcon_BackNext: "icon-back-next.png";


    //set theme, default light mode colors
    property bool themeDarkMode:false;
    property color cTxt_normal : "black";
    property color cTxt_title : "#3E386C";
    property color cBG : "#dedede";//"#F6F6F6";
//    property color cBG_menu : "#dedede"; //"#F6F6F6";
    property color cBG_element: "white";
    property color cTxt_button : "black";
    property color cBG_button : "#B178FF";
    property color cBG_button_activated: "#B178FF";
    property color cBG_button_deactivated: "#EBDDFF";
    property string gFontFamily:"Courier";
    property color cBG_Unknown: "transparent";
    property color cUnknown: "white";

   Rectangle
   {
       id:menuBar;
       width: root.width;
       height:root.height/15;
       anchors.top:root.top;
       color:cBG;
       MyMenu
       {
           id:myMenu;
            cBGMenu: viewTimers.currentIndex==0? cBG_button: cBG;
            colorTextMenu:cTxt_button;
            textTitleMenu:appTitle;
       }

   }

    //swipe base Timer starts
    Rectangle
    {
        id:baseTimers;
        visible: true;
        clip: true;
        color:cBG;
        anchors
        {
            top:menuBar.bottom;
            left:root.left;
            right:root.right;
            bottom:myIndicator.top;
//            bottomMargin: parent.height/15;
        }

        Item
        {
            id:itemBaseViewTimers
            property int swipeViewIndex: 0;

            onSwipeViewIndexChanged:
            {
                viewTimers.setCurrentIndex(swipeViewIndex);
            }

            SwipeView
            {
                id: viewTimers

                currentIndex: swipeLunchIndex;//itemBaseViewTimers.swipeViewIndex;
                width: baseTimers.width;
                height:baseTimers.height/100*99;
                onCurrentIndexChanged:
                {
                    myIndicator.myIndicatorIndex = viewTimers.currentIndex;
                }
                Item
                {
                    id:calenderPage;
                    CalenderPage
                    {

                    }
                }
                Item
                {
                    id: firstPage
                    TimerDown
                    {
                        onChangeStatusSwiperFromTimerDown:
                        {
                            if(viewTimers.interactive)
                            {
                                myIndicator.visible=false;
                                viewTimers.interactive=false;
                            }

                            else
                            {
                                viewTimers.interactive=true;
                                myIndicator.visible=true;
                            }


                        }
                    }
                }
                Item
                {
                    id: secondPage
                    CountUp
                    {

                    }


                }
                Item
                {
                    id: thirdPage
                    CountDown
                    {

                    }
                }

            }
        }



    }
    //swipe base timer ends



    //timer indicator starts
    MyTimerIndicator
    {
        id:myIndicator;
        myIndicatorIndex: swipeLunchIndex;
        myIndicatorIndexAText: "Alarm";
        myIndicatorIndexBText: "StopWatch";
        myIndicatorIndexCText: "Timer";
        myIndicatorIndexDText: "Calender";
        anchors.bottom:root.bottom;

        setIconIndexA: path_to_menuIcons + fileIcon_Alarm;
        setIconIndexB: path_to_menuIcons + fileIcon_Stopwatch;
        setIconIndexC: path_to_menuIcons + fileIcon_Countdown;
        setIconIndexD: path_to_menuIcons + fileIcon_Calender;

        onIndex_d_clicked:
        {
            viewTimers.setCurrentIndex(0);
        }
        onIndex_a_clicked:
        {
            viewTimers.setCurrentIndex(1);
        }
        onIndex_b_clicked:
        {
            viewTimers.setCurrentIndex(2);
        }

        onIndex_c_clicked:
        {
            viewTimers.setCurrentIndex(3);
        }
    }
    //timer indicator ends
}//end of window
