import QtQuick 2.0

Item
{
    property color setColorActived: "lightblue";
    property color setColorDeactived: "gray";
    property color setTotalColor: "white";
    property int setSwitchWidth:parent.width;
    property int setAnimationDuration:150;
    property int setBorderWidth: 6;
    signal statusSwitch;

    anchors.fill: parent;
    Rectangle
    {
        id:mySwitsch;
        width:  setSwitchWidth;
        height: width/2;
        radius:50;
        color:setColorActived;
        Rectangle
        {
            id:switchCircle;
            width: parent.width/3.80;
            height: width;
            color:setTotalColor;
            radius:50;
            x:mySwitsch.width/5;
            y:setSwitchWidth/8;
        }
        border.width:setBorderWidth;
        border.color: setTotalColor;
        MouseArea
        {
            anchors.fill: parent;
            onClicked:
            {
                if(switchCircle.x>mySwitsch.width/5)
                {
                    animactionDeactive.running=true;
                }
                else
                {
                    animationAcvite.running=true;
                }


            }
        }

    }
    SequentialAnimation
    {
        id:animationAcvite;
        running:false;
        NumberAnimation
        {
            target: switchCircle;
            property: 'x';
            to:mySwitsch.width/1.90;
            duration: setAnimationDuration;
        }
    }
    SequentialAnimation
    {
        id:animactionDeactive;
        running:false;
        NumberAnimation
        {
            target: switchCircle;
            property: 'x';
            to:mySwitsch.width/5;
            duration: setAnimationDuration;
        }
    }

}
