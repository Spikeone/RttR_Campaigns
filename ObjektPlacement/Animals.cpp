#include "Animals.hpp"
#include "Random.hpp"
#include "Consts.hpp"
#include "Texture.hpp"
#include <iostream>

using namespace std;

//PlaceAnimal
//task: place an animal
void PlaceAnimal(unsigned char tempmapfile[],unsigned long int Block_pos, unsigned long int Block_size, unsigned char animal)
{
	tempmapfile[MAPHEADER+6*Block_size+Block_pos+7*BLOCKHEADER] = animal;
}

//RandomAnimals
//task:Place random Animals
void RandomAnimals(unsigned char tempmapfile[],unsigned int mapwidth,unsigned int mapheight,unsigned int userseed)
{
	unsigned long int i = 0;
	unsigned int animal = 0;
	unsigned char texture;
	for(i=0;i<(mapheight*mapwidth);i++)
	{
		//lets see if we place an animal
		if((Random(userseed,false)%25) == 0)
		{
			texture = GetBasicTexture(tempmapfile,i,(mapwidth*mapheight));
			switch(texture)
			{
				case(WATER):
					{
						PlaceAnimal(tempmapfile,i,(mapwidth*mapheight),DUCK);
					}break;
				case(LAVA):
				case(SWAMP):
				case(SNOW):
					{
						//no animals
					}break;
				case(MEADOW):
					{
						animal = Random(userseed,false)%5;
						switch(animal)
						{
						case(0):
							{
								PlaceAnimal(tempmapfile,i,(mapwidth*mapheight),RABBIT);
							}break;
						case(1):
							{
								PlaceAnimal(tempmapfile,i,(mapwidth*mapheight),FOX);
							}break;
						case(2):
							{
								PlaceAnimal(tempmapfile,i,(mapwidth*mapheight),STAG);
							}break;
						case(3):
							{
								PlaceAnimal(tempmapfile,i,(mapwidth*mapheight),ROE);
							}break;
						case(4):
							{
								PlaceAnimal(tempmapfile,i,(mapwidth*mapheight),SHEEP);
							}break;
						}
					}break;
				case(SAVANNAH):
					{
						PlaceAnimal(tempmapfile,i,(mapwidth*mapheight),RABBIT);
					}break;
				case(MOUNTAIN):
				case(MMEADOW):
					{
						animal = Random(userseed,false)%3;
						switch(animal)
						{
						case(0):
							{
								PlaceAnimal(tempmapfile,i,(mapwidth*mapheight),SHEEP);
							}break;
						case(1):
							{
							PlaceAnimal(tempmapfile,i,(mapwidth*mapheight),RABBIT);
							}break;
						case(2):
						{
							PlaceAnimal(tempmapfile,i,(mapwidth*mapheight),FOX);
						}break;
					}break;
				default:
					{
						//nothing
					}break;
				}
			}
		}
	}
	cout << "God invented live on your map..." << endl;
}