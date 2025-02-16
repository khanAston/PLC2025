#include <stdio.h>

typedef enum {JAN, FEB, MAR, APR, MAY, JUN, 
              JUL, AUG, SEP, OCT, NOV, DEC} Month;
typedef struct { int d; Month m; int y; }  Date;

/* Date someday = { 1, JAN, 1901 }; */
Date someday = {  1, 1901 };


int main(int argc, char *argv[])
{
    
    printf("year = %d\n", someday.y);
    return 0;
}
