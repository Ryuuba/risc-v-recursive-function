unsigned fibonacci(unsigned target)
{
    if (target == 0)
        return 0;
    else if(target == 1 || target == 2)
        return 1;
    else
        return fibonacci(target-1) + fibonacci(target-2);  
}

int main() {
    unsigned fib = fibonacci(10);
    return 0;
}


