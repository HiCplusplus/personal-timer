.import "dataBaseCenter.js" as DBC
const tableName = "log_messages3";

function set(logId,logMessageText)
{
   var db = DBC.getDatabase();
   var res = "";

   db.transaction
   (
       function(tx)
       {
                  tx.executeSql('CREATE TABLE IF NOT EXISTS '+tableName+' (lm_id INTEGER PRIMARY KEY AUTOINCREMENT,log_id INT, lm_text TEXT, lm_date DATETIME DEFAULT CURRENT_TIMESTAMP, FOREIGN KEY(log_id) REFERENCES logs2(l_id) ON DELETE CASCADE );');
                  var rs = tx.executeSql('INSERT OR REPLACE INTO '+tableName+' (log_id,lm_text) VALUES (?,?);',
                                                                                                [logId,
                                                                                                logMessageText]);

                  if (rs.rowsAffected > 0)
                  {
                    res = "OK";
                  }

                  else
                  {
                    res = "Error (saveLoadLogMessages.set)";
                  }
      }
   );
  return res;
}

function get(logId)
{
   var db = DBC.getDatabase();
   var res="";
    let result2 = '{ "logMessages" : [';


   try
   {
     db.transaction
     (
       function(tx)
       {

         var rs = tx.executeSql('SELECT * FROM '+tableName+' WHERE log_id = ? ORDER BY lm_date ASC;',[logId]);
         var tableColumns = rs.rows.length;
         if (rs.rows.length > 0)
         {
                 for(var x=0; x<tableColumns; x++)
                 {
                     result2 +=
                             '{ "id":"'+ rs.rows.item(x).lm_id +
                             '", "text":"'+ rs.rows.item(x).lm_text +
                             '", "date":"'+ rs.rows.item(x).lm_date + '" }';
                     if(x<tableColumns-1)
                     {
                         result2 += ",";
                     }

                 }
             result2 += "]}";


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
       console.log("Database (saveLoadLogMessages.get): " + err);
//       res = default_value;
   };
//  return res;
   return result2;
}


