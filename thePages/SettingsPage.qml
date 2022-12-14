import QtQuick 2.15
import QtQuick.Controls 2.15
import "../theControls"

Item
{
    anchors.fill: parent;
    signal anBackPage;
    signal anNextPage;

    onAnBackPage:
    {        
        stack.pop();
        console.log(stack.index + " [] " + stack.currentItem + " [] "+ stack.depth)
    }

    ScrollView
    {
        anchors
        {
            top:parent.top;
            topMargin:100;
            left:parent.left
            right:parent.right
            bottom:parent.bottom;
        }
        Column
        {
            width:parent.width;
            height:300;
            anchors
            {
                top:parent.top;
                topMargin:100;
            }

            spacing:10;
            Rectangle
            {
                width:parent.width;
                height:70;
                color:"red";
            }
            Rectangle
            {
                width:parent.width;
                height:70
                color:"yellow";
            }
            Rectangle
            {
                width:parent.width;
                height:70
                color:"green";
            }
        }
    }



    StackView
    {
        id: stack;
        initialItem: "thePageA.qml";
        anchors.fill: parent;
        visible:false;
//        Row
//        {
//            anchors.bottom:parent.bottom;
//            spacing: 10
//            Button {
//                text: "Push"
//                onClicked: stack.push("thePageB.qml");
//            }
//            Button {
//                text: "Pop"
////                enabled: stack.depth > 1
//                onClicked: stack.push("thePageC.qml")
//            }
//            Button {
//                text: "Pop"
////                enabled: stack.depth > 1
//                onClicked: stack.push("thePageC.qml")
//            }
//            Text
//            {
//                text: stack.depth
//            }
//        }
    }
}
