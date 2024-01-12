#ifndef SAVELOAD_HPP
#define SAVELOAD_HPP

#include <iostream>
#include <fstream>

//////////////////////////////////////
//Save the mapfile as new-"filename"//
//////////////////////////////////////
void savemap(unsigned char tempmapfile[],char name[],unsigned long int Buffer);

//////////////////
//Open a Mapfile//
//////////////////
bool openmap(FILE* &ptr, char *mapname, char *type);

/////////////////
//read a string//
/////////////////
void readstr(FILE *f, char *string);

#endif