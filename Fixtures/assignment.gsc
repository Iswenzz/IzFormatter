main()
{
    intA -= 10;
    intA += 10;
    intA *= 10;
    intA /= 10;
    intA %= 10;
    intA &= 10;
    intA |= 10;
    intA ^= 10;
    intA <<= 10;
    intA >>= 10;

    intA = 10 + 20 * 20 / 30 % 40;
    intA = 10 + (20 * 20) / 30 % 40;
    intA = sizeof(intA);

    intA++; 
    intA--;

    ++intA;
    --intA;

    arrayA[1] = 10;
    arrayA[1][2] = 10;
    arrayA["test"] = "test";
}
