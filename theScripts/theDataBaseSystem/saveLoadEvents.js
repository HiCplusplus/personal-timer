.import "dataBaseCenter.js" as DBC
const tableName = "events3";

function set(eventGroupId, eventTitle, eventDescription, eventTag, eventPriority, eventStart, eventEnd, eventActive, eventLocation)
{
   var db = DBC.getDatabase();
   var res = "";


   db.transaction
   (
       function(tx)
       {
                  tx.executeSql('CREATE TABLE IF NOT EXISTS '+tableName+' ( e_id INTEGER PRIMARY KEY AUTOINCREMENT,'+ //event id
                                                                            'eg_id INT,'+ //group id
                                                                            'e_title TEXT,'+ //name of event limited
                                                                            'e_description TEXT,'+ //long text for user by user
                                                                            'e_tag TEXT,'+ //for search and grouping/sorting
                                                                            'e_priority INT,'+ //a number
                                                                            'e_start DATETIME,'+ //start date n time
                                                                            'e_end DATETIME,'+ //end date n time
                                                                            'e_active INT,'+ // enabled or disabled
                                                                            'e_location TEXT,'+ //location for later to know which location is popular
                                                                            'e_creation_date DATETIME DEFAULT CURRENT_TIMESTAMP,'+
                                                                            'FOREIGN KEY(eg_id) REFERENCES eventGroups2(eg_id) ON DELETE CASCADE );');



                  var rs = tx.executeSql('INSERT OR REPLACE INTO '+tableName+' (eg_id,e_title,e_description,e_tag,e_priority,e_start,e_end,e_active,e_location) VALUES (?,?,?,?,?,?,?,?,?);',
                                                                                                [eventGroupId,
                                                                                                eventTitle,
                                                                                                eventDescription,
                                                                                                 eventTag,
                                                                                                 eventPriority,
                                                                                                 eventStart,
                                                                                                 eventEnd,
                                                                                                 eventActive,
                                                                                                 eventLocation]);

                  if (rs.rowsAffected > 0)
                  {
                    res = "OK";
                  }

                  else
                  {
                    res = "Error (saveLoadEvents.set)";
                  }
      }
   );
  return res;
}



function get(groupId)
{
//    console.log("GET STARTED........................")
   var db = DBC.getDatabase();
   var res="";
    let result2 = '{ "events" : [';

   try
   {
     db.transaction
     (
       function(tx)
       {

         var rs = tx.executeSql('SELECT * FROM '+tableName+' WHERE eg_id = '+groupId+' ORDER BY e_priority ASC;');
         var tableColumns = rs.rows.length;
         if (rs.rows.length > 0)
         {
                 for(var x=0; x<tableColumns; x++)
                 {
                     result2 +=
                             '{ "id":"'+ rs.rows.item(x).e_id +
                             '", "name":"'+ rs.rows.item(x).e_title +
                             '", "priority":"'+ rs.rows.item(x).e_priority +
                             '", "start":"'+ rs.rows.item(x).e_start +
                             '", "end":"'+ rs.rows.item(x).e_end +
                             '", "active":"'+ rs.rows.item(x).e_active +
                             '", "location":"'+ rs.rows.item(x).e_location +
                             '", "tags":"'+ rs.rows.item(x).e_tag + '" }';
                     console.log("res=" + result2);
                     if(x<tableColumns-1)
                     {
                         result2 += ",";
                     }


                 }
             result2 += "]}";

                 console.log("values stringfiy from events.get");
                 console.log(JSON.stringify(result2));

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
       console.log("Database (saveLoadEvents.get): " + err);
   };
   return result2;
}

