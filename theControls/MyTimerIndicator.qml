import QtQuick 2.15
import "../theScripts/updateIndicator.js" as UIN
Item
{
    id:itemRoot;
    width:parent.width;
//    height:parent.height/15;
    height:80;
    clip:true;
    signal index_a_clicked;
    signal index_b_clicked;
    signal index_c_clicked;
    signal index_d_clicked;
    property int myIndicatorIndex: -1;
    property string myIndicatorIndexAText: "A";
    property string myIndicatorIndexBText: "B";
    property string myIndicatorIndexCText: "C";
    property string myIndicatorIndexDText: "D";
    property int indexesWidth: 70;//rowArea.width/3.5;
    property int indexesHeight: 70; //rowArea.height
    property int indexesRadius: 50;

    onMyIndicatorIndexChanged:
    {
        switch(myIndicatorIndex)
        {
            case 0 : UIN.setIndexActive(indexA,indexB,indexC,indexD);break;
            case 1 : UIN.setIndexActive(indexB,indexC,indexA,indexD);break;
            case 2 : UIN.setIndexActive(indexC,indexA,indexB,indexD);break;
            case 3 : UIN.setIndexActive(indexD,indexC,indexA,indexB);break;
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
                        index_a_clicked();
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
                        index_b_clicked();
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
                        index_c_clicked();
                    }
                }
            }//end of index c




            Rectangle
            {
                id:indexD;
                clip:true;
                width:indexesWidth;
                height:indexesHeight;
                radius: indexesRadius;
                Text
                {
                    anchors.horizontalCenter: indexD.horizontalCenter;
                    anchors.verticalCenter: indexD.verticalCenter;
                    text:myIndicatorIndexDText;
                    color:cTxt_button;
                }
                MouseArea
                {
                    anchors.fill: parent;
                    onClicked:
                    {
                        index_d_clicked();
                    }
                }
            }//end of index D
        }
    }
}
