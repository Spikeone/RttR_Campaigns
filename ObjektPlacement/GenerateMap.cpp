#include "GenerateMap.hpp"
#include "Consts.hpp"


//GenerateMap()
//task: calls all functions to generate my map
unsigned char GenerateMap(unsigned char tempmapfile[], int mapwidth, int mapheight){

	unsigned long int Buffer = 0;

	Buffer = CalculateBufferSize(mapwidth, mapheight);
	//tempmapfile = new unsigned char[Buffer];

	for (unsigned long int j = 0; j < Buffer; j++){
		tempmapfile[j] = 0x00;
	}

	for (int i = 0; i < BLOCKS; i++){
		GenerateDefaultBlock(tempmapfile, mapwidth, mapheight, i);
	}

	GenerateMapHeader(tempmapfile, mapwidth, mapheight);

	tempmapfile[Buffer-1] = 0xFF;

	return *tempmapfile;
}

//CalculateBufferSize
//task: Calculates the Buffer Size I need
unsigned long int CalculateBufferSize(int mapwidth, int mapheight){
	return (MAPHEADER + BLOCKS * BLOCKHEADER + BLOCKS * mapwidth*mapheight + 1);
}


//GenerateDefaultBlock
//task: generates the Blocks by ID
void GenerateDefaultBlock(unsigned char tempmapfile[], int mapwidth, int mapheight, int BlockID){
	for (int i = 0; i < BLOCKS; i++){
		GenerateBlockHeader(tempmapfile, mapwidth, mapheight, i);
		GenerateBlock(tempmapfile, mapwidth, mapheight, i);
	}
}

//GenerateBlockHeader
//task: calculates block header
void GenerateBlockHeader(unsigned char tempmapfile[], int mapwidth, int mapheight, int BlockID){
	unsigned long int startID = 0;
	startID = MAPHEADER + BlockID * BLOCKHEADER + BlockID * mapwidth * mapheight; //gives the first ID where the Block starts

	tempmapfile[startID + 0] = 0x10;
	tempmapfile[startID + 1] = 0x27;

	tempmapfile[startID + 2] = 0x00;
	tempmapfile[startID + 3] = 0x00;
	tempmapfile[startID + 4] = 0x00;
	tempmapfile[startID + 5] = 0x00;

	tempmapfile[startID + 6] = mapwidth - (int)(mapwidth / 256) * 256;
	tempmapfile[startID + 7] = (int)(mapwidth / 256);

	tempmapfile[startID + 8] = mapheight - (int)(mapheight / 256) * 256;
	tempmapfile[startID + 9] = (int)(mapheight / 256);

	tempmapfile[startID + 10] = 0x01;
	tempmapfile[startID + 11] = 0x00;

	tempmapfile[startID + 12] = mapwidth*mapheight - mapwidth*mapheight / 256 * 256 - mapwidth*mapheight / 256 / 256 * 256 - mapwidth*mapheight / 256 / 256 / 256 * 256;
	tempmapfile[startID + 13] = mapwidth*mapheight / 256;
	tempmapfile[startID + 14] = mapwidth*mapheight / 256 / 256;
	tempmapfile[startID + 15] = mapwidth*mapheight / 256 / 256 / 256;
}

//GenerateBlock
//task: generates a Block by ID
void GenerateBlock(unsigned char tempmapfile[], int mapwidth, int mapheight, int BlockID){

	switch (BlockID){
		case(0): //we got Heightblock
		{
				SetCompleteBlock(tempmapfile,mapwidth,mapheight,DEFAULTHEIGHT,BlockID);
		}break;
		case(1): //Block rsu triangles
		{
				SetCompleteBlock(tempmapfile, mapwidth, mapheight, WATER, BlockID);
		}break;
		case(2): //Block usd triangles
		{
				SetCompleteBlock(tempmapfile, mapwidth, mapheight, WATER, BlockID);
		}break;
		case(3)://Roads
		{
				SetCompleteBlock(tempmapfile, mapwidth, mapheight, NOTHING, BlockID);
		}break;
		case(4): //Object Index
		{
				SetCompleteBlock(tempmapfile, mapwidth, mapheight, NOTHING, BlockID);
		}break;
		case(5): //Object Type
		{
				SetCompleteBlock(tempmapfile, mapwidth, mapheight, NOTHING, BlockID);
		}
		case(6): //Animals
		{
				SetCompleteBlock(tempmapfile, mapwidth, mapheight, NOTHING, BlockID);
		}break;
		case(7): //Unknown / Internal? / Savegame?
		{
				SetCompleteBlock(tempmapfile, mapwidth, mapheight, NOTHING, BlockID);
		}break; //Buildable sites
		case(8):
		{
				SetCompleteBlock(tempmapfile, mapwidth, mapheight, NOTHING, BlockID);
		}break; //Unknown / Internal? / Savegame?
		case(9):
		{
				SetCompleteBlock(tempmapfile, mapwidth, mapheight, 0x07, BlockID);
		}break;
		case(10): //Mapeditor cursor position
		{
				SetCompleteBlock(tempmapfile, mapwidth, mapheight, NOTHING, BlockID);
		}break;
		case(11): //Resources
		{
				SetCompleteBlock(tempmapfile, mapwidth, mapheight, NOTHING, BlockID);
		}break;
		case(12): //Gouraud shading
		{
				SetCompleteBlock(tempmapfile, mapwidth, mapheight, NOTHING, BlockID);
		}break;
		case(13): //Passable areas
		{
				SetCompleteBlock(tempmapfile, mapwidth, mapheight, NOTHING, BlockID);
		}break;
		default:
		{

		}break;
	}

}

//SetCompleteBlock
//task: generates a complete block with a value
void SetCompleteBlock(unsigned char tempmapfile[], int mapwidth, int mapheight, unsigned char value, unsigned long int BlockID){
	unsigned long int startID = 0;
	startID = MAPHEADER + BlockID * BLOCKHEADER + BlockID * mapwidth * mapheight + BLOCKHEADER; //gives the first ID where the Block starts
	for (unsigned long int j = startID; j < startID + mapwidth*mapheight; j++){
		tempmapfile[j] = value;
	}
}

//GenerateMapHeader
//task: generates the mapheader
void GenerateMapHeader(unsigned char tempmapfile[],int mapwidth, int mapheight){
	tempmapfile[0] = 'W';
	tempmapfile[1] = 'O';
	tempmapfile[2] = 'R';
	tempmapfile[3] = 'L';
	tempmapfile[4] = 'D';
	tempmapfile[5] = '_';
	tempmapfile[6] = 'V';
	tempmapfile[7] = '1';
	tempmapfile[8] = '.';
	tempmapfile[9] = '0';
	tempmapfile[10] = 'G';
	tempmapfile[11] = 'e';
	tempmapfile[12] = 'n';
	tempmapfile[13] = 'e';
	tempmapfile[14] = 'r';
	tempmapfile[15] = 'a';
	tempmapfile[16] = 't';
	tempmapfile[17] = 'e';
	tempmapfile[18] = 'd';
	tempmapfile[19] = 'W';
	tempmapfile[20] = 'o';
	tempmapfile[21] = 'r';
	tempmapfile[22] = 'l';
	tempmapfile[23] = 'd';
	tempmapfile[24] = 0x00;

	tempmapfile[30] = mapwidth - (int)(mapwidth / 256) * 256;
	tempmapfile[31] = (int)(mapwidth / 256);

	tempmapfile[32] = mapheight - (int)(mapheight / 256) * 256;
	tempmapfile[33] = (int)(mapheight / 256);

	tempmapfile[34] = 0x00;

	tempmapfile[35] = 0x00;

	tempmapfile[36] = 'S';
	tempmapfile[37] = 'p';
	tempmapfile[38] = 'i';
	tempmapfile[39] = 'k';
	tempmapfile[40] = 'e';
	tempmapfile[41] = 'o';
	tempmapfile[42] = 'n';
	tempmapfile[43] = 'e';
	tempmapfile[44] = ' ';
	tempmapfile[45] = 'a';
	tempmapfile[46] = 'n';
	tempmapfile[47] = 'd';
	tempmapfile[48] = ' ';
	tempmapfile[49] = 'T';
	tempmapfile[50] = 'o';
	tempmapfile[51] = 'o';
	tempmapfile[52] = 'l';
	tempmapfile[53] = 0x00;

	tempmapfile[2342] = 0x11;
	tempmapfile[2343] = 0x27;

	tempmapfile[2344] = 0x00;
	tempmapfile[2345] = 0x00;
	tempmapfile[2346] = 0x00;
	tempmapfile[2347] = 0x00;

	tempmapfile[2348] = mapwidth - (int)(mapwidth / 256) * 256;
	tempmapfile[2349] = (int)(mapwidth / 256);

	tempmapfile[2350] = mapheight - (int)(mapheight / 256) * 256;
	tempmapfile[2351] = (int)(mapheight / 256);
}