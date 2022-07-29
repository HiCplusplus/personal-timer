import QtQuick 2.0
import "theControls"
import "thePages"
Item
{
    property color setColorBG: "white";

    anchors.fill: parent;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:"#F6F6F6";
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
                name: "04:00";
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
                height: 145;
                color: "white";

                radius:15;
                anchors
                {
                    horizontalCenter: baseItemDelegate.horizontalCenter;
                    topMargin: 15;
                    top:baseItemDelegate.top;
                }

                Rectangle
                {
                    width: 8;
                    height: 8;
                    color:"#B178FF";
                    radius: 50;
                    anchors
                    {
                        top:parent.top;
                        topMargin:16;
                        left:parent.left;
                        leftMargin:18;
                    }
                }



                Text
                {
                    text:"Mon,Fri,Sam";
                    font.family: "Courier";
                    anchors
                    {
                        top:parent.top;
                        topMargin:10;
                        left:parent.left;
                        leftMargin:30;
                    }
                }




                Text
                {
                    id:textClock;
                    anchors
                    {
                        verticalCenter:parent.verticalCenter;
                        left:parent.left;
                        leftMargin: 30;
                    }
                    font.pointSize: 30;
                    font.family: "Courier";
                    text:name;
                }



                Rectangle
                {
//                    iconsfrom https://icons8.com/icon/set/weather/stickers
                    /*
                      https://icons8.com/icon/VzDK0G3Z5kLF/night
                      */
                    width: 25;
                    height: 25;
                    color:"transparent";
                    Image
                    {
                        anchors.fill: parent;
                        source: "./thePictures/icon-moon.png";
                    }
                    anchors
                    {
                        bottom:textAmPm.top;
                        left:textAmPm.left;
                        leftMargin:3;
                    }
                }

                Text
                {
                    id:textAmPm
                    text:"AM";
                    font.family: "Courier";
                    anchors.bottom: textClock.bottom;
//                    anchors.bottomMargin: ;
                    anchors.leftMargin: 10;
                    anchors.left: textClock.right;
                    font.pointSize: 20;
                }






                Text
                {
                    id:textLabel;
                    text:"Team meeting";
                    font.family: "Courier";
                    anchors
                    {
                        verticalCenter:parent.verticalCenter;
                        left:parent.left;
                        leftMargin: 30;
                        top:textClock.bottom;
                    }
                }

                Rectangle
                {
                    width: 50;
                    height: width/2;
                    color:"transparent";
                    anchors
                    {
                        right:baseAlarm.right;
                        verticalCenter:baseAlarm.verticalCenter;
                        rightMargin:30;
                    }

                    MySwitch
                    {
                        setBorderWidth: 4;
                        setStatusSwitch:false;
                        setColorActived: "#B178FF";
                        setColorDeactived: "#EBDDFF";
                        setStatusBorder:false;
                        setSizeSwitchCircle: 2.80;
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



    Rectangle
    {
        anchors.fill: parent;
        color:"white";
        visible: true;
        AlarmSetPage
        {
            onButtonSave:
            {
                console.log("save");
            }
            onButtonCancel:
            {
                console.log("cancel");
            }
        }

    }


}//end of item
