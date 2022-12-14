
//function insertOrUpdate(_url,_id,_name,_priority,_tag,_ukey)
function insertOrUpdate(_url,_data)
{
    console.log("im in sync log inserupdate func start;");
    var req = new XMLHttpRequest();
    req.open("POST", _url);
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    req.onreadystatechange = function()
    {
        console.log("readystate="+this.readyState + "\t"+this.status);
        if (this.readyState === 4 && this.status === 200)
        {
            switch(this.responseText)
            {
                  case "0":
                  {
                      console.log("sync_logs error: 0 -> database connection error.");
                      return -1;
                  }

                  case "1":
                  {
                      console.log("sync_logs error: 1 -> invalid name parameter (name field is empty).");
                      return -1;
                  }

                  case "2":
                  {
                      console.log("sync_logs: 2 -> successfuly inserted.");
                      return 0;
                  }

                  case "3":
                  {
                      console.log("sync_logs: 3 -> successfuly updated.");
                      return 0;
                  }

                  case "4":
                  {
                      console.log("sync_logs error: 4 -> query update failed.");
                      return -1;
                  }

                  case "5":
                  {
                      console.log("sync_logs error: 5 -> invaild ukey (access denied).");
                      return -1;
                  }

                  default:
                  {
                      console.log("sync_logs error: unknown error.");
                      return -1;
                  }

            }
        }
    }
//    var mydata = "id="+_id+"&name="+_name+"&priority="+_priority+"&tag="+_tag+"&ukey="+_ukey;
    var mydata = "id=1&name=2&priority=3&tag=4&ukey=dwdw";
    req.send(mydata);//mydata);
}
