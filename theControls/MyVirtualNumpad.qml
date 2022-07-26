import QtQuick
import QtQuick.Layouts
Item
{
    anchors.fill: parent;

    Rectangle
    {
        anchors.fill: parent;

        Column
        {
            spacing: 4;
            anchors.fill: parent;

            Rectangle
            {
                width: parent.width;
                height: parent.height/4;
                Rectangle
                {
                    id:btnOne
                    width: parent.width/3.2;
                    height:parent.height/100*90;
                    color:"gray";
                    radius: 10;
                    anchors.verticalCenter: parent.verticalCenter;
                    anchors.leftMargin: parent.width/50;
                    anchors.left:parent.left;
                }
                Rectangle
                {
                    id:btnTwo;
                    width: parent.width/3.2;
                    height:parent.height/100*90;
                    color:"gray";
                    radius: 10;
                    anchors.verticalCenter: parent.verticalCenter;
                    anchors.leftMargin: parent.width/100;

                    anchors.left: btnOne.right;

                }
                Rectangle
                {
                    id:btnTree;
                    width: parent.width/3.2;
                    height:parent.height/100*90;
                    color:"gray";
                    radius: 10;
                    anchors.verticalCenter: parent.verticalCenter;
                    anchors.leftMargin: parent.width/100;
                    anchors.left: btnTwo.right;
                }


            }




            Row
            {
                width: parent.width;
                height: parent.height/4;
                spacing: 4;
                Rectangle
                {
                    width: parent.width/3;
                    height:parent.height/100*90;
                    color:"pink";
                    anchors.verticalCenter: parent.verticalCenter;
                }
                Rectangle
                {
                    width: parent.width/3;
                    height:parent.height;
                    color:"pink";
                }
                Rectangle
                {
                    width: parent.width/3;
                    height:parent.height;
                    color:"pink";
                }
            }


            Row
            {
                width: parent.width;
                height: parent.height/4;
                spacing: 4;
                Rectangle
                {
                    width: parent.width/3;
                    height:parent.height/100*90;
                    color:"gray";
                    anchors.verticalCenter: parent.verticalCenter;
                }
                Rectangle
                {
                    width: parent.width/3;
                    height:parent.height;
                    color:"gray";
                }
                Rectangle
                {
                    width: parent.width/3;
                    height:parent.height;
                    color:"gray";
                }
            }


            Row
            {
                width: parent.width;
                height: parent.height/4;
                spacing: 4;
                Rectangle
                {
                    width: parent.width/3;
                    height:parent.height/100*90;
                    color:"gray";
                    anchors.verticalCenter: parent.verticalCenter;
                }
                Rectangle
                {
                    width: parent.width/3;
                    height:parent.height;
                    color:"gray";
                }
                Rectangle
                {
                    width: parent.width/3;
                    height:parent.height;
                    color:"gray";
                }
            }
        }

    }


}

