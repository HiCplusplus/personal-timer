import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../theControls/canvasDraws/"
import "../../theScripts/theTimer/sportTimer.js" as ST
import "../../theControls"

Item
{
    id:root;
    clip:true;
    anchors.fill: parent;
    //user set data
    property int setRounds: 4;

    property variant setTimePerRound: [0,0,10]; //hour, minute, second, to know when is the time, example: if(setTime[0]=== setTimePerRound[0]/2) means we are in half way.
    property variant setBreaks: [0,0,10]; //hour, minute, second


    //user set options
    property bool setSpeechOn: false;
    property variant setSpeechPlayEvery: [0,0,10];//hour , minute , second.
    property variant setSpeechPlayWhen: ["Rounds & rests & letsgo","Rounds & rests","Only rounds","Only rests"];
    property variant speechPacks: ["male","female"];
    property bool setVibrationOn: false;
    property bool setNotificationOn: false;
    property bool setSoundEffectsOn: false;
    property variant soundEffectsPacks: ["beeps","pings"];


    //proccess data (some of these are for temprary to avoid destory user data. if replace these with orginal, some part of app will calculate/show wrong)
    property int tempRounds: setRounds;
    property int tempBreaks: setRounds;
    property variant avrageRounds: [(setTimePerRound[0]*setRounds) , (setTimePerRound[1]*setRounds) , (setTimePerRound[2]*setRounds)] //TPR (timePerRound) * rounds
    property variant avrageBreaks: [(setBreaks[0]*setRounds) , (setBreaks[1]*setRounds) , (setBreaks[2]*setRounds)]; //breaks*rounds
    property variant avrageBreak_Round: [(avrageRounds[0]+avrageBreaks[0]),
        (avrageRounds[1]+avrageBreaks[1]),
        (avrageRounds[2]+avrageBreaks[2])]; //hour,minute,second (avrage time = rounds+breaks)

    property int roundOn : 0; //this is flag , to turn off/on break/round turns . 0 means break turn, 1 means round turn
    property int tempSaveRunnigs: 0;//to know when is break , when is round. this is counter in Second timer

    property variant setTimes: []; //hour,minute,second (avrage time = rounds+breaks)
    onAvrageBreak_RoundChanged:
    {
        setTimes[0] = parseInt(ST.addTimes_together(avrageBreak_Round[0],avrageBreak_Round[1],avrageBreak_Round[2],0));
        setTimes[1] = parseInt(ST.addTimes_together(avrageBreak_Round[0],avrageBreak_Round[1],avrageBreak_Round[2],1));
        setTimes[2] = parseInt(ST.addTimes_together(avrageBreak_Round[0],avrageBreak_Round[1],avrageBreak_Round[2],2));
    }






    //for drawCircle
    property variant timePast: [avrageBreak_Round[0]*minusPast_Hour/8, ///4,
        (avrageBreak_Round[1])*minusPast_MinuteSecond, //(avrageBreak_Round[1]+4)*minusPast_MinuteSecond,
        avrageBreak_Round[2]*minusPast_MinuteSecond/maxCircles];

    property int maxCircles: 378;
    property double minusPast_Hour : 15.75; //maxCircles/24
    property double minusPast_MinuteSecond: 6.30; //maxCircles/60

    property int lineWsFromParent: parent.width/15;//parent.width/40;
    property variant setLineWidths: [lineWsFromParent,lineWsFromParent,lineWsFromParent];//hour,minute,second
    property variant setRadiuses: [20];//,22,19];//[20,17,14]; //h,m,s
    property variant setColors: [cBG_Unknown,cBG_Unknown,cBG_Unknown];//["black",cBG_button,"orange"];//hour, minute, second . //minute hour has bug disabled
    property variant setBreak_and_RoundColors: ["#fc4949","#00bf66","blue"]; //break, round, pause circle colors. green->#10FCB3. red->#fc4949


    //to pepear for next sport Timer values
    signal startTheMainTimer; //call from outside
    signal initValues; //re-fill values for next time
    signal sportTimerEnded; //when times end this called

    onStartTheMainTimer:
    {
        initValues();
        mainTimer.running=true;
    }

    onInitValues:
    {
        tempRounds= setRounds;
        tempBreaks= setRounds;
        avrageRounds= [(setTimePerRound[0]*setRounds) , (setTimePerRound[1]*setRounds) , (setTimePerRound[2]*setRounds)] //TPR (timePerRound) * rounds
        avrageBreaks= [(setBreaks[0]*setRounds) , (setBreaks[1]*setRounds) , (setBreaks[2]*setRounds)]; //breaks*rounds
        avrageBreak_Round= [(avrageRounds[0]+avrageBreaks[0]),
                (avrageRounds[1]+avrageBreaks[1]),
                (avrageRounds[2]+avrageBreaks[2])];

        tempSaveRunnigs=0;
        roundOn=0;

        timePast= [avrageBreak_Round[0]*minusPast_Hour/8, ///4,
                (avrageBreak_Round[1])*minusPast_MinuteSecond, //(avrageBreak_Round[1]+4)*minusPast_MinuteSecond,
                avrageBreak_Round[2]*minusPast_MinuteSecond/maxCircles];
    }

    onSportTimerEnded:
    {
        mainTimer.stop();
        secondTimer.stop();
    }







    Timer
    {
        id:secondTimer;
        interval: 1000; running: false; repeat: true;
        onTriggered:
        {
            ST.updateCircles(justShowCircle,maxCircles,3,cBG_element); //update background color
            //break turn
            tempSaveRunnigs++; //second counter (all value Hour/Minute/Second converted to Second) for example
            if(roundOn==0)
            {
                if(tempSaveRunnigs >= ((setBreaks[0]*60) + setBreaks[1])*60 + setBreaks[2]) //(hour*60=> miunute + main-minute)*60 => seconds
                {
                    secondTimer.running=false;
                    mainTimer.running=true;
                    tempBreaks--;
                }
                else
                    ST.timeSystem(setTimes[0],setTimes[1],setTimes[2],timePast[0],timePast[1],timePast[2],roundOn);
            }
            else
            {
                //round turn
                if(tempSaveRunnigs >= ((setTimePerRound[0]*60) + setTimePerRound[1])*60 + setTimePerRound[2]) //(hour*60=> miunute + main-minute)*60 => seconds
                {
                    secondTimer.running=false;
                    mainTimer.running=true;
                    tempRounds--;
                }
                else
                    ST.timeSystem(setTimes[0],setTimes[1],setTimes[2],timePast[0],timePast[1],timePast[2],roundOn);
            }

        }
    }

    Timer
    {
        id:mainTimer;
        interval: 1000; running: false; repeat: true;
        onTriggered:
        {
            ST.updateCircles(justShowCircle,maxCircles,3,cBG_element); //update background color
            if(tempBreaks>=tempRounds)
            {
                //break turn
                if(tempBreaks<=0)
                {
                    //break value is end
                    sportTimerEnded();
                }
                else
                {
                    roundOn=0;//means breaks turn
                    tempSaveRunnigs=0;//reset global counter second
                    valueRound.text= "rest";//Math.abs(tempBreaks-(setRounds+1)); //this could be only  *.text = tempRounds, but (for example rounds=8) tempRounds will count from 8 to 0 but we want 1 to 8
                    if(setBreaks[2]<60 && setBreaks[2]>0)
                        minusPast_MinuteSecond = maxCircles/setBreaks[2];
                    else
                        minusPast_MinuteSecond = maxCircles/60; //this should be maxCircle/minusPast_MinuteSecond, isnt because the second is morethan 60s so circle will divide by 60, 1minte=60sec

                    secondTimer.running = true;
                    mainTimer.running = false;
                }

            }
            else
            {
                //round turn
                if(tempRounds<=0)
                {
                    sportTimerEnded();
                }
                else
                {
                    roundOn=1;//means rounds turn
                    tempSaveRunnigs=0;
                    valueRound.text= Math.abs(tempRounds-(setRounds+1)); //this could be only  *.text = tempRounds, but (for example rounds=8) tempRounds will count from 8 to 0 but we want 1 to 8
                    if(setTimePerRound[2]<60 && setTimePerRound[2]>0)
                        minusPast_MinuteSecond = maxCircles/setTimePerRound[2];
                    else
                        minusPast_MinuteSecond = maxCircles/60;

                    mainTimer.running = false;
                    secondTimer.running = true;
                }
            }
        }
    }


    Rectangle
    {
        id:baseCircles;
        anchors.fill: parent;
        color:cBG;

        DrawCircle
        {
            id:justShowCircle;
            setLineWidth: setLineWidths[0];
            setColor: "#cfcfcf";//cBG_button_deactivated;//"#dcd3e8";
            setRadius: setRadiuses[0];
            setTime: maxCircles;
        }

        DrawCircle //other circles termperory removed from here because they didnt work but stored in TrashCodesForLater.qml
        {
            id:circleSecond;
            setLineWidth: setLineWidths[0]; //could be [2] but Hour's is better looking
            setColor: setColors[2];
            setRadius: setRadiuses[0]; //could be [2] but Hour's is better looking
            setTime: timePast[2];
            setTimeDivide: 60;
            Rectangle
            {
                id:baseTextRound;
                anchors.centerIn: parent;
                width: parent.width/8;
                height: parent.height/8;
                color:cBG_Unknown;
                Text
                {
                    id:valueRound;
                    text:setRounds;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    font.pointSize: ((parent.width<=100) ? 45 : 60);
                    font.family: gFontFamily;
                    color:cTxt_button;
                }

            }

        }


        //empty circle for a line to better look

    }
    MyThreeBottomButtons
    {
        id:sportSettingsMuteButton;
        width: root.width;
        height:root.height/10.5;
        //setCenterButtonCircleStyled:true;
        setCenterButtonText: "";
        setLeftButtonText: "Speech";
        setLeftButtonIcon: path_to_menuIcons + fileIcon_Mute;

        setRightButtonText: "Effect";
        setRightButtonIcon: path_to_menuIcons + fileIcon_Unmute;

        anchors
        {
            bottom:sportButtons.bottom;
            bottomMargin:sportButtons.height;
        }
    }

    MyThreeBottomButtons
    {
        id:sportButtons;
        width: root.width;
        height:root.height/10.5;
        //setCenterButtonCircleStyled:true;
        setCenterButtonText: "Pause";
        onCenterButtonPressed:
        {
            if(setCenterButtonText=="Pause")
            {
                mainTimer.running=false;
                secondTimer.running=false;
                setCenterButtonText="Resume";
            }
            else
            {
                mainTimer.running=true;
                secondTimer.running=true;
                setCenterButtonText="Pause";
            }
        }

        setLeftButtonText: "Cancel";
        setLeftButtonIcon: path_to_menuIcons + fileIcon_Cancel;
        onLeftButtonPressed:
        {
            sportTimerEnded();
        }

        setRightButtonText: "Settings";
        setRightButtonIcon: path_to_menuIcons + fileIcon_Settings;


        anchors
        {
            bottom:root.bottom;
            bottomMargin:15;
        }
    }
}
