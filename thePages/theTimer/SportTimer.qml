import QtQuick 2.15
import QtQuick.Controls 2.15
//import QtQuick.Layouts 1.15
//import QtQuick.Shapes 1.15
//import QtQuick.Window 2.15
import "../../theControls/canvasDraws/"

Item
{
    property variant setTotal: [0,4,0,0]; //hour, minute, second, milisecond
    property variant setBreak: [0,1,0,0]; //hour, minute, second, milisecond
    property variant setSpeechPlayEvery: [0,0,10,0]; //hour , minute , second. ,milisecond
    property variant setColors: ["gray","orange","red","cyan"]; //hour, minute, second, milisecond
    property int setRound: 4;//not sure put this or not

    property int lineWsFromParent: parent.width/40;
    property variant setLineWidths: [lineWsFromParent,lineWsFromParent,lineWsFromParent,lineWsFromParent]//[20,15,10,5]; //hour,minute,second,milisecond  //test make this int instead variant
    property variant setRadiuses: [20,17,14,11]; //h,m,s,ms


    property variant timePast: [1,1,1,1]; //hour, minute, second, milisecond


    //setttings
    property variant setSpeechPlayWhen: ["Rounds & rests & letsgo","Rounds & rests","Only rounds","Only rests"];
    property bool setSpeechOn: false;
    property bool setSoundEffectsOn: false;
    property bool setVibrationOn: false;
    property bool setNotificationOn: false;
    property variant soundPacks: ["beeps","pings"];
    property variant speechPacks: ["male","female"];



    Timer
    {
        id:timerRun;
        interval: 1; running: false; repeat: true;
        onTriggered:
        {
            function updateCircles(h,m,s,ms)
            {
                const plusValue = 6.33;
                const maxCircles = 380;
                ms += plusValue;
                if(ms>=maxCircles)
                {
                   ms=0;
                   s+=plusValue;
                    if(s>=maxCircles)
                    {
                        s=0;
                        m+=plusValue;
                        if(m>=maxCircles)
                        {
                            m=0;
                            h+=plusValue;
                            if(h>=maxCircles)
                            {
                                h=0;
                                    //here
                            }
                        }
                    }
                }
                timePast[0]=h;
                timePast[1]=m;
                timePast[2]=s;
                timePast[3]=ms;
                //return '{"h":'+h+',"m":'+m+',"s":'+s+',"ms":'+ms+'}';
            }
            function updateCanvanses(_circle,_time)
            {
                _circle.setTime = _time;
                _circle.canvasPrint();
            }

            updateCircles(timePast[0],timePast[1],timePast[2],timePast[3]);
            updateCanvanses(circleHour,timePast[0]);
            updateCanvanses(circleMinute,timePast[1]);
            updateCanvanses(circleSecond,timePast[2]);
            updateCanvanses(circleMilisecond,timePast[3]);



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
        color:"purple";
//        anchors.top: parent.top;
//        anchors.topMargin: 20;
        DrawCircle
        {
            id:circleHour;
            setLineWidth: setLineWidths[0];
            setColor: setColors[0];
            setRadius: setRadiuses[0];
            setTime: timePast[0];
            setTimeDivide: 60;

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
                    DrawCircle
                    {
                        id:circleMilisecond;
                        setLineWidth: setLineWidths[3];
                        setColor: setColors[3];
                        setRadius: setRadiuses[3];
                        setTime: timePast[3];
                        setTimeDivide: 60;
                    }
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
