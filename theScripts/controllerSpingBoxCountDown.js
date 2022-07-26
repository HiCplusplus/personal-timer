function plusValue(valuePlused)
{
    if(valuePlused >999)
        return "999";
    else if(valuePlused<10)
        return "0"+valuePlused;
    else
        return valuePlused;
}

function minusValue(valueMinused)
{
    if(valueMinused<=0)
        return "00";
    else if(valueMinused>999)
        return "999";
    else if(valueMinused<10)
        return "0"+valueMinused;
    else
        return valueMinused;
}

function plusHour(valuePlused)
{

}
