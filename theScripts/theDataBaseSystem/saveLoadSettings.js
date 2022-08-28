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














////code from https://github.com/fecub/HelloQtLocalStorage
//.import QtQuick.LocalStorage 2.0 as Storage

//function getDatabase()
//{
//     return Storage.LocalStorage.openDatabaseSync("plarm", "0.1", "plarm database is localdatabse to save application data, later can fetch/send these data into API for backup/sync with other devices", 100);
//}

//function set(setting, value)
//{
//   var db = getDatabase();
//   var res = "";
//   db.transaction
//   (
//       function(tx)
//       {
//                  tx.executeSql('CREATE TABLE IF NOT EXISTS settings(setting TEXT UNIQUE, value INT)');
//                  var rs = tx.executeSql('INSERT OR REPLACE INTO settings VALUES (?,?);', [setting,value]);
//                  if (rs.rowsAffected > 0)
//                  {
//                    res = "OK";
//                  }

//                  else
//                  {
//                    res = "Error";
//                  }
//      }
//   );
//  return res;
//}

//function get(setting, default_value)
//{
//   var db = getDatabase();
//   var res="";
//   try
//   {
//     db.transaction
//     (
//       function(tx)
//       {
//         var rs = tx.executeSql('SELECT value FROM settings WHERE setting=?;', [setting]);
//         if (rs.rows.length > 0)
//         {
//              res = rs.rows.item(0).value;
//         }

//         else
//         {
//             res = default_value;
//         }
//       }
//     )
//   }

//   catch (err)
//   {
//       console.log("Database " + err);
//       res = default_value;
//   };
//  return res;
//}
