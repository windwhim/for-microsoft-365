#include <stdio.h>
#include <stdlib.h>
#define N 100
int main()
{
    char a[N],b[N];
    int i=0;
    gets(a);
    gets(b);
    while(a[i]!='\0'&&b[i]!='\0')
        if(a[i]==b[i])
            i++;
        else
            break;
    if(a[i]=='\0'&&b[i]=='0')
        printf("��ȫ��ͬ");
    else
        printf("��%dλ��ͬ�����%d\n",i+1,a[i]-b[i]);
    return 0;

}
