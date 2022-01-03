main()
{
    test();
    test(1, 2);
    test(1, 2, 3);
    test(1 + 5, 2);
    test("Is", "wenzz");

    maps\mp\_test::test();
    maps\mp\_test::test(1);

    functionA = ::test;
    [[functionA]]();
    [[functionA]](1, 2);

    a = functions[arrayA[0]];
    b = functions[arrayA[0]](1, 2);

    thread test();
    self thread test(1, 2);
    self.function thread test();
    self.functions[1] thread test();
}

test(a, b)
{
    return a + b;
}
