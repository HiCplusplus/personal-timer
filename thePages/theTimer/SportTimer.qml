import QtQuick 2.15
import QtMultimedia
import QtQuick.Controls 2.15
//import "../../theControls/canvasDraws/"
import "../../theScripts/theTimer/sportTimer.js" as ST
import "../../theControls"
import "../../theScripts/theTimer/sportTimerSoundEffects.js" as STsoundEffects
import "../../theScripts/theTimer/sportTimerSpeech.js" as STspeech

Item
{
    id:root;
    clip:true;
    anchors.fill: parent;
    //user set data
    property int setRounds: 4;

    property variant setTimePerRound: [0,0,10]; //hour, minute, second, to know when is the time, example: if(setTime[0]=== setTimePerRound[0]/2) means we are in half way.
    property variant setBreaks: [0,0,10]; //hour, minute, second




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
    property bool statusFlagSpeechEntyRunned: false;




    //for sound service, user options
    property bool setSpeechOn: true;
    property bool setSpeechForBreaks:true;
    property bool setSpeechForRounds: true;
    property bool setSpeechForStartStop: true;



    property variant speechPacks: [directory_SoundSpeech_PackA];//,"male"];
    property int speechPackActived: 0;
    property string pathToActivedSpeechPack: path_to_sportTimer_SoundSpeech + speechPacks[speechPackActived];
    onSpeechPackActivedChanged:
    {
        pathToActivedSpeechPack = path_to_sportTimer_SoundSpeech + speechPacks[speechPackActived];
    }


    property bool setSoundEffectsOn: false;//false;
    property bool setSoundEffectsForBreaks: false;
    property bool setSoundEffectsForRounds: false;
    property bool setSoundEffectsForStartStop: false;
    property variant soundEffectsPacks: [directory_SoundEffect_PackA];//,directory_soundPackB];
    property int soundPackActived: 0;
    property string pathToActivedSoundPack: path_to_sportTimer_SoundEffect + soundEffectsPacks[soundPackActived];
    onSoundPackActivedChanged:
    {
        pathToActivedSoundPack = path_to_sportTimer_SoundEffect + soundEffectsPacks[soundPackActived];
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



    //signals for notices
    signal notices_roundStarted;
    signal notices_roundStopped;
    onNotices_roundStarted:
    {
        if(setSoundEffectsOn && setSoundEffectsForRounds)
        {
            STsoundEffects.playSoundEffect(theSoundEffect,1,2); //parameters: soundEffect id's  ,  status-> (0 stopped/endded) & (1 started/run), model (1 sportTimer) & (2 Round/Set) & (3 Break/Rest)
        }
        if(setSpeechOn && setSpeechForRounds)
        {
            STspeech.sayRoundBreak(theSoundSpeech,1);
            statusFlagSpeechEntyRunned= false;
            secondTimer.stop();
            mainTimer.stop();
            waitForSayNumber.running = true;
        }
    }
    onNotices_roundStopped:
    {
        if(setSoundEffectsOn && setSoundEffectsForRounds)
        {
            STsoundEffects.playSoundEffect(theSoundEffect,0,2);
        }
        if(setSpeechOn && setSpeechForRounds)
        {
            STspeech.sayRoundBreak(theSoundSpeech,0);
        }
        //speech ## round STOP REMOVED BECAUSE OF SOME REASONS
    }




    signal notices_breakStarted;
    signal notices_breakStopped;
    onNotices_breakStarted:
    {

    }

    onNotices_breakStopped:
    {
    }



    signal notices_timerStarted;
    signal notices_timerStopped;
    onNotices_timerStarted:
    {
        if(setSoundEffectsOn && setSoundEffectsForStartStop)
        {
            STsoundEffects.playSoundEffect(theSoundEffect,1,1); //parameters: soundEffect id's  ,  status-> (0 stopped/endded) & (1 started/run), model (1 sportTimer) & (2 Round/Set) & (3 Break/Rest)
        }
        if(setSpeechOn && setSpeechForStartStop)
        {
            STspeech.sayStartStop(theSoundSpeech,1);
        }
    }

    onNotices_timerStopped:
    {
        if(setSoundEffectsOn && setSoundEffectsForStartStop)
        {
            STsoundEffects.playSoundEffect(theSoundEffect,0,1);
        }
        if(setSpeechOn && setSpeechForStartStop)
        {
            STspeech.sayStartStop(theSoundSpeech,0);
        }
    }





    //to pepear for next sport Timer values
    signal startTheMainTimer; //call from outside
    signal initValues; //re-fill values for next time
    signal sportTimerEnded; //when times end this called

    onStartTheMainTimer:
    {
        initValues();
        mainTimer.running=true;
        notices_timerStarted();
    }

    onSportTimerEnded:
    {
        mainTimer.stop();
        secondTimer.stop();
        notices_timerStopped();
    }

    onInitValues:
    {
        valueRound.text=setRounds;
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





    SoundEffect
    {
        id:theSoundEffect;
        source: "";
    }

    SoundEffect
    {
        id:theSoundSpeech;
        source: "";
    }

    Timer
    {
        id:waitForSayNumber;
        interval: 10; running: false; repeat: true;
        onTriggered:
        {
            if(theSoundSpeech.playing==false)
            {
                var rou = Math.abs(tempRounds-(setRounds+1));
                if(rou<=9)
                {
                    STspeech.saySingleNumbers(theSoundSpeech,rou);
                    waitForSayNumber.stop();
                    secondTimer.running =true;
                }
                else if(rou > 9 && rou<=19)
                {
                    STspeech.sayTeenNumbers(theSoundSpeech,rou);
                    waitForSayNumber.stop();
                    secondTimer.running =true;
                }
                else
                {
                    if(!statusFlagSpeechEntyRunned)
                    {
                        STspeech.sayEntyNumber(theSoundSpeech,rou);
                        statusFlagSpeechEntyRunned=true;
                    }

                    if(theSoundSpeech.playing==false)
                    {
                        //to know other number example: 80/10=8 8-8=0 0*10=0;    other example: 85/10=8.5-8=0.5*10=5
                        var tempA = rou/10;
                        var tempVar = (rou/10) - parseInt(rou/10);
                        tempVar = parseInt(Math.round(tempVar*10));
                        if(tempVar!==0)
                        {
                            STspeech.saySingleNumbers(theSoundSpeech,tempVar);
                            waitForSayNumber.stop();
                            secondTimer.running =true;
                        }
                        else
                        {
                            waitForSayNumber.stop();
                            secondTimer.running =true;
                        }
                    }
                }

            }
        }
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
                    notices_breakStopped();
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
                    notices_roundStopped();
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

                    notices_breakStarted();
                    secondTimer.running = true;
                    mainTimer.running = false;
                }

            }
            else
            {
                //round turn
                if(tempRounds<=0)
                {
                    //round value is end
                    sportTimerEnded();
                }
                else
                {
                    roundOn=1;//means rounds turn
                    tempSaveRunnigs=0;
                    valueRound.text= Math.abs(tempRounds-(setRounds+1)) + "/" +setRounds; //this could be only  *.text = tempRounds, but (for example rounds=8) tempRounds will count from 8 to 0 but we want 1 to 8
                    if(setTimePerRound[2]<60 && setTimePerRound[2]>0)
                        minusPast_MinuteSecond = maxCircles/setTimePerRound[2];
                    else
                        minusPast_MinuteSecond = maxCircles/60;

                    notices_roundStarted();
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

        DrawCircle2 //back line, doing nothing just for beauty
        {
            id:justShowCircle;
            setLineWidth: setLineWidths[0];
            setColor: "#cfcfcf";//cBG_button_deactivated;//"#dcd3e8";
            setRadius: setRadiuses[0];
            setTime: maxCircles;
        }

        DrawCircle2 //other circles termperory removed from here because they didnt work but stored in TrashCodesForLater.qml
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
        setLeftButtonText: setSpeechOn ? "Speech" : "";
        setLeftButtonIcon: path_to_menuIcons + fileIcon_Mute;
        onLeftButtonPressed:
        {
            if(setLeftButtonIcon == path_to_menuIcons + fileIcon_Mute)
            {
                theSoundSpeech.volume = 1.0;
                setLeftButtonIcon= path_to_menuIcons + fileIcon_Unmute;
            }
            else
            {
                theSoundSpeech.volume = 0.0;
                setLeftButtonIcon= path_to_menuIcons + fileIcon_Mute;
            }
        }

        setRightButtonText: setSoundEffectsOn ? "Effect" : "";
        setRightButtonIcon: path_to_menuIcons + fileIcon_Unmute;
        onRightButtonPressed:
        {
            if(setRightButtonIcon == path_to_menuIcons + fileIcon_Mute)
            {
                theSoundEffect.volume = 1.0;
                setRightButtonIcon= path_to_menuIcons + fileIcon_Unmute;
            }
            else
            {
                theSoundEffect.volume = 0.0;
                setRightButtonIcon= path_to_menuIcons + fileIcon_Mute;
            }
        }

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
