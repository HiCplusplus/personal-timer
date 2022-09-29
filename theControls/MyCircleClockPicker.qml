import QtQuick 2.15

Item
{
    property int theSelectedNumberIndex:0; //output

    property color elementBackgroundColor : cBG_Unknown;
    property color elementForegroundColor : cTxt_button;
    property int startpointForArc : root.x + root.width/2;
    property int radiusXYForArc : root.width/2.5;
    property int eachBoxSize: 25;
    property color setThebackgroundColer: cBG_Unknown;
    property int setMinNumber: 0;
    property int setMaxNumber: 10;
    property int setfontTextes: 14;
    property int showElemntsWithSpace: 1;
    property color selectedElementBackgroundColor: "red";
    signal changeColorCurrentSelected;
    onChangeColorCurrentSelected:
    {
        listModelMain.clear();
        for(var i=setMinNumber; i <= setMaxNumber; i++)
        {
            if(i%showElemntsWithSpace)
                continue;
            listModelMain.append({
                                     mycustomidtext: i,
                                 });
        }
    }

    onTheSelectedNumberIndexChanged:
    {
        console.log(theSelectedNumberIndex);
    }

    Component.onCompleted:
    {
        changeColorCurrentSelected();
    }

    id: container
    anchors.fill: parent;
    Rectangle
    {
        id:root;
        anchors.fill:parent;
        radius: width /2
        color: setThebackgroundColer;
        PathView
        {
            id:mytestPathview;
            anchors.fill:parent;
            currentIndex: 0;
            model: ListModel
            {
                id:listModelMain;
            }
            onCurrentIndexChanged:
            {
                const innn = (listModelMain.get(mytestPathview.currentIndex).mycustomidtext-1);
                if(innn==0)
                    theSelectedNumberIndex = 24;
                else
                    theSelectedNumberIndex = innn;
            }

            delegate: Rectangle
            {
                width: eachBoxSize;
                height: eachBoxSize;
                radius: eachBoxSize;
                color: (mycustomidtext === theSelectedNumberIndex) ? selectedElementBackgroundColor : elementBackgroundColor;
                Text
                {
                    text: mycustomidtext;
                    anchors.centerIn:parent;
                    color:elementForegroundColor;
                    font.family:gFontFamily;
                    font.pointSize:setfontTextes;
                }
                MouseArea
                {
                    anchors.fill: parent;
                    onClicked:
                    {
                        theSelectedNumberIndex = mycustomidtext;
//                        changeColorCurrentSelected();
                    }
                }
            }
            path: Path
            {
                startX: startpointForArc;
                startY: eachBoxSize;

                PathArc
                {
                    x: startpointForArc;
                    y: root.width-eachBoxSize;
                    radiusX: radiusXYForArc;
                    radiusY: radiusXYForArc;
                    direction: PathArc.Clockwise;

                }
                PathArc
                {
                    x: startpointForArc;
                    y: eachBoxSize;
                    radiusX: radiusXYForArc;
                    radiusY: radiusXYForArc;
                    direction: PathArc.Clockwise;
                }

            }
        }
    }


}
