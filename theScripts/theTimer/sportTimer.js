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










function updateCircles(_circle,_time,_status,_color='') //status ->  0 break , 1 round , 2 paused , 3 normal-color
{
    switch(_status)
    {
        case 0: _circle.setColor = setBreak_and_RoundColors[0]; break;
        case 1: _circle.setColor = setBreak_and_RoundColors[1]; break;
        case 2 : _circle.setColor = setBreak_and_RoundColors[2]; break;
        default: _circle.setColor = _color; break;
    }
    _circle.setTime = _time;
    _circle.canvasPrint();
}









function timeSystem(h,m,s,_pastH,_pastM,_pastS,_mode) //mode 1 round , 0 break
{

        if(s>0)
        {
            s--;
            _pastS -= minusPast_MinuteSecond;
            if(_pastS<0)
                _pastS=maxCircles;

        }
        else if(m>0)
        {
            if(m>0)
            {
                m--;
                _pastM -= minusPast_MinuteSecond;
                if(_pastM<0)
                {
                    if(h<=0)
                        _pastM=0;
                    else
                        _pastM=maxCircles;
                }
                s=60;
            }
        }
        else
        {
            if(h>0)
            {
                _pastH -= minusPast_Hour;
                if(_pastH<0)
                {
                    if(h<=0)
                        _pastH=0;
                    else
                        _pastH=maxCircles;
                }
                h--;
                m=60;
            }
            else
                _pastM=0;
        }



    timePast[2] = _pastS;
    timePast[1] = _pastM;
    timePast[0] = _pastH;

    setTimes[2] = s;
    setTimes[1] = m;
    setTimes[0] = h;

    updateCircles(circleSecond,timePast[2],_mode);
    updateCircles(circleMinute,timePast[1],3,setColors[1]);
    updateCircles(circleHour,timePast[0],3,setColors[0]);
//                    console.log("\th=" +h + "\tm=" + m + "\ts=" + s + "\tph=" + _pastH+ "\tpm=" +_pastM + "\tps=" +_pastS);
}


function convertOneToMaxround(val)
{
//    switch
}
