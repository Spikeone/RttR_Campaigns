#ifndef GENERATEMAP_HPP
#define GENERATEMAP_HPP

////////////////////////////////////////////////////////////////////////////
//GenerateMap - This function calls each function I need to generate a map//
////////////////////////////////////////////////////////////////////////////
unsigned char GenerateMap(unsigned char tempmapfile[], int mapwidth, int mapheight);

////////////////////////////////////////////////////////////////
//CalculateBufferSize - Calculates the Buffersize for my Array//
////////////////////////////////////////////////////////////////
unsigned long int CalculateBufferSize(int mapwidth, int mapheight);

//////////////////////////////////////////////////////////////
//GenerateDefaultBlock - Generates a default block by number//
//////////////////////////////////////////////////////////////
void GenerateDefaultBlock(unsigned char tempmapfile[], int mapwidth, int mapheight,int BlockID);



void GenerateBlockHeader(unsigned char tempmapfile[], int mapwidth, int mapheight, int BlockID);



void GenerateBlock(unsigned char tempmapfile[], int mapwidth, int mapheight, int BlockID);



void SetCompleteBlock(unsigned char tempmapfile[], int mapwidth, int mapheight, unsigned char value, unsigned long int BlockID);



void GenerateMapHeader(unsigned char tempmapfile[],int mapwidth, int mapheight);

#endif