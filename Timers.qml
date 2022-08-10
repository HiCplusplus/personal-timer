import QtQuick 2.15
import QtQuick.Controls 2.15
import "theControls"
import "thePages"
import "thePages/theTimer"
//import "theScripts/updateIndicator.js" as uIndicator

Item
{
    property int setLunchIndex: 2;
    anchors.fill: parent;
    clip:true;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:cBG;
        clip:true;
        SwipeView
        {
            id:timersSwiper;
            anchors.fill: parent;
            anchors.top: timersIndicator.bottom;
            currentIndex: setLunchIndex;
            Item
            {
                id:singleTimer;
                CountDown
                {

                }

            }
            Item
            {
                id:multiTimer;
                Rectangle
                {
                    anchors.fill: parent;
                    color:"pink";
                }
            }
            Item
            {
                id:baseSportTimer;
                SportTimer
                {
                    id:sportTimer;
                }                
            }


        }

        MyTimerIndicator
        {
            id:timersIndicator;
            myIndicatorIndexDText: "Single";
            myIndicatorIndexAText: "Multi";
            myIndicatorIndexBText: "Sport";
            setWidth: indexesWidth*3.30;
            indexesRadius:25;
            setBGcolor: cBG_Unknown;
            indexesHeight: 70/1.50;
            setLabelTopMargin:indexesHeight/100*32;
            setLabelFontSize:12;
            myIndicatorIndex:timersSwiper.currentIndex;
            onIndex_d_clicked:
            {
                timersSwiper.setCurrentIndex(0);
            }
            onIndex_a_clicked:
            {
                timersSwiper.setCurrentIndex(1);
            }
            onIndex_b_clicked:
            {
                timersSwiper.setCurrentIndex(2);
            }
        }



    }
}
