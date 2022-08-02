import QtQuick 2.0

Item
{
    property int setMinValue: 5;
    property int setMaxValue: 100;
    property int setCurrentValue:50;
    property int outPutVolume:setCurrentValue;


    id:itemBase;
    anchors.fill: parent;
    Rectangle
    {
        id:root;
        anchors.horizontalCenter:  parent.horizontalCenter;
        height:parent.height;
        width: parent.width/2;
        color:cBG_Unknown;
        clip:true;

        DropArea
        {
            anchors.fill: parent;
            Rectangle
            {
                id:baseSlider;
                anchors.fill: parent;
                color:"#EBDDFF";//color exception 3 close to gray
                radius:15;
            }
        }

        Rectangle
        {
            id:selectedSlider;
            width: setCurrentValue;//(baseSlider.width/100)*setCurrentValue
            height:parent.height;
            color:cBG_button;
//            radius:15;
        }
    }
    Rectangle
    {
        id:sliderCircle;
        width: itemBase.width;
        height: itemBase.width;
        anchors.horizontalCenter: parent.horizontalCenter;
        color:cBG_button;
        radius:100;
        x:((baseSlider.width/100)*setCurrentValue)-height;

        Drag.active: dragArea.drag.active;
        onXChanged:
        {
            selectedSlider.height=y+height;
            outPutVolume= (y/(baseSlider.height-height))*100;
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
            drag.maximumY: baseSlider.height-sliderCircle.height;
            drag.minimumY: 0;
        }
    }



}
