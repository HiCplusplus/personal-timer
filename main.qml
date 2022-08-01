import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia 5.15
import QtQuick.Controls 2.15
import "theControls"

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

    //menu down idea from https://dribbble.com/shots/17686848-Alarm-Clock-App-UI

    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:cBG;
    }


    property int iconWidthAndHeight: mainWindow.width<700? 40:50; //for button iconBackToHome &  iconSettings
    property string fileIcon_Settings: "icon-settings.png";
    property string fileIcon_backToHome: "icon-back.png";
    property string directory_Icons: "thePictures/";
    property int fontSizeTitles: mainWindow.width<700 ? 45:65;



    //new for dark mode
    property bool themeDarkMode:false;
    property color cTxt_normal : "black";
    property color cTxt_title : "#3E386C";
    property color cBG : "#dedede";//"#F6F6F6";
    property color cBG_menu : "#dedede"; //"#F6F6F6";
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
       id:iconsBar;
       width: root.width;
       height:root.height/15;
       anchors.top:root.top;
       color:cBG;
       MyMenu
       {
            cBGMenu: cBG_menu;
            colorTextMenu:cTxt_button;
            textTitleMenu:appTitle;
            onSignalDarkModeTest:
            {

                if(!themeDarkMode)
                {
                    themeDarkMode = true;
                    cTxt_normal = "black";
                    cTxt_title = "#3E386C";
                    cBG = "#23272A";//darked
                    cBG_menu = "#23272A";//"#2C2F33";//darked bad
                    cBG_element= "#565578";//darked
                    cTxt_button = "white";//darked
                    cBG_button = "#7289DA";//darked
                    cBG_button_activated= "#7289DA";//darked
                    cBG_button_deactivated= "gray";//darked
                    gFontFamily="Courier";//ok
                    cBG_Unknown= "transparent";
                    cUnknown = "white";//o99AAB5k
                }
                else
                {
                    themeDarkMode = false;
                    cTxt_normal = "black";
                    cTxt_title = "#3E386C";
                    cBG = "#dedede";
                    cBG_menu = "#dedede";
                    cBG_element= "white";
                    cTxt_button = "black";
                    cBG_button = "#B178FF";
                    cBG_button_activated= "#B178FF";
                    cBG_button_deactivated= "#EBDDFF";
                    gFontFamily="Courier";
                    cBG_Unknown= "transparent";
                    cUnknown= "white";
                    themeDarkMode = false;
                }


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
            top:iconsBar.bottom;
            left:root.left;
            right:root.right;
            bottom:root.bottom;
            bottomMargin: parent.height/15;
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

                currentIndex: itemBaseViewTimers.swipeViewIndex;
                width: baseTimers.width;
                height:baseTimers.height/100*99;
                onCurrentIndexChanged:
                {
                    itemBaseViewTimers.swipeViewIndex = viewTimers.currentIndex ;
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
        myIndicatorIndex: itemBaseViewTimers.swipeViewIndex;
        myIndicatorIndexAText: "Alarm";
        myIndicatorIndexBText: "StopWatch";
        myIndicatorIndexCText: "Timer";
        anchors.bottom:root.bottom;
    }
    //timer indicator ends
}//end of window
