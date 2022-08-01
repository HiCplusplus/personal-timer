import QtQuick 2.0
import QtQuick .Controls 2.15
import QtQuick 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Private 1.0
import QtQuick.Extras 1.4
import QtQuick.Extras.Private 1.0


Item
{
    anchors.fill: parent;
    signal xANDyChanged;
    property double itemsMargin: 1.15;
    property int xValue: 50;
    property int yValue: 50;
    property int theRadius:150;
    onXANDyChanged:
    {
        console.log(hourPicker.width/theRadius);

        if(hourPoint.x>hourPicker.width || hourPicker.x>hourPicker.height)
        {
            console.log("hourPoint.x.y > hourpiucker.x.y");
        }
        else
        {
            console.log(hourPoint.x+ "\t" +hourPoint.y);
        }
    }

    clip:true;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:"transparent";
        radius:theRadius;
        RangeModel {
            id: range
            minimumValue: 0.0
            maximumValue: 1.0
            stepSize: 0
            value: 0
        }

//        Rectangle
//        {
//            id:baseCircle;
//            width: parent.height;
//            height:parent.height;
//            color:"transparent";
//            radius:theRadius;
//            anchors.centerIn: parent;

//            DropArea
//            {
//                anchors.fill: parent;
//                clip:true;
//                Rectangle
//                {
//                    id:hourPicker;
//                    width: parent.height/itemsMargin;
//                    height:parent.height/itemsMargin;
//                    color:"pink";
//                    anchors.centerIn: parent;
//                    clip:true;
//                    Rectangle
//                    {
//                        id:hourPoint;
//                        width: 20;
//                        height: width;
//                        color:"white";
//                        x:xValue;//parent.height/2-(width/2);
//                        y:yValue;
//                        Drag.active: dragArea.drag.active;
//                        onXChanged:
//                        {
//                            xANDyChanged();
//                        }
//                        onYChanged:
//                        {
//                            xANDyChanged();
//                        }

//                        MouseArea
//                        {
//                            id: dragArea;
//                            anchors.fill: parent;
//                            drag.target: parent;
//                        }
//                    }//end of hourpoint

//                }
//            }
//            Rectangle
//            {
//                id:hourSelected;
//                width: parent.height/itemsMargin/2;
//                height:parent.height/itemsMargin/2;
//                color:"purple";
//                anchors.centerIn: parent;
//            }

//        }//end of base circle
    }//end of root



}
