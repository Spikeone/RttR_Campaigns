#include <iostream>
#include "Texture.hpp"
#include "Consts.hpp"
#include "Random.hpp"
//#include "Struct.hpp"

using namespace std;

//texture
//task: set the texture
void texture(unsigned char texture,int mapheight,int mapwidth, unsigned char tempmapfile[],int swdID,int row)
{
	//unsigned long int Block_2_pos = 0;
	unsigned long int Block_2_pos = 2352+(1*(mapheight*mapwidth))+(2*16)+swdID;	//Position in Block 2 (RSD Triangles)
	//unsigned long int Block_3_pos = 0;	//Position in Block 3 (RSU Trianbles)
	unsigned long int Block_3_pos = 2352+(2*(mapheight*mapwidth))+(3*16)+swdID;
	{
		if((row%2) == 0)	//Check if its an even row
		{
			//Six Triangles make a hexagon
			//Set Block 2, RSD Triangles (RightSideDown)
			//Block_2_pos = 2352+(1*(mapheight*mapwidth))+(2*16)+swdID;	//Mapheader + number of blocks*blocksize + number of blockheaders + elementID
			if(row != 0) //Now I will add the check for the row to not destroy the mapheader
			{
				tempmapfile[Block_2_pos-mapwidth] = texture;				
				tempmapfile[Block_2_pos-mapwidth+1] = texture;
				tempmapfile[Block_2_pos+1] = texture;

				//And Block 3, RSU Triangles (RightSideUp)
				//Block_3_pos = 2352+(2*(mapheight*mapwidth))+(3*16)+swdID;	//Mapheader + number of blocks*blocksize + number of blockheaders + elementID
				tempmapfile[Block_3_pos-mapwidth] = texture;
				tempmapfile[Block_3_pos+1] = texture;
				tempmapfile[Block_3_pos] = texture;
			}
			else 
			{
				//okay, we were in the wrong line now
				//so we got to jump to the end of our mapfile
				Block_2_pos = 2352+(2*(mapheight*mapwidth))+(2*16)+swdID-mapwidth; //Hopefully this works
				Block_3_pos = 2352+(3*(mapheight*mapwidth))+(3*16)+swdID-mapwidth; //Hopefully this works

				tempmapfile[Block_2_pos-mapwidth] = texture;				
				tempmapfile[Block_2_pos-mapwidth+1] = texture;
				tempmapfile[Block_2_pos+1] = texture;

				tempmapfile[Block_3_pos-mapwidth] = texture;
				tempmapfile[Block_3_pos+1] = texture;
				tempmapfile[Block_3_pos] = texture;

			}
		}
		else		//if its not an even row, so it will be uneven
		{
			if(row != 0) //to not destroy the mapheader
			{
				//Block_2_pos = 2352+(1*(mapheight*mapwidth))+(2*16)+swdID;	//Mapheader + number of blocks*blocksize + number of blockheaders + elementID
				tempmapfile[Block_2_pos-mapwidth+1] = texture;
				tempmapfile[Block_2_pos-mapwidth+2] = texture;
				tempmapfile[Block_2_pos+1] = texture;

				//And Block 3, RSU Triangles
				//Block_3_pos = 2352+(2*(mapheight*mapwidth))+(3*16)+swdID;	//Mapheader + number of blocks*blocksize + number of blockheaders + elementID
				tempmapfile[Block_3_pos-mapwidth+1] = texture;
				tempmapfile[Block_3_pos] = texture;
				tempmapfile[Block_3_pos+1] = texture;
			}
			else
			{
				//okay, we were in the wrong line now
				//so we got to jump to the end of our mapfile
				Block_2_pos = 2352+(2*(mapheight*mapwidth))+(2*16)+swdID-mapwidth; //Hopefully this works
				Block_3_pos = 2352+(3*(mapheight*mapwidth))+(3*16)+swdID-mapwidth; //Hopefully this works

				tempmapfile[Block_2_pos-mapwidth+1] = texture;
				tempmapfile[Block_2_pos-mapwidth+2] = texture;
				tempmapfile[Block_2_pos+1] = texture;

				tempmapfile[Block_3_pos-mapwidth+1] = texture;
				tempmapfile[Block_3_pos] = texture;
				tempmapfile[Block_3_pos+1] = texture;
			}
		}
	}
}

//PlacePatches
//task: translate patches into texture
void PlacePatches(unsigned char tempmapfile[],int tempmapparts[],int row,int id,MapOptions Options)
{
	int swdrow; //The row in the swd file
	int swdid; //The id in the row of the swd file
	int currentinfo = tempmapparts[(row*Options.patches_x)+id];
	int texid; //randomize the textures if needed
	int count = 0; //some extra spots maybe
	int i;
	int special_dots = ((Options.patch_size_x/2 + Options.patch_size_y/2)/2); //well, I thought the best would be adding 1/2 of the dot sizes, but I want to make sure both sides are regarded
	int range_y = (Options.patch_size_y/4); //range for differences
	int range_x = (Options.patch_size_x/4);

	switch(currentinfo)
	{

	case(B_DESERT): //so we would have desert
	{
		BiomeGeneratorDesert(Options,tempmapfile,row,id);
	}break;

	case(B_DEADLANDS): //That would make deadlands
	{
		BiomeGeneratorDeadlands(Options, tempmapfile, row, id);
	
		/*for(swdrow=((Options.border_size_y/2)+row*Options.patch_size_y); swdrow<(((Options.border_size_y/2)+((row+1)*Options.patch_size_y)));swdrow++) //border_size_y/2 => gives the upper/lower border
		{
			for(swdid=((swdrow*Options.mapwidth)+((Options.border_size_x/2)+id*Options.patch_size_x)); swdid < ((swdrow*Options.mapwidth)+((Options.border_size_x/2)+(id+1)*Options.patch_size_x));swdid++)
			{
				//randomize everything, 3 types of texture
				texid=(Random(Options.userseed,false)%3);
				if(texid == 0)//savanna
				{
					texture(0x00,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
				}
				else if(texid == 1)
				{
					texture(0x0E,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
				}
				else
				{
					texture(0x04,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
				}
			}
		}*/
	}break;
	case(B_OASIS): //That would make oasis
	{
		for(swdrow=((Options.border_size_y/2)+row*Options.patch_size_y); swdrow<(((Options.border_size_y/2)+((row+1)*Options.patch_size_y)));swdrow++) //border_size_y/2 => gives the upper/lower border
		{
			for(swdid=((swdrow*Options.mapwidth)+((Options.border_size_x/2)+id*Options.patch_size_x)); swdid < ((swdrow*Options.mapwidth)+((Options.border_size_x/2)+(id+1)*Options.patch_size_x));swdid++)
				{
					texture(0x04,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
				}
			}
		count = (Random(Options.userseed,false)%special_dots);	//Allows 0-29 "special dots"
		for(i=0;i<count;i++)
		{
			int add_dot = (Random(Options.userseed,false)%3); //3 types of terrain
			//first of all the middle of patch
			swdrow=((Options.border_size_y/2)+row*Options.patch_size_y)+(Options.patch_size_y/2)-1-(int (range_y/2))+(Random(Options.userseed,false)%range_y); //-1 to correct the position, -2 to take 1/2 of random numbers away and add random number 0,1,2,3,4
			swdid=(swdrow*Options.mapwidth)+(Options.border_size_x/2)+(id*Options.patch_size_x)+(Options.patch_size_x/2)-1-(int (range_x/2))+(Random(Options.userseed,false)%range_x);
			if(add_dot == 1) //place water
			{
				texture(0x0E,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
			}
			else if(add_dot == 2)//place steppe
			{
				texture(0x0E,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
			}
			else //place savanna
			{
				texture(0x00,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
			}
		}
		swdrow=((Options.border_size_y/2)+row*Options.patch_size_y)+(Options.patch_size_y/2)-1;
		swdid=(swdrow*Options.mapwidth)+(Options.border_size_x/2)+(id*Options.patch_size_x)+(Options.patch_size_x/2)-2;
		texture(WATER,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
	}break;
	case(B_MEADOW): //That would make meadow
	{

		for(swdrow=((Options.border_size_y/2)+row*Options.patch_size_y); swdrow<(((Options.border_size_y/2)+((row+1)*Options.patch_size_y)));swdrow++) //border_size_y/2 => gives the upper/lower border
		{
			for(swdid=((swdrow*Options.mapwidth)+((Options.border_size_x/2)+id*Options.patch_size_x)); swdid < ((swdrow*Options.mapwidth)+((Options.border_size_x/2)+(id+1)*Options.patch_size_x));swdid++)
			{
				//randomize everything, 4 types of texture
				texid=(Random(Options.userseed,false)%4);
				if(texid == 0)
				{
					texture(0x08,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
				}
				else if(texid == 1)
				{
					texture(0x09,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
				}
				else if(texid == 2)
				{
					texture(0x0A,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
				}
				else
				{
					texture(0x0F,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
				}
			}
		}
	}break;
	case(B_MOUNTAIN): //that would make mountain
	{
	for(swdrow=((Options.border_size_y/2)+row*Options.patch_size_y); swdrow<(((Options.border_size_y/2)+((row+1)*Options.patch_size_y)));swdrow++) //border_size_y/2 => gives the upper/lower border
		{
			for(swdid=((swdrow*Options.mapwidth)+((Options.border_size_x/2)+id*Options.patch_size_x)); swdid < ((swdrow*Options.mapwidth)+((Options.border_size_x/2)+(id+1)*Options.patch_size_x));swdid++)
			{
				//randomize everything, 4 types of texture
				texid=(Random(Options.userseed,false)%4);
				if(texid == 0)
				{
					texture(0x01,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
				}
				else if(texid == 1)
				{
					texture(0x0B,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
				}
				else if(texid == 2)
				{
					texture(0x0C,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
				}
				else
				{
					texture(0x0D,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
				}
			}
		}

		//Randomize additional patches

		count = (Random(Options.userseed,false)%special_dots);	//Allows 0-3 "special dots" (mountain meadow and snow)
		for(i=0;i<count;i++)
		{
			//first of all the middle of patch
			//swdrow=(border_size/2)+(patch_size/2)+(row*patch_size)-1-2+(Random(userseed,false)%5); //-1 to correct the position, -2 to take 1/2 of random numbers away and add random number 0,1,2,3,4
			//swdid=(swdrow*mapwidth)+(border_size/2)+(id*patch_size)+(patch_size/2)-1-2+(Random(userseed,false)%5);

			swdrow=((Options.border_size_y/2)+row*Options.patch_size_y)+(Options.patch_size_y/2)-1-(int (range_y/2))+(Random(Options.userseed,false)%range_y); //-1 to correct the position, -2 to take 1/2 of random numbers away and add random number 0,1,2,3,4
			swdid=(swdrow*Options.mapwidth)+(Options.border_size_x/2)+(id*Options.patch_size_x)+(Options.patch_size_x/2)-1-(int (range_x/2))+(Random(Options.userseed,false)%range_x);
			if((Random(Options.userseed,false)%3)) //two types of texture,but I want more
			{
				texture(0x12,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
			}
			else //place mountain meadow
			{
				texture(0x02,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
			}
		}
	}break;
	case(B_VULCANO): //that would make vulcano
	{
	for(swdrow=((Options.border_size_y/2)+row*Options.patch_size_y); swdrow<(((Options.border_size_y/2)+((row+1)*Options.patch_size_y)));swdrow++) //border_size_y/2 => gives the upper/lower border
		{
			for(swdid=((swdrow*Options.mapwidth)+((Options.border_size_x/2)+id*Options.patch_size_x)); swdid < ((swdrow*Options.mapwidth)+((Options.border_size_x/2)+(id+1)*Options.patch_size_x));swdid++)
			{
				//randomize everything, 4 types of texture
				texid=(Random(Options.userseed,false)%4);
				if(texid == 0)
				{
					texture(0x01,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
				}
				else if(texid == 1)
				{
					texture(0x0B,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
				}
				else if(texid == 2)
				{
					texture(0x0C,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
				}
				else
				{
					texture(0x0D,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
				}
			}
		}
		//Randomize additional patches

		count = (Random(Options.userseed,false)%special_dots);	//Allows 0-5 "special dots" (mountain meadow and snow)
		for(i=0;i<count;i++)
		{
			//first of all the middle of patch
			//swdrow=(border_size/2)+(patch_size/2)+(row*patch_size)-1-1+(Random(userseed,false)%3); //-1 to correct the position, -1 to take 1/2 of random numbers away and add random number 0,1,2
			//swdid=(swdrow*mapwidth)+(border_size/2)+(id*patch_size)+(patch_size/2)-1-1+(Random(userseed,false)%2);
			swdrow=((Options.border_size_y/2)+row*Options.patch_size_y)+(Options.patch_size_y/2)-1-(int (range_y/2))+(Random(Options.userseed,false)%range_y); //-1 to correct the position, -2 to take 1/2 of random numbers away and add random number 0,1,2,3,4
			swdid=(swdrow*Options.mapwidth)+(Options.border_size_x/2)+(id*Options.patch_size_x)+(Options.patch_size_x/2)-1-(int (range_x/2))+(Random(Options.userseed,false)%range_x);
			texture(0x10,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
		}
	}break;
	case(B_SWAMP): //that would make swamp
	{
		for(swdrow=((Options.border_size_y/2)+row*Options.patch_size_y); swdrow<(((Options.border_size_y/2)+((row+1)*Options.patch_size_y)));swdrow++) //border_size_y/2 => gives the upper/lower border
		{
			for(swdid=((swdrow*Options.mapwidth)+((Options.border_size_x/2)+id*Options.patch_size_x)); swdid < ((swdrow*Options.mapwidth)+((Options.border_size_x/2)+(id+1)*Options.patch_size_x));swdid++)
			{
				//randomize everything, 2 types of texture, meadow, swamp
				texid=(Random(Options.userseed,false)%2);
				if(texid == 0)
				{
					texture(0x03,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
				}
				else
				{
					texture(0x08,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
				}
			}
		}
	}break;
	case(B_ISLANDS):
	{
		for(swdrow=((Options.border_size_y/2)+row*Options.patch_size_y); swdrow<(((Options.border_size_y/2)+((row+1)*Options.patch_size_y)));swdrow++) //border_size_y/2 => gives the upper/lower border
		{
			for(swdid=((swdrow*Options.mapwidth)+((Options.border_size_x/2)+id*Options.patch_size_x)); swdid < ((swdrow*Options.mapwidth)+((Options.border_size_x/2)+(id+1)*Options.patch_size_x));swdid++)
				{
					texture(0x05,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
				}
			}

		//Randomize things
		count = (Random(Options.userseed,false)%special_dots);	//Allows 0-3 "special dots" (mountain meadow and snow)
		for(i=0;i<count;i++)
		{
			//looked really strange with just some islands
			//first of all the middle of patch
			//swdrow=(border_size/2)+(patch_size/2)+(row*patch_size)-1-2+(Random(userseed,false)%5); //-1 to correct the position, -2 to take 1/2 of random numbers away and add random number 0,1,2,3,4
			//swdid=(swdrow*Options.mapwidth)+(border_size/2)+(id*patch_size)+(patch_size/2)-1-2+(Random(userseed,false)%5);
			swdrow=((Options.border_size_y/2)+row*Options.patch_size_y)+(Options.patch_size_y/2)-1-(int (range_y/2))+(Random(Options.userseed,false)%range_y); //-1 to correct the position, -2 to take 1/2 of random numbers away and add random number 0,1,2,3,4
			swdid=(swdrow*Options.mapwidth)+(Options.border_size_x/2)+(id*Options.patch_size_x)+(Options.patch_size_x/2)-1-(int (range_x/2))+(Random(Options.userseed,false)%range_x);
			texture(0x04,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
		}
	}break;
	default: //and only water is left and player positions
	{
		//just do nothing :-)
	}break;
	}
}

//GetBasicTexture
//task: Get the Basic information about the texture
unsigned char GetBasicTexture(unsigned char tempmapfile[],unsigned long int Block_pos,unsigned long int Block_size)
{
	unsigned char ret_tex;
	unsigned char texture = tempmapfile[MAPHEADER+2*BLOCKHEADER+1*Block_size+Block_pos];
		//First of all we need to check which texture we got
		switch(texture)
		//switch(tempmapfile[MAPHEADER+2*BLOCKHEADER+1*Block_size+Block_pos])
		{
		case(WATER):
		case(BWATER):
		case(UWATER):
			{
				ret_tex = WATER;
				//return WATER;
			}break;
		case(MOUNTAIN):
		case(MOUNTAIN2):
		case(MOUNTAIN3):
		case(MOUNTAIN4):
		case(BMOUNTAIN):
			{
				ret_tex = MOUNTAIN;
				//return MOUNTAIN;
			}break;
		case(SAVANNAH):
		case(DESERT):
		case(DESERT2):
		case(STEPPE):
			{
				ret_tex = SAVANNAH;
				//return SAVANNAH;
			}break;
		case(SNOW):
			{
				ret_tex = SNOW;
				//return SNOW;
			}break;
		case(SWAMP):
			{
				ret_tex = SWAMP;
				//return SWAMP;
			}break;
		case(MEADOW):
		case(MEADOW2):
		case(MEADOW3):
		case(FMEADOW):
			{
				ret_tex = MEADOW;
				//return MEADOW;
			}break;
		case(LAVA):
		case(LAVA2):
		case(LAVA3):
		case(LAVA4):
			{
				ret_tex = LAVA;
				//return LAVA;
			}break;
		case(MMEADOW):
			{
				ret_tex = MMEADOW;
				//return MMEADOW;
			}break;
		//The Program told sometimes, that something went wrong whn there was a harbour
		case(SAVANNAH+HARBOUR):
		case(STEPPE+HARBOUR):
		case(BMOUNTAIN+HARBOUR):
		case(MEADOW+HARBOUR):
		case(MEADOW2+HARBOUR):
		case(MEADOW3+HARBOUR):
		case(FMEADOW+HARBOUR):
		case(MMEADOW+HARBOUR):
			{
				//I think MAGENTA resulted in doing nothing
				ret_tex = MAGENTA;
			}break;
		default:
			{
				//Well, if something went terrible wrong I should give an output what my program read.
				ret_tex = MAGENTA;
				cout << "Warning: Some map information couldn't be read!" << endl;
				cout << "Block2,Position:" << Block_pos << endl;
				printf("Information: %X",tempmapfile[Block_pos]);
				cout << endl;
			}break;
		}
		return ret_tex;
}

//Generators
//First of all for Desert
void BiomeGeneratorDesert(MapOptions Options,unsigned char tempmapfile[],unsigned int row,unsigned int id)
{
	unsigned long int swdid;
	unsigned long int swdrow;
	for(swdrow=((Options.border_size_y/2)+row*Options.patch_size_y); swdrow<(((Options.border_size_y/2)+((row+1)*Options.patch_size_y)));swdrow++) //border_size_y/2 => gives the upper/lower border
		{
			for(swdid=((swdrow*Options.mapwidth)+((Options.border_size_x/2)+id*Options.patch_size_x)); swdid < ((swdrow*Options.mapwidth)+((Options.border_size_x/2)+(id+1)*Options.patch_size_x));swdid++)
			{
				texture(DESERT,Options.mapheight,Options.mapwidth,tempmapfile,swdid,swdrow);
			}
		}
}

//Second is Deadlands
void BiomeGeneratorDeadlands(MapOptions Options, unsigned char tempmapfile[], unsigned int row, unsigned int id){
	unsigned long int swdid;
	unsigned long int swdrow;
	int texid = 0;
	for (swdrow = ((Options.border_size_y / 2) + row*Options.patch_size_y); swdrow<(((Options.border_size_y / 2) + ((row + 1)*Options.patch_size_y))); swdrow++) //border_size_y/2 => gives the upper/lower border
	{
		for (swdid = ((swdrow*Options.mapwidth) + ((Options.border_size_x / 2) + id*Options.patch_size_x)); swdid < ((swdrow*Options.mapwidth) + ((Options.border_size_x / 2) + (id + 1)*Options.patch_size_x)); swdid++)
		{
			//randomize everything, 3 types of texture
			texid = (Random(Options.userseed, false) % 3);
			if (texid == 0)//savanna
			{
				texture(0x00, Options.mapheight, Options.mapwidth, tempmapfile, swdid, swdrow);
			}
			else if (texid == 1)
			{
				texture(0x0E, Options.mapheight, Options.mapwidth, tempmapfile, swdid, swdrow);
			}
			else
			{
				texture(0x04, Options.mapheight, Options.mapwidth, tempmapfile, swdid, swdrow);
			}
		}
	}
}

//setHEXAGONByID
//task: Place a hexagon at the given ID
void setHEXAGONByID(unsigned char tempmapfile[], unsigned long int id, unsigned long int mapwidth, unsigned long int mapheight, unsigned char texture)
{	
	unsigned long int Block_2 = 0;
	unsigned long int Block_3 = 0;
	Block_2 = 2 * BLOCKHEADER + MAPHEADER + 1 * mapwidth*mapheight;
	Block_3 = 3 * BLOCKHEADER + MAPHEADER + 2 * mapwidth*mapheight;

	//check for even or not even row
	if (id >= mapwidth && id <= mapwidth*mapheight - mapwidth)
	{
		if (((int(id / mapwidth)) % 2) != 0 )			//uneven row
		{
			tempmapfile[Block_2+id - 2*mapwidth -1] = texture;
			tempmapfile[Block_2+id - 2*mapwidth] = texture;
			tempmapfile[Block_2+id - mapwidth] = texture;

			tempmapfile[Block_3+id - 2*mapwidth - 1] = texture;
			tempmapfile[Block_3+id - mapwidth] = texture;
			tempmapfile[Block_3+id - mapwidth - 1] = texture;
		}
		else
		{
			tempmapfile[Block_2 + id - 2*mapwidth] = texture;
			tempmapfile[Block_2 + id - 2*mapwidth + 1] = texture;
			tempmapfile[Block_2 + id - mapwidth] = texture;

			tempmapfile[Block_3 + id - 2*mapwidth] = texture;
			tempmapfile[Block_3 + id - mapwidth - 1] = texture;
			tempmapfile[Block_3 + id - mapwidth] = texture;
		}
	}
}

void setHEXAGONByCoordinate(unsigned char tempmapfile[], unsigned long int row, unsigned long int pos, unsigned long int mapwidth, unsigned long int mapheight, unsigned char texture)
{
	unsigned long int Block_2 = 0;
	unsigned long int Block_3 = 0;
	Block_2 = 2 * BLOCKHEADER + MAPHEADER + 1 * mapwidth*mapheight;
	Block_3 = 3 * BLOCKHEADER + MAPHEADER + 2 * mapwidth*mapheight;
	if (row % 2 != 0 && row != 0)			//uneven row
	{
		if (row != 0 && pos != 0 && pos != mapwidth-1 && row != mapheight - 1) //every normal position
		{

			tempmapfile[Block_2 + row*mapwidth + pos - mapwidth + 1] = texture;
			tempmapfile[Block_2 + row*mapwidth + pos - mapwidth] = texture;
			tempmapfile[Block_2 + row*mapwidth + pos] = texture;

			tempmapfile[Block_3 + row*mapwidth + pos - mapwidth] = texture;
			tempmapfile[Block_3 + row*mapwidth + pos] = texture;
			tempmapfile[Block_3 + row*mapwidth + pos - 1] = texture;
		}
		
		else if (row == mapheight - 1 && pos != 0 && pos != mapwidth)
		{
			tempmapfile[Block_2 + row*mapwidth + pos - mapwidth] = texture;
			tempmapfile[Block_2 + row*mapwidth + pos - mapwidth + 1] = texture;
			tempmapfile[Block_2 + row*mapwidth + pos] = texture;

			tempmapfile[Block_3 + row*mapwidth + pos - mapwidth - 1 + 1] = texture;
			tempmapfile[Block_3 + row*mapwidth + pos] = texture;
			tempmapfile[Block_3 + row*mapwidth + pos - 1] = texture;
		}
		else if (pos == 0 && row != mapheight - 1)
		{
			tempmapfile[Block_2 + row*mapwidth + pos - 2*mapwidth] = texture;
			tempmapfile[Block_2 + row*mapwidth + pos - mapwidth -1] = texture;
			tempmapfile[Block_2 + row*mapwidth + pos - mapwidth] = texture;

			tempmapfile[Block_3 + row*mapwidth + pos - mapwidth - 1] = texture;
			tempmapfile[Block_3 + row*mapwidth + pos - mapwidth] = texture;
			tempmapfile[Block_3 + row*mapwidth + pos - 1] = texture;
		}
		else if (pos == mapwidth - 1 && row != mapheight - 1)
		{
			tempmapfile[Block_2 + row*mapwidth + pos - 1] = texture;
			tempmapfile[Block_2 + row*mapwidth + pos - mapwidth] = texture;
			tempmapfile[Block_2 + row*mapwidth + pos - mapwidth-1] = texture;

			tempmapfile[Block_3 + row*mapwidth - mapwidth + pos - 1] = texture;
			tempmapfile[Block_3 + row*mapwidth + pos - 1] = texture;
			tempmapfile[Block_3 + row*mapwidth + pos - 2] = texture;
		}
	}
	else
	{
		if (row != mapheight - 1 && row != 0 && pos != 0 && pos != mapwidth-1)
		{
			tempmapfile[Block_2 + row*mapwidth + pos - mapwidth - 1] = texture;
			tempmapfile[Block_2 + row*mapwidth + pos - mapwidth] = texture;
			tempmapfile[Block_2 + row*mapwidth + pos] = texture;

			tempmapfile[Block_3 + row*mapwidth + pos - mapwidth - 1] = texture;
			tempmapfile[Block_3 + row*mapwidth + pos - 1] = texture;
			tempmapfile[Block_3 + row*mapwidth + pos] = texture;
		}
		else if (row == 0 && pos != 0 && pos != mapwidth)
		{
			tempmapfile[Block_2 + row*mapwidth + pos - mapwidth - 1 + mapwidth*mapheight] = texture;
			tempmapfile[Block_2 + row*mapwidth + pos - mapwidth + mapwidth*mapheight] = texture;
			tempmapfile[Block_2 + row*mapwidth + pos] = texture;

			tempmapfile[Block_3 + row*mapwidth + pos - mapwidth - 1 + mapwidth*mapheight] = texture;
			tempmapfile[Block_3 + row*mapwidth + pos] = texture;
			tempmapfile[Block_3 + row*mapwidth + pos - 1] = texture;
		}
		else if (pos == 0 && row != 0)
		{
			tempmapfile[Block_2 + row*mapwidth + pos - 1 * mapwidth] = texture;
			tempmapfile[Block_2 + row*mapwidth + pos - 1] = texture;
			tempmapfile[Block_2 + row*mapwidth + pos] = texture;

			tempmapfile[Block_3 + row*mapwidth + pos - 1] = texture;
			tempmapfile[Block_3 + row*mapwidth + pos] = texture;
			tempmapfile[Block_3 + row*mapwidth + pos + 1*mapwidth - 1] = texture;
		}
		else if (pos == mapwidth - 1 && row != 0)
		{
			tempmapfile[Block_2 + row*mapwidth + pos - mapwidth - 1] = texture;
			tempmapfile[Block_2 + row*mapwidth + pos - mapwidth] = texture;
			tempmapfile[Block_2 + row*mapwidth + pos] = texture;

			tempmapfile[Block_3 + row*mapwidth + pos - mapwidth - 1] = texture;
			tempmapfile[Block_3 + row*mapwidth + pos - 1] = texture;
			tempmapfile[Block_3 + row*mapwidth + pos] = texture;
		}
	}
};

int GetBasicHexagonQuality(unsigned char tempmapfile[], int mapwidth, int mapheight, int row, int pos)
{
	unsigned long int Block_2 = 0;
	unsigned long int Block_3 = 0;
	Block_2 = 2 * BLOCKHEADER + MAPHEADER + 1 * mapwidth*mapheight;
	Block_3 = 3 * BLOCKHEADER + MAPHEADER + 2 * mapwidth*mapheight;
	unsigned char texture[6]; //holds 6 texture information
	int sid = 0;
	bool isthesame = false;

	if (row % 2 != 0 && row != 0)			//uneven row
	{
		if (row != 0 && pos != 0 && pos != mapwidth - 1 && row != mapheight - 1) //every normal position
		{

			texture[0] = tempmapfile[Block_2 + row*mapwidth + pos - mapwidth + 1];
			texture[1] = tempmapfile[Block_2 + row*mapwidth + pos - mapwidth];
			texture[2] = tempmapfile[Block_2 + row*mapwidth + pos];

			texture[3] = tempmapfile[Block_3 + row*mapwidth + pos - mapwidth];
			texture[4] = tempmapfile[Block_3 + row*mapwidth + pos];
			texture[5] = tempmapfile[Block_3 + row*mapwidth + pos - 1];
		}

		else if (row == mapheight - 1 && pos != 0 && pos != mapwidth)
		{
			texture[0] = tempmapfile[Block_2 + row*mapwidth + pos - mapwidth];
			texture[1] = tempmapfile[Block_2 + row*mapwidth + pos - mapwidth + 1];
			texture[2] = tempmapfile[Block_2 + row*mapwidth + pos];

			texture[3] = tempmapfile[Block_3 + row*mapwidth + pos - mapwidth - 1 + 1];
			texture[4] = tempmapfile[Block_3 + row*mapwidth + pos];
			texture[5] = tempmapfile[Block_3 + row*mapwidth + pos - 1];
		}
		else if (pos == 0 && row != mapheight - 1)
		{
			texture[0] = tempmapfile[Block_2 + row*mapwidth + pos - 2 * mapwidth];
			texture[1] = tempmapfile[Block_2 + row*mapwidth + pos - mapwidth - 1];
			texture[2] = tempmapfile[Block_2 + row*mapwidth + pos - mapwidth];

			texture[3] = tempmapfile[Block_3 + row*mapwidth + pos - mapwidth - 1];
			texture[4] = tempmapfile[Block_3 + row*mapwidth + pos - mapwidth];
			texture[5] = tempmapfile[Block_3 + row*mapwidth + pos - 1];
		}
		else if (pos == mapwidth - 1 && row != mapheight - 1)
		{
			texture[0] = tempmapfile[Block_2 + row*mapwidth + pos - 1];
			texture[1] = tempmapfile[Block_2 + row*mapwidth + pos - mapwidth];
			texture[2] = tempmapfile[Block_2 + row*mapwidth + pos - mapwidth - 1];

			texture[3] = tempmapfile[Block_3 + row*mapwidth - mapwidth + pos - 1];
			texture[4] = tempmapfile[Block_3 + row*mapwidth + pos - 1];
			texture[5] = tempmapfile[Block_3 + row*mapwidth + pos - 2];
		}
	}
	else
	{
		if (row != mapheight - 1 && row != 0 && pos != 0 && pos != mapwidth - 1)
		{
			texture[0] = tempmapfile[Block_2 + row*mapwidth + pos - mapwidth - 1];
			texture[1] = tempmapfile[Block_2 + row*mapwidth + pos - mapwidth];
			texture[2] = tempmapfile[Block_2 + row*mapwidth + pos];

			texture[3] = tempmapfile[Block_3 + row*mapwidth + pos - mapwidth - 1];
			texture[4] = tempmapfile[Block_3 + row*mapwidth + pos - 1];
			texture[5] = tempmapfile[Block_3 + row*mapwidth + pos];
		}
		else if (row == 0 && pos != 0 && pos != mapwidth)
		{
			texture[0] = tempmapfile[Block_2 + row*mapwidth + pos - mapwidth - 1 + mapwidth*mapheight];
			texture[1] = tempmapfile[Block_2 + row*mapwidth + pos - mapwidth + mapwidth*mapheight];
			texture[2] = tempmapfile[Block_2 + row*mapwidth + pos];

			texture[3] = tempmapfile[Block_3 + row*mapwidth + pos - mapwidth - 1 + mapwidth*mapheight];
			texture[4] = tempmapfile[Block_3 + row*mapwidth + pos];
			texture[5] = tempmapfile[Block_3 + row*mapwidth + pos - 1];
		}
		else if (pos == 0 && row != 0)
		{
			texture[0] = tempmapfile[Block_2 + row*mapwidth + pos - 1 * mapwidth];
			texture[1] = tempmapfile[Block_2 + row*mapwidth + pos - 1];
			texture[2] = tempmapfile[Block_2 + row*mapwidth + pos];

			texture[3] = tempmapfile[Block_3 + row*mapwidth + pos - 1];
			texture[4] = tempmapfile[Block_3 + row*mapwidth + pos];
			texture[5] = tempmapfile[Block_3 + row*mapwidth + pos + 1 * mapwidth - 1];
		}
		else if (pos == mapwidth - 1 && row != 0)
		{
			texture[0] = tempmapfile[Block_2 + row*mapwidth + pos - mapwidth - 1];
			texture[1] = tempmapfile[Block_2 + row*mapwidth + pos - mapwidth];
			texture[2] = tempmapfile[Block_2 + row*mapwidth + pos];

			texture[3] = tempmapfile[Block_3 + row*mapwidth + pos - mapwidth - 1];
			texture[4] = tempmapfile[Block_3 + row*mapwidth + pos - 1];
			texture[5] = tempmapfile[Block_3 + row*mapwidth + pos];
		}
	}

	for (int id = 0; id < 6; id++)
	{
		texture[id] = TextureQuality(texture[id]);
	}

	for (int id = 0; id < 6; id++)
	{
		sid++;
		for (sid; sid < 6; sid++)
		{
			if (texture[id] != texture[sid])
				isthesame = false;
			else
				isthesame = true;
		}
	}
	if (isthesame)
		return texture[0]; //should be Q_Something OR Q_NOTHING
	else
		return Q_NOTHING;
};

//TextureQuality
int TextureQuality(unsigned char texture)
{
	switch (texture)
	{
	case(MOUNTAIN):
	case(MOUNTAIN2):
	case(MOUNTAIN3):
	case(MOUNTAIN4):
	case(BMOUNTAIN):
	{
		return Q_MOUNTAIN;
	}break;
	case(WATER):
	case(BWATER):
	case(UWATER):
	{
		return Q_FISH;
	}break;
	case(MMEADOW):
	case(SAVANNAH):
	case(MEADOW):
	case(MEADOW2):
	case(MEADOW3):
	case(STEPPE):
	case(FMEADOW):
	{
		return Q_WATER;
	}break;
	default:
	{
		return Q_NOTHING;
	}break;
	};
};