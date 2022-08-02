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
    property int swipeLunchIndex: 0;


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
                Item
                {
                    id:fourthPage;

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
        myIndicatorIndexDText: ";";
        anchors.bottom:root.bottom;

        onIndex_a_clicked:
        {
            viewTimers.setCurrentIndex(0);
        }
        onIndex_b_clicked:
        {
            viewTimers.setCurrentIndex(1);
        }

        onIndex_c_clicked:
        {
            viewTimers.setCurrentIndex(2);
        }

        onIndex_d_clicked:
        {
            viewTimers.setCurrentIndex(3);
        }
    }
    //timer indicator ends
}//end of window
