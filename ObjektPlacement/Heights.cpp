#include "Heights.hpp"
#include "Consts.hpp"
#include "Random.hpp"
#include "GeneralFunctions.hpp"
#include <iostream>
#include <Windows.h>
#include <stdio.h>

using namespace std;

#pragma comment (lib, "winmm.lib")

//setheight
//task: Set all heights of the map
void setallheights(unsigned char tempmapfile[],unsigned int mapheight,unsigned int mapwidth,unsigned char heightcode)
{
	unsigned long int Block_1_pos = 0;
	for(unsigned long int i=0;i<=(mapheight*mapwidth);i++)			//Need to Place the heights on every point of the Map
	{
		Block_1_pos = MAPHEADER + BLOCKHEADER + i;
		tempmapfile[Block_1_pos] = heightcode;
	}
}//setheight

//getHeight
//task: to get the height of the current position
unsigned char getRandomHeight(unsigned char tempmapfile[],int mapheight,int mapwidth,int row,int pos)
{
	int randomnumber = 0; //Thats where we will later have a random function
	unsigned char returnheight = 0x0A;	//If something wents wrong we will always return the default height
	int i = 0;		//thats also the max height
	bool testing = true;	//if we are still testing or already finished
	int maxheightdesert = 4; //There is a min/max height for every surface
	bool testing_left_x = true;
	bool testing_right_x = true;
	bool testing_up_y = true;
	bool testing_low_y = true;
	int left_x = 0;
	int right_x = 0;
	int up_y = 0;
	int low_y = 0;

	//Well I got the idea to get the textures in x direction and y direction
	//            Y
	//            Y
	// X X X X X pos X X X
	//            Y
	//Thats the example - position is the current position
	//Max X would be 3 (left we got 5, right is 3 => min X = 3)
	//Max Y would be 1 (down we got 1, up we got 2 => min Y = 1)
	//so the min height would be 1 because thats the lowest height.

	//random generator
	//srand(timeGetTime());
	

	//Well, get the texture
	switch(tempmapfile[MAPHEADER + 3*BLOCKHEADER + 2*(mapheight*mapwidth) +(row*mapwidth) + pos])
	{
		//if we got water
		//I think we should set the height to the default height
	case(0x05)://Normal water
	case(0x06)://Buildable water
	case(0x13)://unpassable water
		{
			//Todo:
			//Mountainlakes
			//Oasis
			returnheight = DEFAULTHEIGHT;	//So we just return height "0" which is 11, which is 0x0A
		}break;
		//if we got desert
		
		

	case(0x04)://default desert
	case(0x07)://an other desert
		{
			//I like to have low desert (also lower than the default height)
			//but if we are next to water this is maybe a beach
			while((row-i) >= 0 && i < mapheight && (pos-i) >= 0 && i < mapwidth && testing == true)
			//I think I should maybe explain what I'm doing here
			//first of all I have to check if im with my current position still in the y-row
			//this means row-i should be > 0 and i shouldnt be more than the mapheight
			//and also if the x-row is still the right
			//This means pos-i should be more than 0 and i should be less than mapwdith
			//NOTE: This excludes maps which are designed over the mapsides
			{
				
				if(		tempmapfile[MAPHEADER + 3*BLOCKHEADER + 2*(mapheight*mapwidth) + row*mapwidth + pos-i] == 0x04 ||			tempmapfile[MAPHEADER + 3*BLOCKHEADER + 2*(mapheight*mapwidth) + row*mapwidth + pos-i] == 0x07	//If the previous position is 0x07 or 0x04
					&&	tempmapfile[MAPHEADER + 3*BLOCKHEADER + 2*(mapheight*mapwidth) + row*mapwidth + pos+i] == 0x04 ||			tempmapfile[MAPHEADER + 3*BLOCKHEADER + 2*(mapheight*mapwidth) + row*mapwidth + pos+i] == 0x07	//if the next position is 0x07 or 0x04
					&&	tempmapfile[MAPHEADER + 3*BLOCKHEADER + 2*(mapheight*mapwidth) + row*mapwidth + pos+(i*mapwidth)] == 0x04 ||tempmapfile[MAPHEADER + 3*BLOCKHEADER + 2*(mapheight*mapwidth) + row*mapwidth + pos+(i*mapwidth)] == 0x07 //if in y direction the position is 0x07 or 0x04
					&&	tempmapfile[MAPHEADER + 3*BLOCKHEADER + 2*(mapheight*mapwidth) + row*mapwidth + pos-(i*mapwidth)] == 0x04 ||tempmapfile[MAPHEADER + 3*BLOCKHEADER + 2*(mapheight*mapwidth) + row*mapwidth + pos-(i*mapwidth)] == 0x07)
				{
					i++;
				}
				else
				{
					testing = false;
				}
			}

			if(i > maxheightdesert)
			{
				i = maxheightdesert;
			}
			returnheight = unsigned char(DEFAULTHEIGHT - i + randomnumber); //The defaultheight is 10 which equals our "0", than we add i to get the new possible hight and the random height change (which should be -2 to +2 for desert)
		}break;		
	default:
		{
			//cout << "Unknown Texture, something went wrong!" << endl;
		}break;
	}

	return returnheight;
}//getHeight

//setHeight
//task: setting a height by position and heightinformation
void setHeight(unsigned char tempmapfile[],unsigned char height,int mapheight,int mapwidth,int row, int pos)
{
	unsigned long int Block_1_pos = MAPHEADER + BLOCKHEADER +row*mapwidth+pos;
	tempmapfile[Block_1_pos] = height;
}//setHeight

//SetHeight
//task: setting a height by Block_pos
void SetHeight(unsigned char tempmapfile[],unsigned char height,unsigned long int Block_pos)
{
	unsigned long int Block_1_pos = MAPHEADER + BLOCKHEADER + Block_pos;
	tempmapfile[Block_1_pos] = height;
}//setHeight

//GetHeight
//task: Get the Height of a position
unsigned char GetHeight(unsigned char tempmapfile[],unsigned long int Block_pos,unsigned long int Block_size)
{
	return tempmapfile[MAPHEADER + BLOCKHEADER + Block_pos];
}//GetHeight

//getHeight
//task: get height by coordinates


//ChangeHexHeight
//task: change the heights in a hexagon
void ChangeHexHeight(unsigned char tempmapfile[],unsigned long int Block_pos,unsigned long int Block_size,int mapwidth,int mapheight)
{
	unsigned char mid_height = GetHeight(tempmapfile,Block_pos,Block_size);
	SetHeight(tempmapfile,mid_height,Block_pos);
	SetHeight(tempmapfile,mid_height,Block_pos-1);
	SetHeight(tempmapfile,mid_height,Block_pos+2);
	if((int(Block_size/mapwidth))%2 == 0)
	{
		SetHeight(tempmapfile,mid_height,Block_pos-mapwidth);
		SetHeight(tempmapfile,mid_height,Block_pos-mapwidth+1);
		SetHeight(tempmapfile,mid_height,Block_pos+mapwidth);
		SetHeight(tempmapfile,mid_height,Block_pos+mapwidth+1);
		SetHeight(tempmapfile,mid_height,Block_pos+mapwidth-1);
	}
	else
	{
		SetHeight(tempmapfile,mid_height,Block_pos-mapwidth+1);
		SetHeight(tempmapfile,mid_height,Block_pos-mapwidth+2);
		SetHeight(tempmapfile,mid_height,Block_pos+mapwidth);
		SetHeight(tempmapfile,mid_height,Block_pos+mapwidth+1);
		SetHeight(tempmapfile,mid_height,Block_pos+mapwidth-1);
	}
}

//RandomAllHeights
//task:set Random heights for the whole map (doesn't matter if water, desert, mountain, water will be ignored)
unsigned char RandomAllHeights(unsigned char tempmapfile[],int mapheight, int mapwidth,int row, int pos, int userseed)
{
	unsigned char ret_height;
	int random;
	unsigned long int MapID = MAPHEADER + 2 * BLOCKHEADER + 1 * (mapheight*mapwidth) + (row*mapwidth) + pos;

	switch(tempmapfile[MapID])
	{
		//Need to ignore water
	case(0x05)://Normal water
	case(0x06)://Buildable water
	case(0x13)://unpassable water
		{
			ret_height = DEFAULTHEIGHT;
		}break;
	case(MOUNTAIN):
	case(MOUNTAIN2):
	case(MOUNTAIN3):
	case(MOUNTAIN4):
	case(MMEADOW):
	case(LAVA):
		{
			random = (Random(userseed,false)%RANDOMRANGE);
			ret_height = unsigned char(DEFAULTHEIGHT+random);

		}break;
	default:
		{
			//Need to ignore Water if it's block 3 water
			if(		tempmapfile[MAPHEADER + 3*BLOCKHEADER + 2*(mapheight*mapwidth) +(row*mapwidth) + pos] == 0x05
				||	tempmapfile[MAPHEADER + 3*BLOCKHEADER + 2*(mapheight*mapwidth) +(row*mapwidth) + pos] == 0x06
				||	tempmapfile[MAPHEADER + 3*BLOCKHEADER + 2*(mapheight*mapwidth) +(row*mapwidth) + pos] == 0x13)
			{
				//This means we maybe don't have at our current position only water but we got border water
				ret_height = DEFAULTHEIGHT;
			}
			else
			{
				random = (Random(userseed,false)%RANDOMRANGE);	//Gives an random number to set a height from 0-3
				//Now we are sure that we really don't bother water
				ret_height = unsigned char(DEFAULTHEIGHT + random); //now we got a height range from 10-13,hopefully
			}
		}break;
	}
	return ret_height;
}

//IronMap
//task: Change all bad heights
void IronMap(unsigned char tempmapfile[],int mapheight,int mapwidth)
{
	unsigned long int Block_size = mapwidth*mapheight;
	unsigned long int Block_pos = 0;
	int current_height;
	for(Block_pos=0;Block_pos<Block_size;Block_pos++)
	{
		//Which positions do I need to check?
		// 1 2
		//3 X 4
		// 5 6
		//x will be the current height
		current_height = GetHeight(tempmapfile,Block_pos,Block_size);
		//if(Block_pos >=
	}
}

//FetchHeightMap
//task: apply a heightmap
void FetchHeightMap(unsigned char tempmapfile[], unsigned char tempbmpfile[], unsigned long int Bufferbmp){
	int mapwidth = GetMapwidth(tempmapfile);
	int mapheight = GetMapheight(tempmapfile);
	cout << " " << mapwidth << endl;
	cout << " " << mapheight << endl;

	int lastheight = 0;
	int Problems = 0;

	int row = 0;
	int id = 0;

	int modulation = 4;
	bool help = true;
	int heightmodulation = 0;

	int BmpHeaderSize = 0;
	BmpHeaderSize = Bufferbmp - mapheight * mapwidth;

	cout << " " << BmpHeaderSize << endl;

	cout << "Are you using black (0x00) as default height(10)? (1 = yes, else = no)" << endl;
	if (GetOption() == 1){
		heightmodulation = DEFAULTHEIGHT;
	}

	//lastheight = (tempbmpfile[1078 + (mapheight - 1)*mapwidth + 0] / modulation) + heightmodulation; //sets the first height as last height
	lastheight = (tempbmpfile[BmpHeaderSize + (mapheight - 1)*mapwidth + 0] / modulation) + heightmodulation; //sets the first height as last height

	for (row = (mapheight); row > 0; row--)		//Start in the last row (There are the first information)
	{
		for (id = 0; id<(mapwidth); id++)		//Number of elements per row
		{
			//int heightinfo = (tempbmpfile[1078 + (row - 1)*mapwidth + id] / modulation) + heightmodulation; //hopefully this gives the right height back :D
			int heightinfo = (tempbmpfile[BmpHeaderSize + (row - 1)*mapwidth + id] / modulation) + heightmodulation; //hopefully this gives the right height back :D

			if ((heightinfo - lastheight) > 5 || (heightinfo - lastheight) < -5)
			{
				cout << "Warning: Extreme heights detected" << endl;
				cout << "Row: " << mapheight - row << endl;
				cout << "ID: " << id << endl;
				cout << "Difference: " << (heightinfo - lastheight) << endl;
				if (help == true){
					cout << "Maybe I could help you, should I? (1 = yes, else = no)" << endl;
					if (GetOption() == 1){
						cout << "I would also restart the task for you." << endl;
						cout << "(Your heightmap has extreme heights which are not working in SettlersII)" << endl;
						modulation++;
						row = mapheight;
						id = 0;
						//lastheight = (tempbmpfile[1078 + (mapheight - 1)*mapwidth + 0] / modulation) + heightmodulation;
						lastheight = (tempbmpfile[BmpHeaderSize + (mapheight - 1)*mapwidth + 0] / modulation) + heightmodulation;
						Problems = 0;
					}
					else{
						help = false;
					}
				}
				Problems++;
			}

			if (heightinfo > HEIGHT_MAX) //well yes, lets use /4...
			{
				heightinfo = HEIGHT_MAX; //To make sure nobody sets impossible heights... maybe I should use heightinfo/4 which means 255/4 which is nearly 62
				cout << "Warning: Changed height information!" << endl;
			}
			lastheight = heightinfo;
			setHeight(tempmapfile, heightinfo, mapheight, mapwidth, mapheight - row, id); // changing row to mapheight-(row+1) should make the trick... :D
		}
	}
	if (Problems > 0)
		cout << "You got 99 Problems, but the Converter found " << Problems << ". Get your shit together!" << endl;


}