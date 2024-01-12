#include "Objects.hpp"
#include "SaveLoad.hpp"
#include "Consts.hpp"
#include "Texture.hpp"
#include "Random.hpp"
#include <iostream>

using namespace std;

//setobject
//task: place an object
void setobject(unsigned char objectcode,unsigned int mapheight,unsigned int mapwidth,unsigned char tempmapfile[],unsigned long int Buffersize)
{
	unsigned long int x_pos = 0;
	unsigned long int y_pos = 0;
	unsigned long int Block_5_pos = 0;
	unsigned long int Block_6_pos = 0;
	do{
	cout << "Enter the X-coordinate: ";
	cin >> x_pos;
	}while(x_pos < 0 || x_pos >= mapheight);		//Just to make sure nobody places something outside the map (in an other block)
	do{
	cout << "Enter the Y-coordinate: ";
	cin >> y_pos;
	}while(y_pos < 0 || y_pos >= mapwidth);

	//Go to pos at Block 5 (Object index)
	Block_5_pos = 2352 + 4*(mapwidth*mapheight)+ 5*16 + y_pos*mapwidth + x_pos; //Header + Start of Block 5 (4 Blocks of mapsize_x*mapsize_y)+ number of blockheaders + Go to the right row (y_row * number of "x" per row) + actual x position
	if(Block_5_pos > Buffersize)
		cout << "Something seems to be wrong, check the Mapsize with Option '17'!" << endl;
	else
		tempmapfile[Block_5_pos] = objectcode;

	//Go to pos at Block 6 (Object Type)
	Block_6_pos = 2352 + 5*(mapwidth*mapheight)+ 6*16 + y_pos*mapwidth + x_pos; //Header + Start of Block 6 (5 Blocks of mapsize_x*mapsize_y)+ number of blockheaders + Go to the right row (y_row * number of "x" per row) + actual x position
	if(Block_6_pos > Buffersize)
		cout << "Something seems to be wrong, check the Mapsize with Option '17'!" << endl;
	else
		tempmapfile[Block_6_pos] = 0xc8;
	cout << "Object has been placed!" << endl;
	cout << endl;
}//setobject

//PlaceObject
//task: place an object
void PlaceObject(unsigned char tempmapfile[],unsigned long int Block_pos,unsigned long int Block_size,unsigned char object)
{
	//Place the object in Block 5
	tempmapfile[Block_size*4+MAPHEADER+5*BLOCKHEADER+Block_pos] = object;
	//Set the Object type in Block 6 (Maybe I have to change this later when the object is granite etc.
	tempmapfile[Block_size*5+MAPHEADER+6*BLOCKHEADER+Block_pos] = 0xc8;
}

//ClearObject
//task: clear an object
void ClearObject(unsigned char tempmapfile[],unsigned long int Block_pos,unsigned long int Block_size)
{
	tempmapfile[Block_size*4+MAPHEADER+5*BLOCKHEADER+Block_pos] = 0x00;
	tempmapfile[Block_size*5+MAPHEADER+6*BLOCKHEADER+Block_pos] = 0x00;
}

//ClearHexObjects
//task: clear a building space (Hexagon)
void ClearHexObjects(unsigned char tempmapfile[],unsigned long Block_pos,unsigned long int Block_size,int mapwidth,int mapheight)
{
	ClearObject(tempmapfile,Block_pos,Block_size);
	ClearObject(tempmapfile,Block_pos-1,Block_size);
	ClearObject(tempmapfile,Block_pos+1,Block_size);
	if(int(Block_pos/mapwidth)%2 == 0)//again we have to check for even and uneven rows...
	{
		ClearObject(tempmapfile,Block_pos-mapwidth,Block_size);
		ClearObject(tempmapfile,Block_pos-mapwidth+1,Block_size);
		ClearObject(tempmapfile,Block_pos+mapwidth,Block_size);
		ClearObject(tempmapfile,Block_pos+mapwidth+1,Block_size);
	}
	else
	{
		ClearObject(tempmapfile,Block_pos-mapwidth+1,Block_size);
		ClearObject(tempmapfile,Block_pos-mapwidth+2,Block_size);
		ClearObject(tempmapfile,Block_pos+mapwidth,Block_size);
		ClearObject(tempmapfile,Block_pos+mapwidth+1,Block_size);
	}

}


//object
//task: convert user info to map info
void object(int option,int mapheight, int mapwidth, unsigned char tempmapfile[],unsigned long int Buffersize, char mapname[])
{
	switch(option)
	{
		case(0):
		{
			option = 0;
			cout << "Tool will be closed" << endl;
			cout << "Save file again (1-Yes/Other-No): ";
			cin >> option;
			if(option == 1)
			{
				savemap(tempmapfile,mapname,Buffersize);
			}
		}break;
		case(1):
		{
			savemap(tempmapfile,mapname,Buffersize);
		}break;
		//Open a Mapfile?
		case(2):
		{
			//Set a "Waterstone" with code 0B
			setobject(0x0b, mapheight, mapwidth,tempmapfile,Buffersize);
		}break;
		case(3):
		{
			//Set a "small Stone" with code 23
			setobject(0x23, mapheight, mapwidth,tempmapfile,Buffersize);
		}break;
		case(4):
		{
			//Set a "big Stone" with code 24
			setobject(0x24, mapheight, mapwidth,tempmapfile,Buffersize);
		}break;
		case(5):
		{
			//Set a "Bush" with code 28
			setobject(0x28, mapheight, mapwidth,tempmapfile,Buffersize);
			}break;
		case(6):
		{
			//Set a "blue Bush" with code 29
			setobject(0x29, mapheight, mapwidth,tempmapfile,Buffersize);
		}break;
		case(7):
		{
			//Set a "flat Bush" with code 2A
			setobject(0x2A, mapheight, mapwidth,tempmapfile,Buffersize);
		}break;
		case(8):
		{
			//Set a "Snowman" with code 2B
			setobject(0x2b, mapheight, mapwidth,tempmapfile,Buffersize);
		}break;
		case(9):
		{
			//Set a "sunken Ship" with code 15
			setobject(0x15, mapheight, mapwidth,tempmapfile,Buffersize);
			cout << "I'm a pirate without a ship!" << endl;
		}break;
		case(10):
		{
			//Set a "closed Gate" with code 16
			setobject(0x16, mapheight, mapwidth,tempmapfile,Buffersize);
		}break;
		case(11):
		{
			//Set a "opened Gate" with code 17
			setobject(0x17, mapheight, mapwidth,tempmapfile,Buffersize);
			cout << "Yarrr, the gate is open!" << endl;
		}break;
		case(12):
		{
			//Set a "Tent" with code 2C
			setobject(0x2C, mapheight, mapwidth,tempmapfile,Buffersize);
		}break;
		case(13):
		{
			//Set a "Guardhouse" with code 2D
			setobject(0x2D, mapheight, mapwidth,tempmapfile,Buffersize);
		}break;
		case(14):
		{
			//Set a "Watchtower" with code 2E
			setobject(0x2E, mapheight, mapwidth,tempmapfile,Buffersize);
		}break;
		case(15):
		{
			//Set a "Fortress" with code 2F
			setobject(0x2F, mapheight, mapwidth,tempmapfile,Buffersize);
		}break;
		case(16):
		{
			//Set a "voodoo doll" with code 30
			setobject(0x30, mapheight, mapwidth,tempmapfile,Buffersize);
		}break;
		case(17):
		{
			cout << "Mapwidth: " << mapwidth << endl;
			cout << "Mapheight: " << mapheight << endl;
			cout << "Buffer: " << Buffersize << endl;
			cout << endl;
		}break;
		default:
		{
			cout << "Error: not an option" << endl;
			cout << endl;
		}break;
	}
}

//RandomObjects
//task: Place random objects
void RandomObjects(unsigned char tempmapfile[],unsigned int mapheight,unsigned int mapwidth,unsigned int userseed)
{
	unsigned long int Block_size = mapwidth*mapheight;
	unsigned long int i = 0;
	unsigned char current_texture;
	unsigned long int Block_pos = 0;
	unsigned long int object = 0;
	int possible_objects = 39; //default objects are 39

	//I think 25% objects is a good number
	//lets get the reason why everything is water
	for(i=0;i<Block_size;i++) //We will just go through the block
	{
		Block_pos = MAPHEADER+(1*Block_size)+(2*BLOCKHEADER)+i;
		//First of all we need to check which texture we got
		current_texture = GetBasicTexture(tempmapfile,i,Block_size);

		if(Random(userseed,false)%4 == 0)
		{

		if(current_texture == WATER) //we got water
		{
			//Hmm, I think I should also check if the water is close to some coastal region
			//    ?
			//    |
			//    |
			//?- -X - -?
			//    |
			//    |
			//    ?
			//if one of these is not anymore water, we are close to the coast
			//Then we would add an object
			if(i>(2*mapwidth) && i<((mapwidth*mapheight)-(2*mapwidth)))
			{
				if(GetBasicTexture(tempmapfile,i+2,Block_size) != WATER || GetBasicTexture(tempmapfile,i-2,Block_size) != WATER || GetBasicTexture(tempmapfile,i-(2*mapwidth),Block_size) != WATER || GetBasicTexture(tempmapfile,i+(2*mapwidth),Block_size) != WATER)
				{
					possible_objects = 6;
					object = ((int)(Random(userseed,false)%possible_objects)) + 1;
				}
				else
				{
					possible_objects = 1;
					object = ((int)(Random(userseed,false)%possible_objects));
				}
			}
			else
			{
				possible_objects = 1;
				object = ((int)(Random(userseed,false)%possible_objects));
			}
			switch(object)
			{
				//The case 0  will only be possible if we are in the middle of an ocean
			case(0):
				{
					//so, this does nothing :>
				}break;
			case(1):
				{
					if((int)(Random(userseed,false)%10) == 0) //should add less waterstones
					{
						PlaceObject(tempmapfile,i,Block_size,WATERSTONE);
					}
				}break;
			case(2):
				{
					if((int)(Random(userseed,false)%10) == 0) //should add less sunken ships
					{
						PlaceObject(tempmapfile,i,Block_size,SUNKENSHIP);
					}
				}break;
			case(3):
				{
					PlaceObject(tempmapfile,i,Block_size,SHRUB1);
				}break;
			case(4):
				{
					PlaceObject(tempmapfile,i,Block_size,SHRUB2);
				}break;
			case(5):
				{
					PlaceObject(tempmapfile,i,Block_size,SHRUB3);
				}break;
			case(6):
				{
					PlaceObject(tempmapfile,i,Block_size,SHRUB4);
				}break;
			default:
				{
					//nothing again
				}
			}
		}

		//Lets start with mountains
		else if(current_texture == MOUNTAIN) //we got mountain
		{
			possible_objects = 12;
			object = ((int)(Random(userseed,false))%possible_objects);
			switch(object)
			{
			case(0):
				{
					PlaceObject(tempmapfile,i,Block_size,STONES1);
				}break;
			case(1):
				{
					PlaceObject(tempmapfile,i,Block_size,STONES2);
				}break;
			case(2):
				{
					PlaceObject(tempmapfile,i,Block_size,STONES3);
				}break;
			case(3):
				{
					PlaceObject(tempmapfile,i,Block_size,DEADTRUNK);
				}break;
			case(4):
				{
					PlaceObject(tempmapfile,i,Block_size,DEADTREE);
				}break;
			case(5):
				{
					PlaceObject(tempmapfile,i,Block_size,BONE1);
				}break;
			case(6):
				{
					PlaceObject(tempmapfile,i,Block_size,BONE2);
				}break;
			case(7):
				{
					PlaceObject(tempmapfile,i,Block_size,STONE1);
				}break;
			case(8):
				{
					PlaceObject(tempmapfile,i,Block_size,FLOWERS1);
				}break;
			case(9):
				{
					PlaceObject(tempmapfile,i,Block_size,FLOWERS2);
				}break;
			case(10):
				{
					PlaceObject(tempmapfile,i,Block_size,STONE1);
				}break;
			case(11):
				{
					PlaceObject(tempmapfile,i,Block_size,BUSH6);
				}break;
			default:
				{
					//nothing
				}break;
			}
		}
		else if(current_texture == SAVANNAH) //we got savannah
		{
			possible_objects = 10;
			object = ((int)(Random(userseed,false))%possible_objects);
			switch(object)
			{
			case(0):
				{
				PlaceObject(tempmapfile,i,Block_size,DEADTRUNK);
				}break;
			case(1):
				{
				PlaceObject(tempmapfile,i,Block_size,DEADTREE);
				}break;
			case(2):
				{
				PlaceObject(tempmapfile,i,Block_size,BONE1);
				}break;
			case(3):
				{
				PlaceObject(tempmapfile,i,Block_size,BONE2);
				}break;
			case(4):
				{
				PlaceObject(tempmapfile,i,Block_size,CACTUS1);
				}break;
			case(5):
				{
				PlaceObject(tempmapfile,i,Block_size,CACTUS2);
				}break;
			case(6):
				{
				PlaceObject(tempmapfile,i,Block_size,STONES1);
				}break;
			case(7):
				{
				PlaceObject(tempmapfile,i,Block_size,STONES2);
				}break;
			case(8):
				{
				PlaceObject(tempmapfile,i,Block_size,STONES3);
				}break;
			case(9):
				{
					if((int)(Random(userseed,false)%100) == 0)
						PlaceObject(tempmapfile,i,Block_size,VOODODOLL);
				}
			default:
				{
					//nothing
				}break;
			}
		}
		else if(current_texture == SNOW) //we got snow
		{
			possible_objects = 4;
			object = ((int)(Random(userseed,false))%possible_objects);
			switch(object)
			{
			case(0):
				{
					PlaceObject(tempmapfile,i,Block_size,STONES1);
				}break;
			case(1):
				{
					PlaceObject(tempmapfile,i,Block_size,STONES2);
				}break;
			case(2):
				{
					PlaceObject(tempmapfile,i,Block_size,STONES3);
				}break;
			case(3):
				{
					//if((int)(Random(userseed,false)%10) == 0) //should add less sunken ships
					//{
						PlaceObject(tempmapfile,i,Block_size,SNOWMAN);
					//}
				}break;
			default:
				{
					//nothing
				}break;
			}
		}
		else if(current_texture == SWAMP) //we got swamp
		{
			possible_objects = 9;
			object = ((int)(Random(userseed,false))%possible_objects);
			switch(object)
			{
			case(0):
				{
					PlaceObject(tempmapfile,i,Block_size,DEADTRUNK);
				}break;
			case(1):
				{
					PlaceObject(tempmapfile,i,Block_size,DEADTREE);
				}break;
			case(2):
				{
					PlaceObject(tempmapfile,i,Block_size,BONE1);
				}break;
			case(3):
				{
					PlaceObject(tempmapfile,i,Block_size,BONE2);
				}break;
			case(4):
				{
					PlaceObject(tempmapfile,i,Block_size,SHRUB1);
				}break;
			case(5):
				{
					PlaceObject(tempmapfile,i,Block_size,SHRUB2);
				}break;
			case(6):
				{
					PlaceObject(tempmapfile,i,Block_size,SHRUB3);
				}break;
			case(7):
				{
					PlaceObject(tempmapfile,i,Block_size,SHRUB4);
				}break;
			case(8):
				{
					PlaceObject(tempmapfile,i,Block_size,BUSH5);
				}break;
			default:
				{
					//nothing
				}break;
			}
		}
		else if(current_texture == MEADOW)//we got meadow
		{
			possible_objects = 22;
			object = ((int)(Random(userseed,false))%possible_objects);
			switch(object)
			{
			case(0):
				{
					PlaceObject(tempmapfile,i,Block_size,MUSH1);
				}break;
			case(1):
				{
					PlaceObject(tempmapfile,i,Block_size,MUSH2);
				}break;
			case(2):
				{
					PlaceObject(tempmapfile,i,Block_size,STONE1);
				}break;
			case(3):
				{
					PlaceObject(tempmapfile,i,Block_size,STONE2);
				}break;
			case(4):
				{
					PlaceObject(tempmapfile,i,Block_size,STONE3);
				}break;
			case(5):
				{
					PlaceObject(tempmapfile,i,Block_size,DEADTREE);
				}break;
			case(6):
				{
					PlaceObject(tempmapfile,i,Block_size,DEADTRUNK);
				}break;
			case(7):
				{
					PlaceObject(tempmapfile,i,Block_size,FLOWERS1);
				}break;
			case(8):
				{
					PlaceObject(tempmapfile,i,Block_size,BUSH1);
				}break;
			case(9):
				{
					PlaceObject(tempmapfile,i,Block_size,BUSH2);
				}break;
			case(10):
				{
					PlaceObject(tempmapfile,i,Block_size,BUSH3);
				}break;
			case(11):
				{
					PlaceObject(tempmapfile,i,Block_size,BUSH4);
				}break;
			case(12):
				{
					PlaceObject(tempmapfile,i,Block_size,MUSH3);
				}break;
			case(13):
				{
					PlaceObject(tempmapfile,i,Block_size,SMALLSTONE1);
				}break;
			case(14):
				{
					PlaceObject(tempmapfile,i,Block_size,SMALLSTONE2);
				}break;
			case(15):
				{
					PlaceObject(tempmapfile,i,Block_size,BUSH5);
				}break;
			case(16):
				{
					PlaceObject(tempmapfile,i,Block_size,FLOWERS2);
				}break;
			case(17):
				{
					PlaceObject(tempmapfile,i,Block_size,BUSH6);
				}break;
			case(18):
				{
					if((int)(Random(userseed,false)%75) == 0)
						PlaceObject(tempmapfile,i,Block_size,TENT);
				}break;
			case(19):
				{
					if((int)(Random(userseed,false)%75) == 0)
						PlaceObject(tempmapfile,i,Block_size,GUARDHOUSE);
				}break;
			case(20):
				{
					if((int)(Random(userseed,false)%75) == 0)
						PlaceObject(tempmapfile,i,Block_size,WATCHTOWER);
				}break;
			case(21):
				{
					if((int)(Random(userseed,false)%75) == 0)
						PlaceObject(tempmapfile,i,Block_size,FORTRESS);
				}break;
			default:
				{
					//nothing
				}
			}
		}
		else if(current_texture == LAVA)//we got Lava
		{
			possible_objects = 7;
			object = ((int)(Random(userseed,false))%possible_objects);
			switch(object)
			{
			case(0):
				{
				if((int)(Random(userseed,false)%5) == 0)
					PlaceObject(tempmapfile,i,Block_size,DEADTREE);
				}break;
			case(1):
				{
				if((int)(Random(userseed,false)%5) == 0)
					PlaceObject(tempmapfile,i,Block_size,DEADTRUNK);
				}break;
			case(2):
				{
				if((int)(Random(userseed,false)%5) == 0)
					PlaceObject(tempmapfile,i,Block_size,BONE1);
				}break;
			case(3):
				{
				if((int)(Random(userseed,false)%5) == 0)
					PlaceObject(tempmapfile,i,Block_size,BONE2);
				}break;
			case(4):
				{
				if((int)(Random(userseed,false)%5) == 0)
					PlaceObject(tempmapfile,i,Block_size,STONES1);
				}break;
			case(5):
				{
				if((int)(Random(userseed,false)%5) == 0)
					PlaceObject(tempmapfile,i,Block_size,STONES2);
				}break;
			case(6):
				{
				if((int)(Random(userseed,false)%5) == 0)
					PlaceObject(tempmapfile,i,Block_size,STONES3);
				}
			default:
				{
					//nothing
				}
			}
		}
		else if(current_texture == MMEADOW)//we got mountain meadow
		{
			possible_objects = 17;
			object = ((int)(Random(userseed,false))%possible_objects);
			switch(object)
			{
			case(0):
				{
					PlaceObject(tempmapfile,i,Block_size,STONE1);
				}break;
			case(1):
				{
					PlaceObject(tempmapfile,i,Block_size,STONE2);
				}break;
			case(2):
				{
					PlaceObject(tempmapfile,i,Block_size,STONE3);
				}break;
			case(3):
				{
					PlaceObject(tempmapfile,i,Block_size,DEADTREE);
				}break;
			case(4):
				{
					PlaceObject(tempmapfile,i,Block_size,DEADTRUNK);
				}break;
			case(5):
				{
					PlaceObject(tempmapfile,i,Block_size,BUSH1);
				}break;
			case(6):
				{
					PlaceObject(tempmapfile,i,Block_size,BUSH2);
				}break;
			case(7):
				{
					PlaceObject(tempmapfile,i,Block_size,BUSH3);
				}break;
			case(8):
				{
					PlaceObject(tempmapfile,i,Block_size,BUSH4);
				}break;
			case(9):
				{
					PlaceObject(tempmapfile,i,Block_size,SMALLSTONE1);
				}break;
			case(10):
				{
					PlaceObject(tempmapfile,i,Block_size,SMALLSTONE2);
				}break;
			case(11):
				{
					PlaceObject(tempmapfile,i,Block_size,STONES1);
				}break;
			case(12):
				{
					PlaceObject(tempmapfile,i,Block_size,STONES2);
				}break;
			case(13):
				{
					PlaceObject(tempmapfile,i,Block_size,STONES3);
				}break;
			case(14):
				{
					PlaceObject(tempmapfile,i,Block_size,BUSH5);
				}break;
			case(15):
				{
					PlaceObject(tempmapfile,i,Block_size,BUSH6);
				}break;
			case(16):
				{
					if((int)(Random(userseed,false)%50) == 0)
						PlaceObject(tempmapfile,i,Block_size,GUARDHOUSE);
				}break;
			default:
				{
					//nothing
				}break;
			}
		}
		else
		{
			//We should have MAGENTA but we wont do something now
			//GetBasicTexture also gave a warning
		}


		}
		else
		{
			//nothing
		}
	}
	cout << "You are now able to discover objects..." << endl;
}

//PlaceTree
//task:Places a tree of the specified type
void PlaceTree(unsigned char tempmapfile[],unsigned long int Block_pos,unsigned long int Block_size,unsigned char tree,unsigned char tree_type)
{
	//place the object index (Block5)
	tempmapfile[MAPHEADER+5*BLOCKHEADER+Block_pos+4*Block_size] = tree;
	//place the object type (Block6)
	tempmapfile[MAPHEADER+6*BLOCKHEADER+Block_pos+5*Block_size] = tree_type;
}

//RandomTrees
//task:Place random trees placing
void RandomTrees(unsigned char tempmapfile[],int mapheight,int mapwidth,int userseed)
{
	unsigned char texture;
	unsigned long int Block_size = mapheight*mapwidth;
	int possible_trees = 1;
	unsigned long int i = 0;
	int start_animation = 0;
	for(i=0;i<Block_size;i++)
	{
		texture = GetBasicTexture(tempmapfile,i,Block_size);
		switch(texture)
		{
		case(WATER):
		case(LAVA):
		case(SNOW):
			{
				//No trees for these types
			}break;
		case(MEADOW):
			{
				if(Random(userseed,false)%7 == 0)
				{
					possible_trees = 9;
					switch(Random(userseed,false)%possible_trees)
					{
					case(0):
					case(1):
					case(2):
						{
							//randomize startanimation
							start_animation = int(Random(userseed,false)%8);
							//this makes pine
							PlaceTree(tempmapfile,i,Block_size,PINE0+start_animation,TREETYPE1);
						}break;
					case(3):
					case(4):
					case(5):
						{
							//randomize startanimation
							start_animation = int(Random(userseed,false)%8);
							//this makes oak
							PlaceTree(tempmapfile,i,Block_size,OAK0+start_animation,TREETYPE1);
						}break;
					case(6):
					case(7):
						{
							//randomize startanimation
							start_animation = int(Random(userseed,false)%8);
							//this makes birch
							PlaceTree(tempmapfile,i,Block_size,BIRCH0+start_animation,TREETYPE1);
						}break;
					case(8):
						{
							//randomize startanimation
							start_animation = int(Random(userseed,false)%8);
							//this makes cherry
							PlaceTree(tempmapfile,i,Block_size,CHERRY0+start_animation,TREETYPE2);
						}break;
					}
				}
			}break;
		case(SAVANNAH):
			{
				if(Random(userseed,false)%10 == 0)
				{
					possible_trees = 8;
					switch(Random(userseed,false)%possible_trees)
					{
					case(1):
					case(2):
						{
							//randomize startanimation
							start_animation = int(Random(userseed,false)%8);
							//this makes palm1
							PlaceTree(tempmapfile,i,Block_size,PALM10+start_animation,TREETYPE1);
						}break;
					case(3):
					case(4):
						{
							//randomize startanimation
							start_animation = int(Random(userseed,false)%8);
							//this makes palm2
							PlaceTree(tempmapfile,i,Block_size,PALM20+start_animation,TREETYPE2);
						}break;
					case(5):
					case(6):
						{
							//randomize startanimation
							start_animation = int(Random(userseed,false)%8);
							//this makes cypress
							PlaceTree(tempmapfile,i,Block_size,CYPRESS0+start_animation,TREETYPE2);
						}break;
					case(7):
						{
							//randomize startanimation
							start_animation = int(Random(userseed,false)%8);
							//this makes pine apple
							PlaceTree(tempmapfile,i,Block_size,PINEAPPLE0+start_animation,TREETYPE2);
						}break;
					}
				}
			}break;
		case(MMEADOW):
			{
				if(Random(userseed,false)%20 == 0)
				{
					possible_trees = 1;
					switch(Random(userseed,false)%possible_trees)
					{
					case(0):
						{
							//randomize startanimation
							start_animation = int(Random(userseed,false)%8);
							//this makes fir
							PlaceTree(tempmapfile,i,Block_size,FIR0+start_animation,TREETYPE3);
						}break;
					}
				}
			}break;
		case(MOUNTAIN):
			{
				if(Random(userseed,false)%15 == 0)
				{
					possible_trees = 1;
					switch(Random(userseed,false)%possible_trees)
					{
					case(0):
						{
							//randomize startanimation
							start_animation = int(Random(userseed,false)%8);
							//this makes fir
							PlaceTree(tempmapfile,i,Block_size,FIR0+start_animation,TREETYPE3);
						}break;
					}
				}
			}break;
		case(SWAMP):
			{
				if(Random(userseed,false)%7 == 0)
				{
					possible_trees = 6;
					switch(Random(userseed,false)%possible_trees)
					{
					case(0):
					case(1):
					case(2):
						{
							//randomize startanimation
							start_animation = int(Random(userseed,false)%8);
							//this makes pine
							PlaceTree(tempmapfile,i,Block_size,PINE0+start_animation,TREETYPE1);
						}break;
					case(3):
					case(4):
					case(5):
						{
							//randomize startanimation
							start_animation = int(Random(userseed,false)%8);
							//this makes oak
							PlaceTree(tempmapfile,i,Block_size,OAK0+start_animation,TREETYPE1);
						}break;
					}
				}
			}break;
		default:
			{
				//Hopefully this never happens
			}break;
		}
	}
	cout << "You will need some woodcutters now..." << endl;
}

//RandomGranite
//task: Place Granite on a map
void RandomGranite(unsigned char tempmapfile[],unsigned int mapheight,unsigned int mapwidth,unsigned int userseed)
{
	unsigned long int Block_pos;
	unsigned long int Block_size = mapheight*mapwidth;
	unsigned int stones = 0;
	unsigned long int random_pos;
	for(unsigned long int i = 0; i < Block_size;i++)
	{
		if(Random(userseed,false)%85 == 0)
		{
			Block_pos = i;
			stones = Random(userseed,false)%6;
			for(unsigned long int j=0;j<(3+stones);j++)
			{
				random_pos = -1-1*(mapwidth)+(Random(userseed,false)%3)+((Random(userseed,false)%3)*mapwidth);
				if(random_pos+i < 0 || random_pos+i > Block_size) //seems like this made some problems eh?
				{
					random_pos = 0;
				}
				if(GetBasicTexture(tempmapfile,i+random_pos,(mapwidth*mapheight)) != WATER) //Just to not place granite on water
				{
					PlaceTree(tempmapfile,Block_pos+random_pos,Block_size,GRANITE+(Random(userseed,false)%6),TYPEGRANITE);
				}
			}
		}
	}
	cout << "There are some rocks in your way..." << endl;
}