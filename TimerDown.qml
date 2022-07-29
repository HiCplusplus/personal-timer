import QtQuick 2.0
import "theControls"

Item
{
    anchors.fill: parent;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
    }//end of root

    ListView
    {
        id:listViewMain;
        anchors
        {
            top:root.top;
            left:root.left;
            right:root.right;
            bottom:idMyThreeBottomButtons.top;
        }
        clip:true;
        model:
        ListModel
        {
            id:listModelMain;
            ListElement
            {
                name: "00:20";
                cost: 2.45;
            }
        }
        delegate:
        Item
        {
            id:baseItemDelegate;
            anchors.fill: parent;
            Rectangle
            {
                id:baseAlarm;
                width: root.width/1.10;
                height: 100;
                border.width: 3;
                border.color:"gray";

                radius:15;
                anchors
                {
                    horizontalCenter: baseItemDelegate.horizontalCenter;
                    topMargin: 15;
                    top:baseItemDelegate.top;
                }

                Text
                {
                    anchors
                    {
                        verticalCenter:parent.verticalCenter;
                        left:parent.left;
                        leftMargin: 30;
                    }
                    font.pointSize: 30;
                    text:name;
                }

                Rectangle
                {
                    width: 65;
                    height: width/2;
                    color:"transparent";
                    anchors
                    {
                        right:baseAlarm.right;
                        verticalCenter:baseAlarm.verticalCenter;
                        rightMargin:10;
                    }

                    MySwitch
                    {
                        setBorderWidth: 4;
                        setStatusSwitch:false;
                        onStatusSwitch:
                        {
                            //HERE LEAVE NOTHING =-=================================================================================s
                        }
                    }
                }


            }
        }
    }//end of list view





    MyThreeBottomButtons
    {
        id:idMyThreeBottomButtons;
        width: root.width;
        height:root.height/10.5;
        setCenterButtonText: "Add";
        setLeftButtonText: "";
        setRightButtonText: ""; //null string make em invisible

        anchors
        {
            bottom:root.bottom;
            bottomMargin:15;
        }
        onCenterButtonPressed:
        {

        }
    }//end of mytheebuttons


}//end of item
