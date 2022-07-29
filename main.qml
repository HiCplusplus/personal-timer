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
    property string appTitle: "Mein Timer 1, v0.5";
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

    property color colorLines: "black";
    property color colorTitles: "black";
    property color colorTextes: "black";

    property color colorBackgroundIcons: "transparent";
    property color colorBackgrounds: "white";
    property color colorButtons: "orange";
    property color colorButtonsInactive: "transparent";
    property color colorBackgroundMenu: "#f7ea9e";//


   Rectangle
   {
       id:iconsBar;
       width: root.width;
       height:root.height/15;
       anchors.top:root.top;
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
        colorBG: colorBackgrounds;
        colorTxt: colorTextes;
        colorBtn: colorButtons;
        colorBtnInactive: colorButtonsInactive;
        anchors.bottom:root.bottom;
    }
    //timer indicator ends







    //settings start
    Settings
    {
        id:settingsPage;
        visible: false;
        fontSize: fontSizeTitles;
        cBG: colorBackgrounds;
        cTitle: colorTitles;
        cLine: colorLines;
    }
    //settings ends



    //button go to settings starts
    Rectangle
    {
        id:iconSettings;
        width:iconWidthAndHeight;
        height:iconWidthAndHeight;
        visible: true;
        color:colorBackgroundIcons;
        anchors
        {
            right:root.right;
//            top:root.top;
//            topMargin: mainWindow.height/50;
            rightMargin:mainWindow.width/50;
            verticalCenter: iconsBar.verticalCenter;
        }

        Image
        {
            anchors.fill: parent;
            source: directory_Icons + fileIcon_Settings;
        }
        MouseArea
        {
            anchors.fill: iconSettings;
            onPressed:
            {
                iconSettings.visible = false;
                settingsPage.visible = true;
                iconBackToHome.visible = true;
            }
        }
    }
    //button go to settings ends


    //button back to home starts
    Rectangle
    {
        id:iconBackToHome;
        width: iconWidthAndHeight;
        height: iconWidthAndHeight;
        visible:false;
        color: colorBackgroundIcons;
        anchors
        {
            left:root.left;
            top:root.top;
            topMargin: mainWindow.height/50;
            leftMargin:mainWindow.width/50;
        }

        Image
        {
            anchors.fill: parent;
            source: directory_Icons+fileIcon_backToHome;
        }
        MouseArea
        {
            anchors.fill: iconBackToHome;
            onPressed:
            {
                settingsPage.visible = false;
                iconBackToHome.visible = false;
                iconSettings.visible = true;
            }
        }
    }
    //button back to home ends







}
