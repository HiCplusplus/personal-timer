import QtQuick 2.15

Item
{
    id:root;
    anchors.fill:parent;
    property int setConfirmCode: -1;
    property string setTitle: "Title";
    property string setConfirmButtonTitle: "Confirm";
    property string setCancelButtonTitle: "Cancel";
    signal btnNotConfirmed;
    signal btnConfirmed;
    onBtnNotConfirmed:
    {
        root.visible=false;
        setConfirmCode=-1;
    }

    visible:false;
    MyShadowForFocus
    {
        visible:true;
        onRootclicked:
        {
            btnNotConfirmed();
        }
    }

    Rectangle
    {
        width:parent.width/2;
        height:150;
        Text
        {
            id: title;
            text: setTitle;
        }
        Rectangle
        {
            id:buttonCancel;
            width:parent.width/2;
            height:50;
            color:"red";
            anchors
            {
                bottom:parent.bottom;
                left:parent.left;
            }
            Text
            {
                text: setCancelButtonTitle;
                anchors.centerIn:parent;
            }
        }
        Rectangle
        {
            id:buttonConfirmed;
            width:parent.width/2;
            height:50;
            color:"blue";
            anchors
            {
                bottom:parent.bottom;
                right:parent.right;
            }
            Text
            {
                text: setConfirmButtonTitle;
                anchors.centerIn:parent;
            }
        }

    }
}
