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
                    res = "Error";
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
         var rs = tx.executeSql('SELECT * FROM '+tableName+';');
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
       console.log("Database (saveLoadAlarm): " + err);
//       res = default_value;
   };
//  return res;
   return result2;
}

