#include <iostream>
#include "GeneralFunctions.hpp"
#include <stdio.h>
#include <iostream>
#include <fstream>
#include "Windows.h"
#include "Heights.hpp"
#include "Objects.hpp"
#include "Texture.hpp"
#include "SaveLoad.hpp"
#include "MirrorMap.hpp"
#include "Consts.hpp"
#include "Random.hpp"
#include "Animals.hpp"
#include "Players.hpp"
#include "BMP.hpp"

using namespace std;

//GetUserSeed
//task: Get the Userseed
unsigned long int GetUserSeed()
{
	unsigned long int seed = 0;
	do
	{
		cout << "Please enter a 8 digit random Number! or 0 to abort and use default." << endl;
		cout << "Number:";
		cin >> seed;
		cin.clear();
		fflush(stdin);
		cout << endl;
		seed = unsigned long int(seed);
	}while(seed <= 9999999 || seed > 99999999 && seed != 0);

	if (seed == 0)
		seed = 12345678;

	return seed;
}

//GetMapwidth
//task: Get the Mapwidth
int GetMapwidth(unsigned char tempmapfile[])
{
	//cout << "Wert bei 2349: " << hex << (int)tempmapfile[2349] << endl;
	//cout << "Wert bei 2348: " << (int)tempmapfile[2348] << endl;
	//int test = (int(tempmapfile[2349])) * 256 + (int(tempmapfile[2348]));
	//cout << dec << test << endl;
	int width = (int(tempmapfile[2349])) * 256 + (int(tempmapfile[2348]));
	return width; // (int(tempmapfile[2349])) * 256 + (int(tempmapfile[2348]));
}

//GetMapwidth
//task: Get the Mapheight
int GetMapheight(unsigned char tempmapfile[])
{
	//cout << "Wert bei 2351: " << hex << (int)tempmapfile[2351] << endl;
	//cout << "Wert bei 2350: " << (int)tempmapfile[2350] << dec << endl;
	//int test = (int(tempmapfile[2349])) * 256 + (int(tempmapfile[2348]));
	//cout << test << endl;
	int height = (int(tempmapfile[2351])) * 256 + (int(tempmapfile[2350]));
	return height; // (int(tempmapfile[2351])) * 256 + (int(tempmapfile[2350]));
}

//SizeWarning
//task: Show a warning if the mapsize is huge
void SizeWarning(int mapwidth,int mapheight)
{
	if(mapwidth >= 256 || mapheight >= 256)
	{
		cout << endl;
		cout << "Warning: This is a large map!" << endl;
		cout << "Some functions maybe need some time!" << endl;
		cout << "Please be patient..." << endl;
	}
}

void ShowTempmapparts(int tempmapparts[],int border_size_x,int border_size_y,int patches_x,int patches_y,int patch_size_x,int patch_size_y,int mapheight, int mapwidth)
{
	for(int row=0;row<((mapheight-border_size_y)/patch_size_y);row++)
			{
				for(int id=0;id<((mapwidth-border_size_x)/patch_size_x);id++)
				{
					cout << " " << tempmapparts[row*patches_x+id];
				}
				cout << endl;
			}
}

//GetBufferSize
//task: gets the buffersize of a file
unsigned long int GetBufferSize(FILE* file)
{
	unsigned long int Buffer = 0;
	fseek(file, 0, SEEK_END);			//to the end of the file
	Buffer = ftell(file);				//save as Buffer + 1
	fseek(file, 0, SEEK_SET);			//to the start of the file

	return Buffer;
}

//ShowPlaceObjectMenu
//task: Shows the Place Object Menu
void ShowPlaceObjectMenu()
{
	cout << "Spikes Object Editor Menu" << endl;
	cout << "-------------------------" << endl;
	cout << "00 - Back to the Main Menu" << endl;
	cout << "01 - Save the map to 'new-[Mapname]'" << endl;
	cout << "02 - add Waterstone" << endl;
	cout << "03 - add Small stone" << endl;
	cout << "04 - add Big stone" << endl;
	cout << "05 - add Bush" << endl;
	cout << "06 - add blue Bush" << endl;
	cout << "07 - add flat Bush" << endl;
	cout << "08 - add Snowman" << endl;
	cout << "09 - add sunken Ship" << endl;
	cout << "10 - add closed Gate" << endl;
	cout << "11 - add opened Gate" << endl;
	cout << "12 - add small Tent" << endl;
	cout << "13 - add Guardhouse" << endl;
	cout << "14 - add Watchtower" << endl;
	cout << "15 - add Fortress" << endl;
	cout << "16 - add voodoo doll" << endl;
	cout << "17 - view mapsize" << endl;
}

//ShowChangeAllHeightsMenu
//task: Shows the change all heights menu
void ShowChangeAllHeightsMenu()
{
	cout << "Which height do you want to set?" << endl;
	cout << "(Use any option ranging from 1 - 61)" << endl;
	cout << "--------------------------------" << endl;
	cout << "00 - Close Tool" << endl;
	cout << "01 - height -10 (0x00)" << endl;
	cout << "02...10" << endl;
	cout << "11 - height -00 (0x0A)" << endl;
	cout << "12...19" << endl;
	cout << "21 - height +10 (0x14)" << endl;
	cout << "22...29" << endl;
	cout << "31 - height +20 (0x1E)" << endl;
	cout << "32...39" << endl;
	cout << "41 - height +30 (0x28)" << endl;
	cout << "42...49" << endl;
	cout << "51 - height +40 (0x32)" << endl;
	cout << "52...59" << endl;
	cout << "61 - height +50 (0x3C)" << endl;
}


//GetOption
//task: Gets the option the user wants
int GetOption(){
	int option;

	cin >> option;
	cin.clear();
	fflush(stdin);

	return (int)(option);
}