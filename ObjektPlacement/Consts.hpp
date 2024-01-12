#ifndef CONSTS_HPP
#define CONSTS_HPP

#define MAPHEADER 2352			//Header of each Mapfile
#define BLOCKHEADER 16			//Header of a Block
#define BMPHEADER 118			//Header of BMP files
#define DEFAULTHEIGHT 10		//Default Height of every map
#define HEIGHT_MAX 62
#define HEIGHT_MIN 0
#define BLOCKS 14

//////////////////////////////
///////////Textures///////////
//////////////////////////////
#define SAVANNAH 0x00
#define MOUNTAIN 0x01
#define SNOW 0x02
#define SWAMP 0x03
#define DESERT 0x04
#define WATER 0x05
#define BWATER 0x06				//Buildable water
#define DESERT2 0x07
#define MEADOW 0x08
#define MEADOW2 0x09
#define MEADOW3 0x0A
#define MOUNTAIN2 0x0B
#define MOUNTAIN3 0x0C
#define MOUNTAIN4 0x0D
#define STEPPE 0x0E
#define FMEADOW 0xF			//Flower Meadow
#define LAVA 0x10
#define MAGENTA 0x11		//I think only the Original game would Read that
#define MMEADOW 0x12		//Mountain Meadow
#define UWATER 0x13			//by ships unpassable water
#define LAVA2 0x14			//Not used in any game normally
#define LAVA3 0x15			//Not used in any game normally
#define LAVA4 0x16			//Not used in any game normally
#define BMOUNTAIN 0x22		//Buildable Mountain
#define HARBOUR 0x40		//Number to add a HARBOUR spot

//Bmp to swd
#define MMEADOW_B 0x23		//Mountai Meadow Background - used in bmp->swd
#define WATER_B 0x24
#define LAVA_B 0x25

/////////////////////////////
///////////Objects///////////
/////////////////////////////
#define MUSH1 0x00
#define MUSH2 0x01
#define STONE1 0x02
#define STONE2 0x03
#define STONE3 0x04
#define DEADTRUNK 0x05
#define DEADTREE 0x06
#define BONE1 0x07
#define BONE2 0x08
#define FLOWERS1 0x09
#define BUSH1 0x0A
#define WATERSTONE 0x0B
#define CACTUS1 0x0C
#define CACTUS2 0x0D
#define SHRUB1 0x0E
#define SHRUB2 0x0F
#define BUSH2 0x10
#define BUSH3 0x11
#define BUSH4 0x12
#define SHRUB3 0x13
#define SHRUB4 0x14
#define SUNKENSHIP 0x15
#define GATEC 0x16
#define GATEO 0x17
#define MUSH3 0x22
#define SMALLSTONE1 0x23
#define SMALLSTONE2 0x24
#define STONES1 0x25
#define STONES2 0x26
#define STONES3 0x27
#define BUSH5 0x28
#define FLOWERS2 0x29
#define BUSH6 0x2A
#define SNOWMAN 0x2B
#define TENT 0x2C
#define GUARDHOUSE 0x2D
#define WATCHTOWER 0x2E
#define FORTRESS 0x2F
#define VOODODOLL 0x30
#define NOTHING 0x00

/////////////////////////////
///////////Animals///////////
/////////////////////////////
#define RABBIT 0x01
#define FOX 0x02
#define STAG 0x03		//Hirsch
#define ROE 0x04		//reh
#define DUCK 0x05
#define SHEEP 0x06

///////////////////////////
///////////Trees///////////
///////////////////////////
#define PINE0 0x30
#define BIRCH0 0x70
#define OAK0 0xB0
#define PALM10 0xF0
#define PALM20 0x30
#define PINEAPPLE0 0x70
#define CYPRESS0 0xB0
#define CHERRY0 0xF0
#define FIR0 0x30
#define TREETYPE1 0xC4 //That would make pine, birch,oak,palm
#define TREETYPE2 0xC5 //That would make palm2, pineapple,cypress,cherry
#define TREETYPE3 0xC6 //fir

////////////////////////////
///////////Player///////////
////////////////////////////
#define PLAYER 0x80

/////////////////////////////
///////////Granite///////////
/////////////////////////////
#define GRANITE 0x01
#define TYPEGRANITE 0xCC

////////////////////////////////////////////////
///////////changing temporary mapfile///////////
///////////Every biome got an ID!///////////////
////////////////////////////////////////////////
#define B_DESERT 0
#define B_DEADLANDS 1
#define B_OASIS 2
#define B_MEADOW 3
#define B_MOUNTAIN 4
#define B_VULCANO 5
#define B_SWAMP 6
#define B_ISLANDS 7
#define B_WATER 8
#define B_PLAYER 9
#define B_NOBIOME 10

#define RANDOMRANGE 4

///////////////////////////////
///////////Filetypes///////////
///////////////////////////////

#define BMPFILE "BMP-Filename (.bmp)"
#define MAPFILE "Map-Filename (.swd/.wld)"

///////////////////////////////
///////////Resources///////////
///////////////////////////////
#define COAL_MIN 0x40
#define COAL_MAX 0x47
#define IRON_MIN 0x48
#define IRON_MAX 0x4F
#define GOLD_MIN 0x50
#define GOLD_MAX 0x57
#define GRANITE_MIN 0x58
#define GRANITE_MAX 0x5F
#define R_FISH 0x87
#define R_WATER 0x21
#define Q_NOTHING 0
#define Q_FISH 1
#define Q_WATER 2
#define Q_MOUNTAIN 3


#endif