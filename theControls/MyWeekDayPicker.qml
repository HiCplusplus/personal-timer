import QtQuick 2.0

Item
{
    anchors.fill: parent;
    property string emptyTextForAll: "";
    property string textAPick: emptyTextForAll;
    property string textBPick: emptyTextForAll;
    property string textCPick: emptyTextForAll;
    property string textDPick: emptyTextForAll;
    property string textEPick: emptyTextForAll;
    property string textFPick: emptyTextForAll;
    property string textGPick: emptyTextForAll;
    property bool setAPicked: false;
    property bool setBPicked: false;
    property bool setCPicked: false;
    property bool setDPicked: false;
    property bool setEPicked: false;
    property bool setFPicked: false;
    property bool setGPicked: false;



    //setpicmode changes
    property int setPickMode: 2;
    /*
        1 -> only one pick
        2 -> mutiple pick
    */
    property bool setMonthDayPicker: false;





    property color setColorPicked: cBG_button;
    property color setColorNotPicked: setMonthDayPicker? cBG_Unknown : cBG_element;
    property color setColorTextPicked: "white";//"white";
    property color setColorTextNotPicked: cTxt_button;//color exception 5

    property int setTextFontSize: 9;
    property bool setTextBold: true;
    property int setBaseRadius:10;
    property int setBaseWidth: setMonthDayPicker? theRow.height:theRow.width/8;
    property int setBaseHeight: setMonthDayPicker? theRow.height : theRow.height;
    property int setLimitForTexts: 50;
    property bool setViewOnly:false;


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
            enabled: textAPick!=emptyTextForAll? true:false;
            opacity: textAPick!=emptyTextForAll? 1.0:0;
            Text
            {
                text: (parent.width>setLimitForTexts) ? textAPick : textAPick.slice(0,3);
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
                            if(setPickMode==2)
                                setAPicked=true;
                            else
                            {
                                setAPicked=true;
                                setBPicked=false;
                                setCPicked=false;
                                setDPicked=false;
                                setEPicked=false;
                                setFPicked=false;
                                setGPicked=false;
                            }
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
            enabled: textBPick!=emptyTextForAll? true:false;
            opacity: textBPick!=emptyTextForAll? 1.0:0;
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
                            if(setPickMode==2)
                                setBPicked=true;
                            else
                            {
                                setBPicked=true;
                                setAPicked=false;
                                setCPicked=false;
                                setDPicked=false;
                                setEPicked=false;
                                setFPicked=false;
                                setGPicked=false;
                            }
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
            enabled: textCPick!=emptyTextForAll? true:false;
            opacity: textCPick!=emptyTextForAll? 1.0:0;
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
                            if(setPickMode==2)
                                setCPicked=true;
                            else
                            {
                                setCPicked=true;
                                setBPicked=false;
                                setAPicked=false;
                                setDPicked=false;
                                setEPicked=false;
                                setFPicked=false;
                                setGPicked=false;
                            }
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
            enabled: textDPick!=emptyTextForAll? true:false;
            opacity: textDPick!=emptyTextForAll? 1.0:0;
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
                            if(setPickMode==2)
                                setDPicked=true;
                            else
                            {
                                setDPicked=true;
                                setBPicked=false;
                                setCPicked=false;
                                setAPicked=false;
                                setEPicked=false;
                                setFPicked=false;
                                setGPicked=false;
                            }
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
            enabled: textEPick!=emptyTextForAll? true:false;
            opacity: textEPick!=emptyTextForAll? 1.0:0;
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
                            if(setPickMode==2)
                                setEPicked=true;
                            else
                            {
                                setEPicked=true;
                                setBPicked=false;
                                setCPicked=false;
                                setDPicked=false;
                                setAPicked=false;
                                setFPicked=false;
                                setGPicked=false;
                            }
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
            enabled: textFPick!=emptyTextForAll? true:false;
            opacity: textFPick!=emptyTextForAll? 1.0:0;
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
                            if(setPickMode==2)
                                setFPicked=true;
                            else
                            {
                                setFPicked=true;
                                setBPicked=false;
                                setCPicked=false;
                                setDPicked=false;
                                setEPicked=false;
                                setAPicked=false;
                                setGPicked=false;
                            }
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
            enabled: textGPick!=emptyTextForAll? true:false;
            opacity: textGPick!=emptyTextForAll? 1.0:0;
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
                            if(setPickMode==2)
                                setGPicked=true;
                            else
                            {
                                setGPicked=true;
                                setBPicked=false;
                                setCPicked=false;
                                setDPicked=false;
                                setEPicked=false;
                                setFPicked=false;
                                setAPicked=false;
                            }
                    }
                }
            }
        }//end of g

    }
}
