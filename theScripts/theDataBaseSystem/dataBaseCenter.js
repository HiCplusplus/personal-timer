//code from https://github.com/fecub/HelloQtLocalStorage
.import QtQuick.LocalStorage 2.0 as Storage

function getDatabase()
{
     return Storage.LocalStorage.openDatabaseSync("plarm", "0.1", "plarm database is localdatabse to save application data, later can fetch/send these data into API for backup/sync with other devices", 100);
}

function getCurrentDateAndTime()
{
    let currentDate = new Date();
    let cYear = currentDate.getFullYear();
    let cDay = currentDate.getDate();
    let cMonth = currentDate.getMonth() + 1;
    let cHour = (currentDate.getHours()<10? "0"+currentDate.getHours() : currentDate.getHours());
    let cMinute = (currentDate.getMinutes()<10? "0"+currentDate.getMinutes() : currentDate.getMinutes());
    let cSecond = (currentDate.getSeconds()<10? "0"+currentDate.getSeconds() : currentDate.getSeconds());

    if(cDay <10)
        cDay = "0"+cDay;
    if(cMonth < 10)
        cMonth = "0"+cMonth;
//    console.log(cYear + "-" + cMonth + "-" + cDay + " " +  currentDate.getHours() + ":" + currentDate.getMinutes() + ":" + currentDate.getSeconds());
    return  cYear + "-" + cMonth + "-" + cDay + " " + cHour  + ":" + cMinute + ":" + cSecond;
}
