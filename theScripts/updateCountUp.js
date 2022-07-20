function updateCountUp(d,h,m,s)
{
    if(s<59)
        s++;
    else
    {
        s=0;

        if(m<59)
            m++;
        else
        {
            m=0;
            if(h<23)
                h++;

            else
            {
                h=0;
                if(d<999)
                    d++;
                else
                    d=0;
            }
        }

    }
    return '{"d":'+d+',"h":'+h+',"m":'+m+',"s":'+s+'}';
}

