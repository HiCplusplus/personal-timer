import QtQuick 2.15

Item
{
    property double setRotation: -90;
    property double setLineWidth: 1;
    property color setColor: "black";
    property double setRadius: 30;
    property double setTime: 100;
    property double setTimeDivide: 60;
    property double setParentDivide_Width_Height: 2;

    signal canvasPrint;

    onCanvasPrint:
    {
        canvas.requestPaint();
    }
    anchors.fill: parent;
    Canvas
    {
        id: canvas;
        anchors.fill: parent;
        rotation: setRotation;
        onPaint:
        {
            const ctx = getContext("2d");
            ctx.reset();

                ctx.beginPath();
                ctx.lineWidth = setLineWidth;
                ctx.strokeStyle = setColor;
                ctx.arc(canvas.width/setParentDivide_Width_Height,//Width ,
                        canvas.height/setParentDivide_Width_Height,//Height ,
                        (canvas.width/setParentDivide_Width_Height/100
                                                                +canvas.height/setParentDivide_Width_Height/100)
                                                                *setRadius,//radius,
                        0,//angleOffset,
                        setTime/setTimeDivide);//value  //angleOffset + angleSec
                ctx.stroke();

        }
    }
}
