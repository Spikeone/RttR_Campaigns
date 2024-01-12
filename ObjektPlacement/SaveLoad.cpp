#include <iostream>
#include <fstream>
#include "SaveLoad.hpp"

using namespace std;

//savemap
//task: save the mapfile
void savemap(unsigned char tempmapfile[],char name[] ,unsigned long int Buffer)
{
	std::fstream tempmapsave;
	char savestring[60] = "n\0";		//That I have a new-"openedfilename"
	strncat_s(savestring, name, 29);
	tempmapsave.open(savestring, std::ios_base::binary | std::ios_base::out);
	for(unsigned long int j=0;j<=Buffer-1;j++)
	{
		tempmapsave << tempmapfile[j];
	}
	tempmapsave.close();
	cout << endl;
	cout << "Map has been saved!" << endl;
	cout << "Name:" << savestring << endl;
	cout << endl;
}//savemap

//openmap
//task: opens a mapfile
bool openmap(FILE* &ptr,char *mapname, char *type)
{
	char entered[30];
	do
	{
		cout << "Please enter the " << type << " or 0 to abort." << endl;
		cout << "Filename: ";
		cin >> entered;								//Get the Mapname
		fopen_s(&ptr, entered, "rb");
		if (ptr == NULL && entered[0] != '0')				//If this file doesn't exist give the user a message
		{
			cout << "Unable to open File: " << entered << endl;
			cout << endl;
		}
	} while (ptr == NULL && entered[0] != '0');			//and do this until a valid file is opened

	if (ptr != NULL && entered[0] != '0')
	{
		cout << "Map has been loaded!" << endl;
		strcpy(mapname, entered);
		//entered = mapname;
		return true;
	}
	else
	{
		cout << "Loading file has been aborted!" << endl;
		//fclose(ptr);
		//ptr = NULL;
		return false;
	}

}

void readstr(FILE *f, char *string)
{
	do
	{
		fgets(string, 255, f);
	} while ((string[0] == '/') || (string[0] == '\n'));
	return;
}