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
            function drawMyCircle(obj,_lineWidth ,_color ,_width ,_height, _radius ,_time ,_timeDivide ,_angle=0)
            {
                obj.beginPath();
                obj.lineWidth = _lineWidth;
                obj.strokeStyle = _color;
                obj.arc(_width,//Width ,
                        _height,//Height ,
                        (_width/100+_height/100)*_radius,//radius,
                        _angle,//angleOffset,
                        _time/_timeDivide);//value  //angleOffset + angleSec
                obj.stroke();
            }
            drawMyCircle(ctx,setLineWidth,setColor,canvas.width/setParentDivide_Width_Height,canvas.height/setParentDivide_Width_Height, setRadius, setTime, setTimeDivide);

        }


    }
}
