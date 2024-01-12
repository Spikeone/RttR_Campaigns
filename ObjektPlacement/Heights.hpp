///////////////////
//Set the Heights//
///////////////////
void setallheights(unsigned char tempmapfile[],unsigned int mapheight,unsigned int mapwidth,unsigned char heightcode);

/////////////////////////////////////////////////////////////
//getRandomHeight - getting a height by texture information//
/////////////////////////////////////////////////////////////
unsigned char getRandomHeight(unsigned char tempmapfile[],int mapheight,int mapwidth,int row, int pos);

//////////////////////////////////////////////////////////////////////
//setHeight - setting a height by height information (use getHeight)//
//////////////////////////////////////////////////////////////////////
void setHeight(unsigned char tempmapfile[],unsigned char height,int mapheight,int mapwidth,int row, int pos);

/////////////////////////////////////////////
//RandomAllHeights - set some basic heights//
/////////////////////////////////////////////
unsigned char RandomAllHeights(unsigned char tempmapfile[],int mapheight, int mapwidth,int row, int pos, int userseed);

////////////////////////////////////////////
//GetHeight - Get the height of a position//
////////////////////////////////////////////
unsigned char GetHeight(unsigned char tempmapfile[],unsigned long int Block_pos,unsigned long int Block_size);

///////////////////////////////////////////////
//ChangeHexHeight - Change a Hexagon of a map//
///////////////////////////////////////////////
void ChangeHexHeight(unsigned char tempmapfile[],unsigned long int Block_pos,unsigned long int Block_size,int mapwidth,int mapheight);

///////////////////////////////////////////
//Same as setHeight but better for my use//
///////////////////////////////////////////
void SetHeight(unsigned char tempmapfile[],unsigned char height,unsigned long int Block_pos);

////////////////////////////////////////
//IronMap - irons all heights of a map//
////////////////////////////////////////
void IronMap(unsigned char tempmapfile[],int mapheight,int mapwidth);

//////////////////////////////////////////////////////
//FetchHeightMap - Fetches a height map onto the map//
//////////////////////////////////////////////////////
void FetchHeightMap(unsigned char tempmapfile[], unsigned char tempbmpfile[], unsigned long int Bufferbmp);