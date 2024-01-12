#ifndef TEXTURE_HPP
#define TEXTURE_HPP

////////////////////////////////////////////////////////
//Translate the .bmp information into .swd information//
////////////////////////////////////////////////////////
void texture(unsigned char texture,int mapheight,int mapwidth, unsigned char tempmapfile[],int swdID,int row);

//////////////////////////////////
//Place all textures for patches//
//////////////////////////////////
//void PlacePatches(unsigned char tempmapfile[],int tempmapparts[],int row,int id,int mapwidth,int mapheight,int border_size,int userseed, int patch_size,
//					int perc_desert,int perc_deadland,int perc_oasis,int perc_meadow,int perc_mountain,int perc_vulcano,int perc_swamp,int perc_islands);
void PlacePatches(unsigned char tempmapfile[],int tempmapparts[],int row,int id,struct MapOptions Options);

//////////////////////////////////////////////////////////////////////////////
//GetBasicTexture - should return an information about the texture we are on//
//////////////////////////////////////////////////////////////////////////////
unsigned char GetBasicTexture(unsigned char tempmapfile[],unsigned long int Block_pos,unsigned long int Block_size);

///////////////////////////////////////////////////////////////////////////////////////////
//GetBasicHexagonQuality - should return an information about the texture Quaility we got//
///////////////////////////////////////////////////////////////////////////////////////////
int GetBasicHexagonQuality(unsigned char tempmapfile[], int mapwidth, int mapheight,int row, int pos);

////////////////////////////////////////////////////
//BiomeGeneratorMeadow - The Generator for Meadow //
////////////////////////////////////////////////////
void BiomeGeneratorDesert(MapOptions Options,unsigned char tempmapfile[],unsigned int row,unsigned int id);

void BiomeGeneratorDeadlands(MapOptions Options, unsigned char tempmapfile[], unsigned int row, unsigned int id);


///////////////////////////////////////////////////////////////
//setHEXAGONbyID - Places a hexagon at the given ID in a file//
///////////////////////////////////////////////////////////////
void setHEXAGONByID(unsigned char tempmapfile[], unsigned long int id, unsigned long int mapwidth, unsigned long int mapheight, unsigned char texture);
//////////////////////////////////////////////////////////////////////
//setHEXAGONByCoordinate - Places a hexagon at the given coordinates//
//////////////////////////////////////////////////////////////////////
void setHEXAGONByCoordinate(unsigned char tempmapfile[], unsigned long int row, unsigned long int pos, unsigned long int mapwidth, unsigned long int mapheight, unsigned char texture);
////////////////////////////////////////////////////////
//TextureQuality - Gets the Texture Quality by texture//
////////////////////////////////////////////////////////
int TextureQuality(unsigned char texture);

#endif