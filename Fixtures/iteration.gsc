main()
{
    for (;;) { }

    for (i = 0; i < 10; i++)
        test();
        
    while (true)
    {
        if (false)
            continue;
        if (false)
            break;
        test();
    }
}
