.import "dataBaseCenter.js" as DBC
const tableName = "settings";

function set(setting, value)
{
   var db = DBC.getDatabase();
   var res = "";
   db.transaction
   (
       function(tx)
       {
                  tx.executeSql('CREATE TABLE IF NOT EXISTS '+tableName+' (setting TEXT UNIQUE, value TEXT)');
                  var rs = tx.executeSql('INSERT OR REPLACE INTO '+tableName+' VALUES (?,?);', [setting,value]);
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

function get(setting, default_value)
{
   var db = DBC.getDatabase();
   var res="";
   try
   {
     db.transaction
     (
       function(tx)
       {
         var rs = tx.executeSql('SELECT value FROM '+tableName+' WHERE setting=?;', [setting]);
         if (rs.rows.length > 0)
         {
              res = rs.rows.item(0).value;
         }

         else
         {
             res = default_value;
         }
       }
     )
   }

   catch (err)
   {
       console.log("Database (saveLoadSettings) :" + err);
       res = default_value;
   };
  return res;
}



//function get_all() //this function based from saveLoadEvents.get()
//{
//   var db = DBC.getDatabase();
//   var res="";
//    let result2 = '{ "settings" : [';

//   try
//   {
//     db.transaction
//     (
//       function(tx)
//       {

//         var rs = tx.executeSql('SELECT * FROM '+tableName);
//         var tableColumns = rs.rows.length;
//         if (rs.rows.length > 0)
//         {
//                 for(var x=0; x<tableColumns; x++)
//                 {
//                     result2 +=
//                             '{ "setting":"'+ rs.rows.item(x).e_id +
//                             '", "value":"'+ rs.rows.item(x).e_title + '" }';
//                     console.log("res saveLoadSetting.get_all=" + result2);
//                     if(x<tableColumns-1)
//                     {
//                         result2 += ",";
//                     }


//                 }
//             result2 += "]}";

//                 console.log("values stringfiy from events.get");
//                 console.log(JSON.stringify(result2));

//         }

//         else
//         {
//             res = "";
//         }


//       }
//     )
//   }

//   catch (err)
//   {
//       console.log("Database (saveLoadSettings.get_all: " + err);
//   };
//   return result2;
//}









