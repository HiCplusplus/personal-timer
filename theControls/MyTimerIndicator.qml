import QtQuick

Item
{
    id:itemRoot;
    width:parent.width;
    height:parent.height/20;

    property int myIndicatorIndex: -1;
    property string myIndicatorIndexAText: "First";
    property string myIndicatorIndexBText: "Second";
    property string myIndicatorIndexCText: "Third";
    property int indexesWidth: rowArea.width/3.5;
    property int indexesHeight: rowArea.height;
    property int indexesRadius: 20;

    onMyIndicatorIndexChanged:
    {
        function setIndexActive(a_Active,b_Diactive,c_Diactive)
        {
            a_Active.color = "orange";
            b_Diactive.color = "transparent";
            c_Diactive.color = "transparent";
        }
        switch(myIndicatorIndex)
        {
            case 0 : setIndexActive(indexA,indexB,indexC);break;
            case 1 : setIndexActive(indexB,indexC,indexA);break;
            case 2 : setIndexActive(indexC,indexA,indexB);break;
        }

    }

    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:"red";
        Row
        {
            id:rowArea;
            anchors.fill: parent;
            anchors.horizontalCenter: root.horizontalCenter;
            anchors.left: root.left;
            anchors.leftMargin: root.width/25;
            anchors.bottom: root.bottom;
            anchors.bottomMargin: 5;
            spacing: root.width/25;
            Rectangle
            {
                id:indexA;
                clip:true;
                width:indexesWidth;
                height:indexesHeight;
                radius: indexesRadius;
                Text
                {
                    anchors.horizontalCenter: indexA.horizontalCenter;
                    anchors.verticalCenter: indexA.verticalCenter;
                    text:myIndicatorIndexAText;

                }
                MouseArea
                {
                    anchors.fill: parent;
                    onClicked:
                    {
                        viewTimers.setCurrentIndex(0);
                    }
                }

            }


            Rectangle
            {
                id:indexB;
                clip:true;
                width:indexesWidth;
                height:indexesHeight;
                radius: indexesRadius;
                Text
                {
                    anchors.horizontalCenter: indexB.horizontalCenter;
                    anchors.verticalCenter: indexB.verticalCenter;
                    text:myIndicatorIndexBText;
                }
                MouseArea
                {
                    anchors.fill: parent;
                    onClicked:
                    {
                        viewTimers.setCurrentIndex(1);
                    }
                }
            }


            Rectangle
            {
                id:indexC;
                clip:true;
                width:indexesWidth;
                height:indexesHeight;
                radius: indexesRadius;
                Text
                {
                    anchors.horizontalCenter: indexC.horizontalCenter;
                    anchors.verticalCenter: indexC.verticalCenter;
                    text:myIndicatorIndexCText;
                }
                MouseArea
                {
                    anchors.fill: parent;
                    onClicked:
                    {
                        viewTimers.setCurrentIndex(2);
                    }
                }
            }
        }
    }
}
