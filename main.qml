import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia 5.15
import QtQuick.Controls 2.15
import "theControls"
import "thePages"
import QtQuick.Controls.Material 2.15


Window
{
//    Material.theme:Material.Dark
//    Material.accent: Material.LightBlue
    Material.foreground: cTxt_button;


    id: mainWindow;
//    width: Screen.width;
//    height: Screen.height;
    width:720/2+10;
    height:1339/1.7;
    visible: true;
    property string appTitle: "pLarm";

    title: qsTr(appTitle);
    color:cBG;



    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:cBG;
    }


    property int iconWidthAndHeight: mainWindow.width<700? 40:50; //for button iconBackToHome &  iconSettings
    property int fontSizeTitles: mainWindow.width<700 ? 45:65;
    property int swipeLunchIndex: 3;


    //- - - - - - - - - - - - - - - - - - - - - - set theme, default light mode colors
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

    //- - - - - - - - - - - - - - - - - - - - - - icons
    property string directory_Icons: "../thePictures/";
    property string direcotry_BlackIcons: "dark-25px/";
    property string direcotry_WhiteIcons: "white-25px/";
    property string path_to_menuIcons: directory_Icons + direcotry_BlackIcons;//(!themeDarkMode? direcotry_BlackIcons:direcotry_WhiteIcons);

    //dark/light switch icons
    property string fileIcon_DarkMode: "icon-darkmode.png";
    property string fileIcon_LightMode: "icon-lightmode.png";


    //my inidcator icons
    property string fileIcon_Alarm: "icon-alarm.png";
    property string fileIcon_Countdown: "icon-countdown.png";
    property string fileIcon_Stopwatch: "icon-stopwatch.png";
    property string fileIcon_Calender: "icon-calender.png";

    //calender icons
    property string fileIcon_BackNext: "icon-back-next.png";

    //alarm(TimerDown.qml) icons
    property string fileIcon_Cancel: "icon-cancel.png";

//    property string fileIcon_backToHome: "icon-back.png"; //NOT FOUND NOT USED


    //sportTimer Icons
    property string fileIcon_Mute: "icon-mute.png";
    property string fileIcon_Unmute: "icon-unmute.png";
    property string fileIcon_Settings: "icon-settings.png";
    property string fileIcon_Reset: "icon-reset.png";


    //- - - - - - - - - - - - - - - - - - - - - - sound effects
    //- - sportTimer:
    property string directory_Sounds: "../theSounds/";
    property string directory_sportTimer_SoundEffects: "sportTimer/sound-effects/";
    property string directory_soundPackA: "sound-pack-a/";
//    property string directory_soundPackB: "sound-pack-b/";

    property string fileAudio_timerStarted: "started.wav";
    property string fileAudio_timerStopped: "stopped.wav";
    property string fileAudio_roundStarted: "round-started.wav";
    property string fileAudio_roundStopped: "round-stopped.wav";
    property string fileAudio_breakStarted: "break-started.wav";
    property string fileAudio_breakStopped: "break-stopped.wav";


    property string path_to_sportTimer_SoundEffect: "../"+ directory_Sounds + directory_sportTimer_SoundEffects;//innder directory ../


    //singleTimer
    property string fileAudio_elevatorTone: "mixkit-elevator-tone-2863.wav";


   Rectangle
   {
       id:menuBar;
       width: root.width;
       height:root.height/15;
       anchors.top:root.top;
       color:cBG;
       z:5;
       MyMenu
       {
            id:myMenu;
            cBGMenu: viewTimers.currentIndex==0? cBG_button: cBG;
            colorTextMenu:cTxt_button;
            textTitleMenu:appTitle;
            onSignalOpenMenu:
            {
                if(pageSettings.visible)
                    pageSettings.visible=false;
                else
                    pageSettings.visible=true;
            }
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
                    Alarm
                    {
                        onGoToAlarmSetPage:
                        {

                                baseAlarmSet.visible=true;
                                viewTimers.interactive=false;
                                viewTimers.visible=false;
                        }
                    }
                }
                Item
                {
                    id: secondPage
                    StopWatch
                    {

                    }
                }
                Item
                {
                    id: thirdPage
                    Timers
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
        myIndicatorIndexDText: "Calendar";
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

    Rectangle
    {
        id:baseAlarmSet;
        anchors.fill: parent;
        anchors.topMargin: menuBar.height;
        color:cBG_Unknown;
        visible: false;
        z:4;
        AlarmSetPage
        {
            id:pageAlarmSet;
            onButtonCancel:
            {
                baseAlarmSet.visible=false;
                viewTimers.interactive=true;
                viewTimers.visible=true;
            }
        }
    }

    SettingsPage
    {
        id:pageSettings;
        visible: false;
        z:4;
    }
}//end of window
