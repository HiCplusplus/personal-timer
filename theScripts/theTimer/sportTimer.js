function updateCircles(h,m,s,ms)
{
    const plusValue = 6.33;
    const maxCircles = 380;
    ms += plusValue;
    if(ms>=maxCircles)
    {
       ms=0;
       s+=plusValue;
        if(s>=maxCircles)
        {
            s=0;
            m+=plusValue;
            if(m>=maxCircles)
            {
                m=0;
                h+=plusValue;
                if(h>=maxCircles)
                {
                    h=0;
                        //here
                }
            }
        }
    }
//                timePast[0]=h;
//                timePast[1]=m;
//                timePast[2]=s;
//                timePast[3]=ms;
    return '{"h":'+h+',"m":'+m+',"s":'+s+',"ms":'+ms+'}';
}
