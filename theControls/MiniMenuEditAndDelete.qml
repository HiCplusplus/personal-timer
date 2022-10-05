import QtQuick 2.15

Item
{
//    id:root;
    anchors.fill:parent;
    visible:false;
//    signal removeAnElement;
//    signal editAnElement;
    signal cancelButton;
    property int posYselectedElement:0;
    property double heightButtonsAre: 37.50;
    property string defImageSource: path_to_menuIcons + fileIcon_Delete; // to avoid invaild source for image

    property variant setTitlesAsArray: ["Delete"]; //text 0 , text 1 ,..
    property variant setIconsAsArray: [path_to_menuIcons + fileIcon_Delete]; //icon 0 , icon 1 ,..
    signal buttonAClicked;
    signal buttonBClicked;
    signal buttonCClicked;
    signal buttonDClicked;
    signal buttonEClicked;
    signal buttonFClicked;
    signal buttonGClicked;

    onPosYselectedElementChanged:
    {
        baseButtons.y=posYselectedElement+25;
    }

//    property int setCountOfButtons: 2;

    MyShadowForFocus
    {
        visible:true;
        onRootclicked:
        {
            cancelButton();
        }
    }



    Rectangle
    {
        id:baseButtons;
        width:parent.width/2.50;
        height:setTitlesAsArray.length*heightButtonsAre;
        color:cBG_button_deactivated;
        radius: 50;
        anchors.left:parent.left;
        anchors.leftMargin: 50;
        Rectangle
        {
            id:aButton;
            width:parent.width;
            height:heightButtonsAre;
            color:cBG_button_deactivated;
            visible:setTitlesAsArray[0]===undefined? false:true;
            Image
            {
                id:aIcon;
                anchors
                {
                    verticalCenter: parent.verticalCenter;
                    left:parent.left;
                    leftMargin:10;
                }
                width:25;
                height:25;
                source: setIconsAsArray[0]===undefined? defImageSource:setIconsAsArray[0];
            }
            Text
            {
                text:setTitlesAsArray[0];
                font.bold:true;
                font.family:gFontFamily;
                color:cTxt_button;
                anchors
                {
                    left:aIcon.right;
                    leftMargin: 15;
                    verticalCenter:parent.verticalCenter;
                }
            }

            MouseArea
            {
                anchors.fill:parent;
                onClicked:
                {
                    buttonAClicked();
                }
            }
        }//end of A
        Rectangle
        {
            id:bButton;
            width:parent.width;
            height:heightButtonsAre;
            color:cBG_button_deactivated;
            anchors.top:aButton.bottom;
            visible:setTitlesAsArray[1]===undefined? false:true;
            Image
            {
                id:bIcon;
                anchors
                {
                    verticalCenter: parent.verticalCenter;
                    left:parent.left;
                    leftMargin:10;
                }
                width:25;
                height:25;
                source: setIconsAsArray[1]===undefined? defImageSource:setIconsAsArray[1];
            }
            Text
            {
                text:setTitlesAsArray[1]===undefined? "":setTitlesAsArray[1];
                font.bold:true;
                font.family:gFontFamily;
                color:cTxt_button;
                anchors
                {
                    left:bIcon.right;
                    leftMargin: 15;
                    verticalCenter:parent.verticalCenter;
                }
            }
            MouseArea
            {
                anchors.fill:parent;
                onClicked:
                {
                    buttonBClicked();
                }
            }
        }//end of B
        Rectangle
        {
            id:cButton;
            width:parent.width;
            height:heightButtonsAre;
            color:cBG_button_deactivated;
            anchors.top:bButton.bottom;
            visible:setTitlesAsArray[2]===undefined? false:true;
            Image
            {
                id:cIcon;
                anchors
                {
                    verticalCenter: parent.verticalCenter;
                    left:parent.left;
                    leftMargin:10;
                }
                width:25;
                height:25;
                source: setIconsAsArray[2]===undefined? defImageSource:setIconsAsArray[2];
            }
            Text
            {
                text:setTitlesAsArray[2]===undefined? "":setTitlesAsArray[2];
                font.bold:true;
                font.family:gFontFamily;
                color:cTxt_button;
                anchors
                {
                    left:cIcon.right;
                    leftMargin: 15;
                    verticalCenter:parent.verticalCenter;
                }
            }
            MouseArea
            {
                anchors.fill:parent;
                onClicked:
                {
                    buttonCClicked();
                }
            }
        }//end of C
        Rectangle
        {
            id:dButton;
            width:parent.width;
            height:heightButtonsAre;
            color:cBG_button_deactivated;
            anchors.top:cButton.bottom;
            visible:setTitlesAsArray[3]===undefined? false:true;
            Image
            {
                id:dIcon;
                anchors
                {
                    verticalCenter: parent.verticalCenter;
                    left:parent.left;
                    leftMargin:10;
                }
                width:25;
                height:25;
                source: setIconsAsArray[3]===undefined? defImageSource:setIconsAsArray[3];
            }
            Text
            {
                text:setTitlesAsArray[3]===undefined? "":setTitlesAsArray[3];
                font.bold:true;
                font.family:gFontFamily;
                color:cTxt_button;
                anchors
                {
                    left:dIcon.right;
                    leftMargin: 15;
                    verticalCenter:parent.verticalCenter;
                }
            }
            MouseArea
            {
                anchors.fill:parent;
                onClicked:
                {
                    buttonDClicked();
                }
            }
        }//end of D
        Rectangle
        {
            id:eButton;
            width:parent.width;
            height:heightButtonsAre;
            color:cBG_button_deactivated;
            anchors.top:dButton.bottom;
            visible:setTitlesAsArray[4]===undefined? false:true;
            Image
            {
                id:eIcon;
                anchors
                {
                    verticalCenter: parent.verticalCenter;
                    left:parent.left;
                    leftMargin:10;
                }
                width:25;
                height:25;
                source: setIconsAsArray[4]===undefined? defImageSource:setIconsAsArray[4];
            }
            Text
            {
                text:setTitlesAsArray[4]===undefined? "":setTitlesAsArray[4];
                font.bold:true;
                font.family:gFontFamily;
                color:cTxt_button;
                anchors
                {
                    left:eIcon.right;
                    leftMargin: 15;
                    verticalCenter:parent.verticalCenter;
                }
            }
            MouseArea
            {
                anchors.fill:parent;
                onClicked:
                {
                    buttonEClicked();
                }
            }
        }//end of E
        Rectangle
        {
            id:fButton;
            width:parent.width;
            height:heightButtonsAre;
            color:cBG_button_deactivated;
            anchors.top:eButton.bottom;
            visible:setTitlesAsArray[5]===undefined? false:true;
            Image
            {
                id:fIcon;
                anchors
                {
                    verticalCenter: parent.verticalCenter;
                    left:parent.left;
                    leftMargin:10;
                }
                width:25;
                height:25;
                source: setIconsAsArray[5]===undefined? defImageSource:setIconsAsArray[5];
            }
            Text
            {
                text:setTitlesAsArray[5]===undefined? "":setTitlesAsArray[5];
                font.bold:true;
                font.family:gFontFamily;
                color:cTxt_button;
                anchors
                {
                    left:fIcon.right;
                    leftMargin: 15;
                    verticalCenter:parent.verticalCenter;
                }
            }
            MouseArea
            {
                anchors.fill:parent;
                onClicked:
                {
                    buttonFClicked();
                }
            }
        }//end of F
        Rectangle
        {
            id:gButton;
            width:parent.width;
            height:heightButtonsAre;
            color:cBG_button_deactivated;
            anchors.top:fButton.bottom;
            visible:setTitlesAsArray[6]===undefined? false:true;
            Image
            {
                id:gIcon;
                anchors
                {
                    verticalCenter: parent.verticalCenter;
                    left:parent.left;
                    leftMargin:10;
                }
                width:25;
                height:25;
                source: setIconsAsArray[6]===undefined? defImageSource:setIconsAsArray[6];
            }
            Text
            {
                text:setTitlesAsArray[6]===undefined? "":setTitlesAsArray[6];
                font.bold:true;
                font.family:gFontFamily;
                color:cTxt_button;
                anchors
                {
                    left:gIcon.right;
                    leftMargin: 15;
                    verticalCenter:parent.verticalCenter;
                }
            }
            MouseArea
            {
                anchors.fill:parent;
                onClicked:
                {
                    buttonGClicked();
                }
            }
        }//end of G


    }
}
