import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../theControls/canvasDraws/"
import "../../theScripts/theTimer/sportTimer.js" as ST

Item
{

    //data from user
    property int setRounds: 10;
    property int tempSetRounds:setRounds;
    property variant setTimePerRound: [0,1,0]; //hour, minute, second, to know when is the time, example: if(setTime[0]=== setTimePerRound[0]/2) means we are in half way.
    property variant setBreaks: [0,0,30]; //hour, minute, second
    property int roundOn: 1; //a flag to know when is Break/Round

    property variant tempBreaks: setBreaks;
    property variant tempTPR: setTimePerRound;

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
        id:mainTimer;
        interval: 1; running: true; repeat: true;
        onTriggered:
        {
            valueRound.text= tempSetRounds;//setTimes[0]+":"+setTimes[1]+":"+setTimes[2];





//            ST.timeSystem(setBreaks[0],setBreaks[1],setBreaks[2],timePast[0],timePast[1],timePast[2],0);
//            ST.timeSystem(setTimes[0],setTimes[1],setTimes[2],timePast[0],timePast[1],timePast[2],tempBreaks[0],tempBreaks[1],tempBreaks[2],roundOn);
//            if((setTimes[0]-setBreaks[0])/tempSetRounds === setTimePerRound[0] &&
//               (setTimes[1]-setBreaks[1])/tempSetRounds === setTimePerRound[1] &&
//               (setTimes[2]-setBreaks[2])/tempSetRounds === setTimePerRound[2])
//            {
//                tempSetRounds--;
//                console.log(setRounds + "\t"+ setTimes[0] + "\t"+ setTimes[1] + "\t"+ setTimes[2]);
//                console.log(setRounds + "\t"+ setBreaks[0] + "\t"+ setBreaks[1] + "\t"+ setBreaks[2]);
//                console.log(setRounds + "\t"+ (setTimes[0]-setBreaks[0])/setRounds + "\t"+ (setTimes[1]-setBreaks[1])/setRounds + "\t"+ (setTimes[2]-setBreaks[2])/setRounds);
//                console.log(setRounds + "\t"+ avrageRounds[0] + "\t"+ avrageRounds[1] + "\t"+ avrageRounds[2]);
//                console.log(setRounds + "\t"+ avrageBreak_Round[0] + "\t"+ avrageBreak_Round[1] + "\t"+ avrageBreak_Round[2]);
//                console.log("\n");
//            }


        }
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
                    anchors.bottom: parent.bottom;
                    font.pointSize: ((parent.width<=100) ? 15 : 30);
                    color:cTxt_button;
                }
                Text
                {
                    id:textRound;
                    text:"Round";
                    anchors.bottom: valueRound.top;
                    anchors.horizontalCenter: parent.horizontalCenter;
                    font.pointSize: ((parent.width<=100) ? 15 : 25);
                    color:cTxt_button;
                }
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
