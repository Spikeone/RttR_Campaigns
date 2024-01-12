/////////////////////////////////////////////////////////
//PlacePlayersRandomMap - Place players on a random map//
/////////////////////////////////////////////////////////
void PlacePlayersRandomMap(unsigned char tempmapfile[],int tempmapparts[],int patches_x,int patches_y,int userseed,int player_count,int mapwidth,int mapheight,int border_size_x,int border_size_y,int patch_size_x,int patch_size_y);

/////////////////////////////////
//PlacePlayer - Places a player//
/////////////////////////////////
void PlacePlayer(unsigned char tempmapfile[],unsigned long int Block_size, unsigned long int Block_pos, int player_number,int HQ_X,int HQ_Y);

////////////////////////////////////////////////////////////////////////////
//SetPlayerInformation - Sets the Information for players in the Mapheader//
////////////////////////////////////////////////////////////////////////////
void SetPlayerInformation(unsigned char tempmapfile[],int player_number,int HQ_X,int HQ_Y);