import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia
import QtQuick.Controls
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


    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:colorBackgrounds;
    }


    property int iconWidthAndHeight: mainWindow.width<700? 40:50; //for button iconBackToHome &  iconSettings
    property string fileIcon_Settings: "icon-settings.png";
    property string fileIcon_backToHome: "icon-back.png";
    property string directory_Icons: "thePictures/";
    property int fontSizeTitles: mainWindow.width<700 ? 45:65;

    property color colorLines: "#3E386C";
    property color colorTitles: "#3E386C";
    property color colorTextes: "#3E386C";

    property color colorBackgroundIcons: "transparent";
    property color colorBackgrounds: "#F6F6F6";
    property color colorButtons: "orange";
    property color colorButtonsInactive: "transparent";
    property color colorBackgroundMenu: "#F6F6F6";//


   Rectangle
   {
       id:iconsBar;
       width: root.width;
       height:root.height/15;
       anchors.top:root.top;
       color:colorBackgrounds;
       MyMenu
       {
            cBGMenu: colorBackgroundMenu;
            colorTextMenu:colorTitles;
            textTitleMenu:appTitle;
       }
   }

    //swipe base Timer starts
    Rectangle
    {
        id:baseTimers;
        visible: true;
        clip: true;
        color:colorBackgrounds;
        anchors
        {
            top:iconsBar.bottom;
            left:root.left;
            right:root.right;
            bottom:root.bottom;
            bottomMargin: parent.height/15;

//            left:iconSettings.right;
//            right:root.right;
//            leftMargin:mainWindow.width/50;
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
                        setColorBG: colorBackgrounds;
                    }
                }
                Item
                {
                    id: secondPage
                    CountUp
                    {
                        setColorBG: colorBackgrounds;
                    }


                }
                Item
                {
                    id: thirdPage
                    CountDown
                    {
                        setColorBG: colorBackgrounds;
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
        colorBG: "white";//colorBackgrounds
        colorTxt: colorTextes;
        colorBtn: colorButtons;
        colorBtnInactive: colorButtonsInactive;
        anchors.bottom:root.bottom;
    }
    //timer indicator ends
}//end of window
