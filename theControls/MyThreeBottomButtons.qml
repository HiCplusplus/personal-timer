import QtQuick 2.0

Item
{
    property color colorButtons: "orange";
    property color colorButtonTexts: "white";
    property color colorButtonSecond: "pink";
    property color colorButtonSecondTexts: "black";
    property color setBackGroundColor: "transparent";
    property bool setCenterButtonCircleStyled: false;
    signal leftButtonPressed;
    signal centerButtonPressed;
    signal rightButtonPressed;


    property string setLeftButtonText:"Left";
    property string setCenterButtonText: "center";
    property string setRightButtonText: "right";

    Rectangle
    {
        id:baseButtons;
        width: root.width;
        height:root.height/10.5;
        color:setBackGroundColor;

        Rectangle
        {
            id:btnAddNew;
            width: setCenterButtonCircleStyled<1 ? parent.width/3.5 : 50;
            height: 50; //parent.height/1.3
            visible: setCenterButtonText==""? false:true;
            anchors
            {
                horizontalCenter:parent.horizontalCenter;
                verticalCenter:parent.verticalCenter;
            }
            color:colorButtons;
            radius:50;
            Text
            {
                font.pointSize: setCenterButtonCircleStyled<1? 15 : 25;
                text:setCenterButtonText;
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
                onClicked: centerButtonPressed();
            }
        }

        Rectangle
        {
            id:btnClearAll;
            width:parent.width/1.7;
            height: 40; //parent.height/1.7
            visible: setLeftButtonText==""? false:true;
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
                text:setLeftButtonText;
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
                onClicked: leftButtonPressed();
            }
        }


        Rectangle
        {
            id:btnIdk;
            width:parent.width/1.7;
            height: 40; //parent.height/1.7;
            visible: setRightButtonText==""? false:true;
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

                text:setRightButtonText;
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
                onClicked: rightButtonPressed();
            }
        }


    }
}
