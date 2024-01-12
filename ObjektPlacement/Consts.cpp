struct MapOptions
{
	//Add variables for percentages
	int perc_desert;
	int perc_deadlands;
	int perc_oasis;
	int perc_meadow;
	int perc_mountain;
	int perc_vulcano;
	int perc_swamp;
	int perc_islands;
	//water = 100-all
	int patch_size_x;
	int patch_size_y;
	int border_size_x;
	int border_size_y;
	int patches_x;
	int patches_y;
	int map_parts;
	//Number of players
	int player_count;
	//gate option
	bool place_gate;
	//to save the userseed
	unsigned long int userseed;

	//To save the file information
	int mapwidth;
	int mapheight;
};