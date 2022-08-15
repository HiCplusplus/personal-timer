import QtQuick 2.15
Item {
    id: name
}


/* My fav styles


    menu down idea
            https://dribbble.com/shots/17686848-Alarm-Clock-App-UI


    timer single
            https://dribbble.com/shots/7077105-Daily-UI-challenge-014-Countdown-Timer

i wish do this https://dribbble.com/shots/14896001-Alarm-App-Concept
good looking color and theme https://dribbble.com/shots/17279416-Sleepzy-Sleep-tracker-app
https://dribbble.com/shots/4894371-Dashboard-Graph
good looking calneders
    https://dribbble.com/shots/16390127-Schedule-App
    https://dribbble.com/shots/15628214-Calendar-app
    https://dribbble.com/shots/16618447-Falop-Project
    https://dribbble.com/shots/6291859-Date-Picker
    https://dribbble.com/shots/3769275-Calendar-Daily-UI-038
    https://dribbble.com/shots/5554215-Task-manage-app-concept
    https://dribbble.com/shots/9622078-Daily-UI-Events-App-Design
    https://dribbble.com/shots/18098594-Delivery-Components
    https://dribbble.com/shots/4749823-Calender-Screen
    https://dribbble.com/shots/5642817-Calender-with-Background-Gradient
    https://dribbble.com/shots/5811377-5-100-Calender-of-the-day
    https://dribbble.com/shots/3870315-Event-Listing-Daily-UI-070
    https://dribbble.com/shots/3671877-Calender
    https://dribbble.com/shots/8945197-Minimal-Calender-Modul-1
    https://dribbble.com/shots/10924372-UI-design-for-calender
    https://dribbble.com/shots/4129451-Time-Tracker-Concept
    https://dribbble.com/shots/4994794-Flight-Booking-App-Freebie
    https://dribbble.com/shots/16710172-Task-Management-App-to-do-calender-events
    https://dribbble.com/shots/10170477-Date-Picker-Exploration-Part-1
    https://dribbble.com/shots/11751267-DailyUI-Day42-ToDo-List
    https://dribbble.com/shots/14748311-Task-Manager-App
    Text to speech sounds:
    https://ttsmp3.com/
    https://freetts.com/
    https://voicemaker.in/


*/













//------------------------------------------------------------------------------------------------------- from Sport Timer


//            DrawCircle
//            {
//                id:circleHour;
//                setLineWidth: setLineWidths[0];
//                setColor: setColors[0];
//                setRadius: setRadiuses[0];
//                setTime: timePast[0];
//                setTimeDivide: 60;
//            DrawCircle
//            {
//                id:circleMinute;
//                setLineWidth: setLineWidths[1];
//                setColor: setColors[1];
//                setRadius: setRadiuses[1];
//                setTime: timePast[1];
//                setTimeDivide: 60;
//                DrawCircle
//                {
//                    id:circleSecond;
//                    setLineWidth: setLineWidths[2];
//                    setColor: setColors[2];
//                    setRadius: setRadiuses[2];
//                    setTime: timePast[2];
//                    setTimeDivide: 60;
//                }
//            }
            //}








// import ArcGIS.AppFramework.Speech 1.0
//import QtTextToSpeech

//                    console.log("breaks="+tempBreaks);


//[setTimes[0]*minusPast_Hour  ,setTimes[1]*minusPast_MinuteSecond   ,setTimes[2]*minusPast_MinuteSecond]; //hour, minute, second



//setTimes[0]+":"+setTimes[1]+":"+setTimes[2];

//            console.log("counts:\n breaks=" +tempBreaks + "\trounds="+ tempRounds);
//            console.log("setRounds="+setRounds + "\t setTimes H="+ setTimes[0] + "\tsetTimes M="+ setTimes[1] + "\tsetTimes S="+ setTimes[2]);
//            console.log("\tbreaks H="+ setBreaks[0] + "\t"+ setBreaks[1] + "\t"+ setBreaks[2]);
//            console.log("\t(setTimes[0]-setBreaks[0])/setRounds="+ (setTimes[0]-setBreaks[0])/setRounds + "\t"+ (setTimes[1]-setBreaks[1])/setRounds + "\t"+ (setTimes[2]-setBreaks[2])/setRounds);
//            console.log("\tavrageRounds[0]="+ avrageRounds[0] + "\t"+ avrageRounds[1] + "\t"+ avrageRounds[2]);
//            console.log("\tavrageBreak_Round[0]="+ avrageBreak_Round[0] + "\t"+ avrageBreak_Round[1] + "\t"+ avrageBreak_Round[2]);
//            console.log("\n");


//setTimes[0]+":"+setTimes[1]+":"+setTimes[2];

//                    while(setTimes[2] !== setTimes[2]-setBreaks[2])
//                    {
//                        console.log("---------------------" + timePast[2]/minusPast_MinuteSecond +"-"+ (setTimes[2]-setBreaks[2]));
//                        ST.timeSystem(setTimes[0],setTimes[1],setTimes[2],timePast[0],timePast[1],timePast[2],0);
//                    }

//                    ST.timeSystem(setBreaks[0],setBreaks[1],setBreaks[2],timePast[0],timePast[1],timePast[2],1);


//                    anchors.bottom: valueRound.top;



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














//------------------------------------------------------------------------------------------------------- from Count Down




//                    console.log("\th=" +h + "\tm=" + m + "\ts=" + s + "\tph=" + _pastH+ "\tpm=" +_pastM + "\tps=" +_pastS);


//            _textRound,_round
//            _textRound.text = _round;






//    Timer
//    {
//        id:timerBreak;
//        interval: 1; running: false; repeat: true;
//    }


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

























//    property variant setBreaks: [0,0,30]; //hour, minute, second
//    property int setRounds: 4;


    //section options
//    property bool setSpeechOn: false;
//    property variant setSpeechPlayEvery: [0,0,10];//hour , minute , second.
//    property variant setSpeechPlayWhen: ["Rounds & rests & letsgo","Rounds & rests","Only rounds","Only rests"];
//    property variant speechPacks: ["male","female"];

//    property bool setVibrationOn: false;
//    property bool setNotificationOn: false;
//    property bool setSoundEffectsOn: false;
//    property variant soundEffectsPacks: ["beeps","pings"];






//import QtQuick 2.15
//import QtQuick.Controls 2.15
//import "../../theControls/canvasDraws"
/*import "../../theControls"
//import "../../theScripts/controllerSpingBoxCountDown.js" as CSBC
//import "../../theScripts/updateCountDown.js" as UCD
//import QtMultimedia 5.15
//import "../../thePages"

Item
{


    property int theHour: 0;
    property int theMinute:0;
    property int theSecond:0;

    anchors.fill: parent;
    clip:true;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:cBG;
        DrawCircle
        {

        }

    }

}//end of item
*/

//signal goToDismissPage;

//property int mavFontSizes: 30;
//property int mavTimerIntervalValue: 200;

//property bool increaseDecreaseControllerStatusEnabled: false;
//    property color setColorBG: "white";
//    property color colorTexts: "black";


//for MyAutoValue Increase Decrease.qml
//    property color mavColorTexts: "black";



//    SoundEffect
//    {
//        id:theSoundEffectTimesUp;
//        source: "./theSounds/mixkit-elevator-tone-2863.wav"; //from https://mixkit.co/free-sound-effects/
//    }



//    Timer
//    {
//        id: globaTimer;
//        interval: 1000;
//        repeat: true;
//        running: false;

//        onTriggered:
//        {
//            var allObject = JSON.parse(UCD.updateCountDown(theHour,theMinute,theSecond));
//            theHour = allObject.h;
//            theMinute = allObject.m;
//            theSecond = allObject.s;

//            if(theHour<10)
//                txtHour.text = "0"+theHour;
//            else
//                txtHour.text = theHour;


//            if(theMinute<10)
//                txtMinute.text = "0"+theMinute;
//            else
//                txtMinute.text = theMinute;


//            if(theSecond<10)
//                txtSecond.text = "0"+theSecond;
//            else
//                txtSecond.text = theSecond;

//            if(theHour<=0&&theMinute<=0&&theSecond<=0)
//            {
//                theSoundEffectTimesUp.play();
//                myDismiss.visible=true;
//                goToDismissPage();
//            }
//        }
//    }

//    Rectangle
//    {
//        id:addNewTimer;
//        width: parent.width/1.2;
//        height:parent.height/4;
//        color:cBG_Unknown;
//        anchors
//        {
//            horizontalCenter:parent.horizontalCenter;
//            verticalCenter:parent.verticalCenter;
//        }

//        Rectangle
//        {
//            id:baseSetTimer;
//            width: parent.width;
//            height: parent.height;
//            anchors.centerIn: parent;
//            color:cBG_Unknown;
//            Row
//            {
//                anchors.fill: parent;
//                Rectangle
//                {
//                    id:setHour;
//                    width: parent.width/3.2;
//                    height:parent.height;
//                    color:cBG_Unknown;
//                    Text
//                    {
//                        text:"Hours";
//                        color:cTxt_button;
//                        anchors.horizontalCenter:parent.horizontalCenter;
//                    }
//                    Text
//                    {
//                        id:txtHour;
//                        text:theHour<10? "0"+theHour: theHour;
//                        color:cTxt_button;
//                        anchors.horizontalCenter:parent.horizontalCenter;
//                        anchors.verticalCenter: parent.verticalCenter;
//                        font.pointSize: 40;
//                        font.bold:true;
//                    }
//                    Rectangle
//                    {
//                        width: 35;
//                        height:35;
//                        anchors.bottom: txtHour.top;
//                        anchors.horizontalCenter: parent.horizontalCenter;
//                        color:cBG_Unknown;
//                        MyAutoIncreaseValue
//                        {
//                            id:hourIncrease;
//                            anchors.fill: parent;
//                            setTimerIntervalValue: mavTimerIntervalValue;
//                            setInputIntValue: theHour;
//                            onOutputResultStringChanged:
//                            {
//                                txtHour.text = outputResultString;
//                            }
//                            onOutputResultIntChanged:
//                            {
//                                theHour = outputResultInt;
//                            }
//                        }

////                        MyAutoValue_Increase_Decrease
////                        {
////                            id:hourIncrease;
////                            anchors.fill: parent;

////                            setLocalStatusIncreaseOrDecrease: true;//false means decrease, true means  increase
////                            setTimerIntervalValue: mavTimerIntervalValue;
////                            setInputIntValue: theHour;
////                            onOutputResultStringChanged:
////                            {
////                                txtHour.text = outputResultString;
////                            }
////                            onOutputResultIntChanged:
////                            {
////                                theHour = outputResultInt;
////                            }
////                        }
//                    }

//                    Rectangle
//                    {
//                        width: 35;
//                        height:35;
//                        anchors.top: txtHour.bottom;
//                        anchors.horizontalCenter: parent.horizontalCenter;
//                        color:cBG_Unknown;
//                        MyAutoDecreaseValue
//                        {
//                            id:hourDecrease;
//                            anchors.fill: parent;
//                            setTextFontSize: mavFontSizes;
//                            setTimerIntervalValue: mavTimerIntervalValue;
//                            setInputIntValue: theHour;
//                            onOutputResultStringChanged:
//                            {
//                                txtHour.text = outputResultString;
//                            }
//                            onOutputResultIntChanged:
//                            {
//                                theHour = outputResultInt;
//                            }
//                        }
////                        MyAutoValue_Increase_Decrease
////                        {
////                            id:hourDecrease;
////                            anchors.fill: parent;

////                            setLocalStatusIncreaseOrDecrease: false;//false means decrease, true means  increase
////                            setTextFontSize: mavFontSizes;
////                            setTimerIntervalValue: mavTimerIntervalValue;
////                            setInputIntValue: theHour;
////                            onOutputResultStringChanged:
////                            {
////                                txtHour.text = outputResultString;
////                            }
////                            onOutputResultIntChanged:
////                            {
////                                theHour = outputResultInt;
////                            }
////                        }
//                    }


//                }
//                Text
//                {
//                    text:":";
//                    color:cTxt_button;
//                    anchors.verticalCenter: parent.verticalCenter;
//                    font.pointSize: 40;
//                    font.bold:true;
//                }
//                Rectangle
//                {
//                    id:setMinute;
//                    width: parent.width/3.2;
//                    height:parent.height;
//                    color:cBG_Unknown;
//                    Text
//                    {
//                        text:"Minutes";
//                        color:cTxt_button;
//                        anchors.horizontalCenter:parent.horizontalCenter;
//                    }
//                    Text
//                    {
//                        id:txtMinute;
//                        text:theMinute<10? "0"+theMinute: theMinute;
//                        color:cTxt_button;
//                        anchors.horizontalCenter:parent.horizontalCenter;
//                        anchors.verticalCenter: parent.verticalCenter;
//                        font.pointSize: 40;
//                        font.bold:true;
//                    }

//                    Rectangle
//                    {
//                        width: 35;
//                        height:35;
//                        anchors.bottom: txtMinute.top;
//                        anchors.horizontalCenter: parent.horizontalCenter;
//                        color:cBG_Unknown;
//                        MyAutoIncreaseValue
//                        {
//                            id:minuteIncrease;
//                            anchors.fill: parent;

//                            setTextFontSize: mavFontSizes;
//                            setTimerIntervalValue: mavTimerIntervalValue;
//                            setInputIntValue: theMinute;
//                            onOutputResultStringChanged:
//                            {
//                                txtMinute.text = outputResultString;
//                            }
//                            onOutputResultIntChanged:
//                            {
//                                theMinute = outputResultInt;
//                            }
//                        }
////                        MyAutoValue_Increase_Decrease
////                        {
////                            id:minuteIncrease;
////                            anchors.fill: parent;

////                            setLocalStatusIncreaseOrDecrease: true;//false means decrease, true means  increase
////                            setTextFontSize: mavFontSizes;
////                            setTimerIntervalValue: mavTimerIntervalValue;
////                            setInputIntValue: theMinute;
////                            onOutputResultStringChanged:
////                            {
////                                txtMinute.text = outputResultString;
////                            }
////                            onOutputResultIntChanged:
////                            {
////                                theMinute = outputResultInt;
////                            }
////                        }
//                    }
//                    Rectangle
//                    {
//                        width: 35;
//                        height:35;
//                        anchors.top: txtMinute.bottom;
//                        anchors.horizontalCenter: parent.horizontalCenter;
//                        color:cBG_Unknown;
//                        MyAutoDecreaseValue
//                        {
//                            id:minuteDecrease;
//                            anchors.fill: parent;

//                            setTextFontSize: mavFontSizes;
//                            setTimerIntervalValue: mavTimerIntervalValue;
//                            setInputIntValue: theMinute;
//                            onOutputResultStringChanged:
//                            {
//                                txtMinute.text = outputResultString;
//                            }
//                            onOutputResultIntChanged:
//                            {
//                                theMinute = outputResultInt;
//                            }
//                        }
////                        MyAutoValue_Increase_Decrease
////                        {
////                            id:minuteDecrease;
////                            anchors.fill: parent;

////                            setLocalStatusIncreaseOrDecrease: false;//false means decrease, true means  increase
////                            setTextFontSize: mavFontSizes;
////                            setTimerIntervalValue: mavTimerIntervalValue;
////                            setInputIntValue: theMinute;
////                            onOutputResultStringChanged:
////                            {
////                                txtMinute.text = outputResultString;
////                            }
////                            onOutputResultIntChanged:
////                            {
////                                theMinute = outputResultInt;
////                            }
////                        }
//                    }

//                }
//                Text
//                {
//                    text:":";
//                    color:cTxt_button;
//                    anchors.verticalCenter: parent.verticalCenter;
//                    font.pointSize: 40;
//                    font.bold:true;
//                }
//                Rectangle
//                {
//                    id:setSecond;
//                    width: parent.width/3.2;
//                    height:parent.height;
//                    color:cBG_Unknown;
//                    Text
//                    {
//                        id:labelSeconds;
//                        text:"Seconds";
//                        color:cTxt_button;
//                        anchors.horizontalCenter:parent.horizontalCenter;
//                    }
//                    Text
//                    {
//                        id:txtSecond;
//                        text:theSecond<10? "0"+theSecond:theSecond;
//                        color:cTxt_button;
//                        anchors.horizontalCenter:parent.horizontalCenter;
//                        anchors.verticalCenter: parent.verticalCenter;
//                        font.pointSize: 40;
//                        font.bold:true;
//                    }
//                    Rectangle
//                    {
//                        width: 35;
//                        height:35;
//                        anchors.bottom: txtSecond.top;
//                        anchors.horizontalCenter: parent.horizontalCenter;
//                        color:cBG_Unknown;
//                        MyAutoIncreaseValue
//                        {
//                            id:secondIncrease;
//                            anchors.fill: parent;

//                            setTextFontSize: mavFontSizes;
//                            setTimerIntervalValue: mavTimerIntervalValue;
//                            setInputIntValue: theSecond;
//                            onOutputResultStringChanged:
//                            {
//                                txtSecond.text = outputResultString;
//                            }
//                            onOutputResultIntChanged:
//                            {
//                                theSecond = outputResultInt;
//                            }
//                        }
////                        MyAutoValue_Increase_Decrease
////                        {
////                            id:secondIncrease;
////                            anchors.fill: parent;

////                            setLocalStatusIncreaseOrDecrease: true;//false means decrease, true means  increase
////                            setTextFontSize: mavFontSizes;
////                            setTimerIntervalValue: mavTimerIntervalValue;
////                            setInputIntValue: theSecond;
////                            onOutputResultStringChanged:
////                            {
////                                txtSecond.text = outputResultString;
////                            }
////                            onOutputResultIntChanged:
////                            {
////                                theSecond = outputResultInt;
////                            }
////                        }
//                    }



//                    Rectangle
//                    {
//                        width: 35;
//                        height:35;
//                        anchors.top: txtSecond.bottom;
//                        anchors.horizontalCenter: parent.horizontalCenter;
//                        color:cBG_Unknown;
//                        MyAutoDecreaseValue
//                        {
//                            id:secondDecrease;
//                            anchors.fill: parent;

//                            setTextFontSize: mavFontSizes;
//                            setTimerIntervalValue: mavTimerIntervalValue;
//                            setInputIntValue: theSecond;
//                            onOutputResultStringChanged:
//                            {
//                                txtSecond.text = outputResultString;
//                            }
//                            onOutputResultIntChanged:
//                            {
//                                theSecond = outputResultInt;
//                            }
//                        }
////                        MyAutoValue_Increase_Decrease
////                        {
////                            id:secondDecrease;
////                            anchors.fill: parent;

////                            setLocalStatusIncreaseOrDecrease: false;//false means decrease, true means  increase
////                            setTextFontSize: mavFontSizes;
////                            setTimerIntervalValue: mavTimerIntervalValue;
////                            setInputIntValue: theSecond;
////                            onOutputResultStringChanged:
////                            {
////                                txtSecond.text = outputResultString;
////                            }
////                            onOutputResultIntChanged:
////                            {
////                                theSecond = outputResultInt;
////                            }
////                        }
//                    }

//                }

//            }//end of row

//        }//end of base Set Timer

//    }//end of add new timer


//    MyThreeBottomButtons
//    {
//        id:idMyThreeBottomButtons
//        width: parent.width;
//        height:root.height/10.5;
//        setCenterButtonText: "Start";
//        setLeftButtonText: "Reset";
//        setRightButtonText: ""; //leave empty for hide button
//        anchors
//        {
//            bottom:root.bottom;
//            bottomMargin:15;
//        }
//        onCenterButtonPressed:
//        {
//            if((!(theHour<=0&&theMinute<=0&&theSecond<=0)) && idMyThreeBottomButtons.setCenterButtonText == "Start")
//            {
//                increaseDecreaseControllerStatusEnabled=false;
//                idMyThreeBottomButtons.setCenterButtonText = "Pause";

//                globaTimer.running=!increaseDecreaseControllerStatusEnabled;
//                hourIncrease.visible=increaseDecreaseControllerStatusEnabled;
//                hourDecrease.visible=increaseDecreaseControllerStatusEnabled;
//                minuteIncrease.visible=increaseDecreaseControllerStatusEnabled;
//                minuteDecrease.visible=increaseDecreaseControllerStatusEnabled;
//                secondIncrease.visible=increaseDecreaseControllerStatusEnabled;
//                secondDecrease.visible=increaseDecreaseControllerStatusEnabled;
//            }
//            else
//            {
//                //button pause pressed
//                increaseDecreaseControllerStatusEnabled=true;
//                idMyThreeBottomButtons.setCenterButtonText = "Start";

//                globaTimer.running=!increaseDecreaseControllerStatusEnabled;
//                hourIncrease.visible=increaseDecreaseControllerStatusEnabled;
//                hourDecrease.visible=increaseDecreaseControllerStatusEnabled;
//                minuteIncrease.visible=increaseDecreaseControllerStatusEnabled;
//                minuteDecrease.visible=increaseDecreaseControllerStatusEnabled;
//                secondIncrease.visible=increaseDecreaseControllerStatusEnabled;
//                secondDecrease.visible=increaseDecreaseControllerStatusEnabled;
//            }

//        }
//        onLeftButtonPressed:
//        {
//            if(theHour>0 || theMinute>0 || theSecond>0)
//            {
//                increaseDecreaseControllerStatusEnabled=true;
//                txtHour.text = txtMinute.text = txtSecond.text = "00";
//                theHour = theMinute = theSecond = 0;

//                idMyThreeBottomButtons.setCenterButtonText = "Start";

//                globaTimer.running=!increaseDecreaseControllerStatusEnabled;
//                hourIncrease.visible=increaseDecreaseControllerStatusEnabled;
//                hourDecrease.visible=increaseDecreaseControllerStatusEnabled;
//                minuteIncrease.visible=increaseDecreaseControllerStatusEnabled;
//                minuteDecrease.visible=increaseDecreaseControllerStatusEnabled;
//                secondIncrease.visible=increaseDecreaseControllerStatusEnabled;
//                secondDecrease.visible=increaseDecreaseControllerStatusEnabled;
//            }


//        }
//    }//end of three buttons

//    DismissPage
//    {

//        id:myDismiss;
//        visible: false;
//        onStatusDismiss:
//        {
//            theSoundEffectTimesUp.stop();
//            myDismiss.visible=false;
//            increaseDecreaseControllerStatusEnabled=true;
//            idMyThreeBottomButtons.setCenterButtonText = "Start";
//            globaTimer.running=!increaseDecreaseControllerStatusEnabled;
//            hourIncrease.visible=increaseDecreaseControllerStatusEnabled;
//            hourDecrease.visible=increaseDecreaseControllerStatusEnabled;
//            minuteIncrease.visible=increaseDecreaseControllerStatusEnabled;
//            minuteDecrease.visible=increaseDecreaseControllerStatusEnabled;
//            secondIncrease.visible=increaseDecreaseControllerStatusEnabled;
//            secondDecrease.visible=increaseDecreaseControllerStatusEnabled;
//        }
//    }



//------------------------------------------------------------------------------------------------------- from NEW CountDown.qml
//            function updateCircles(_circle,_time,_status,_color='') //status ->  0 break , 1 round , 2 paused , 3 normal-color
//            {
//                switch(_status)
//                {
//                    case 0: _circle.setColor = setBreak_and_RoundColors[0]; break;
//                    case 1: _circle.setColor = setBreak_and_RoundColors[1]; break;
//                    case 2 : _circle.setColor = setBreak_and_RoundColors[2]; break;
//                    default: _circle.setColor = _color; break;
//                }
//                _circle.setTime = _time;
//                _circle.canvasPrint();
//            }


//------------------------------------------------------------------------------------------------------- from Timers.qml
//import QtQuick 2.15
//import QtQuick.Controls 2.15
//import "theControls"
//import "thePages"
//import "thePages/theTimer"
////import "theScripts/updateIndicator.js" as uIndicator

//Item
//{
//    property int setLunchIndex: 2;
//    anchors.fill: parent;
//    clip:true;
//    Rectangle
//    {
//        id:root;
//        anchors.fill: parent;
//        color:cBG;

//        SwipeView
//        {
//            id:timersSwiper;
//            anchors.fill: parent;
////            clip:true;
//            anchors.top: timersIndicator.bottom;
//            currentIndex: setLunchIndex;
//            Item
//            {
//                id:baseSingleTimer;
//            }
//            Item
//            {

//            }
//            Item
//            {
//                id:baseSportTimer;

//            }


//        }

////        MyTimerIndicator
////        {
////            id:timersIndicator;
////            myIndicatorIndexDText: "Single";
////            myIndicatorIndexAText: "Multi";
////            myIndicatorIndexBText: "Sport";
////            setWidth: indexesWidth*3.30;
////            indexesRadius:25;
////            setBGcolor: cBG_Unknown;
////            indexesHeight: 70/1.50;
////            setLabelTopMargin:indexesHeight/100*32;
////            setLabelFontSize:12;
////            myIndicatorIndex:timersSwiper.currentIndex;
////            onIndex_d_clicked:
////            {
////                timersSwiper.setCurrentIndex(0);
////            }
////            onIndex_a_clicked:
////            {
////                timersSwiper.setCurrentIndex(1);
////            }
////            onIndex_b_clicked:
////            {
////                timersSwiper.setCurrentIndex(2);
////            }
////        }



//    }
//}




//---------drawCIrcle
//            function drawMyCircle(obj,_lineWidth ,_color ,_width ,_height, _radius ,_time ,_timeDivide ,_angle=0)
//            {
//                obj.beginPath();
//                obj.lineWidth = _lineWidth;
//                obj.strokeStyle = _color;
//                obj.arc(_width,//Width ,
//                        _height,//Height ,
//                        (_width/100+_height/100)*_radius,//radius,
//                        _angle,//angleOffset,
//                        _time/_timeDivide);//value  //angleOffset + angleSec
//                obj.stroke();
//            }



//----sport timer
//        if(setSoundEffectsOn && setSoundEffectsForBreaks)
//        {
//            STsoundEffects.playSoundEffect(theSoundEffect,0,3);
//        }


//        if(setSoundEffectsOn && setSoundEffectsForBreaks)
//        {
//            STsoundEffects.playSoundEffect(theSoundEffect,1,3); //parameters: soundEffect id's  ,  status-> (0 stopped/endded) & (1 started/run), model (1 sportTimer) & (2 Round/Set) & (3 Break/Rest)
//        }


//    property variant setSpeechPlayEvery: [0,0,10];//hour , minute , second.
//    property variant setSpeechPlayWhen: ["Rounds & rests & letsgo","Rounds & rests","Only rounds","Only rests"];

//    property bool setVibrationOn: false;
//    property bool setNotificationOn: false;
//cheer , go , time remaning, left will come soon
//console.log("-- rou="+rou +" rou/10="+tempA+" tempVar="+tempVar+ " tempVar*10="+tempVar*10);
//console.log("++ rou="+rou +" rou/10="+tempA+" tempVar="+tempVar+ " tempVar*10="+tempVar*10);





//------------------------------------------------------------------------------------------------------------------- from AutoValue Increase Decrease.qml
//import QtQuick 2.0
//import "../theScripts/controllerSpingBoxCountDown.js" as CSBC

//Item
//{
//    property bool setLocalStatusIncreaseOrDecrease: false; //0means decrease(minus), 1means increase(plus)
////    property color setColorTexts: "black";
//    property int setTextFontSize: 30;
//    property int setTimerIntervalValue: 150;
//    property int setInputIntValue:0;
//    property string outputResultString: "";
//    property int outputResultInt:0;
//    property int vSpeedCounter: 0;
//    property int vSpeedLevel: 1;
////    property color setColorBG: "transparent";

//    /*
//      use like this for outputResult when use component (example for txtMinute)
//                txtMinute.text = CSBC.minusValue(theMinute-1);
//                theMinute = txtMinute.text;
//    */

//    Rectangle
//    {
//        width: 35;
//        height:35;
//        color:cBG_Unknown;
//        Text
//        {
//            text:setLocalStatusIncreaseOrDecrease? "+":"-";
//            color:cTxt_button;
//            font.pointSize: setTextFontSize;
//            anchors.centerIn: parent;
//        }
//        Timer
//        {
//            id: theAutoValue_Timer_Increase_Decrease;
//            interval: setTimerIntervalValue;
//            repeat: true;
//            running: false;

//            onTriggered:
//            {
//                vSpeedCounter++;

//                if(vSpeedCounter/6>3)
//                    vSpeedLevel = 10;
//                else if(vSpeedCounter/6>5)
//                    vSpeedLevel = 50;
//                else if(vSpeedCounter/6>8)
//                    vSpeedLevel = 100;
//                else
//                    vSpeedLevel = 1;


//                if(setLocalStatusIncreaseOrDecrease)
//                {
//                    outputResultString = CSBC.plusValue(setInputIntValue+vSpeedLevel);
//                    outputResultInt = outputResultString;
//                }
//                else
//                {
//                    outputResultString = CSBC.minusValue(setInputIntValue-vSpeedLevel);
//                    outputResultInt = outputResultString;
//                }
//            }
//        }
//        MouseArea
//        {
//            anchors.fill: parent;
//            onPressed:
//            {
//                vSpeedCounter=0;
//                theAutoValue_Timer_Increase_Decrease.running = true;
//            }

//            onReleased:
//            {
//                theAutoValue_Timer_Increase_Decrease.running = false;
//                if(setLocalStatusIncreaseOrDecrease)
//                {
//                    outputResultString = CSBC.plusValue(setInputIntValue+1);
//                    outputResultInt = outputResultString;
//                }
//                else
//                {
//                    outputResultString = CSBC.minusValue(setInputIntValue-1);
//                    outputResultInt = outputResultString;
//                }
//            }
//        }
//    }
//}
