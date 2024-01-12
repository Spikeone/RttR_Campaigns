#include <iostream>
#include "Consts.hpp"
#include "MirrorMap.hpp"

using namespace std;

//MirrorMapY
//task:Mirror objects,textures,heights,animals of the map
void MirrorMapY(unsigned char tempmapfile[],unsigned int mapwidth,unsigned int mapheight)
{
	unsigned long int Block_1_Pos = 0;	//Heights
	unsigned long int Block_2_Pos = 0;	//RSD
	unsigned long int Block_3_Pos = 0;	//RSU
	unsigned long int Block_5_Pos = 0;	//Objecttype
	unsigned long int Block_6_Pos = 0;	//Object
	unsigned long int Block_7_Pos = 0;	//Animal
	unsigned long int Block_12_Pos = 0;	//Resources

	for(unsigned long int i=0;i<mapheight;i++)
	{
		for(unsigned long int j=0;j<(mapwidth/2);j++)
		{
			//We need to change something that the direction of triangles wont stay / but \
			//this also means, that the row is +1 long and we need to place at position -1
			//And we have to check if the row is even or not
			if(i%2!=0) //If the row is even, everything is okay
			{
				Block_1_Pos = MAPHEADER + 1*BLOCKHEADER + 0*(mapwidth*mapheight)+(i*mapwidth);	//Added this for heights, hopefully everything still works
				Block_2_Pos = MAPHEADER + 2*BLOCKHEADER + 1*(mapwidth*mapheight)+(i*mapwidth);	//Mapheader+Blockheaders+Blocks + row
				Block_3_Pos = MAPHEADER + 3*BLOCKHEADER + 2*(mapwidth*mapheight)+(i*mapwidth);	//Well, Block3 pos is just one more mapwidth*mapheight
				Block_5_Pos = MAPHEADER + 5*BLOCKHEADER + 4*(mapwidth*mapheight)+(i*mapwidth);
				Block_6_Pos = MAPHEADER + 6*BLOCKHEADER + 5*(mapwidth*mapheight)+(i*mapwidth);
				Block_7_Pos = MAPHEADER + 7*BLOCKHEADER + 6*(mapwidth*mapheight)+(i*mapwidth);
				Block_12_Pos = MAPHEADER + 12*BLOCKHEADER + 11*(mapwidth*mapheight)+(i*mapwidth);

				tempmapfile[Block_1_Pos+mapwidth-j-1] = tempmapfile[Block_1_Pos+j];
				tempmapfile[Block_2_Pos+mapwidth-j-1] = tempmapfile[Block_2_Pos+j];
				tempmapfile[Block_3_Pos+mapwidth-j-2] = tempmapfile[Block_3_Pos+j]; //rsu is -2
				tempmapfile[Block_5_Pos+mapwidth-j-1] = tempmapfile[Block_5_Pos+j];
				tempmapfile[Block_6_Pos+mapwidth-j-1] = tempmapfile[Block_6_Pos+j];
				tempmapfile[Block_7_Pos+mapwidth-j-1] = tempmapfile[Block_7_Pos+j];
				tempmapfile[Block_12_Pos+mapwidth-j-1] = tempmapfile[Block_12_Pos+j];
			}
			else	//Well, if the row is uneven, we need to change the position of rsd triangles
			{
				Block_1_Pos = MAPHEADER + 1*BLOCKHEADER + 0*(mapwidth*mapheight)+(i*mapwidth);	//Added this for heights, hopefully everything still works
				Block_2_Pos = MAPHEADER + 2*BLOCKHEADER + 1*(mapwidth*mapheight)+(i*mapwidth);	//Mapheader+Blockheaders+Blocks + row
				Block_3_Pos = MAPHEADER + 3*BLOCKHEADER + 2*(mapwidth*mapheight)+(i*mapwidth);	//Well, Block3 pos is just one more mapwidth*mapheight
				Block_5_Pos = MAPHEADER + 5*BLOCKHEADER + 4*(mapwidth*mapheight)+(i*mapwidth);
				Block_6_Pos = MAPHEADER + 6*BLOCKHEADER + 5*(mapwidth*mapheight)+(i*mapwidth);
				Block_7_Pos = MAPHEADER + 7*BLOCKHEADER + 6*(mapwidth*mapheight)+(i*mapwidth);
				Block_12_Pos = MAPHEADER + 12*BLOCKHEADER + 11*(mapwidth*mapheight)+(i*mapwidth);

				tempmapfile[Block_1_Pos+mapwidth-j] = tempmapfile[Block_1_Pos+j];
				tempmapfile[Block_2_Pos+mapwidth-j] = tempmapfile[Block_2_Pos+j];
				tempmapfile[Block_3_Pos+mapwidth-j-1] = tempmapfile[Block_3_Pos+j]; //Rsd is -1
				tempmapfile[Block_5_Pos+mapwidth-j] = tempmapfile[Block_5_Pos+j];
				tempmapfile[Block_6_Pos+mapwidth-j] = tempmapfile[Block_6_Pos+j];
				tempmapfile[Block_7_Pos+mapwidth-j] = tempmapfile[Block_7_Pos+j];
				tempmapfile[Block_12_Pos+mapwidth-j] = tempmapfile[Block_12_Pos+j];
			}
		}
	}
	cout << "Map has been fully Y-Axis mirrored!" << endl;
	cout << endl;
}//MirrorMapX

void MirrorMapX(unsigned char tempmapfile[],unsigned int mapwidth,unsigned int mapheight)
{
	unsigned long int Block_Size = mapwidth*mapheight;
	unsigned long int Block_1_Pos = MAPHEADER + 1*BLOCKHEADER + 0*(Block_Size);	//Heights
	unsigned long int Block_2_Pos = MAPHEADER + 2*BLOCKHEADER + 1*(Block_Size);	//RSD
	unsigned long int Block_3_Pos = MAPHEADER + 3*BLOCKHEADER + 2*(Block_Size);	//RSU
	unsigned long int Block_5_Pos = MAPHEADER + 5*BLOCKHEADER + 4*(Block_Size);	//Objecttype
	unsigned long int Block_6_Pos = MAPHEADER + 6*BLOCKHEADER + 5*(Block_Size);	//Object
	unsigned long int Block_7_Pos = MAPHEADER + 7*BLOCKHEADER + 6*(Block_Size);	//Animal
	unsigned long int Block_12_Pos = MAPHEADER + 12*BLOCKHEADER + 11*(Block_Size);	//Resources

	for(unsigned long int i=1;i<(mapheight/2);i++)
	{
		for(unsigned long int j=0;j<mapwidth;j++)
		{
			//We need to change something that the direction of triangles wont stay / but \
			//this also means, that the row is +1 long and we need to place at position -1
			//And we have to check if the row is even or not
			if(i%2!=0) //If the row is even, everything is okay
			{
				tempmapfile[Block_3_Pos+(Block_Size)-((i+1)*mapwidth)+j] = tempmapfile[Block_2_Pos+(i*mapwidth)+j];
				tempmapfile[Block_2_Pos+(Block_Size)-((i+1)*mapwidth)+j+1] = tempmapfile[Block_3_Pos+(i*mapwidth)+j];
				tempmapfile[Block_1_Pos+(Block_Size)-((i+1)*mapwidth)+j+mapwidth] = tempmapfile[Block_1_Pos+(i*mapwidth)+j];
				tempmapfile[Block_5_Pos+(Block_Size)-((i+1)*mapwidth)+j+mapwidth] = tempmapfile[Block_5_Pos+(i*mapwidth)+j];
				tempmapfile[Block_6_Pos+(Block_Size)-((i+1)*mapwidth)+j+mapwidth] = tempmapfile[Block_6_Pos+(i*mapwidth)+j];
				tempmapfile[Block_7_Pos+(Block_Size)-((i+1)*mapwidth)+j+mapwidth] = tempmapfile[Block_7_Pos+(i*mapwidth)+j];
				tempmapfile[Block_12_Pos+(Block_Size)-((i+1)*mapwidth)+j+mapwidth] = tempmapfile[Block_12_Pos+(i*mapwidth)+j];
			}
			else	//Well, if the row is uneven, we need to change the position of rsd triangles
			{
				tempmapfile[Block_3_Pos+(Block_Size)-((i+1)*mapwidth)+j-1] = tempmapfile[Block_2_Pos+(i*mapwidth)+j];
				tempmapfile[Block_2_Pos+(Block_Size)-((i+1)*mapwidth)+j] = tempmapfile[Block_3_Pos+(i*mapwidth)+j]; //Rsd is -1
				tempmapfile[Block_1_Pos+(Block_Size)-((i+1)*mapwidth)+j+mapwidth] = tempmapfile[Block_1_Pos+(i*mapwidth)+j];
				tempmapfile[Block_5_Pos+(Block_Size)-((i+1)*mapwidth)+j+mapwidth] = tempmapfile[Block_5_Pos+(i*mapwidth)+j];
				tempmapfile[Block_6_Pos+(Block_Size)-((i+1)*mapwidth)+j+mapwidth] = tempmapfile[Block_6_Pos+(i*mapwidth)+j];
				tempmapfile[Block_7_Pos+(Block_Size)-((i+1)*mapwidth)+j+mapwidth] = tempmapfile[Block_7_Pos+(i*mapwidth)+j];
				tempmapfile[Block_12_Pos+(Block_Size)-((i+1)*mapwidth)+j+mapwidth] = tempmapfile[Block_12_Pos+(i*mapwidth)+j];
			}
		}
	}
	cout << "Map has been fully X-Axis mirrored!" << endl;
	cout << endl;
}

//RotateMap
//task:Rotate map 180°
void RotateMap(unsigned char tempmapfile[],unsigned char tempmapfileoriginal[],unsigned int mapwidth,unsigned int mapheight)
{
	unsigned long int Block_2_Pos = 0;
	unsigned long int Block_3_Pos = 0;
	for(unsigned long int i = 0; i<mapheight;i++)
	{
		for(unsigned long int j = 0; j<mapwidth;j++)
		{
			Block_2_Pos = MAPHEADER + 1*(mapwidth*mapheight) + 2*BLOCKHEADER;
			Block_3_Pos = MAPHEADER + 2*(mapwidth*mapheight) + 3*BLOCKHEADER;
			tempmapfile[Block_2_Pos+(mapwidth*mapheight)-i*mapheight-j] = tempmapfileoriginal[Block_3_Pos+i*mapheight+j];
			tempmapfile[Block_3_Pos+(mapwidth*mapheight)-i*mapheight-j] = tempmapfileoriginal[Block_2_Pos+i*mapheight+j];
		}
	}
}