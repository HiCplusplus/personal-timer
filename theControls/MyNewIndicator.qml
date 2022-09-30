import QtQuick 2.15

Item
{
    id:root;
    anchors.fill:parent;
    property int sayCurrentIndex: 0;
    property string localPathToMenuIcons : path_to_menuIcons;
    signal refreshIcons;
    onRefreshIcons:
    {
        //when theme Changed the icons dont work good. white->white , dark->dark and i want whati -> dark , dark -> white
        //problem was using the main Var and this was change whole app into wrong icon colors, so i chnage this to a property and local by using localPathToMenuIcons i mean code was path_to_menuIcons = "../thePictures/dark-25px/";
        if( path_to_menuIcons === "../thePictures/white-25px/")
             localPathToMenuIcons = "../thePictures/dark-25px/";
        else
            localPathToMenuIcons = "../thePictures/white-25px/";

        appendItems();
    }


    signal appendItems;
    onAppendItems:
    {
        listModelMain.clear();
        for(var i=0; i <= 7; i++)
        {
            const listIcons=
                           [
                               localPathToMenuIcons + fileIcon_Calender,
                               localPathToMenuIcons + fileIcon_Event,
                               localPathToMenuIcons + fileIcon_Log,
                               localPathToMenuIcons + fileIcon_Alarm,
                               localPathToMenuIcons + fileIcon_Countdown,
                               localPathToMenuIcons + fileIcon_SportTimer,
                               localPathToMenuIcons + fileIcon_Stopwatch,
                               localPathToMenuIcons + fileIcon_MultiTimer

                           ];
            const listTitles =
                             [
                                 "Calender",
                                 "Event",
                                 "Log",
                                 "Alarm",
                                 "Timer",
                                 "SportTimer",
                                 "StopWatch",
                                 "MultiTimer"
                             ];

            listModelMain.append({
                                     theIndex: i,
                                     theTitle: listTitles[i],
                                     theIcon: listIcons[i],
                                 });

        }
    }

    onSayCurrentIndexChanged:
    {
        pathView.currentIndex = sayCurrentIndex;
    }


    //for view from MyTimerIndicator.qml
    property int indexesWidth: 70;
    property int indexesHeight: 70;
    property int indexesRadius: 50;
    property int setIconTopMargin:10;
    property int setIconWidthHeight: 25;

    Component.onCompleted:
    {
        appendItems();
    }

    PathView
    {
        id: pathView
        anchors.fill: parent;
        model: ListModel
        {
            id:listModelMain;
        }
        onCurrentIndexChanged:
        {
            sayCurrentIndex = pathView.currentIndex;
        }

        delegate: Rectangle
        {
            width:indexesWidth;
            height:indexesHeight;
            radius: indexesRadius;
            color : sayCurrentIndex===theIndex ? cBG_button: cBG_button_deactivated;

            Rectangle
            {
                width: setIconWidthHeight;
                height:setIconWidthHeight;
                color:cBG_Unknown;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top:parent.top;
                anchors.topMargin: setIconTopMargin;
                Image
                {
                    anchors.fill: parent;
                    source: theIcon;
                }
            }
            Text
            {
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.top:parent.top;
                anchors.topMargin: parent.height/1.80;
                text:theTitle;
                color:cTxt_button;
                font.pointSize: 8;
                font.family: gFontFamily;
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    pathView.currentIndex = theIndex;
                }
            }
        }

        interactive: true;

        pathItemCount: 5;
        preferredHighlightEnd: 0.5;
        preferredHighlightBegin: 0.5;

        path: Path
        {
            startX: 0
            startY: parent.height * 0.5

            PathAttribute { name: "z"; value: 0 }
            PathAttribute { name: "itemscale"; value: 0.5 }

            PathLine
            {
                x: parent.width * 0.5;
                y: parent.height * 0.5;
            }

            PathAttribute { name: "z"; value: 100 }
            PathAttribute { name: "itemscale"; value: 1 }

            PathLine
            {
                x: parent.width;
                y: parent.height * 0.5;
            }

            PathAttribute { name: "z"; value: 0 }
            PathAttribute { name: "itemscale"; value: 0.5 }
        }
    }
}
