function dayofweek(y,m,d)
{
    if(isNaN(m))
    {
        m = m.toLowerCase();
        switch(m)
        {
            case "january": m = 1; break;
            case "february" : m = 2; break;
            case "march" : m = 3; break;
            case "april" : m = 4; break;
            case "may" : m = 5; break;
            case "june" : m = 6; break;
            case "july" : m = 7; break;
            case "august" : m = 8; break;
            case "september" : m = 9; break;
            case "october" : m = 10; break;
            case "november" : m = 11; break;
            case "december" : m = 12; break;
            default : m = 0; //error
        }
    }

    if(m>0)
    {
        let t = [ 0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4 ];
        y -= (m < 3) ? 1 : 0;
        var result = parseInt (( y + y/4 - y/100 + y/400 + t[m-1] + d) % 7);
        switch(result)
        {
            case 0 : return "Sunday";
            case 1 : return "Monday";
            case 2 : return "Tuesday";
            case 3 : return "Wednesday";
            case 4 : return "Thursday";
            case 5 : return "Friday";
            case 6 : return "Saturday";
            default : return "error dayofweek (result>6 or result <0)";
        }
    }
    else
        return "error dayofweek (m=0 or m<0)";


}
