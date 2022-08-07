import QtQuick 2.15

Item
{
    property variant setTotal: [0,4,0]; //hour, minute, second
    property variant setBreak: [0,1,0]; //hour, minute, second
    property int setRound: 4;//not sure put this or not

    property variant setSpeechPlayEvery: [0,0,10]; //hour , minute , second
    property variant setSpeechPlayWhen: ["Rounds & rests & letsgo","Rounds & rests","Only rounds","Only rests"];

    property bool setSpeechOn: false;
    property bool setSoundEffectsOn: false;
    property bool setVibrationOn: false;
    property bool setNotificationOn: false;

    property variant soundPacks: ["beeps","pings"];
    property variant speechPacks: ["male","female"];


    anchors.fill: parent;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
    }

}
