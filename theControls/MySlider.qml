import QtQuick 2.0

Item
{
    property color setColorSelected: "#B178FF";
    property color setColorNotSelected: "#EBDDFF";//
    property int setMinValue: 0;
    property int setMaxValue: 100;
    property double currentValue:50;
    id:itemBase;
    anchors.fill: parent;
    Rectangle
    {
        id:root;
        anchors.verticalCenter:  parent.verticalCenter;
        height:parent.height/2;
        width: parent.width;
        clip:true;
        DropArea
        {
            anchors.fill: parent;
            Rectangle
            {
                id:baseSlider;
                anchors.fill: parent;
                color:setColorNotSelected;
                radius:15;
            }

        }

        Rectangle
        {
            id:selectedSlider;
            width: (baseSlider.width/100)*currentValue;
            height:parent.height;
            color:setColorSelected;
            radius:15;
        }
    }
    Rectangle
    {
        id:sliderCircle;
        width: itemBase.height;
        height: itemBase.height;
        anchors.verticalCenter: parent.verticalCenter;
        color:setColorSelected;
        radius:100;
        x:((baseSlider.width/100)*currentValue)-height;

        Drag.active: dragArea.drag.active;
//        Drag.hotSpot.x: 10;
//        Drag.hotSpot.y: 10;
        onXChanged:
        {
            if(x>=baseSlider.width)
                x=baseSlider.width-height;

//            if(x<00.00)
//                x=baseSlider.width/100;

                console.log(sliderCircle.x);
                selectedSlider.width=x+height;
        }

        MouseArea
        {
            id: dragArea;
            anchors.fill: parent;
            drag.target: parent;
        }
    }



}
