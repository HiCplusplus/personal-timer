// function sync_settings(api_url,_setting,_value,_ukey)
// {
//   var xhttp = new XMLHttpRequest();
//   xhttp.onreadystatechange = function()
//   {
//     if(this.readyState === 0)
//     {
//         console.log("sync_settings: readyState -> 0.");
//     }
//     if(this.readyState === 1 || this.readyState === 2 || this.readyState === 3)
//     {
//       console.log("sync_settings: readyState -> 1 or 2 or 3.");
//     }
//      if (this.readyState === 4 && this.status === 200)
//      {
//          switch(this.responseText)
//          {
//                case "0":
//                {
//                    console.log("sync_settings error: 0 -> database connection error.");
//                }break;

//                case "1":
//                {
//                    console.log("sync_settings error: 1 -> invalid setting parameter (setting field is empty).");
//                }break;

//                case "2":
//                {
//                    console.log("sync_settings: 2 -> successfuly inserted.");
//                }break;

//                case "3":
//                {
//                    console.log("sync_settings: 3 -> successfuly updated.");
//                }break;

//                case "4":
//                {
//                    console.log("sync_settings error: 4 -> query update failed.");
//                }break;

//                case "5":
//                {
//                    console.log("sync_settings error: 5 -> invaild ukey (access denied).");
//                }break;

//                default:
//                    console.log("sync_settings error: unknown error.");
//                    break;

//          }
//      }
//   };
//   xhttp.open("POST", api_url, true); //POST
//   xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//   var dataa= "setting="+_setting+"&value="+_value+"&ukey="+_ukey;
//   xhttp.send(dataa);
// }

//function getData()
//{
//    var xmlhttp = new XMLHttpRequest();
//    var url = "http://www.w3schools.com/website/Customers_MYSQL.php";

//    xmlhttp.onreadystatechange=function()
//    {
//        if (xmlhttp.readyState === XMLHttpRequest.DONE && xmlhttp.status === 200) {
//            console.log("res from getDAta = \n\n"+xmlhttp.responseText);
//        }
//    }
//    xmlhttp.open("GET", url, true);
//    xmlhttp.send();
//}


//function sendData(url,_setting,_value,_ukey)
//{
//    var req = new XMLHttpRequest();
//    req.open("POST", url);
//    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
//    req.onreadystatechange = function() {
//      if (req.readyState === XMLHttpRequest.DONE) {
//          console.log("successfuyl updateinserted data setting state="+ req.readyState + " sta=" +req.status + " res=" + req.responseText);
//        // what you want to be done when request is successfull
//      }
//    }
//    req.onerror = function(){
//      // what you want to be done when request failed
//        console.log("failed to updateinserted data setting");
//    }
//    req.send("setting="+_setting+"&value="+_value+"&ukey="+_ukey);
//}


function insertOrUpdate(_url,_setting,_value,_ukey)
{
    var req = new XMLHttpRequest();
    req.open("POST", _url);
    req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    req.onreadystatechange = function()
    {
        if (this.readyState === 4 && this.status === 200)
        {
            switch(this.responseText)
            {
                  case "0":
                  {
                      console.log("sync_settings error: 0 -> database connection error.");
                  }break;

                  case "1":
                  {
                      console.log("sync_settings error: 1 -> invalid setting parameter (setting field is empty).");
                  }break;

                  case "2":
                  {
                      console.log("sync_settings: 2 -> successfuly inserted.");
                  }break;

                  case "3":
                  {
                      console.log("sync_settings: 3 -> successfuly updated.");
                  }break;

                  case "4":
                  {
                      console.log("sync_settings error: 4 -> query update failed.");
                  }break;

                  case "5":
                  {
                      console.log("sync_settings error: 5 -> invaild ukey (access denied).");
                  }break;

                  default:
                      console.log("sync_settings error: unknown error.");
                      break;
            }
        }
    }

    var mydata = "setting="+_setting+"&value="+_value+"&ukey="+_ukey;
    req.send(mydata);
}
