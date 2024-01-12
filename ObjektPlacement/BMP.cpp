#include "BMP.hpp"
#include <iostream>
#include "Consts.hpp"
#include "Texture.hpp"

using namespace std;

//GetBmpwidth
//task: Get the Bmpwidth
int GetBmpwidth(unsigned char tempbmpfile[])
{
	return (int(tempbmpfile[19])) * 256 + (int(tempbmpfile[18]));
};

//GetBmpwidth
//task: Get the Bmpheight
int GetBmpheight(unsigned char tempbmpfile[])
{
	return (int(tempbmpfile[23])) * 256 + (int(tempbmpfile[22]));
};

//CheckBmpSizes
//task: Check if one side is not %2 == 0
bool CheckBmpSizes(int bmpwidth, int bmpheight)
{
	if (bmpwidth % 2 != 0 || bmpheight % 2 != 0 || bmpwidth <= 0 || bmpheight <= 0)		//There is no way that I would add such an option as there are no such maps
	{
		cout << "Warning, your BMP Sizes are not even or 0!" << endl;
		cout << "BMP to SWD will stop now!" << endl;
		return false;
	}
	else
		return true;
};

//CalcExtraBytes
//task: Calculate the extrabytes we need
int CalcExtraBytes(int bmpwidth)
{
	//bmpwidth / 8 gives count of "how often 8 fit"
	// +1 * 8 gives the next bmpwidth%8 = 0		// take the bmpwidth we actually have away
	// and 1 byte = 2 pixel => /2
	//Examle:
	//bmpwidth = 26
	//FFFFFFFFFFFFFFFFFFFFFFFFFF000000
	// 26/8 = 3 + 1 * 8 = 32 -26 = 6 / 2 = 3 (0x00,0x00,0x00)
	return ((int(bmpwidth / 8) + 1) * 8 - bmpwidth) / 2;
}

//TranslatBMPtoSWD
//task: translate the BMP information
void TranslateBMPtoSWD(unsigned char tempbmpfile[], unsigned char bmpinfo[], unsigned long int bmpwidth, unsigned long int bmpheight,int extrabytes)
{
	unsigned long int row = 0;
	unsigned long int id = 0;
	unsigned long int infoid = 0;
	unsigned char fieldinfo = 0x00;
	unsigned char firstbyte = 0x00;
	unsigned char secondbyte = 0x00;
	unsigned char texture = 0x00;

	for (row = bmpheight; row > 0; row--)		//for all rows we got in the bmp file
	{
		for (id = 0; id < bmpwidth/2; id++)			//for all elements in a row
		{
			fieldinfo = tempbmpfile[BMPHEADER + ((row-1)*(bmpwidth / 2) + row*extrabytes) + id];
			firstbyte = int(fieldinfo / 16);
			secondbyte = int(fieldinfo % 16);

			bmpinfo[infoid] = TranslateBMPNumbertoTexture(firstbyte);
			bmpinfo[infoid+1] = TranslateBMPNumbertoTexture(secondbyte);

			infoid += 2;
		}
	}
}

//TranslateBMPNumbertoTexture
//task: Translates a bmp number to a swd texture
unsigned char TranslateBMPNumbertoTexture(int information)
{
	switch (information)
	{
	case(0) :
	{
				return MAGENTA;
	}break;
	case(1) :
	{
				return LAVA_B;
	}break;
	case(2) :
	{
				return MEADOW;
	}break;
	case(3) :
	{
				return STEPPE;
	}break;
	case(4) :
	{
				return WATER_B;
	}break;
	case(5) :
	{
				return MMEADOW_B;
	}break;
	case(6) :
	{
				return SWAMP;
	}break;
	case(7) :
	{
				return MOUNTAIN;
	}break;
	case(8) :
	{
				return MMEADOW;
	}break;
	case(9) :
	{
				return LAVA;
	}break;
	case(10) :
	{
				return SAVANNAH;
	}break;
	case(11) :
	{
				 return DESERT;
	}break;
	case(12) :
	{
				 return WATER;
	}break;
	case(13) :
	{
				 return MAGENTA;
	}break;
	case(14) :
	{
				 return FMEADOW;
	}break;
	case(15) :
	{
				 return SNOW;
	}break;
	default:
	{
			   cout << "WARNING: Some unknown information appeared! (TranslateBMPNumbertoTexture)" << endl;
			   return MAGENTA;
	}break;
	}
}

//ConvertBMPtoSWD
//task: Converts the bmp info to swd
void ConvertBMPtoSWD(unsigned char tempmapfile[], unsigned char bmpinfo[],int mapwidth,int mapheight)
{
	unsigned long int i = 0;
	int round = 0;
	int row = 0;
	int pos = 0;
	unsigned char curtexture = 0x00;
	for (round = 0; round < 16; round++)
	{
		//curtexture = getCurrentTexture(round);
		for (row = 0; row < mapheight; row++)
		{
			for (pos = 0; pos < mapwidth; pos++)
			{
				curtexture = getCurrentTexture(round);
				if (bmpinfo[row*mapwidth + pos] == curtexture && curtexture != MAGENTA)
				{
					if (curtexture == WATER_B)
						curtexture = WATER;
					if (curtexture == LAVA_B)
						curtexture = LAVA;
					if (curtexture == MMEADOW_B)
						curtexture = MMEADOW;
					setHEXAGONByCoordinate(tempmapfile, row, pos, mapwidth, mapheight, curtexture);
				}
			}
		}
	}
}

//CheckFileSizes
//task: Check if bmp and swd have the same sizes
bool CheckFileSizes(int mapwidth, int bmpwidth, int mapheight, int bmpheight)
{
	if (mapwidth != bmpwidth)
	{
		cout << "ERROR: Mapwidth and BMP size do not fit!" << endl;
		return false;
	}
	else if (mapheight != bmpheight)
	{
		cout << "ERROR: Mapheight and BMP size do not fit!" << endl;
		return false;

	}
	else
		return true;
}

//getCurrentTexture
//task: layer drawing
unsigned char getCurrentTexture(int round)
{
	switch (round)
	{
	case(0) :
	{
				return LAVA_B;
	}break;
	case(1) :
	{
				return WATER_B;
	}break;
	case(2) :
	{
				return MAGENTA;
	}break;
	case(3) :
	{
				return DESERT;
	}break;
	case(4) :
	{
				return MMEADOW;
	}break;
	case(5) :
	{
				return STEPPE;
	}break;
	case(6) :
	{
				return SAVANNAH;
	}break;
	case(7) :
	{
				return MEADOW;
	}break;
	case(8) :
	{
				return SWAMP;
	}break;
	case(9) :
	{
				return MAGENTA;
	}break;
	case(10) :
	{
				return MOUNTAIN;
	}break;
	case(11) :
	{
				return FMEADOW;
	}break;
	case(12) :
	{
				return MMEADOW_B;
	}break;
	case(13) :
	{
				return SNOW;
	}break;
	case(14) :
	{
				return WATER;
	}break;
	case(15) :
	{
				 return LAVA;
	}break;
	default:
	{
			   cout << "WARNING: Some wild unknown information appeared! (GetCurrentTexture)" << endl;
			   return MAGENTA;
	}break;
	}
}