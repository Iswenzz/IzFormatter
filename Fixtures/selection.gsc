main()
{
    if (true) { }
    else if (true) { }  
    else { }

    if (true)
        a = 0;
    else if (true)
        b = 0;
    else if (false)
        c = 0;
    else
        d = 0;

    if (isDefined(test)) 
        test();
    else 
        test();

    switch (true)
    {
        case 1:
        case 2:
        case 3: 
            break;

        case "block":
            {
                test();
            }
            break;

        case "test": 
            break;
        default: 
            break;
    }
}
