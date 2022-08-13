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
    Material.foreground: cTxt_button;


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
    property string directory_SoundEffect_PackA: "sound-pack-a/";

    property string fileAudio_timerStarted: "started.wav";
    property string fileAudio_timerStopped: "stopped.wav";
    property string fileAudio_roundStarted: "round-started.wav";
    property string fileAudio_roundStopped: "round-stopped.wav";
    property string fileAudio_breakStarted: "break-started.wav";
    property string fileAudio_breakStopped: "break-stopped.wav";

    property string path_to_sportTimer_SoundEffect: "../"+ directory_Sounds + directory_sportTimer_SoundEffects;//innder directory ../


    //- - - - - - - singleTimer
    property string fileAudio_elevatorTone: "mixkit-elevator-tone-2863.wav";



    //- - - - - - - - - - - - - - - - - - - - - - sound speech
    property string directory_sportTimer_SoundSpeech: "sportTimer/sound-speech/";
    property string directory_SoundSpeech_PackA: "sound-pack-male-joey/"; //MALE , by ttsmp3.com , US English Joey
    property string directory_sportTimer_SoundSpeech_Numbers: "numbers/";

    property string fileAudio_speech_start: "start.wav";
    property string fileAudio_speech_stop: "stop.wav";
    property string fileAudio_speech_rest: "rest.wav";
    property string fileAudio_speech_set: "set.wav";
    property string fileAudio_speech_go: "go.wav";
    property string fileAudio_speech_cheer: "cheer.wav";
    property string fileAudio_speech_ready: "ready.wav";

    property string fileAudio_speech_hour: "hour.wav";
    property string fileAudio_speech_minute: "minute.wav";
    property string fileAudio_speech_second: "second.wav";

    property string fileAudio_speech_hours: "hours.wav";
    property string fileAudio_speech_minutes: "minutes.wav";
    property string fileAudio_speech_seconds: "seconds.wav";

    property variant fileAudio_speech_numbers:
        ["0","1.wav","2.wav","3.wav","4.wav","5.wav","6.wav","7.wav","8.wav","9.wav","10.wav",
        "11.wav","12.wav","13.wav","14.wav","15.wav","16.wav","17.wav","18.wav","19.wav","20.wav",
        "21.wav","22.wav","23.wav","24.wav","25.wav","26.wav","27.wav","28.wav","29.wav","30.wav",
        "31.wav","32.wav","33.wav","34.wav","35.wav","36.wav","37.wav","38.wav","39.wav","40.wav",
        "41.wav","42.wav","43.wav","44.wav","45.wav","46.wav","47.wav","48.wav","49.wav","50.wav",
        "51.wav","52.wav","53.wav","54.wav","55.wav","56.wav","57.wav","58.wav","59.wav","60.wav",
        "61.wav","62.wav","63.wav","64.wav","65.wav","66.wav","67.wav","68.wav","69.wav","70.wav",
        "71.wav","72.wav","73.wav","74.wav","75.wav","76.wav","77.wav","78.wav","79.wav","80.wav",
        "81.wav","82.wav","83.wav","84.wav","85.wav","86.wav","87.wav","88.wav","89.wav","90.wav",
        "91.wav","92.wav","93.wav","94.wav","95.wav","96.wav","97.wav","98.wav","99.wav","100.wav"];


//    property string fileAudio_speech_left: "left.wav";
//    property string fileAudio_speech_passed: "passed.wav";


    property string path_to_sportTimer_SoundSpeech: "../" + directory_Sounds + directory_sportTimer_SoundSpeech;





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
