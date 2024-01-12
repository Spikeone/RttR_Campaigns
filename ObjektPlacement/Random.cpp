//taken from: http://de.wikipedia.org/wiki/Mersenne-Twister

#include <stdint.h>
#include <iostream>
#include "Consts.hpp"
#include "Random.hpp"

using namespace std;

uint32_t Random(unsigned long int userseed, bool first_start)
{
#define N     624
#define M     397
#define HI    0x80000000
#define LO    0x7fffffff
	static const uint32_t seed = userseed;
	static const uint32_t A[2] = { 0, 0x9908b0df };
	static uint32_t y[N];
	static int i = N+1;
 
	if(first_start == true)
	{
		i = N+1; //do we have a restart? if yes just reset the i
	}

	if (i > N) {
    /* Initialisiere y mit Pseudozufallszahlen */
		y[0] = seed;
 
		for (i=1; i<N; ++i) {
		y[i] = (1812433253UL * (y[i-1] ^ (y[i-1] >> 30)) + i);
		/* See Knuth TAOCP Vol2. 3rd Ed. P.106 for multiplier. */
		/* In the previous versions, MSBs of the seed affect   */
		/* only MSBs of the array mt[].                        */
		/* 2002/01/09 modified by Makoto Matsumoto             */
		}
	}
 
	if (i == N) {
    /* Berechne neuen Zustandsvektor */
		uint32_t h;
 
    for (i=0; i<N-M; ++i) {
      h = (y[i] & HI) | (y[i+1] & LO);
      y[i] = y[i+M] ^ (h >> 1) ^ A[h & 1];
    }
    for ( ; i<N-1; ++i) {
      h = (y[i] & HI) | (y[i+1] & LO);
      y[i] = y[i+(M-N)] ^ (h >> 1) ^ A[h & 1];
    }
 
    h = (y[N-1] & HI) | (y[0] & LO);
    y[N-1] = y[M-1] ^ (h >> 1) ^ A[h & 1];
    i = 0;
  }
 
  uint32_t e = y[i++];
  /* Tempering */
  e ^= (e >> 11);
  e ^= (e << 7) & 0x9d2c5680;
  e ^= (e << 15) & 0xefc60000;
  e ^= (e >> 18);

  return e;
#undef N
#undef M
#undef HI
#undef LO
}

//RandomMapParts
//task: now in a good way to set the
void RandomMapParts(int tempmapparts[],MapOptions Options)
{
	int biome = 0;
	for(int i = 0;i<Options.map_parts;i++)
	{
		biome = Random(Options.userseed,false)%100;
		if(biome >= 0 && biome < Options.perc_desert) //we got desert
		{
			tempmapparts[i] = B_DESERT;
		}
		else if(biome >= Options.perc_desert && biome < (Options.perc_desert+Options.perc_deadlands)) //we got deadlands
		{
			tempmapparts[i] = B_DEADLANDS;
		}
		else if(biome >= (Options.perc_desert+Options.perc_deadlands) && biome < (Options.perc_desert+Options.perc_deadlands+Options.perc_oasis)) //we got oasis
		{
			tempmapparts[i] = B_OASIS;
		}
		else if(biome >= (Options.perc_desert+Options.perc_deadlands+Options.perc_oasis) && biome < (Options.perc_desert+Options.perc_deadlands+Options.perc_oasis+Options.perc_meadow)) //we got meadow
		{
			tempmapparts[i] = B_MEADOW;
		}
		else if(biome >= (Options.perc_desert+Options.perc_deadlands+Options.perc_oasis+Options.perc_meadow) && biome < (Options.perc_desert+Options.perc_deadlands+Options.perc_oasis+Options.perc_meadow+Options.perc_mountain)) //we got mountain
		{
			tempmapparts[i] = B_MOUNTAIN;
		}
		else if(biome >= (Options.perc_desert+Options.perc_deadlands+Options.perc_oasis+Options.perc_meadow+Options.perc_mountain) && biome < (Options.perc_desert+Options.perc_deadlands+Options.perc_oasis+Options.perc_meadow+Options.perc_mountain+Options.perc_vulcano)) //we got vulcano
		{
			tempmapparts[i] = B_VULCANO;
		}
		else if(biome >= (Options.perc_desert+Options.perc_deadlands+Options.perc_oasis+Options.perc_meadow+Options.perc_mountain+Options.perc_vulcano) && biome < (Options.perc_desert+Options.perc_deadlands+Options.perc_oasis+Options.perc_meadow+Options.perc_mountain+Options.perc_vulcano+Options.perc_swamp)) //we got swamp
		{
			tempmapparts[i] = B_SWAMP;
		}
		else if(biome >= (Options.perc_desert+Options.perc_deadlands+Options.perc_oasis+Options.perc_meadow+Options.perc_mountain+Options.perc_vulcano+Options.perc_swamp) && biome <  (Options.perc_desert+Options.perc_deadlands+Options.perc_oasis+Options.perc_meadow+Options.perc_mountain+Options.perc_vulcano+Options.perc_swamp+Options.perc_islands)) //we got islands
		{
			tempmapparts[i] = B_ISLANDS;
		}
		else //only water is left
		{
			tempmapparts[i] = B_WATER;
		}
	}
}

//GetBiomeType
//task: Gets the biome type or maybe returns nothing
int GetBiomeType(int tempmapparts[],int patches_x, int patches_y, int pos_x, int pos_y)
{
	if(pos_x <= patches_x && pos_y <= patches_y && pos_x >= 0 && pos_y >= 0) //this makes it possible that the patch exists
	{
		switch(tempmapparts[pos_x+pos_y*patches_x])
		{
		case(B_MEADOW):
			{
				return B_MEADOW;
			}break;
		case(B_MOUNTAIN):
		case(B_VULCANO):
			{
				return B_MOUNTAIN;
			}break;
		case(B_DESERT):
		case(B_OASIS):
			{
				return B_DESERT;
			}break;
		case(B_DEADLANDS):
			{
				return B_DEADLANDS;
			}break;
		case(B_SWAMP):
			{
				return B_SWAMP;
			}break;
		case(B_ISLANDS):
		case(B_WATER):
			{
				return B_WATER;
			}break;
		case(B_PLAYER):
			{
				return B_PLAYER;
			}break;
		default:
			{
				return B_NOBIOME;
			}break;
		}
	}
	else
	{
		return B_NOBIOME;
	}
}
//SetRandomOptions
//task: Fill the struct with information
MapOptions SetRandomOptions (MapOptions Options)
{
	//Set the percentages of biomes
	Options.perc_desert = 0;
	Options.perc_deadlands = 0;
	Options.perc_oasis = 0;
	Options.perc_meadow = 45;
	Options.perc_mountain = 15;
	Options.perc_vulcano = 0;
	Options.perc_swamp = 0;
	Options.perc_islands = 0;
	//water percentage is 100-all

	Options.patch_size_x = 12;
	Options.patch_size_y = 12;
	Options.border_size_x = 0;
	Options.border_size_y = 0;
	Options.patches_x = 0;
	Options.patches_y = 0;
	Options.map_parts = 0;

	Options.player_count = 1;
	Options.place_gate = false;

	//to make sure we have one
	Options.userseed = 12345678;

	return Options;
}

MapOptions SetInformation(MapOptions Options,int mapwidth,int mapheight)
{
	//saves the mapinformation
	Options.mapheight = mapheight;
	Options.mapwidth = mapwidth;
	//creates the patch information
	Options.patches_x = int(Options.mapwidth/Options.patch_size_x);
	Options.patches_y = int(Options.mapheight/Options.patch_size_y);

	Options.border_size_x = (mapwidth - int(Options.patches_x*Options.patch_size_x));
	Options.border_size_y = (mapheight - int(Options.patches_y*Options.patch_size_y));

	if(Options.border_size_x == 0)
	{
		//To make sure everything wents right
		Options.border_size_x = Options.patch_size_x;
		Options.patches_x = Options.patches_x--;
	}
	if(Options.border_size_y == 0)
	{
		//To make sure everything wents right
		Options.border_size_y = Options.patch_size_y;
		Options.patches_y = Options.patches_y--;
	}

	Options.map_parts = Options.patches_x*Options.patches_y;

	return Options;
}