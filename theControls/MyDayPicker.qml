import QtQuick 2.15

Item
{
    anchors.fill: parent;
    property int setPickMode: 0;
    /*
        0 -> readonly
        1 -> only one pick
        2 -> mutiple pick (week pick) (whole month pick)
        3 -> range pick
    */
    property variant setDays: ["1","2","3","4","5","6","7","8"
                              ,"9","10","11","12","13","14","15","16"
                              ,"17","18","19","20","21","22","23","24"
                              ,"25","26","27","28","29","30","31"];

    property int howManyDaysAreBlank: 0;
    property int maxDaysThisMonth:31;



    property bool setAPicked: false;
    property bool setBPicked: false;
    property bool setCPicked: false;
    property bool setDPicked: false;
    property bool setEPicked: false;
    property bool setFPicked: false;
    property bool setGPicked: false;

    property color setColorPicked: cBG_button;
    property color setColorNotPicked: cBG_element;
    property color setColorTextPicked: "white";//"white";
    property color setColorTextNotPicked: cTxt_button;//color exception 5

    property int setTextFontSize: 9;
    property bool setTextBold: true;
    property int setBaseRadius:10;
    property int setBaseWidth: theRow.width/8;
    property int setBaseHeight: theRow.height;
    property int setLimitForTexts: 50;
    property bool setViewOnly:false;
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
                text: parent.width>setLimitForTexts? textAPick : textAPick.slice(0,3);
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
                    if(!setViewOnly)
                    {
                        if(setAPicked)
                            setAPicked=false;
                        else
                            setAPicked=true;
                        aPick();
                    }

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
                text: parent.width>setLimitForTexts? textBPick : textBPick.slice(0,3);
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
                    if(!setViewOnly)
                    {
                        if(setBPicked)
                            setBPicked=false;
                        else
                            setBPicked=true;
                        bPick();
                    }
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
                text: parent.width>setLimitForTexts? textCPick : textCPick.slice(0,3);
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
                    if(!setViewOnly)
                    {
                        if(setCPicked)
                            setCPicked=false;
                        else
                            setCPicked=true;
                        cPick();
                    }

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
                text: parent.width>setLimitForTexts? textDPick : textDPick.slice(0,3);
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
                    if(!setViewOnly)
                    {
                        if(setDPicked)
                            setDPicked=false;
                        else
                            setDPicked=true;
                        dPick();
                    }
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
                text: parent.width>setLimitForTexts? textEPick : textEPick.slice(0,3);
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
                    if(!setViewOnly)
                    {
                        if(setEPicked)
                            setEPicked=false;
                        else
                            setEPicked=true;
                        ePick();
                    }
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
                text: parent.width>setLimitForTexts? textFPick : textFPick.slice(0,3);
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
                    if(!setViewOnly)
                    {
                        if(setFPicked)
                            setFPicked=false;
                        else
                            setFPicked=true;
                        fPick();
                    }
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
                text: parent.width>setLimitForTexts? textGPick : textGPick.slice(0,3);
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
                    if(!setViewOnly)
                    {
                        if(setGPicked)
                            setGPicked=false;
                        else
                            setGPicked=true;
                        gPick();
                    }
                }
            }
        }//end of g

    }
}
