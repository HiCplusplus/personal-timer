import QtQuick 2.15

Item
{
    property int setSwitchWidth:parent.width;
    property int setAnimationDuration:150;
    property int setBorderWidth: 6;
//    signal updateSwitch;
//    onUpdateSwitch:
//    {
//        if(setStatusSwitch<=0)
//        {
//            mySwitsch.color= cBG_button_deactivated;
//            switchCircle.x= mySwitsch.width/8;
//        }
//        else
//        {
//            mySwitsch.color= cBG_button_activated;
//            switchCircle.x= mySwitsch.width/1.90;
//        }

//    }

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
        color:setStatusSwitch<=0? cBG_button_deactivated: cBG_button_activated;
        Rectangle
        {
            id:switchCircle;
            width: parent.width/setSizeSwitchCircle;
            height: width;
            color:cUnknown;
            radius:50;
            anchors.verticalCenter: parent.verticalCenter;
            x:setStatusSwitch<=0? mySwitsch.width/8: mySwitsch.width/1.90;
//            y:setSwitchWidth/7;
        }
        border.width: setStatusBorder<=0? 0:setBorderWidth;
        border.color: setStatusBorder<=0? cBG_Unknown:cUnknown;
        MouseArea
        {
            anchors.fill: parent;
            onClicked:
            {
                if(switchCircle.x>mySwitsch.width/5) //setStatusSwitch)
                {
                    animactionDeactive.running=true;
                    mySwitsch.color = cBG_button_deactivated;
                    setStatusSwitch=false;
                }
                else
                {
                    animationAcvite.running=true;
                    mySwitsch.color = cBG_button_activated;
                    setStatusSwitch=true;
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
