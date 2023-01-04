#include <stdio.h>
#include <string.h>
#define N 100
int main()
{
    char a[N];
    while(1)
    {
        gets(a);
        if(strcmp(a,"password"))
        {
            printf("Error!");
            printf("\n");
        }
        else
            break;
    }
    printf("OK!");
    return 0;
}
