import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../theControls/canvasDraws/"
import "../../theControls/"
import "../../theScripts/theTimer/sportTimer.js" as ST
Item
{
    id:root;
    clip:true;
    anchors.fill: parent;
    signal runTimer;
    signal cancelTimer;
    onCancelTimer:
    {
        timerRun.stop();
    }

    onRunTimer:
    {
        setTimes[0] = baseTime[0];
        setTimes[1] = baseTime[1];
        setTimes[2] = baseTime[2];
        timePast= [setTimes[0]*minusPast_Hour  ,setTimes[1]*minusPast_MinuteSecond   ,setTimes[2]*minusPast_MinuteSecond];
        timerRun.running=true;
    }

    property variant baseTime: [0,0,0]; //hour, minute, second, to know when is the time, example: if(setTime[0]=== baseTime[0]/2) means we are in half way.
    property variant setTimes: [];//baseTime[0],baseTime[1],baseTime[2]]; //hour, minute, second




    //drawCircle
    property int maxCircles: 378;
    property double minusPast_Hour : 15.75; //maxCircles/24
    property double minusPast_MinuteSecond: 6.30; //maxCircles/60
    property variant timePast: [setTimes[0]*minusPast_Hour  ,setTimes[1]*minusPast_MinuteSecond   ,setTimes[2]*minusPast_MinuteSecond]; //hour, minute, second

    property int lineWsFromParent: parent.width/40;
    property variant setLineWidths: [lineWsFromParent,lineWsFromParent,lineWsFromParent];//hour,minute,second
    property variant setRadiuses: [20,17,14]; //h,m,s
    property variant setColors: ["orange",cBG_button,"black"];//hour, minute, second
    property variant setBreak_and_RoundColors: ["red","green","blue"]; //break, round, pause


    Timer
    {
        id:timerRun;
        interval: 1000; running: false; repeat: true;
        onTriggered:
        {

            function timeSystem(h,m,s,_pastH,_pastM,_pastS,_textTimer)
            {
                if(s>0)
                {
                    s--;
                    _pastS -= minusPast_MinuteSecond;
                    if(_pastS<0)
                        _pastS=maxCircles;
                }
                else if(m>0)
                {
                    if(m>0)
                    {
                        m--;
                        _pastM -= minusPast_MinuteSecond;
                        if(_pastM<0)
                        {
                            if(h<=0)
                                _pastM=0;
                            else
                                _pastM=maxCircles;
                        }

                        s=60;
                    }
                }
                else
                {
                    if(h>0)
                    {
                        _pastH -= minusPast_Hour;
                        if(_pastH<0)
                        {
                            if(h<=0)
                                _pastH=0;
                            else
                                _pastH=maxCircles;
                        }
                        h--;
                        m=60;
                    }
                    else
                        _pastM=0;
                }

                    timePast[2] = _pastS;
                    timePast[1] = _pastM;
                    timePast[0] = _pastH;

                    setTimes[2] = s;
                    setTimes[1] = m;
                    setTimes[0] = h;

                    ST.updateCircles(circleSecond,timePast[2],1);
                    ST.updateCircles(circleMinute,timePast[1],3,setColors[1]);
                    ST.updateCircles(circleHour,timePast[0],3,setColors[0]);
                if(h === 0 && m === 0 && s===0)
                {
                    cancelTimer();
                }
            }

            timeSystem(setTimes[0],setTimes[1],setTimes[2],timePast[0],timePast[1],timePast[2]);
            textRound.text= setTimes[0]+":"+setTimes[1]+":"+setTimes[2];

        }
    }




    Rectangle
    {
        anchors.fill: parent;
        color:cBG;
        DrawCircle
        {
            id:circleHour;
            setLineWidth: setLineWidths[0];
            setColor: setColors[0];
            setRadius: setRadiuses[0];
            setTime: timePast[0];
            setTimeDivide: 60;
            Text
            {
                id:textRound;
                text:"-:-:-";
                anchors.centerIn: parent;
                font.pointSize: ((parent.width<=520) ? 13 : 20);
                color:cTxt_button;
            }

            DrawCircle
            {
                id:circleMinute;
                setLineWidth: setLineWidths[1];
                setColor: setColors[1];
                setRadius: setRadiuses[1];
                setTime: timePast[1];
                setTimeDivide: 60;
                DrawCircle
                {
                    id:circleSecond;
                    setLineWidth: setLineWidths[2];
                    setColor: setColors[2];
                    setRadius: setRadiuses[2];
                    setTime: timePast[2];
                    setTimeDivide: 60;
                }
            }

        }
    }
    MyThreeBottomButtons
    {
        id:sportButtons;
        width: root.width;
        height:root.height/10.5;
        setCenterButtonText: "";
//        setCenterButtonCircleStyled:true;
        setLeftButtonText: "Cancel";
        setRightButtonText: "Pause";
        onLeftButtonPressed:
        {
            cancelTimer();
        }
        onRightButtonPressed:
        {
            if(setRightButtonText == "Pause")
            {
                timerRun.stop();
                setRightButtonText = "Resume";
            }
            else
            {
                timerRun.running=true;;
                setRightButtonText= "Pause";
            }

        }

        anchors
        {
            bottom:root.bottom;
            bottomMargin:15;
        }
    }
}





