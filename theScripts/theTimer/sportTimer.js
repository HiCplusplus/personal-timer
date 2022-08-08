function addTimes_together(h,m,s,typeMode)//start,end,typeMode) //typeMod -> 0 return hour, 1 return minute , 2 return second
{
//    times = [];
//    times1 = start.split(':');
//    times2 = end.split(':');

//    for (var i = 0; i < 3; i++)
//    {
//        times1[i] = (isNaN(parseInt(times1[i]))) ? 0 : parseInt(times1[i])
//        times2[i] = (isNaN(parseInt(times2[i]))) ? 0 : parseInt(times2[i])
//        times[i] = times1[i] + times2[i];
//    }

//    var hours = times[0];
//    var minutes = times[1];
//    var seconds = times[2];

    var hours = h;
    var minutes = m;
    var seconds = s;
    if (seconds % 60 === 0)
    {
        minutes += seconds / 60;
        seconds=0;
    }
    else
    {
        var res2 = (seconds /60 | 0);
        minutes += res2;
        seconds = seconds - ( 60 * res2);
    }

    var res = (minutes / 60) | 0;
    hours += res;
    minutes = minutes - (60 * res);

    switch(typeMode)
    {
    case 0: return hours;
    case 1: return minutes;
    case 2: return seconds;
    }
}
