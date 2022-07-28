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
                name: "ss";
                cost: 2.45
            }
        }
        delegate:
        Item
        {
            id:baseItemDelegate;
            width: parent.width;
            height: parent.height;
            anchors
            {

            }

            Rectangle
            {
                id:baseAlarm;
                width: root.width/1.10;
                height: 100;
                color:"purple";
                anchors
                {
                    horizontalCenter: baseItemDelegate.horizontalCenter;
                    topMargin: 10;
                    top:baseItemDelegate.top;
                }

                Text
                {
                    anchors.centerIn: some2;
                    text:name;
                }

                Rectangle
                {
                    width: 60;
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
                        onStatusSwitch:
                        {

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
