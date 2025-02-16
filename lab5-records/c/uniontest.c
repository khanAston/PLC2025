#include <stdio.h>

typedef enum {JAN, FEB, MAR, APR, MAY, JUN, 
              JUL, AUG, SEP, OCT, NOV, DEC} Month;

typedef struct { int d; Month m; int y; }  DMYDate;

typedef struct { int d; int y; }  DYDate;

typedef union
{
    DMYDate dmyDate;
    DYDate dyDate;
} DateUnion;

typedef enum {DMY, DY} DateVariant;

typedef struct
{
    DateVariant variant;
    DateUnion content;
} Date;


Date someday1 = { DMY, { 1, JAN, 1901 }};
Date someday2 = { DY, { 111, 1901 }};
Date someday3 = { DMY, { 12, 1901 }}; // leaving one component unitialised



int main(int argc, char *argv[])
{
        
    printf("%d\n", someday3.content.dmyDate.y); // unsafe!!
    return 0;
}
