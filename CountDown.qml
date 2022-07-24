import QtQuick
import QtQuick.Controls


Item
{
    property color colorBG: "white";
    property color colorTexts: "black";

    property color colorButtons: "orange";
    property color colorButtonTexts: "white";


    property color colorButtonSecond: "pink";
    property color colorButtonSecondTexts: "black";


    anchors.fill: parent;
    clip:true;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:colorBG;
    }

    Rectangle
    {
        id:addNewTimer;
        width: parent.width/1.2;
        height:parent.height/2;
        anchors
        {
            horizontalCenter:parent.horizontalCenter;
            verticalCenter:parent.verticalCenter;
//            top:parent.top;
//            topMargin:parent.height/2;
        }

//        color:"red";


        Rectangle
        {
            id:baseSetTimer;
            width: parent.width;
            height: parent.height/3;
//            anchors.top: parent.bottom;
            Row
            {
                anchors.fill: parent;
                Rectangle
                {
                    id:setHour;
                    width: parent.width/3.2;
                    height:parent.height;
                    Text
                    {
                        text:"Hours";
                        color:"black";
                        anchors.horizontalCenter:parent.horizontalCenter;
                    }
                    Text
                    {
                        text:"01";
                        color:"black";
                        anchors.horizontalCenter:parent.horizontalCenter;
                        anchors.verticalCenter: parent.verticalCenter;
                        font.pointSize: 40;
                        font.bold:true;
                    }
                    SpinBox
                    {
                        id: spinbox
                        font.pointSize: 40;
                        width: parent.width;

                    }

                }
                Text
                {
                    text:":";
                    color:"black";
                    anchors.verticalCenter: parent.verticalCenter;
                    font.pointSize: 40;
                    font.bold:true;
                }
                Rectangle
                {
                    id:setMinute;
                    width: parent.width/3.2;
                    height:parent.height;
                    Text
                    {
                        text:"Minutes";
                        color:"black";
                        anchors.horizontalCenter:parent.horizontalCenter;
                    }
                    Text
                    {
                        text:"23";
                        color:"black";
                        anchors.horizontalCenter:parent.horizontalCenter;
                        anchors.verticalCenter: parent.verticalCenter;
                        font.pointSize: 40;
                        font.bold:true;
                    }
                }
                Text
                {
                    text:":";
                    color:"black";
                    anchors.verticalCenter: parent.verticalCenter;
                    font.pointSize: 40;
                    font.bold:true;
                }
                Rectangle
                {
                    id:setSecond;
                    width: parent.width/3.2;
                    height:parent.height;
                    Text
                    {
                        text:"Seconds";
                        color:"black";
                        anchors.horizontalCenter:parent.horizontalCenter;
                    }
                    Text
                    {
                        text:"00";
                        color:"black";
                        anchors.horizontalCenter:parent.horizontalCenter;
                        anchors.verticalCenter: parent.verticalCenter;
                        font.pointSize: 40;
                        font.bold:true;
                    }
                }

            }

        }
        Rectangle
        {
            width: parent.width/2.5;
            height: parent.height/6;
            color:"black";
            anchors.top:  baseSetTimer.bottom;
            anchors.horizontalCenter: parent.horizontalCenter;
            anchors.topMargin: 10;
            radius:50;
            Text
            {
                text:"Add";
                anchors.centerIn: parent;
                color:"white";
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    console.log("button add new timer added");
                    InputContext.priv.inputItem.text = InputContext.priv.inputItem.textBeforeEditing
                }
            }
        }
    }

    Rectangle
    {
        id:baseButtons;
        width: root.width;
        height:root.height/10.5;
        anchors
        {
            bottom:root.bottom;
            bottomMargin:15;
        }

        Rectangle
        {
            id:btnAddNew;
            width:parent.height;
            height:parent.height;
            anchors
            {
                horizontalCenter:parent.horizontalCenter;
                verticalCenter:parent.verticalCenter;
            }
            color:colorButtons;
            radius:50;
            Text
            {
                font.pointSize: 30;
                text: "+";
                color:colorButtonTexts;
                font.bold: true;
                anchors
                {
                    centerIn:parent;
                }
            }

            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    console.log("add button clicked");
                }
            }
        }

        Rectangle
        {
            id:btnClearAll;
            width:parent.width/1.7;
            height:parent.height/1.7;
            anchors
            {
                verticalCenter:parent.verticalCenter;
                right:btnAddNew.left;
                rightMargin:20;
                left:baseButtons.left;
                leftMargin:-25;
            }
            color:colorButtonSecond;
            radius:50;
            Text
            {
                text:"Clear All";
                color:colorButtonSecondTexts;
                anchors
                {
                    horizontalCenter:parent.horizontalCenter;
                    verticalCenter:parent.verticalCenter;
                }
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    console.log("clearall button clicked");
                }
            }
        }


        Rectangle
        {
            id:btnIdk;
            width:parent.width/1.7;
            height:parent.height/1.7;
            anchors
            {
                verticalCenter:parent.verticalCenter;
                left:btnAddNew.right;
                leftMargin:20;
                right:baseButtons.right;
                rightMargin:-25;
            }
            color:colorButtonSecond
            radius:50;
            Text
            {
                text:"2 Button";
                color:colorButtonSecondTexts;
                anchors
                {
                    horizontalCenter:parent.horizontalCenter;
                    verticalCenter:parent.verticalCenter;
                }
            }
            MouseArea
            {
                anchors.fill: parent;
                onClicked:
                {
                    console.log("idkAll button clicked");
                }
            }
        }


    }
}
