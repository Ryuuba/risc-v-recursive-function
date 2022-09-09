#include <iostream>

void swap(char *x, char *y)
{
    char temp = *x;
    *x = *y;
    *y = temp;
}

void reverse_str(char *str, int k)
{
    static int i = 0;
 
    // if the end of the string is reached
    if (*(str + k) == '\0')
        return;
 
    reverse_str(str, k + 1);
 
    if (i <= k)
        swap(&str[i++], &str[k]);
}

int main()
{
    char a[] = "Anita lava la tina";
    char a_reversed[19];
    reverse_str(a, 19);
    std::cout << a << ' ' << a_reversed << std::endl;
    return 0;
}