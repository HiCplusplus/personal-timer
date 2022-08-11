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

        SwipeView
        {
            id:timersSwiper;
            anchors.fill: parent;
            clip:true;
            anchors.top: timersIndicator.bottom;
            currentIndex: setLunchIndex;
            Item
            {
                id:baseSingleTimer;
                SingleTimer
                {
                    id:singleTimer;
                    visible:false;
                    onCancelTimer:
                    {
                        singleTimer.visible=false;
                        singleTimerSetPage.visible=true;
                    }
                }
                SingleTimerSetPage
                {
                    id:singleTimerSetPage;
                    onButtonStartClicked:
                    {
                        singleTimer.baseTime[0] = singleTimerSetPage.selectHour;
                        singleTimer.baseTime[1] = singleTimerSetPage.selectMinute;
                        singleTimer.baseTime[2] = singleTimerSetPage.selectSecond;
                        singleTimerSetPage.visible=false;
                        singleTimer.visible=true;
                        singleTimer.runTimer();
                    }
                }

            }
            Item
            {
                id:baseMultiTimer;
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
                    visible: false;
                    onSportTimerEnded:
                    {
                        sportTimer.visible=false;
                        sportTimerSetPage.visible=true;

                    }
                }
                SportTimerSetPage
                {
                    id:sportTimerSetPage;
                    onStartSportTimer:
                    {
                        sportTimerSetPage.visible=false;
                        sportTimer.visible=true;

                        sportTimer.setRounds = repeatValue[0];


                        sportTimer.setTimePerRound[0] =  roundValues[0];
                        sportTimer.setTimePerRound[1] =  roundValues[1];
                        sportTimer.setTimePerRound[2] =  roundValues[2];

                        sportTimer.setBreaks[0] =  breakValues[0];
                        sportTimer.setBreaks[1] =  breakValues[1];
                        sportTimer.setBreaks[2] =  breakValues[2];

                        sportTimer.startTheMainTimer();

                    }
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
