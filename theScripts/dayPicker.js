function calculateColumns_of_MonthDays(arrayLen)
{

    /*
      how style 7 day in a row

      TITLES are :
      //NOTE start '*' means anyday (28 29 30 31)
      (spaced/nulled) (table columns) -> (max day of month)    (max days + spaced days)

            0                4        -> 28                     (28)
            0                5        -> 29 30 31               (29 , 30 , 31)
            1                5        -> *                      (29 to 32)
            2                5        -> *                      (30 to 33)
            3                5        -> *                      (31 to 34)
            4                5        -> *                      (32 to 35)
            5                5        -> 28 29 30               (33 , 34 , 35)
            6                5        -> 28 29                  (34 , 35)


            5                6        -> 31                     (36)
            6                6        -> 30 31                  (36 , 37)

            x<29 -> 4 column
            x>=29 && x<=35 -> 5 column
            x>=36 or else -> 6 column
      */


    if(arrayLen<29)
        return 4;
    else if(arrayLen >= 29 && arrayLen <= 35)
        return 5;
    else
        return 6;
}

function myObject()
{
    var x =
            `
                                import QtQuick 2.15

                                Rectangle
                                {
                                    color: "red"
                                    width: `+600+`
                                    height: `+200+`
                                    MyWeekDayPicker
                                    {
                                        textAPick =
                                        textBPick
                                        textCPick
                                        textDPick
                                        textEPick
                                        textFPick
                                        textGPick
                                    }
                                }
                                `;

    return x;
}

//// test create dynamic
//var component;
//var sprite;

//function createSpriteObjects()
//{
//    component = Qt.createComponent("../theControls/MyDayPicker.qml");
//    if (component.status == Component.Ready)
//        finishCreation();
//    else
//        component.statusChanged.connect(finishCreation);
//}

//function finishCreation()
//{
//    if (component.status == Component.Ready) {
//        sprite = component.createObject(myComp, {x: 100, y: 100});
//        if (sprite == null) {
//            // Error Handling
//            console.log("Error creating object");
//        }
//    } else if (component.status == Component.Error) {
//        // Error Handling
//        console.log("Error loading component:", component.errorString());
//    }
//}
