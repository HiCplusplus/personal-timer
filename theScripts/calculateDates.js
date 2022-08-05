function translateMonthInputs(m) //m means month
{
    if(isNaN(m))
    {
        m = m.toLowerCase();
        switch(m)
        {
            case "january": return  1;
            case "february" : return  2;
            case "march" : return  3;
            case "april" : return  4;
            case "may" : return  5;
            case "june" : return  6;
            case "july" : return  7;
            case "august" : return  8;
            case "september" : return  9;
            case "october" : return  10;
            case "november" : return  11;
            case "december" : return  12;
            default : return -1; //error
        }
    }
    else
        return m;//means input month is not a string
}



function dayOfWeek(y,m,outputType,d=1) //outputType is a string: value 'text' or any
{

//    m = translateMonthInputs(m);
    if(m>0)
    {
        let t = [ 0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4 ];
        y -= (m < 3) ? 1 : 0;
        var result = parseInt (( y + y/4 - y/100 + y/400 + t[m-1] + d) % 7);
        if(outputType==="text")
        {
            switch(result)
            {                               
                case 0 : return "Sunday";
                case 1 : return "Monday";
                case 2 : return "Tuesday";
                case 3 : return "Wednesday";
                case 4 : return "Thursday";
                case 5 : return "Friday";
                case 6 : return "Saturday";//+1
                default : return -1; //means error :"error dayofweek (result>6 or result <0 from outputType text)";
            }
        }
        else
        {
            switch(result)
            {
                case 0 : return 6; //su
                case 1 : return 0; //mo
                case 2 : return 1; //tu
                case 3 : return 2; //we
                case 4 : return 3; //thu
                case 5 : return 4; //fri
                case 6 : return 5; //sat
                default : return -1; //means error: "error dayofweek (result>6 or result <0 from outputType non-text)";
            }
        }


    }
    else
        return -1; //means error : "error dayofweek (m=0 or m<0)" or error isfrom translator bcz of invalid input;
}


function leapYear(year)
{
    year = parseInt(year); //for make sure its int
    return ((year % 4 == 0) && (year % 100 != 0)) || (year % 400 == 0);
}


function monthDays(year,month)
{
    if(!isNaN(month))
    {
        month = parseInt(month);
        if(month===2)
        {
            if(leapYear(year))
                return 29;
            else
                return 28;
        }
        else
        {
            switch(month)
            {
                case 1:
                case 3:
                case 5:
                case 7:
                case 8:
                case 10:
                case 12:
                    return 31;
                default:
                    return 30;
            }
        }
    }
    else
    {
        month = translateMonthInputs(month);
        if(month>0)
            monthDays(year,month);
        else
            return -1;//means error
    }
    return -1;//means error
}


function automaticMonth(year,month,showMode=0)
/*showMode is another function condintion (by default disabled)for
            make space after the value ONLY FOR SHOW INTHE
            TEXTS TO AVOID ERROR Unable to assign [undefined] to QString*/


// return me space days with fill '0' untill month day started of week and insert other days (maxday)
// e.g : (2022,'january') or (2022,1)
// result must be like : [0,0,0,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15, ... , 31]
// result note: zero means this month dont start at this cell/dayweek/e.g(sat.mon,..)
{
    var result = [];


    var makeSpaceForValues = dayOfWeek(year,month,'nontext');//day is default filled by 1
    if(makeSpaceForValues>-1)
    {
//        if(makeSpaceForValues===0)
//            makeSpaceForValues--;

//        makeSpaceForValues--;
        if(makeSpaceForValues>0)
            for(var i=0;i<=makeSpaceForValues;i++)
                result[i] = '0';   //now day space added into result , it was 0 but changed to empty string

    }
    else
        return -1; //error on dayOfWeek result


   var maxDay = monthDays(year,month);
    if(maxDay<0)
        return -1; //error fail on calculate month max day
    else
        for(var j=1; j<= maxDay; j++)
            result.push(j);

    if(showMode)
    {
        for(var a=1; a<= maxDay*2; a++)
            result.push('0');
    }

    return result;
}




//day picker section
function calculateColumns_of_MonthDays(arrayLen)
{

    /*
      how style 7 day in a row

      TITLES are :
      //NOTE start '*' means anyday (28 29 30 31)
      (spaced/nulled) (table columns) -> (max day of month)    (max days + spaced days)

            0                4        -> 28                     (28)

            0                5        -> 29 30 31               (29 , 30 , 31)
            1                5        -> *                      (29 to 32)
            2                5        -> *                      (30 to 33)
            3                5        -> *                      (31 to 34)
            4                5        -> *                      (32 to 35)
            5                5        -> 28 29 30               (33 , 34 , 35)
            6                5        -> 28 29                  (34 , 35)


            5                6        -> 31                     (36)
            6                6        -> 30 31                  (36 , 37)

            x<29 -> 4 column
            x>=29 && x<=35 -> 5 column
            x>=36 or else -> 6 column
      */


    if(arrayLen<29)
        return 4;
    else if(arrayLen >= 29 && arrayLen <= 35)
        return 5;
    else
        return 6;
}
