main()
{
	thread sr\api\_map::create_spawn_auto();
	thread sr\api\_map::create_normal_way("Normal Way;");
	for (;;)
	{
	}
	for (i = 0;;)
	{
	}
	for (; i < 10;)
	{
	}
	for (;; i++)
	{
	}
	for (i = 0;; i++)
	{
	}
	for (; i < 10; i++)
	{
	}
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
