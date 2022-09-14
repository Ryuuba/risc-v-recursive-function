void swap(char* x, char* y)
{
    char temp = *x;
    *x = *y;
    *y = temp;
}

void reverse_str(char* str, unsigned pos)
{
    static int i = 0;
    if (*(str + pos) == '\0')
        return;
    reverse_str(str, pos + 1);
    if (i <= pos)
    {
        swap(&str[i], &str[pos]);
        i = i + 1;
    }
    return;
}

int main()
{
    char a[] = "Anita lava la tina";
    unsigned initial_position = 0;
    reverse_str(a, initial_position);
    return 0;
}