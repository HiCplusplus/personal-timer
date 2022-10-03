import QtQuick 2.15

Item
{
    id:root;
    width:parent.width/3;
    height:75;
    visible:false;
    signal removeAnElement;
    signal editAnElement;

    Rectangle
    {
        anchors.fill:parent;
        color:cUnknown;
        radius:50;
        Rectangle
        {
            id:editButton;
            width:parent.width;
            height:parent.height/2;
            color:cBG_button_deactivated;
            Image
            {
                id:iconEdit;
                anchors
                {
                    verticalCenter: parent.verticalCenter;
                    left:parent.left;
                    leftMargin:10;
                }
                width:25;
                height:25;
                source: path_to_menuIcons + fileIcon_Edit;
            }
            Text
            {
                text:"Edit";
                font.bold:true;
                font.family:gFontFamily;
                color:cTxt_button;
                anchors
                {
                    left:iconEdit.right;
                    leftMargin: 15;
                    verticalCenter:parent.verticalCenter;
                }
            }

            MouseArea
            {
                anchors.fill:parent;
                onClicked:
                {
                    editAnElement();
                }
            }
        }
        Rectangle
        {
            id:deleteButton;
            width:parent.width;
            height:parent.height/2;
            color:cBG_button_deactivated;
            anchors.top:editButton.bottom;
            Image
            {
                id:iconDelete;
                anchors
                {
                    verticalCenter: parent.verticalCenter;
                    left:parent.left;
                    leftMargin:10;
                }
                width:25;
                height:25;
                source: path_to_menuIcons + fileIcon_Delete;
            }
            Text
            {
                text:"Delete";
                font.bold:true;
                font.family:gFontFamily;
                color:cTxt_button;
                anchors
                {
                    left:iconDelete.right;
                    leftMargin: 15;
                    verticalCenter:parent.verticalCenter;
                }
            }
            MouseArea
            {
                anchors.fill:parent;
                onClicked:
                {
                    removeAnElement();
                }
            }
        }
    }
}
