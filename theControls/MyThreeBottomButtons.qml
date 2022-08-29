import QtQuick 2.15

Item
{

    property bool setCenterButtonCircleStyled: false;
    signal leftButtonPressed;
    signal centerButtonPressed;
    signal rightButtonPressed;


    property string setLeftButtonText:"Left";
    property string setCenterButtonText: "center";
    property string setRightButtonText: "right";


    property string setLeftButtonIcon: "";
    property string setRightButtonIcon: "";

    Rectangle
    {
        id:baseButtons;
        width: root.width;
        height:root.height/10.5;
        color:cBG_Unknown;

        Rectangle
        {
            id:btnAddNew;//center BUTtON
            width: setCenterButtonCircleStyled<1 ? parent.width/3.5 : 50;
            height: 50; //parent.height/1.3
            visible: setCenterButtonText==""? false:true;
            anchors
            {
                horizontalCenter:parent.horizontalCenter;
                verticalCenter:parent.verticalCenter;
            }
            color:cBG_button;
            radius:50;
            Text
            {
                font.pointSize: setCenterButtonCircleStyled<1? 15 : 25;
                text:setCenterButtonText;
                color:cTxt_button;
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
            id:btnClearAll;//LEFT BUTTON
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
            color:cBG_button;
            radius:50;
            Text
            {
                text:setLeftButtonText;
                color:cTxt_button;
                anchors
                {
                    horizontalCenter:parent.horizontalCenter;
                    verticalCenter:parent.verticalCenter;
                }
            }
            Rectangle
            {
                id:baseIconLeftButton;
                width:25;
                height:25;
                color:cBG_Unknown;
                visible: setRightButtonIcon==""? false:true;
                anchors
                {
                    right:btnClearAll.right;
                    verticalCenter:parent.verticalCenter;
                    rightMargin:15;
                }
                Image
                {
                    id: iconLeftButton;
                    anchors.fill: parent;
                    source: setLeftButtonIcon;
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
            id:btnIdk; //RightButton
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
            color:cBG_button
            radius:50;
            Text
            {
                id:textRightButton;
                text:setRightButtonText;
                color:cTxt_button;
                anchors
                {
                    horizontalCenter:parent.horizontalCenter;
                    verticalCenter:parent.verticalCenter;
                }
            }
            Rectangle
            {
                id:baseIconRightButton;
                width:25;
                height:25;
                color:cBG_Unknown;
                visible: setRightButtonIcon==""? false:true;
                anchors
                {
                    left:btnIdk.left;
                    verticalCenter:parent.verticalCenter;
                    leftMargin:15;
                }
                Image
                {
                    id: iconRightButton;
                    anchors.fill: parent;
                    source: setRightButtonIcon;
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
