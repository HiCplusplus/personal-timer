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
    property bool setStatusSwitch:false;
    property bool setStatusBorder:true;
    property double setSizeSwitchCircle: 3.80;
    anchors.fill: parent;
    Rectangle
    {
        id:mySwitsch;
        width:  setSwitchWidth;
        height: width/1.80;
        radius:50;
        color:setStatusSwitch<=0? setColorDeactived: setColorActived;
        Rectangle
        {
            id:switchCircle;
            width: parent.width/setSizeSwitchCircle;
            height: width;
            color:setTotalColor;
            radius:50;
            anchors.verticalCenter: parent.verticalCenter;
            x:setStatusSwitch<=0? mySwitsch.width/8: mySwitsch.width/1.90;
//            y:setSwitchWidth/7;
        }
        border.width: setStatusBorder<=0? 0:setBorderWidth;
        border.color: setStatusBorder<=0? "transparent":setTotalColor;
        MouseArea
        {
            anchors.fill: parent;
            onClicked:
            {
                if(switchCircle.x>mySwitsch.width/5)
                {
                    animactionDeactive.running=true;
                    mySwitsch.color = setColorDeactived;
                }
                else
                {
                    animationAcvite.running=true;
                    mySwitsch.color = setColorActived;
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
            to:mySwitsch.width/8;
            duration: setAnimationDuration;
        }
    }

}
