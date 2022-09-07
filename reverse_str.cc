void reverse_str(char* src, char* dest[])
{
    if (*src)
    {
        reverse_str(src+1, dest);
        *(*dest) = *src;
        (*dest)++;
    }
}
 

int main()
{
    char a[20] = "Anita lava la tina";
    char a_reversed[20];
    reverse_str(a, );
    return 0;
}