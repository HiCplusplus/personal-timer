import QtQuick 2.0

Item
{
    signal statusDismiss;
    property bool statusChan:false;
    property int setAnimationDuration:100;
    anchors.fill: parent;
    Rectangle
    {
        Rectangle
        {
            id:animG;
            width: 100;
            height: 100;
            border.color: "gray";//color exception 2
            border.width: 4;
            radius:100;
            anchors.centerIn: parent;
        }

        anchors.fill: parent;
        color:cUnknown;
        DropArea
        {
            id:idDropArea;
            anchors.centerIn: parent;
            width: parent.width;
            height: 100;


            Rectangle
            {
                anchors.fill: parent;

                color:cBG_Unknown;
            }
            onContainsDragChanged: //has Error  QML Rectangle (parent or ancestor of QQuickDragAttached): active cannot be changed from within a drag event handler
            {
                statusDismiss();
            }

        }

        Rectangle
        {
            anchors.centerIn: idDropArea;
            width: 100;
            height: width;
            color: "black";
            radius: 100;
            Drag.active: dragArea.drag.active
//            Drag.hotSpot.x: 10;Drag.hotSpot.y: 10;
            Text
            {
                text: "✖";
                anchors.centerIn: parent;
                color:cUnknown;
                font.pointSize: 30;
            }

            MouseArea
            {
                id: dragArea;
                anchors.fill: parent;
                drag.target: parent;
                onDoubleClicked:
                {
                    statusDismiss();
                }
            }
        }


    }

    SequentialAnimation
    {
        id:theAnimationB;
        running: false;
        NumberAnimation {property: 'width'; to:120; target: animG; duration: setAnimationDuration;}
        NumberAnimation {property: 'width'; to:140; target: animG; duration: setAnimationDuration;}
        NumberAnimation {property: 'width'; to:160; target: animG; duration: setAnimationDuration;}

    }
    SequentialAnimation
    {
        id:theAnimationC;
        running: false;
        NumberAnimation {property: 'height'; to:120; target: animG; duration: setAnimationDuration;}
        NumberAnimation {property: 'height'; to:140; target: animG; duration: setAnimationDuration;}
        NumberAnimation {property: 'height'; to:160; target: animG; duration: setAnimationDuration;}
    }

    Timer
    {
        interval: 500;
        running: true;
        repeat: true;
        onTriggered:
        {
            theAnimationB.running=true;
            theAnimationC.running=true;
        }
    }


}
