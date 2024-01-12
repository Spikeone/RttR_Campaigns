//Project: objekt placing
//Task: place some "special" objects on maps
//Editor: Spikeone

#include <stdio.h>
#include <iostream>
#include <fstream>
#include "Windows.h"
#include "Heights.hpp"
#include "Objects.hpp"
#include "Texture.hpp"
#include "SaveLoad.hpp"
#include "MirrorMap.hpp"
#include "Consts.hpp"
#include "Random.hpp"
#include "Animals.hpp"
#include "GeneralFunctions.hpp"
#include "Players.hpp"
#include "BMP.hpp"
#include "Resources.hpp"
#include "GenerateMap.hpp"

using namespace std;

#pragma comment (lib, "winmm.lib")

int main()
{
	FILE *mapfile = NULL;								//our mapfile
	FILE *bmpfile = NULL;								//our bmpfile
	unsigned long int row = 0;
	unsigned long int id = 0;							//just to count
	unsigned long int swdid = 0;
	unsigned int mapwidth = 0;
	unsigned int mapheight = 0;
	unsigned long int bmpwidth = 0;
	unsigned long int bmpheight = 0;
	char mapname[30],bmpname[30];
	int extrabytes = 0;									//Extrabytes for the bmp file if mapwidth %8 != 0
	int option = 0;
	unsigned long int Buffer = 0;
	unsigned long int Bufferbmp = 0;
	unsigned long int i = 0;
	unsigned long int j = 0;							//My Buffer
	unsigned long int userseed = 1234678;
	bool run = true;									//keep track if everything wents wrong
	unsigned char *tempmapfile;

	//setbuf(stdout,NULL);								//Set a buffer
	setvbuf(stdout, NULL, _IOFBF, 1024);				//Set a v buffer?

	do
	{
		cout << "Spikes Maptools - v20140809-0026(v100):" << endl;
		cout << "-------------------------" << endl;
		cout << "00 - Close Program" << endl;
		cout << "01 - Object-Edit-Tool" << endl;
		cout << "02 - BMP-SWD-Tool" << endl;
		cout << "03 - Mirror-Map-Tool(WIP)" << endl;
		cout << "04 - SWD-BMP-Tool(-)" << endl;
		cout << "05 - Set-Heights-Tool" << endl;
		cout << "06 - Random-Objects-Tool" << endl;
		cout << "07 - Random-Heights-Tool(WIP)" << endl;
		cout << "08 - Random-Map-Tool(WIP)" << endl;
		cout << "09 - Apply Height-Map(WIP)" << endl;
		cout << "10 - Random-Resources-Tool(WIP)" << endl;
		cout << "11 - Info" << endl;
		cout << "12 - Testingfunctions(Maybe useless for you)" << endl;
		cout << "What do you want to do: ";
		option = GetOption();
		cout << endl;

		switch(option)
		{
			/////////////////////////////
			//End of the Whole Program!//
			/////////////////////////////
			
		case(0):
			{
				cout << "Hopefully everything went better than expected!" << endl;
			}break;

			//////////////////////////////////////////
			//Option 1 - Add some Objects to the map//
			//////////////////////////////////////////
		case(1):
			{
				//Open the File
				//
				run = openmap(mapfile,mapname,MAPFILE);

				//Set the Buffer
				//
				if (run)
					Buffer = GetBufferSize(mapfile);

				//my Array
				//
				if (run)
					tempmapfile = new unsigned char[Buffer]; //My array for the mapdata

				//"Copy" the file into my Array
				//
				if (run)
					fread(tempmapfile,Buffer,1,mapfile);

				//get the width and height of the map
				//
				if (run)
					mapwidth = GetMapwidth(tempmapfile);
				if (run)
					mapheight = GetMapheight(tempmapfile);

				//Menu
				//
				if (run)
				{
					do
					{
						//Menu output
						option = 0;

						ShowPlaceObjectMenu();

						cout << "Option: ";
						option = GetOption();
						cout << endl;

						object(option, mapheight, mapwidth, tempmapfile, Buffer, mapname);

					} while (option != 0);
				}
			option = 1; //Change option to an other if the user still wants to use the tool, otherwise it would close (while option != 0)
			if (mapfile != NULL)
			{
				fclose(mapfile);
				mapfile = NULL;
			}
			if (run)
				delete[] tempmapfile;

			}break;

		/////////////////////////////////////
		//Option 2 - Convert a .bmp to .swd//
		/////////////////////////////////////
	case(2):
		{
			////////////
			//BMP file//
			////////////

			//Open the File
			//
			run = openmap(bmpfile, bmpname, BMPFILE);

			//Set my Array Buffer
			//
			if (run)
				Bufferbmp = GetBufferSize(bmpfile);

			//my Array
			//
			unsigned char *tempbmpfile = new unsigned char[Bufferbmp]; //My array for the mapdata

			//"Copy" the file into my Array
			//
			if (run)
				fread(tempbmpfile, Bufferbmp, 1, bmpfile);

			//Get mapsizes by bmp sizes
			//TODO: Check those sizes
			//
			mapwidth = GetBmpwidth(tempbmpfile);
			mapheight = GetBmpheight(tempbmpfile);

			//Calculate the Buffer
			//
			Buffer = CalculateBufferSize(mapwidth, mapheight);

			//
			//
			tempmapfile = new unsigned char[Buffer];

			//Generates the map
			//
			GenerateMap(tempmapfile, mapwidth, mapheight);

			//get the width and height of the map
			//
			if (run)
				SizeWarning(mapwidth, mapheight);

			if (run && mapwidth%8 != 0)
				extrabytes = CalcExtraBytes(bmpwidth);

			//convert bmp info to related information
			unsigned char *bmpinfo = new unsigned char[mapheight*mapwidth];

			if (run)
				TranslateBMPtoSWD(tempbmpfile,bmpinfo,mapwidth,mapheight,extrabytes);

			if (run)
				ConvertBMPtoSWD(tempmapfile, bmpinfo,mapwidth,mapheight);

			////////////
			//Map Part//
			////////////

			if (run){
				savemap(tempmapfile,"Spike.wld", Buffer);
				delete[] tempmapfile;
			}

			if (bmpfile != NULL){
				fclose(bmpfile);
				mapfile = NULL;
			}

			//Save the map and close the files
			delete[] tempbmpfile;
			delete[] bmpinfo;
		}break;

		/////////////////////////
		//Option 3 - Mirror Map//
		/////////////////////////
	case(3):
		{
			cout << "Mirror Map tool still under construction" << endl;
			//Open the File
			//
			run = openmap(mapfile, mapname, MAPFILE);

			//Set my Array Buffer
			//
			if (run)
				Buffer = GetBufferSize(mapfile);

			//my Array
			//
			if (run)
				tempmapfile = new unsigned char[Buffer]; //My array for the mapdata

			//"Copy" the file into my Array
			//
			if (run)
				fread(tempmapfile,Buffer,1,mapfile);

			//get the width and height of the map
			//
			if (run)
			{
				mapwidth = GetMapwidth(tempmapfile);
				mapheight = GetMapheight(tempmapfile);
			}

			while (run && option!=0)
			{
				cout << "You can mirror maps in X and Y direction." << endl;
				cout << "-----------------------------------------" << endl;
				cout << "00 - Close Program" << endl;
				cout << "01 - Mirror Y-Axis" << endl;
				cout << "02 - Mirror X-Axis" << endl;
				cout << "03 - Rotate Map 180" << endl;
				cout << "What do you want to do:";
				option = GetOption();

				switch(option)
				{
				case(0):
					{
						cout << "Leaving Tool" << endl;
					}break;
				case(1):
					{
						cout << endl;
						cout << "Map is mirrored in Y direction" << endl;
						MirrorMapY(tempmapfile,mapwidth,mapheight);
					}break;
				case(2):
					{
						cout << "Mirroring X is now under construction" << endl;
						cout << endl;
						cout << "Map is mirrored in X direction" << endl;
						MirrorMapX(tempmapfile,mapwidth,mapheight);
					}break;
				case(3):
					{
						cout << "Rotating Map 180" << endl;
						unsigned char *tempmapfileoriginal = new unsigned char [Buffer];	//I don't want to use an other variable to swap all positions properly so I just make a new mapcopy
						fseek(mapfile,0,SEEK_SET);											//Jumping back to the beginning of the file? Maybe that fixes the 0F bug I got
						fread(tempmapfileoriginal,Buffer,1,mapfile);						//Read that file

						RotateMap(tempmapfile,tempmapfileoriginal,mapwidth,mapheight);		//Rotate the map
						delete[] tempmapfileoriginal;										//and delete my second mapcopy
					}break;
				default:
					{
						cout << "Not an option" << endl;
					}
				}
			};
			if (run)
				savemap(tempmapfile, mapname, Buffer);
				delete[] tempmapfile;

			if (mapfile != NULL){
				fclose(mapfile);
				mapfile = NULL;
			}

			option = 1;
		}break;

		/////////////////////////////////////
		//Option 4 - Convert a .swd to .bmp//
		/////////////////////////////////////
	case(4):
		{
			cout << "SWD to BMP tool still under construction" << endl;
		}break;

		////////////////////////////////////////////
		//Option 5 - Change all heights of the map//
		////////////////////////////////////////////
	case(5):
		{
			cout << "Change heights tool still under construction" << endl;

			//Open the File
			//
			run = openmap(mapfile, mapname, MAPFILE);

			//Set my Array Buffer
			//
			if (run)
				Buffer = GetBufferSize(mapfile);

			//my Array
			//
			if (run)
				tempmapfile = new unsigned char[Buffer]; //My array for the mapdata

			//"Copy" the file into my Array
			//
			if (run)
				fread(tempmapfile, Buffer, 1, mapfile);

			//get the width and height of the map
			//
			if (run)
			{
				mapwidth = GetMapwidth(tempmapfile);
				mapheight = GetMapheight(tempmapfile);
				SizeWarning(mapwidth, mapheight);
			}

			/////////////////////////
			//Options to set heigts//
			/////////////////////////

			do
			{
				option = 0;
				ShowChangeAllHeightsMenu();
				do
				{
					cout << "Which height do you want:";
					option = GetOption();
				}while(option < 0 || option > 60 && option != 0);

				//Hopefully this works too that I can stop using the 600 line switch way
				if(option != 0)
					setallheights(tempmapfile,mapheight,mapwidth,(unsigned char)(option)-1);
				//changeheight(tempmapfile,mapheight,mapwidth,option);

			}while(option != 0);

			option = 1; //again if someone wants to do more than just change heights
			//And close everything
			if (run)
				savemap(tempmapfile, mapname, Buffer);
				delete[] tempmapfile;

			if (mapfile != NULL){
				fclose(mapfile);
				mapfile = NULL;
			}
		}break;

		//////////////////////////////////////////////
		//Option 6 - Place random objects on the map//
		//////////////////////////////////////////////
	case(6):
		{
			   //Open the File
			   //
			   run = openmap(mapfile, mapname, MAPFILE);

			   //Set my Array Buffer
			   //
			   if (run)
				   Buffer = GetBufferSize(mapfile);

			   //my Array
				if (run)
					tempmapfile = new unsigned char[Buffer]; //My array for the mapdata

			   //"Copy" the file into my Array
			   //
			   if (run)
				   fread(tempmapfile, Buffer, 1, mapfile);

			   //get the width and height of the map
			   //
			   if (run)
			   {
				   mapwidth = GetMapwidth(tempmapfile);
				   mapheight = GetMapheight(tempmapfile);
				   SizeWarning(mapwidth, mapheight);
			   }

			   if (run)
			   {
				   cout << "Use own userseed? (1 = yes, else = no)" << endl;
				   option = GetOption();
				   if (option == 1)
					   userseed = GetUserSeed();

				   cout << "Place Trees? (1 = yes, else = no)" << endl;
				   option = GetOption();
				   if (option == 1)
					   RandomTrees(tempmapfile, mapheight, mapwidth, userseed);
				   cout << "Place Objects? (1 = yes, else = no)" << endl;
				   option = GetOption();
				   if (option == 1)
					   RandomObjects(tempmapfile, mapheight, mapwidth, userseed);
				   cout << "Place Granite? (1 = yes, else = no)" << endl;
				   option = GetOption();
				   if (option == 1)
					   RandomGranite(tempmapfile, mapheight, mapwidth, userseed);
				   cout << "Place Animals? (1 = yes, else = no)" << endl;
				   option = GetOption();
				   if (option == 1)
					   RandomAnimals(tempmapfile, mapheight, mapwidth, userseed);
				   cout << "Place Resources? (1 = yes, else = no)" << endl;
				   option = GetOption();
				   if (option == 1)
					   PlaceRandomResources(tempmapfile, mapwidth, mapheight);
			   }

			   if (run){
				   savemap(tempmapfile, mapname, Buffer);
				   delete[] tempmapfile;
			   }

			   if (mapfile != NULL){
				   fclose(mapfile);
				   mapfile = NULL;
			   }
			   option = 1;
		}break;

		//////////////////////////////////////
		//Option 7 - Set some random heights//
		//////////////////////////////////////
	case(7):
		{
			cout << "Random set heights tool is still under construction" << endl;
			cout << "Just works for all areas and not for water, there are no special heights (mountains,desert etc.)" << endl;

			//Open the File
			//
			run = openmap(mapfile, mapname, MAPFILE);

			//Set my Array Buffer
			//
			if (run)
				Buffer = GetBufferSize(mapfile);

			//my Array
			//
			if (run)
				tempmapfile = new unsigned char[Buffer]; //My array for the mapdata

			//"Copy" the file into my Array
			//
			if (run)
				fread(tempmapfile, Buffer, 1, mapfile);

			//get the width and height of the map
			//
			if (run)
			{
				mapwidth = GetMapwidth(tempmapfile);
				mapheight = GetMapheight(tempmapfile);
				SizeWarning(mapwidth, mapheight);
			}

			//we need a seed for our work with the map
			if (run)
				userseed = GetUserSeed();

			if (run)
			Random(userseed,true); //first start of the random number generator, means we have to "restart" it!

			for(i=0;i<mapheight;i++)
			{
				for(j=0;j<mapwidth;j++)
				{
					unsigned char height = RandomAllHeights(tempmapfile,mapheight,mapwidth,i,j,userseed);
					setHeight(tempmapfile,height,mapheight,mapwidth,i,j);
				}
			}
			if (run){
				savemap(tempmapfile, mapname, Buffer);
				delete[] tempmapfile;
			}

			if (mapfile != NULL)
			{
				fclose(mapfile);
				mapfile = NULL;
			}

			option = 1;

		}break;

		//////////////////////////////
		//Option 8 - Random Map Tool//
		//////////////////////////////
	case(8):
		{
			//Well, this tool will need some time
			//Added a new struct for my map options (see consts.hpp)
			//MapOptions Options;
			MapOptions Options={1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,false,18,19,20};

			//and fill them with my information
			Options = SetRandomOptions(Options);

			cout << "- Mapsizes -" << endl;
			cout << "Please enter Mapwidth: ";
			mapwidth = (int)GetOption();
			cout << "Please enter Mapheight: ";
			mapheight = (int)GetOption();


			//Get the Userseed of the user
			Options.userseed = GetUserSeed();
			//and restart the Randomgen
			Random(Options.userseed,true);

			//Open the File
			//
			//run = openmap(mapfile, mapname, MAPFILE);

			//Set my Array Buffer
			//
			//if (run)
			//	Buffer = GetBufferSize(mapfile);
			Buffer = CalculateBufferSize(mapwidth, mapheight);

			//my Array
			//if (run)
			tempmapfile = new unsigned char[Buffer]; //My array for the mapdata

			GenerateMap(tempmapfile, mapwidth, mapheight);

			//"Copy" the file into my Array
			//
			//if (run)
			//	fread(tempmapfile, Buffer, 1, mapfile);

			//get the width and height of the map
			//
			if (run)
			{
				//mapwidth = GetMapwidth(tempmapfile);
				//mapheight = GetMapheight(tempmapfile);
				SizeWarning(mapwidth, mapheight);
			}

			if (run)
				Options = SetInformation(Options,mapwidth,mapheight);

			//Now I will also create an array for each part
			int *tempmapparts = new int[Options.map_parts];

			if (run)
				RandomMapParts(tempmapparts,Options);

			//Testing if everything works how it should...
			//I wish myself good luck //Yep it worked :>
			if (run)
			{
				for (row = 0; row < ((mapheight - Options.border_size_y) / Options.patch_size_y); row++)
				{
					for (id = 0; id < ((mapwidth - Options.border_size_x) / Options.patch_size_x); id++)
					{
						//If this works fine now I would be really happy... but I don't think :D
						PlacePatches(tempmapfile, tempmapparts, row, id, Options);
					}
					//cout << endl;
				}
			}

			cout << endl;

			if (run)
			{
				//Adding some objects
				Random(userseed, true);
				RandomObjects(tempmapfile, mapheight, mapwidth, userseed);

				//Adding some Trees... Hopefully?
				Random(userseed, true);
				RandomTrees(tempmapfile, mapheight, mapwidth, userseed);

				//Adding granite
				Random(userseed, true);
				RandomGranite(tempmapfile, mapheight, mapwidth, userseed);

				//Adding some animals
				Random(userseed, true);
				RandomAnimals(tempmapfile, mapwidth, mapheight, userseed);

				//Adding some random heights for now
				//Random(userseed, true); //first start of the random number generator, means we have to "restart" it!

				PlaceRandomResources(tempmapfile, mapwidth, mapheight);

				for (i = 0; i < mapheight; i++)
				{
					for (j = 0; j < mapwidth; j++)
					{
						unsigned char height = RandomAllHeights(tempmapfile, mapheight, mapwidth, i, j, userseed);
						setHeight(tempmapfile, height, mapheight, mapwidth, i, j);
					}
				}
			}

			//PlacePlayersRandomMap(tempmapfile,tempmapparts,patches_x,patches_y,userseed,player_count,mapwidth,mapheight,border_size_x,border_size_y,patch_size_x,patch_size_y);
			if (run){
				savemap(tempmapfile, "Gen.wld", Buffer);
				delete[] tempmapfile;
			}

			if (mapfile != NULL){
				fclose(mapfile);
				mapfile = NULL;
			}

			delete[] tempmapparts;	//And lets get rid of that temporary "map" file
			option = 1;

		}break;

		/////////////////////////////////////////
		//Option 09 - Use an Heightmap for maps//
		/////////////////////////////////////////
	case(9):
		{
			cout << "Let's add some Heightmaps..." << endl;

			////////////////////
			//Open the Mapfile//
			////////////////////

			//Open the File
			//
			run = openmap(mapfile, mapname, MAPFILE);

			//Set my Array Buffer
			//
			if (run)
				Buffer = GetBufferSize(mapfile);

			//my Array
			//
			//if (run)
			//	tempmapfile = new unsigned char[Buffer]; //My array for the mapdata
			unsigned char *tempmapfile = new unsigned char[Buffer];

			//"Copy" the file into my Array
			//
			if (run)
				fread(tempmapfile, Buffer, 1, mapfile);

			////////////
			//BMP file//
			////////////

			//Open the File
			//
			run = openmap(bmpfile, bmpname, BMPFILE);


			//Set my Array Buffer
			//
			if (run)
				Bufferbmp = GetBufferSize(bmpfile);

			//if someone wants to use the tool more than 1 time
			swdid = 0;

			//my Array
			//
			unsigned char *tempbmpfile = new unsigned char[Bufferbmp]; //My array for the mapdata

			//"Copy" the file into my Array
			//
			if (run)
				fread(tempbmpfile, Bufferbmp, 1, bmpfile);

			if (run)
			{
				mapwidth = GetMapwidth(tempmapfile);
				mapheight = GetMapheight(tempmapfile);

				bmpwidth = GetBmpwidth(tempbmpfile);
				bmpheight = GetBmpheight(tempbmpfile);			

				run = CheckBmpSizes(bmpwidth, bmpheight);
				run = CheckFileSizes(mapwidth, bmpwidth, mapheight, bmpheight);

				SizeWarning(mapwidth, mapheight);
			}

			////////////
			//Map Part//
			////////////

			if (run){
				FetchHeightMap(tempmapfile, tempbmpfile, Bufferbmp);
			}

			//Save the map and close the files
			if (run){
				savemap(tempmapfile, mapname, Buffer);
				//delete[] tempmapfile;
			}

			if (mapfile != NULL){
				fclose(mapfile);
				mapfile = NULL;
			}
			if (bmpfile != NULL){
				fclose(bmpfile);
				bmpfile = NULL;
			}

			delete[] tempbmpfile;	
			delete[] tempmapfile;

			option = 1;
		}break;

	case(10):
	{
				/////////////////////////////////////
				//Option 10 - Random-Resources-Tool//
				/////////////////////////////////////
				cout << "10 - Random-Resources-Tool(WIP)" << endl;
				cout << "This Tool will add some random resources to your map" << endl;

				////////////////////
				//Open the Mapfile//
				////////////////////

				//Open the File
				//
				run = openmap(mapfile, mapname, MAPFILE);


				//Set my Array Buffer
				//
				if (run)
					Buffer = GetBufferSize(mapfile);

				//my Array
				//
				if(run)
					tempmapfile = new unsigned char[Buffer]; //My array for the mapdata

				//"Copy" the file into my Array
				//
				if (run)
					fread(tempmapfile, Buffer, 1, mapfile);

				if (run)
				{
					mapwidth = GetMapwidth(tempmapfile);
					mapheight = GetMapheight(tempmapfile);
					SizeWarning(mapwidth, mapheight);
				}

				//Place Random Resources
				if (run)
					PlaceRandomResources(tempmapfile,mapwidth, mapheight);

				//Save the map and close the files
				if (run){
					savemap(tempmapfile, mapname, Buffer);
					delete[] tempmapfile;
				}

				if (mapfile != NULL)
				{
					fclose(mapfile);
					mapfile = NULL;
				}

				option = 1;
	}break;


		/////////////////////////////////////
		//Option 11 - Show some information//
		/////////////////////////////////////
	case(11):
		{
			cout << "Information about my Program" << endl;
			cout << "---------------------------" << endl;
			cout << "Program was written by Spikeone(www.rttr.info). You should only use it for Return to the Roots map, SettlersII maps are still untested" << endl;
			cout << "Use this Program at your own risk. If you use the program wrong I can't ensure that everything wents okay. I tested program a several times but you can never be sure." << endl;
			cout << "If you want to contact me: 'fvv1@gmx.de'" << endl;
		}break;

		//////////////////////////////////////
		//Option 12 - Testing Random numbers//
		//////////////////////////////////////
	case(12):
		{
			cout << "Nothing here!" << endl;
			////////////////////
			//Open the Mapfile//
			////////////////////

			mapwidth = 32;
			mapheight = 32;

			Buffer = CalculateBufferSize(mapwidth, mapheight);

			tempmapfile = new unsigned char[Buffer];

			GenerateMap(tempmapfile,mapwidth,mapheight);

			savemap(tempmapfile, "test.wld", Buffer);

			if (mapfile != NULL)
			{
				fclose(mapfile);
				mapfile = NULL;
			}

			delete[] tempmapfile;

			option = 1;


		}break;
	default:
		{
			cout << "Error: not an option" << endl;
		}
	}
	}while(option != 0);//while(mainoption != 0);

	return 0;
}