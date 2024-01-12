#include "Random.hpp"
#include "Players.hpp"
#include "Texture.hpp"
#include "Consts.hpp"
#include "Heights.hpp"
#include "Objects.hpp"
#include "GeneralFunctions.hpp"
#include <iostream>

using namespace std;

void PlacePlayersRandomMap(unsigned char tempmapfile[],int tempmapparts[],int patches_x,int patches_y,int userseed,int player_count,int mapwidth,int mapheight,int border_size_x,int border_size_y,int patch_size_x,int patch_size_y)
{
	int players = player_count;
	int trys = 250;
	int row = 0;
	int id = 0;
	unsigned long int Block_size = mapwidth*mapheight;
	int map_parts = (patches_x*patches_y);
	unsigned long int swdrow = 0;
	unsigned long int swdid = 0;
	unsigned long int Block_pos = 0;
	//? ? ?
	//? P ? 
	//? ? ?
	//one of these ? should be mountain
	//1 2 3 
	//4 P 5
	//6 7 8
	//just to tell which of these I'm currently testing
	do
	{
		row = (Random(userseed,false)%patches_y);
		id = (Random(userseed,false)%patches_x);
		swdrow=((border_size_y/2)+row*patch_size_y)+(patch_size_y/2);
		swdid=(border_size_x/2)+(id*patch_size_x)+(patch_size_x/2);
		Block_pos = swdrow*mapwidth+swdid;
		if(GetBiomeType(tempmapparts,patches_x,patches_y,id,row) == B_MEADOW)
		{
			if(GetBiomeType(tempmapparts,patches_x,patches_y,id+1,row) == B_MOUNTAIN ||
				GetBiomeType(tempmapparts,patches_x,patches_y,id-1,row) == B_MOUNTAIN ||
				GetBiomeType(tempmapparts,patches_x,patches_y,id-patches_x,row-1) == B_MOUNTAIN ||
				GetBiomeType(tempmapparts,patches_x,patches_y,id-patches_x+1,row-1) == B_MOUNTAIN ||
				GetBiomeType(tempmapparts,patches_x,patches_y,id-patches_x-1,row-1) == B_MOUNTAIN ||
				GetBiomeType(tempmapparts,patches_x,patches_y,id+patches_x,row-1) == B_MOUNTAIN ||
				GetBiomeType(tempmapparts,patches_x,patches_y,id+patches_x+1,row-1) == B_MOUNTAIN ||
				GetBiomeType(tempmapparts,patches_x,patches_y,id+patches_x-1,row-1) == B_MOUNTAIN) //This makes a possible good player position
			{
				tempmapparts[id+row*patches_x] = B_PLAYER;
				ClearHexObjects(tempmapfile,Block_pos,Block_size,mapwidth,mapheight);
				ClearHexObjects(tempmapfile,Block_pos-mapwidth+1,Block_size,mapwidth,mapheight);
				ChangeHexHeight(tempmapfile,Block_pos,Block_size,mapwidth,mapheight);
				ChangeHexHeight(tempmapfile,Block_pos-mapwidth+1,Block_size,mapwidth,mapheight);
				PlacePlayer(tempmapfile,Block_size,Block_pos+1,(player_count-players),swdid+1,swdrow);
				players = players-1;
			}
		}
		trys = trys-1;
	}while(players > 0 && trys > 0);
}

//PlacePlayer
//task: Place a Player
void PlacePlayer(unsigned char tempmapfile[],unsigned long int Block_size, unsigned long int Block_pos, int player_number,int HQ_X,int HQ_Y)
{
	PlaceTree(tempmapfile,Block_pos,Block_size,player_number,0x80);
	//Sets information for number of players
	tempmapfile[35] = 1+player_number;
	tempmapfile[56+player_number*2] = HQ_X;
	tempmapfile[56+player_number*2+1] = 0x00;
	tempmapfile[70+player_number*2] = HQ_Y;
	tempmapfile[70+player_number*2+1] = 0x00;
}