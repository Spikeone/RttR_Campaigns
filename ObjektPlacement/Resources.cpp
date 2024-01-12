#include "Resources.hpp"
#include "Texture.hpp"
#include "Consts.hpp"

void PlaceRandomResources(unsigned char tempmapfile[], int mapwidth, int mapheight)
{
	int quality = Q_NOTHING;
	int mine = 0;
	for (int row = 0; row < mapheight; row++)
	{
		for (int pos = 0; pos < mapwidth; pos++)
		{
			quality = GetBasicHexagonQuality(tempmapfile, mapwidth, mapheight, row, pos);
			switch (quality)
			{
			case(Q_NOTHING):
			{
			}break;
			case(Q_FISH):
			{
				PlaceResource(tempmapfile, mapwidth, mapheight, row, pos, R_FISH);
			}break;
			case(Q_WATER):
			{
				PlaceResource(tempmapfile, mapwidth, mapheight, row, pos, R_WATER);
			}break;
			case(Q_MOUNTAIN):
			{
				PlaceResource(tempmapfile, mapwidth, mapheight, row, pos, GetMountainResource(mine));
				mine++;
				if (mine >= 6)
					mine = 0;
			}break;
			default:
			{

			}break;
			};
		}
	}
};

int GetMountainResource(int id)
{
	switch (id)
	{
	case(0):
	case(2):
	{
		return COAL_MAX;
	}break;
	case(1):
	{
		return IRON_MAX;
	}break;
	case(3):
	{
		return GOLD_MAX;
	}break;
	case(4):
	{
		return COAL_MAX;
	}break;
	case(5):
	{
		return GRANITE_MAX;
	}break;
	default:
	{
		return GRANITE_MIN;
	};
	};
};

void PlaceResource(unsigned char tempmapfile[], int mapwidth, int mapheight, int row, int pos, unsigned char resource)
{
	unsigned long int Block_12_Pos = 0;
	Block_12_Pos = 12 * BLOCKHEADER + 11 * mapheight*mapwidth + MAPHEADER + row*mapwidth + pos;
	tempmapfile[Block_12_Pos] = resource;
}