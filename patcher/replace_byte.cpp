#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <sys/stat.h>

int Crack      (FILE* file);
int BeforeCrack(FILE* file);

int main()
{
    //struct stat buf = {};
    FILE* file = fopen("PASSWORD.COM", "r+b");
    if(file == NULL)
    {
        printf("cannot open file\n");
        return 0;
    }

    //stat("PASSWORD.COM", &buf);
    //printf("len: %d\n", buf.st_size);
    int offset = 80;
    //scanf("%d", &offset);
    fseek(file, offset, SEEK_SET);

    Crack(file);

    BeforeCrack(file);

    printf("-----success--------");
}

int Crack(FILE* file)
{
    assert(file);

    fprintf(file, "t");

    return 0;
}

int BeforeCrack(FILE* file)
{
    assert(file);

    fprintf(file, "u");

    return 0;
}
