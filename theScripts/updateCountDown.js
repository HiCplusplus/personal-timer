function updateCountDown(h,m,s)
{
    if(s>0)
        s--;
    else
    {
        if(m>0)
        {
            m--;
            s=59;
        }
        else
        {
            if(h>0)
            {
                h--;
                m=59;
            }
        }
    }

    return '{"h":'+h+',"m":'+m+',"s":'+s+'}';
}


