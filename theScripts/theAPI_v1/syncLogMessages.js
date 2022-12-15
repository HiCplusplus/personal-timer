
function insertOrUpdate(_url,_data)//_id,_name,_priority,_tag,_ukey)
{
    var req = new XMLHttpRequest();
    req.open("POST", _url);
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    req.onreadystatechange = function()
    {
        if (req.readyState === 4 && req.status === 200)
        {
            switch(req.responseText)
            {
                  case "0":
                  {
                      console.log("sync_logMessage error: 0 -> database connection error.");
                      return -1;
                  }

                  case "1":
                  {
                      console.log("sync_logMessage error: 1 -> invalid name parameter (name field is empty).");
                      return -1;
                  }

                  case "2":
                  {
                      console.log("sync_logMessage: 2 -> successfuly inserted. data="+_data);
                      return 1;
                  }

                  case "3":
                  {
                      console.log("sync_logMessage: 3 -> quary failed. data="+_data);
                      return -1;
                  }


                  case "5":
                  {
                      console.log("sync_logMessage error: 5 -> invaild ukey (access denied).");
                      return -1;
                  }

                  default:
                  {
                      console.log("sync_logMessage error: unknown error. response=" + req.responseText+"\tdata="+_data);
                      return -1;
                  }

            }
        }
    }

//    var mydata = "id="+_id+"&name="+_name+"&priority="+_priority+"&tag="+_tag+"&ukey="+_ukey;
//    req.send(mydata);
    req.send(_data);
}
