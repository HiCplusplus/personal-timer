import QtQuick

Item
{
    id:itemRoot;
    width:parent.width;
    height:parent.height/15;
    clip:true;
    property int myIndicatorIndex: -1;
    property string myIndicatorIndexAText: "A";
    property string myIndicatorIndexBText: "B";
    property string myIndicatorIndexCText: "C";
    property int indexesWidth: rowArea.width/3.5;
    property int indexesHeight: 50; //rowArea.height
    property int indexesRadius: 50;


    onMyIndicatorIndexChanged:
    {
        function setIndexActive(a_Active,b_Diactive,c_Diactive)
        {
            a_Active.color = cBG_button;
            b_Diactive.color = cBG_button_deactivated;
            c_Diactive.color = cBG_button_deactivated;
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
        color:cBG;
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
                    color:cTxt_button;

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
                    color: cTxt_button;
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
                    color:cTxt_button;
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
