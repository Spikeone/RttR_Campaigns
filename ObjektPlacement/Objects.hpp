//////////////////
//Set the Object//
//////////////////
void setobject(unsigned char objectcode,unsigned int mapheight, unsigned int mapwidth,unsigned char tempmapfile[],unsigned long int Buffersize);

////////////////////////////////////////
//Convert user option to object option//
////////////////////////////////////////
void object(int option,int mapheight, int mapwidth, unsigned char tempmapfile[],unsigned long int Buffersize,char mapname[]);

/////////////////////////////////////////////////
//RandomObjects - Place random Objects on a map//
/////////////////////////////////////////////////
void RandomObjects(unsigned char tempmapfile[],unsigned int mapheight,unsigned int mapwidth,unsigned int userseed);

///////////////////////////////////////////////////////////////////////////////////
//void PlaceObject - Places a specified object without asking for the coordinates//
///////////////////////////////////////////////////////////////////////////////////
void PlaceObject(unsigned char tempmapfile[],unsigned long int Block_pos,unsigned long int Block_size,unsigned char object);

/////////////////////////////////////////////////////
//RandomTress - Randomize trees and then place them//
/////////////////////////////////////////////////////
void RandomTrees(unsigned char tempmapfile[],int mapheight,int mapwidth,int userseed);

////////////////////////////////////////
//PlaceTree - places a tree on the map//
////////////////////////////////////////
void PlaceTree(unsigned char tempmapfile[],unsigned long int Block_pos,unsigned long int Block_size,unsigned char tree,unsigned char tree_type);

////////////////////////////////////////////////////////////
//RandomStone - Randomize granite on the map////////////////
//As far as I know I can use "PlaceTree" to place granite!//
////////////////////////////////////////////////////////////
void RandomGranite(unsigned char tempmapfile[],unsigned int mapheight,unsigned int mapwidth,unsigned int userseed);

//////////////////////////////////////////////////////////
//ClearObject - Cleares a specified point of all objects//
//////////////////////////////////////////////////////////
void ClearObject(unsigned char tempmapfile[],unsigned long int Block_pos,unsigned long int Block_size);

///////////////////////////////////////////////////
//ClearHexObjects - to clear a hexagon of objects//
///////////////////////////////////////////////////
void ClearHexObjects(unsigned char tempmapfile[],unsigned long Block_pos,unsigned long int Block_size,int mapwidth,int mapheight);