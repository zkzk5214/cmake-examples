#include "static/Hello.h"
/*
Using this method means that there is less chance of header 
    filename clashes when you use multiple libraries in 
    your project.
*/
int main(int argc, char *argv[])
{
    Hello hi;
    hi.print();
    return 0;
}
