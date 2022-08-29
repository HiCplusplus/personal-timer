.import "dataBaseCenter.js" as DBC
const tableName = "alarms5";

function set(aname,astatus,ahour,aminute,apm,asound,avolume,adays)
{
   var db = DBC.getDatabase();
   var res = "";



   db.transaction
   (
       function(tx)
       {
                  tx.executeSql('CREATE TABLE IF NOT EXISTS '+tableName+' (a_name TEXT UNIQUE, a_status INT, a_hour INT, a_minute INT, a_pm INT, a_sound TEXT, a_volume INT, a_days TEXT)');
                  var rs = tx.executeSql('INSERT OR REPLACE INTO '+tableName+' VALUES (?,?,?,?,?,?,?,?);',   [aname,
                                                                                                astatus,
                                                                                                ahour,
                                                                                                aminute,
                                                                                                apm,
                                                                                                asound,
                                                                                                avolume,
                                                                                                adays]);

                  if (rs.rowsAffected > 0)
                  {
                    res = "OK";
                  }

                  else
                  {
                    res = "Error (saveLoadAlarm.set)";
                  }
      }
   );
  return res;
}

function get()
{
   var db = DBC.getDatabase();
   var res="";
    let result2 = '{ "alarms" : [';


   try
   {
     db.transaction
     (
       function(tx)
       {

//         var tableColumns2 = tx.executeSql('SELECT count(*) FROM information_schema.columns WHERE table_name ='+tableName+';');
         var rs = tx.executeSql('SELECT * FROM '+tableName+' ORDER BY a_status DESC;');
         var tableColumns = rs.rows.length;
         if (rs.rows.length > 0)
         {
                 for(var x=0; x<tableColumns; x++)
                 {
                     result2 +=
                             '{ "name":"'+ rs.rows.item(x).a_name +
                             '", "status":"'+ rs.rows.item(x).a_status +
                             '", "hour":"'+ rs.rows.item(x).a_hour +
                             '", "minute":"'+ rs.rows.item(x).a_minute +
                             '", "pm":"'+ rs.rows.item(x).a_pm +
                             '", "sound":"'+ rs.rows.item(x).a_sound +
                             '", "volume":"'+ rs.rows.item(x).a_volume +
                             '", "days":"'+ rs.rows.item(x).a_days + '" }';
                     if(x<tableColumns-1)
                     {
                         result2 += ",";
                     }

                 }
             result2 += "]}";


// FOR TEST JSON
//                 var allObject = JSON.parse(result2);
//                console.log(allObject.alarms[1].name);
//                 console.log("-----------------------");
//                 console.log(JSON.stringify(allObject))

         }

         else
         {
             res = "";
         }
       }
     )
   }

   catch (err)
   {
       console.log("Database (saveLoadAlarm.get): " + err);
//       res = default_value;
   };
//  return res;
   return result2;
}




function update(alarmName,fieldName,value)
{
   var db = DBC.getDatabase();
   var res = "";
   db.transaction
   (
       function(tx)
       {
                  var rs = tx.executeSql('UPDATE '+tableName+' SET '+ fieldName +' = '+ value +' WHERE a_name =?;',[alarmName]);
                  if (rs.rowsAffected > 0)
                  {
                    res = "OK";
                  }

                  else
                  {
                    res = "Error (from saveLoadAlarm.update)";
                  }
      }
   );
  return res;
}



function convertDaysToText(text)
{
    var res="";
    const allValues = text.split(",");
    if(allValues[0] === '1')
        res += "Mon ";
    if(allValues[1] === '1')
        res += "Tue ";
    if(allValues[2] === '1')
        res += "Wed ";
    if(allValues[3] === '1')
        res += "Thu ";
    if(allValues[4] === '1')
        res += "Fri ";
    if(allValues[5] === '1')
        res += "Sat ";
    if(allValues[6] === '1')
        res += "Sun ";
    if(res.length>=28)
        res = "EveryDay";
    if(res == "")
        res = "NoRepeat";
    return res;
}
