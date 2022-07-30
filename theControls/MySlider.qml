import QtQuick 2.0

Item
{
//    property color setColorSelected: "#B178FF";
//    property color setColorNotSelected: "#EBDDFF";//
    property int setMinValue: 5;
    property int setMaxValue: 100;
    property int setCurrentValue:50;
    property int outPutVolume:setCurrentValue; //use this for

    id:itemBase;
    anchors.fill: parent;
    Rectangle
    {
        id:root;
        anchors.verticalCenter:  parent.verticalCenter;
        height:parent.height/2;
        width: parent.width;
        color:cBG_Unknown;
        clip:true;

        DropArea
        {
            anchors.fill: parent;
            Rectangle
            {
                id:baseSlider;
                anchors.fill: parent;
                color:"#EBDDFF";//color exception 3
                radius:15;
            }

        }

        Rectangle
        {
            id:selectedSlider;
            width: setCurrentValue;//(baseSlider.width/100)*setCurrentValue
            height:parent.height;
            color:cBG_button;
            radius:15;
        }
    }
    Rectangle
    {
        id:sliderCircle;
        width: itemBase.height;
        height: itemBase.height;
        anchors.verticalCenter: parent.verticalCenter;
        color:cBG_button;
        radius:100;
        x:((baseSlider.width/100)*setCurrentValue)-height;

        Drag.active: dragArea.drag.active;
        onXChanged:
        {
            selectedSlider.width=x+height;
            outPutVolume= (x/(baseSlider.width-height))*100;
            textVolume.text=outPutVolume;
        }

        Text
        {
            id:textVolume;
            text:"";
            anchors.centerIn: parent;
            color:cTxt_button;
            font.pointSize: 9;
        }

        MouseArea
        {
            id: dragArea;
            anchors.fill: parent;
            drag.target: parent;
            drag.maximumX: baseSlider.width-sliderCircle.height;
            drag.minimumX: 0;
        }
    }



}
