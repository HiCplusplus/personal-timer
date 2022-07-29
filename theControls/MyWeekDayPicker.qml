import QtQuick 2.0

Item
{
    anchors.fill: parent;
    property string textAPick: "Mon";
    property string textBPick: "Tue";
    property string textCPick: "Wed";
    property string textDPick: "Thu";
    property string textEPick: "Fri";
    property string textFPick: "Sat";
    property string textGPick: "Sun";
    property bool setAPicked: false;
    property bool setBPicked: false;
    property bool setCPicked: false;
    property bool setDPicked: false;
    property bool setEPicked: false;
    property bool setFPicked: false;
    property bool setGPicked: false;

    property color setColorPicked: "#B178FF";
    property color setColorNotPicked: "white";
    property color setColorTextPicked: "white";
    property color setColorTextNotPicked: "black";


    property int setTextFontSize: 9;
    property bool setTextBold: true;
    property int setBaseRadius:10;
    property int setBaseWidth: theRow.width/8;
    property int setBaseHeight: theRow.height;

    signal aPick;
    signal bPick;
    signal cPick;
    signal dPick;
    signal ePick;
    signal fPick;
    signal gPick;

    Row
    {
        id:theRow;
        anchors.fill: parent;
        spacing:parent.width/50;
        Rectangle
        {
            height:setBaseHeight;
            width:setBaseWidth;
            color:setAPicked<=0? setColorNotPicked:setColorPicked;
            radius:setBaseRadius;
            Text
            {
                text:textAPick;
                anchors.centerIn: parent;
                font.pointSize: setTextFontSize;
                color:setAPicked<=0? setColorTextNotPicked: setColorTextPicked;
                font.bold: setTextBold;
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    if(setAPicked)
                        setAPicked=false;
                    else
                        setAPicked=true;
                    aPick();
                }
            }
        }//end of a

        Rectangle
        {
            height:setBaseHeight;
            width:setBaseWidth;
            color:setBPicked<=0? setColorNotPicked:setColorPicked;
            radius:setBaseRadius;
            Text
            {
                text:textBPick;
                anchors.centerIn: parent;
                font.pointSize: setTextFontSize;
                color:setBPicked<=0? setColorTextNotPicked: setColorTextPicked;
                font.bold: setTextBold;
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    if(setBPicked)
                        setBPicked=false;
                    else
                        setBPicked=true;
                    bPick();
                }
            }
        }//end of b


        Rectangle
        {
            height:setBaseHeight;
            width:setBaseWidth;
            color:setCPicked<=0? setColorNotPicked:setColorPicked;
            radius:setBaseRadius;
            Text
            {
                text:textCPick;
                anchors.centerIn: parent;
                font.pointSize: setTextFontSize;
                color:setCPicked<=0? setColorTextNotPicked: setColorTextPicked;
                font.bold: setTextBold;
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    if(setCPicked)
                        setCPicked=false;
                    else
                        setCPicked=true;
                    cPick();
                }
            }
        }//end of c

        Rectangle
        {
            height:setBaseHeight;
            width:setBaseWidth;
            color:setDPicked<=0? setColorNotPicked:setColorPicked;
            radius:setBaseRadius;
            Text
            {
                text:textDPick;
                anchors.centerIn: parent;
                font.pointSize: setTextFontSize;
                color:setDPicked<=0? setColorTextNotPicked: setColorTextPicked;
                font.bold: setTextBold;
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    if(setDPicked)
                        setDPicked=false;
                    else
                        setDPicked=true;
                    dPick();
                }
            }
        }//end of d





        Rectangle
        {
            height:setBaseHeight;
            width:setBaseWidth;
            color:setEPicked<=0? setColorNotPicked:setColorPicked;
            radius:setBaseRadius;
            Text
            {
                text:textEPick;
                anchors.centerIn: parent;
                font.pointSize: setTextFontSize;
                color:setEPicked<=0? setColorTextNotPicked: setColorTextPicked;
                font.bold: setTextBold;
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    if(setEPicked)
                        setEPicked=false;
                    else
                        setEPicked=true;
                    ePick();
                }
            }
        }//end of e



        Rectangle
        {
            height:setBaseHeight;
            width:setBaseWidth;
            color:setFPicked<=0? setColorNotPicked:setColorPicked;
            radius:setBaseRadius;
            Text
            {
                text:textFPick;
                anchors.centerIn: parent;
                font.pointSize: setTextFontSize;
                color:setFPicked<=0? setColorTextNotPicked: setColorTextPicked;
                font.bold: setTextBold;
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    if(setFPicked)
                        setFPicked=false;
                    else
                        setFPicked=true;
                    fPick();
                }
            }
        }//end of f



        Rectangle
        {
            height:setBaseHeight;
            width:setBaseWidth;
            color:setGPicked<=0? setColorNotPicked:setColorPicked;
            radius:setBaseRadius;
            Text
            {
                text:textGPick;
                anchors.centerIn: parent;
                font.pointSize: setTextFontSize;
                color:setGPicked<=0? setColorTextNotPicked: setColorTextPicked;
                font.bold: setTextBold;
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    if(setGPicked)
                        setGPicked=false;
                    else
                        setGPicked=true;
                    gPick();
                }
            }
        }//end of g

    }
}
