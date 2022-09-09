unsigned factorial(unsigned x)
{
    if (x < 2)
        return 1;
    else
        return x * factorial(x - 1);
}

int main()
{
    unsigned x = factorial(10);
    return 0;
}