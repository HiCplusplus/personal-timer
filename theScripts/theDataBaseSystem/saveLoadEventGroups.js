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






/*
  Event group:

        title (primery, uniq)  [short text , limited i.g 32char]
        tag [short text , limited i.g 32char]
        priority [int] [def 50] //lower number = highest pririoty


  Events:
        id [int] autoincrease
        title [short text , limited]
        tag (icon/color) [short text , limited]
        priority [int] //lower number = highest pririoty
        description [long text , limited]
        enable/active [int] default ture/1
        start + clock [time/date] default timestamp
        end + clock [time/date] defualt +1hour after start
        location [short text, limited]
        creation [timestamp]


        -------------------------------------------------------- reminder: (number , minute/hour/day/week/AT-EVENT-TIME) [all is before starts]

        repeat mode: [int]
                            // 0->[0] repeate status
                            // 1->[1] repeate status
                            // 2->[2] repeate status
                            // 3->[3] repeate status
                            // 4->[4] repeate status
                            // 5->[5] repeate status

        repeat status are:  [short text]
                            dont-repeat //
                            every ? hour,minute,seconds,rounds
                            every ? day //
                            every ? weeks //
                            every ? month //
                            every ? year //



    Complete/Repeat Events
        id (auto_increase)
        eventId (with eventRouind not repeated, primery , refrecned from Events)
        eventRound (with eventID not repeated , primery , refrenced from Events)
        complete status (default 0, timestamp)
        removed (default 0, timestamp)


  */
