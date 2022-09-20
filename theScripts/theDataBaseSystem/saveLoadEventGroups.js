.import "dataBaseCenter.js" as DBC
const tableName = "eventGroups2"; //NOTE: this name is used inside saveLoadEvents.js as refrence

function set(groupName,groupPriority,groupTags)
{
   var db = DBC.getDatabase();
   var res = "";

   db.transaction
   (
       function(tx)
       {
                  //eg= eventGroup
                  tx.executeSql('CREATE TABLE IF NOT EXISTS '+tableName+' (eg_id INTEGER PRIMARY KEY AUTOINCREMENT,eg_name  TEXT, eg_prioirty INT, eg_tags TEXT)');
                  var rs = tx.executeSql('INSERT OR REPLACE INTO '+tableName+' (eg_name,eg_prioirty,eg_tags) VALUES (?,?,?);',
                                                                                                [groupName,
                                                                                                groupPriority,
                                                                                                groupTags]);

                  if (rs.rowsAffected > 0)
                  {
                    res = "OK";
                  }

                  else
                  {
                    res = "Error (saveLoadEventGroups.set)";
                  }
      }
   );
  return res;
}

function get()
{
//    console.log("GET STARTED........................")
   var db = DBC.getDatabase();
   var res="";
    let result2 = '{ "eventGroups" : [';


   try
   {
     db.transaction
     (
       function(tx)
       {

         var rs = tx.executeSql('SELECT * FROM '+tableName+' ORDER BY eg_prioirty ASC;');
         var tableColumns = rs.rows.length;
         if (rs.rows.length > 0)
         {
                 for(var x=0; x<tableColumns; x++)
                 {
                     result2 +=
                             '{ "id":"'+ rs.rows.item(x).eg_id +
                             '", "name":"'+ rs.rows.item(x).eg_name +
                             '", "priority":"'+ rs.rows.item(x).eg_prioirty +
                             '", "tags":"'+ rs.rows.item(x).eg_tags + '" }';
                     console.log("res=" + result2);
                     if(x<tableColumns-1)
                     {
                         result2 += ",";
                     }


                 }
             result2 += "]}";


//                 console.log("values stringfiy from saveloadeventgroup");
//                 console.log(JSON.stringify(result2));

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
       console.log("Database (saveLoadEventGroups.get): " + err);
   };
   return result2;
}

