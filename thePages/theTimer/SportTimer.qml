import QtQuick 2.15
import QtQuick.Controls 2.15
//import QtQuick.Layouts 1.15
//import QtQuick.Shapes 1.15
//import QtQuick.Window 2.15
import "../../theControls/canvasDraws/"
import "../../theScripts/theTimer/sportTimer.js" as ST

Item
{

    //data from user
    property int setRounds: 4;
    property variant setTimePerRound: [1,0,0]; //hour, minute, second, to know when is the time, example: if(setTime[0]=== setTimePerRound[0]/2) means we are in half way.
    property variant setBreaks: [0,0,30]; //hour, minute, second


    property variant avrageRounds: [(setTimePerRound[0]*setRounds) , (setTimePerRound[1]*setRounds) , (setTimePerRound[2]*setRounds)] //TPR (timePerRound) * rounds
    property variant avrageBreaks: [(setBreaks[0]*setRounds) , (setBreaks[1]*setRounds) , (setBreaks[2]*setRounds)]; //breaks*rounds
    property variant avrageBreak_Round: [(avrageRounds[0]+avrageBreaks[0]),
                                         (avrageRounds[1]+avrageBreaks[1]),
                                         (avrageRounds[2]+avrageBreaks[2])]; //hour,minute,second (avrage time = rounds+breaks)


    property variant setTimes: []; //hour,minute,second (avrage time = rounds+breaks)
    onAvrageBreak_RoundChanged:
    {
        setTimes[0] = parseInt(ST.addTimes_together(avrageBreak_Round[0],avrageBreak_Round[1],avrageBreak_Round[2],0));
        setTimes[1] = parseInt(ST.addTimes_together(avrageBreak_Round[0],avrageBreak_Round[1],avrageBreak_Round[2],1));
        setTimes[2] = parseInt(ST.addTimes_together(avrageBreak_Round[0],avrageBreak_Round[1],avrageBreak_Round[2],2));
    }


    property int roundOn: 1;
    //drawCircle
    property variant timePast: [avrageBreak_Round[0]*minusPast_Hour/4,
                                (avrageBreak_Round[1]+4)*minusPast_MinuteSecond,
                                avrageBreak_Round[2]*minusPast_MinuteSecond/maxCircles];
        //[setTimes[0]*minusPast_Hour  ,setTimes[1]*minusPast_MinuteSecond   ,setTimes[2]*minusPast_MinuteSecond]; //hour, minute, second
    property int maxCircles: 378;
    property double minusPast_Hour : 15.75; //maxCircles/24
    property double minusPast_MinuteSecond: 6.30; //maxCircles/60

    property int lineWsFromParent: parent.width/40;
    property variant setLineWidths: [lineWsFromParent,lineWsFromParent,lineWsFromParent];//hour,minute,second
    property variant setRadiuses: [20,17,14]; //h,m,s
    property variant setColors: ["black",cBG_button,"orange"];//hour, minute, second
    property variant setBreak_and_RoundColors: ["red","green","blue"]; //break, round, pause



    //section options
    property bool setSpeechOn: false;
    property variant setSpeechPlayEvery: [0,0,10];//hour , minute , second.
    property variant setSpeechPlayWhen: ["Rounds & rests & letsgo","Rounds & rests","Only rounds","Only rests"];
    property variant speechPacks: ["male","female"];

    property bool setVibrationOn: false;
    property bool setNotificationOn: false;
    property bool setSoundEffectsOn: false;
    property variant soundEffectsPacks: ["beeps","pings"];


    Timer
    {
        id:timerRun;
        interval: 1000; running: true; repeat: true;
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
                        if(roundOn)
                        {
                            roundOn=0;
                        }
                        else
                        {
                            roundOn=1;
                        }
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



                updateCircles(circleSecond,timePast[2],roundOn);
                updateCircles(circleMinute,timePast[1],3,setColors[1]);
                updateCircles(circleHour,timePast[0],3,setColors[0]);
//                    console.log("\th=" +h + "\tm=" + m + "\ts=" + s + "\tph=" + _pastH+ "\tpm=" +_pastM + "\tps=" +_pastS);

            }

            function updateCircles(_circle,_time,_status,_color='') //status ->  0 break , 1 round , 2 paused , 3 normal-color
            {
                switch(_status)
                {
                    case 0: _circle.setColor = setBreak_and_RoundColors[0]; break;
                    case 1: _circle.setColor = setBreak_and_RoundColors[1]; break;
                    case 2 : _circle.setColor = setBreak_and_RoundColors[2]; break;
                    default: _circle.setColor = _color; break;
                }
                _circle.setTime = _time;
                _circle.canvasPrint();
            }

            function refreshAll()
            {
                timeSystem(setTimes[0],setTimes[1],setTimes[2],timePast[0],timePast[1],timePast[2]);
                textRound.text= setTimes[0]+":"+setTimes[1]+":"+setTimes[2];



//                if(setTimes[0])
            }

            refreshAll();
        }
    }


    Timer
    {
        id:timerBreak;
        interval: 1; running: false; repeat: true;
    }

    anchors.fill: parent;
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
                text:"01";
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
}






/*
let ctx = getContext("2d");
var spaceCIRCLE=0;
ctx.reset();
ctx.beginPath();
//                ctx.moveTo(canvas.width/2, canvas.height/2);
ctx.arc(canvas.width/2+spaceCIRCLE, canvas.height/2+spaceCIRCLE, 100, Math.PI, 0, false);
//                ctx.lineWidth = 4;
//                ctx.lineCap = "round";

//                ctx.moveTo(canvas.width, canvas.height);
//                ctx.lineTo();
//                ctx.strokeStyle = '#FF0000';
ctx.stroke();
ctx.beginPath();
//                                ctx.closePath();
//                                ctx.fill();
//                                ctx.beginPath();
//                                for (let j = 0; j < pts.length; j++) {
//                                    ctx.ellipse(pts[j].x - 5, pts[j].y - 5, 10, 10);
//                                }
//                                ctx.strokeStyle = "red";
//                                ctx.stroke();
*/
