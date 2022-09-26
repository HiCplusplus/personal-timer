import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../theControls"
import "../../thePages"
import "../../theScripts/theDataBaseSystem/saveLoadLogMessages.js" as SaveLoadLogMessages
Item
{
//    signal changeStatusSwiperFromTimerDown;
    signal refreshListModel;
    property int setLogId: 0;
    property string setLogName : "";
    property int setMaxCharLogText: 500;
    property int checkLengthText : 1;
    property var tmp_Date: ["9999","99","99"];//year month day . for show the dates
    signal goToLogs;
    onGoToLogs:
    {
        //on android i saw problem when user leaved the log messages keybaord still cuming up !! to avoid this
          logText.enabled=false;

    }

    onRefreshListModel:
    {
        listModelMain.clear();
        //reset tmpDate for next refresh
         tmp_Date [0] = tmp_Date[1] = tmp_Date[2] = "9999";
        logText.enabled=true;

        if(JSON.stringify(SaveLoadLogMessages.get(setLogId)).length > 24) //to avoid Syntax error Json.parse error showsup when table is clear
        {
            var allObject = JSON.parse(SaveLoadLogMessages.get(setLogId));
            for(var i=0; i<allObject.logMessages.length; i++)
            {

                //proccess Date and times before append
                const ddate = allObject.logMessages[i].date;
                const yyear = ddate.substr(0,4);
                const mmonth = ddate.substr(5,2); //2022-10-26
                const dday = ddate.substr(8,2);
                const cclocks = ddate.substr(11,ddate.length);
                var finalDate = "";

                if(tmp_Date[0] === "9999" || tmp_Date[0] !== yyear || tmp_Date[1] !== mmonth || tmp_Date[2] !== dday) //init
                {
                    tmp_Date[0] = yyear;
                    tmp_Date[1] = mmonth;
                    tmp_Date[2] = dday;
                    finalDate = yyear + " " + mmonth + " " + dday;
                }
                else
                {
                        finalDate = "";
                }



                //way 2, other ways stored inside TrashCodes,qml
                listModelMain.append({
                                         id:allObject.logMessages[i].id,
                                         lmId:allObject.logMessages[i].id,
                                         lmText: allObject.logMessages[i].text,
                                         lmText: allObject.logMessages[i].text,
                                         date: allObject.logMessages[i].date,
                                         lmClock: cclocks,
                                         lmDate: finalDate,
                                         lmDateLength: finalDate.length,
                                         lmTextLength: allObject.logMessages[i].text.length, //becuase of lenght isnt accessable in mql when wants get height to background rectangle
                                         lmTextLength:
                                         allObject.logMessages[i].text.length, //becuase of lenght isnt accessable in mql when wants get height to background rectangle
                                         });


            }
        }
        else //table is empty and json has error
        {
            console.log("LOG MESSAGES ARE NOT FOUND(logMessages are 0)/Table isnt exists");
        }

    }





    anchors.fill: parent;
    Rectangle
    {
        id:root;
        anchors.fill: parent;
        color:cBG;
    }//end of root


    Rectangle
    {
        id:baseLocalMenuBar;
        width: parent.width;
        height: 45;
        color:cBG;
        Text
        {
            text: setLogName;
            font.pointSize: 15;
            font.family: gFontFamily;
            font.bold: true;
            anchors.centerIn: parent;
            color: cTxt_button;
        }

        Rectangle
        {
            id:backToLogs;
            anchors.left:baseLocalMenuBar.left;
            width:45;
            height:45;
            color:cBG_Unknown;
            Image
            {
                anchors.fill: parent;
                source: "../../"+ path_to_menuIcons + fileIcon_BackNext;
            }

            MouseArea
            {
                anchors.fill:parent;
                onClicked:
                {
                    goToLogs();
                    stack_log_titles = "Logs";
                    appTitle = stack_log_titles;
                }
            }
        }
    }


    ListView
    {
        id:listViewMain;
        anchors.top: baseLocalMenuBar.bottom;
        anchors.left:parent.left;
        anchors.right:parent.right;
        anchors.bottom:writeText.top;
        anchors.topMargin: 12.50;
        anchors.bottomMargin: 12.50;


        clip:true;
        model:
        ListModel
        {
            id:listModelMain;
        }
        delegate:
        Item
        {
            width: listViewMain.width;
            height: ((lmTextLength/(listViewMain.width/11))*32.50)+85; //+70 space between messages from bottom and top

            Rectangle
            {
                anchors.fill: parent;
                color:cBG;
                Rectangle
                 {
                     id: showDateIntheTop;
                     width: parent.width/3.50;
                     height: lmDateLength>1 ? 15 : 0;
                     color:cBG_button;
                     anchors.horizontalCenter: parent.horizontalCenter;
                     radius:50;
                     Text
                     {
                         text: lmDate;
                         color:cUnknown;
                         anchors.centerIn:parent;
                     }
                 }


                Rectangle
                {
                    width: parent.width/1.10;
                    /*formula for hieght:
                      lmTextLen = text.length
                      listViewMain.w = parent.w
                      divide by 11 = i found a number to divide width to charecters => ~charecters in a line
                      mupltle to 32.50 = pixel i dedicated to each line of texts
                      +1 = to avoid multiple zero with pixel per line and make them example: 1*32 = 32 NOT 15 or .. for show better smallest texts
                      LAST +15 or +etc = for bottom date OR for bottom space;
                      */
                    height: (((lmTextLength/(listViewMain.width/11))+1)*32.50)+15; //+10 because of date placed on bottom, +1 is for when number of text lines are 0 dont multp 0.5 to other number
                    color: cBG_element;
                    radius:15;
                    //                    anchors.centerIn:parent;
                    anchors.top:showDateIntheTop.bottom;
                    anchors.topMargin: 10;
                    anchors.horizontalCenter: parent.horizontalCenter;


                    Text
                    {
                        text: lmText;
                        font.family: gFontFamily;
                        color:cTxt_button;
                        font.pointSize: 12;
                        wrapMode: Text.WrapAtWordBoundaryOrAnywhere;
                        clip:true;
                        anchors.fill:parent;
                        padding: 20;
                    }
                    Text
                    {
                        text: lmClock;
                        font.family: gFontFamily;
                        color:cTxt_button;
                        font.pointSize: 10;
                        anchors.bottom:parent.bottom;
                        anchors.right:parent.right;
                        anchors.rightMargin: 15;
                        anchors.bottomMargin: 5;
                    }
                }

            }

        }//end of item delegate

    }//end of list view


    Rectangle
    {
        id:writeText;
        anchors.bottom: root.bottom;
        width:parent.width;
        height:45;
        color:cBG_element;
        TextArea
        {
            id:logText;
            width: parent.width-45;
            height:parent.height;
            font.family: gFontFamily;
            font.pointSize: 12.50;
            wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere;

            color:cTxt_button;
            padding: 10;

            Text
            {
                text: "Enter text here...";
                color: "#aaa";
                visible: !logText.text;
                anchors
                {
                    verticalCenter:parent.verticalCenter;
                    left:parent.left;
                    leftMargin: 30;
                }
            }
            onTextChanged:
            {

                //to avoid json erros
                function removeThings(text)
                {
                    text = text.replace("\t","");
                    text = text.replace("\n","");
                    return text;
                }
                logText.text = removeThings(logText.text);



                //text dynamic background
                const iconboxWidth = 8;
                const heightPerCharecter = 22.50;
                var xyz = writeText.width/10;
                xyz -= iconboxWidth;
                var lc = logText.length/xyz;
                lc+=1.50;
                if(lc<=2.50)
                    writeText.height = 45;
                else if(lc<3.10)
                    writeText.height = 60;
                else
                    writeText.height = lc * heightPerCharecter;






                //max length
                if(logText.length >= setMaxCharLogText)
                {
                    logText.text = logText.text.slice(0,setMaxCharLogText);
                    logText.cursorPosition=setMaxCharLogText;
                }
            }
        }


        Rectangle
        {
            id:iconSendOrSave;
            width:45;
            height:45;
            color:cBG_Unknown;
            anchors.verticalCenter:writeText.verticalCenter;
            anchors.right:writeText.right;
            Image
            {
                width:25;
                height:25;
                anchors.centerIn:parent;
                source: "../../" + path_to_menuIcons + fileIcon_Send;
            }

            MouseArea
            {
                anchors.fill:parent;
                onClicked:
                {
                    SaveLoadLogMessages.set(setLogId,logText.text);
                    logText.text = "";
                    writeText.height = 45;
                    refreshListModel();

                    //code insert text

                }
            }
        }
    }







}//end of item
