#include<iostream>
#include<string>
#include<time.h>
using namespace std;

string letters = "ooABCDEFGHIJ";
bool field[12][13];
bool ofield[12][13];
char display[12][13];
char odisplay[12][13];
bool picked[12][13];
bool struck[12][13];
string coordinates;
int x;
size_t y;
int length;
int l;
int r;
int up;
int down;
int hits = 0;
int ouches = 0;
string you;

//identifies whether or not you hit an enemy ship
bool youHit() {
	if (ofield[x][y]) {
		ofield[x][y] = false;
		return true;
	}
	else {
		return false;
	}
}

//same deal except vice versa
bool computerHit() {
	if (field[x][y]) {
		field[x][y] = false;
		return true;
	}
	else {
		return false;
	}
}

//converts input coordinates into processable coordinates for the arrays
void convertCoordinates() {
	coordinates[0] = toupper(coordinates[0]);
	x = coordinates[1] - '0';
	x = x + 1;
	y = letters.find_first_of(coordinates[0]);
}

//prints the two arrays display and odisplay side by side the way they are at the moment
void printfield() {
	cout << endl << endl << endl << endl << endl << endl << endl << endl << endl << endl << endl;
	cout << "                  B A T T L E S H I P                  " << endl << endl;
	for (int j = 0; j < 13; j++) {
		//display
		for (int i = 0; i < 12; i++) {
			//letters A-J on left hand side
			if (i == 0 && j < 12 && j > 1) {
				cout << letters[j] << ' ' << display[i][j] << ' ';
			}
			else if (i == 0) {
				cout << "  " << display[i][j] << ' ';
			}
			else {
				cout << display[i][j] << ' ';
			}
		}
		//"wall" between the two displays
		cout << "||| ";
		//odisplay
		for (int i = 0; i < 12; i++) {
			//letters A-J on left-hand side
			if (i == 0 && j < 12 && j > 1) {
				cout << letters[j] << ' ' << odisplay[i][j] << ' ';
			}
			else if (i == 0) {
				cout << "  " << odisplay[i][j] << ' ';
			}
			else {
				cout << odisplay[i][j] << ' ';
			}
		}
		cout << endl;
	}
	//orients the name entered
	int spacesLeft;
	int spacesRight;
	//name has an odd # of letters
	if (you.size() % 2 == 1) {
		spacesLeft = (23 - you.size()) / 2;
		spacesRight = spacesLeft;
	}
	//name has an even # of letters
	else {
		spacesLeft = ((23 - you.size()) - 1) / 2;
		spacesRight = spacesLeft + 1;
	}
	//name below display
	cout << "  ";
	for (int i = 0; i < spacesLeft; i++) {
		cout << ' ';
	}
	cout << you;
	for (int i = 0; i < spacesRight; i++) {
		cout << ' ';
	}
	cout << "       ";
	cout << "  The Flying Dutchman  " << endl;
}

//changes the character at (x, y) in odisplay to 'X' or 'O' depending on hit or miss
void youShoot() {
	if (youHit()) {
		odisplay[x][y] = 'X';
		printfield();
		cout << "Dutchman: AAAARGH! Right in the poopdeck!" << endl;
		hits++;
	}
	else {
		odisplay[x][y] = 'O';
		printfield();
		cout << "Dutchman: Ye missed me, Scallywag!" << endl;
	}
}

//50-50 chance for yes or no decisions in logic
bool coinflip() {
	int flip = rand() % 2;
	if (flip == 0) {
		return true;
	}
	else {
		return false;
	}
}

//put logic in this function
void pickCoordinates() {
	time_t begin = time(0);
	bool found = false;
	for (int i = 1; i < 11; i++) {
		for (int j = 2; j < 12; j++) {
			if (picked[i][j] && struck[i][j]) {
				if (struck[i + 1][j]) {
					if (!(picked[i - 1][j]) && i != 1) {
						if (struck[i + 2][j] && struck[i + 3][j] && struck[i + 4][j]) {
							if (coinflip()) {
								x = i - 1;
								y = j;
								found = true;
								break;
							}
						}
						else {
							x = i - 1;
							y = j;
							found = true;
							break;
						}
					}
				}
				else if (struck[i][j + 1]) {
					if (!(picked[i][j - 1]) && j != 2) {
						if (struck[i][j + 2] && struck[i][j + 3] && struck[i][j + 4]) {
							if (coinflip()) {
								x = i;
								y = j - 1;
								found = true;
								break;
							}
						}
						else {
							x = i;
							y = j - 1;
							found = true;
							break;
						}
					}
				}
				else if (struck[i - 1][j]) {
					if (!(picked[i + 1][j]) && i != 10) {
						if (struck[i - 2][j] && struck[i - 3][j] && struck[i - 4][j]) {
							if (coinflip()) {
								x = i + 1;
								y = j;
								found = true;
								break;
							}
						}
						else {
							x = i + 1;
							y = j;
							found = true;
							break;
						}
					}
				}
				else if (struck[i][j - 1]) {
					if (!(picked[i][j + 1]) && j != 11) {
						if (struck[i][j - 2] && struck[i][j - 3] && struck[i][j - 4]) {
							if (coinflip()) {
								x = i;
								y = j + 1;
								found = true;
								break;
							}
						}
						else {
							x = i;
							y = j + 1;
							found = true;
							break;
						}
					}
				}
				else {
					if (!(picked[i + 1][j]) && i != 10) {
						if (picked[i][j + 1] && picked[i][j - 1] && (struck[i][j + 1] || struck[i][j - 1])) {
							if (coinflip()) {
								x = i + 1;
								y = j;
								found = true;
								break;
							}
						}
						else {
							x = i + 1;
							y = j;
							found = true;
							break;
						}
					}
					else if (!(picked[i][j + 1]) && j != 11) {
						if (picked[i + 1][j] && picked[i - 1][j] && (struck[i + 1][j] || struck[i - 1][j])) {
							if (coinflip()) {
								x = i;
								y = j + 1;
								found = true;
								break;
							}
						}
						else {
							x = i;
							y = j + 1;
							found = true;
							break;
						}
					}
					else if (!(picked[i - 1][j]) && i != 1) {
						if (picked[i][j + 1] && picked[i][j - 1] && (struck[i][j + 1] || struck[i][j - 1])) {
							if (coinflip()) {
								x = i - 1;
								y = j;
								found = true;
								break;
							}
						}
						else {
							x = i - 1;
							y = j;
							found = true;
							break;
						}
					}
					else if (!(picked[i][j - 1]) && j != 2) {
						if (picked[i + 1][j] && picked[i - 1][j] && (struck[i + 1][j] || struck[i - 1][j])) {
							if (coinflip()) {
								x = i;
								y = j - 1;
								found = true;
								break;
							}
						}
						else {
							x = i;
							y = j - 1;
							found = true;
							break;
						}
					}
				}
			}
			if (found) {
				break;
			}
		}
	}
	if (!(found)) {
		do {
			x = (rand() % 10) + 1;
			if (x % 2 == 0)
				y = ( 2 * (rand() % 5)) + 2;
			else
				y = (2 * (rand() % 5)) + 3;
		} while (picked[x][y]);
	}
	time_t finish = time(0);
	if (finish - begin < 5) {
		int gap = 5 - (finish - begin);
		time_t previous = time(0);
		time_t now = time(0);
		while (now - previous < gap) {
			now = time(0);
		}
	}
}

//if the Dutchman hits a ship this changes the character at that spot to 'X'
void computerShoot() {
	pickCoordinates();
	if (computerHit()) {
		display[x][y] = 'X';
		printfield();
		cout << "Dutchman: Haha! Say your prayers, landlubber!" << endl;
		ouches++;
		struck[x][y] = true;
	}
	else {
		printfield();
		cout << "Dutchman: Barnacles! That shot went straight to Davy Jones' Locker!" << endl;
	}
	picked[x][y] = true;
}

//"pinpoints" the coordinates entered. Detects how much room there is to the left, right, up, and down
void pinpoint() {
	l = 0;
	r = 0;
	up = 0;
	down = 0;
	int minr = 15;
	int mindown = 15;

	for (int i = 1; i < 12; i++) {
		if (display[i][y] == ' ') {
			display[i][y] = '-';
			if (i < x) {
				l++;
			}
			else if (i > x) {
				r++;
			}
		}
		else if (i < x) {
			l = 0;
		}
		else if (i > x) {
			if (r < minr) {
				minr = r;
			}
		}
	}
	for (int j = 2; j < 13; j++) {
		if (display[x][j] == ' ') {
			display[x][j] = '|';
			if (j < y) {
				up++;
			}
			else if (j > y) {
				down++;
			}
		}
		else if (j < y) {
			up = 0;
		}
		else if (j > y) {
			if (down < mindown) {
				mindown = down;
			}
		}
	}
	r = minr;
	down = mindown;
	if (display[x][y] == '-' || display[x][y] == '|') {
		display[x][y] = '+';
	}
}

//clears the pinpoint characters from display
void undoPinpoint() {
	for (int i = 1; i < 11; i++) {
		for (int j = 2; j < 12; j++) {
			if (display[i][j] == '-' || display[i][j] == '|' || display[i][j] == '+') {
				display[i][j] = ' ';
			}
		}
	}
}

//sets every value in ofield back to false: used in case of unexplained error
void resetofield() {
	for (int jj = 1; jj < 11; jj++) {
		for (int ii = 2; ii < 11; ii++) {
			ofield[ii][jj] = false;
		}
	}
}

//Dutchman places ships in random orientations and in random places
void setup() {
	int length;
	int error = 0;
	cout << "Dutchman placing ships..." << endl;
	while (error != 17) {
		error = 0;
		for (int ship = 1; ship < 6; ship++) {
			if (ship == 1) {
				length = 5;
				cout << "placing carrier..." << endl;
			}
			else if (ship == 2) {
				length = 4;
				cout << "placing battleship..." << endl;
			}
			else if (ship == 3) {
				length = 3;
				cout << "placing cruiser..." << endl;
			}
			else if (ship == 4) {
				length = 3;
				cout << "placing submarine..." << endl;
			}
			else if (ship == 5) {
				length = 2;
				cout << "placing destroyer..." << endl;
			}

			//generate random coordinates
			do {
				x = rand() % 10 + 1;
				y = rand() % 10 + 2;

				pinpoint();
				undoPinpoint();

			} while (ofield[x][y] || (up < length - 1 && down < length - 1 && r < length - 1 && l < length - 1));
			//rejects invalid coordinates (on another ship or not enough room in any direction to place ship)

			bool notdone = true;
			while (notdone) {
				//generates random direction
				int dir = rand() % 4 + 1;
				//up
				if (dir == 1) {
					if (up >= length - 1) {
						for (int j = y; j > y - length; j--) {
							ofield[x][j] = true;
							error++;
						}
						notdone = false;
					}
				}
				//down
				else if (dir == 2) {
					if (down >= length - 1) {
						for (int j = y; j < y + length; j++) {
							ofield[x][j] = true;
							error++;
						}
						notdone = false;
					}
				}
				//right
				else if (dir == 3) {
					if (r >= length - 1) {
						for (int i = x; i < x + length; i++) {
							ofield[i][y] = true;
							error++;
						}
						notdone = false;
					}
				}
				//left
				else if (dir == 4) {
					if (l >= length - 1) {
						for (int i = x; i > x - length; i--) {
							ofield[i][y] = true;
							error++;
						}
						notdone = false;
					}
				}
			}
			/*Unexpected error was encountered during development:
			Dutchman would occasionally places ships of lengths 5, 4, 4, and 2,
			rather than 5, 4, 3, 3, and 2.
			To fix this, counter "error" was added for each time ofield was made true.
			When error is not equal to 17 after the last ship is placed, ofield resets
			and the Dutchman generates another orientation for the ships.
			In other words, if the Dutchman does not place the right # of ships, he will try again*/
			if (ship == 5 && error != 17) {
				cout << "ERROR DETECTED" << endl << "Restarting setup..." << endl;
				resetofield();
			}
		}
	}
}

int main() {
	srand(time(NULL));

	//initialize the arrays
	for (int j = 0; j < 13; j++) {
		for (int i = 0; i < 12; i++) {
			//every value in these is set to false
			field[i][j] = false;
			ofield[i][j] = false;
			picked[i][j] = false;
			struck[i][j] = false;
			//top corners should be left blank
			if ((i == 0 && j == 0) || (i == 11 && j == 0)) {
				display[i][j] = ' ';
				odisplay[i][j] = ' ';
			}
			//0-9 on top
			else if (j == 0) {
				display[i][j] = '0' + (i - 1);
				odisplay[i][j] = '0' + (i - 1);
			}
			//border
			else if (i == 0 || i == 11 || j == 1 || j == 12) {
				display[i][j] = '*';
				odisplay[i][j] = '*';
			}
			//everywhere else is left blank
			else {
				display[i][j] = ' ';
				odisplay[i][j] = ' ';
			}
		}
	}

	cout << "                          R U L E S:" << endl;
	cout << "OBJECTIVE:" << endl;
	cout << "   Take out the Flying Dutchman's ships before they take out yours." << endl;
	cout << "PLACING YOUR SHIPS:" << endl;
	cout << "   Designate where you would like to place the end of your ship and then" << endl;
	cout << "   which direction (up, down, right, or left) you would like to" << endl;
	cout << "   direct the ship's length" << endl;
	cout << "ENTERING COORDINATES:" << endl;
	cout << "   Format: LETTER (A-J) NUMBER (0-9)" << endl;
	cout << "   Example: D6" << endl;
	cout << "NOTES:" << endl;
	cout << "  -The game might take a little bit to start and" << endl;
	cout << "   the computer may take some time to make its" << endl;
	cout << "   decision, just give it time" << endl;
	cout << "  -Make sure when placing your ship you enter a" << endl;
	cout << "   number if asked for a number and a coordinate if" << endl;
	cout << "   asked for a coordinate" << endl;
	cout << "Enter a name to begin" << endl;

	getline(cin, you); //enter a name
	while (you.size() > 23) {
		cout << "Name must be 23 characters or less, please try again" << endl;
		getline(cin, you);
	}

	//computer places ships
	setup();

	int carrier = 1;
	int battleship = 1;
	int cruiser = 1;
	int submarine = 1;
	int destroyer = 1;
	int ship;

	//you place ships
	while (carrier == 1 || battleship == 1 || cruiser == 1 || submarine == 1 || destroyer == 1) {
		bool invalid = true;
		while (invalid) {
			printfield();
			cout << "Select a ship to place by its number" << endl;
			cout << "SHIP TYPES (and length):" << endl;
			//only displays ship if it has not yet been placed
			if (carrier == 1) {
				cout << "1. Carrier (5)" << endl;
			}
			else {
				cout << "OUT OF STOCK" << endl;
			}
			if (battleship == 1) {
				cout << "2. Battleship (4)" << endl;
			}
			else {
				cout << "OUT OF STOCK" << endl;
			}
			if (cruiser == 1) {
				cout << "3. Cruiser (3)" << endl;
			}
			else {
				cout << "OUT OF STOCK" << endl;
			}
			if (submarine == 1) {
				cout << "4. Submarine (3)" << endl;
			}
			else {
				cout << "OUT OF STOCK" << endl;
			}
			if (destroyer == 1) {
				cout << "5. Destroyer (2)" << endl << endl;
			}
			else {
				cout << "OUT OF STOCK" << endl;
			}
			std::cin >> ship;
			cout << endl;

			//negates invalid # entries
			while (ship < 1 || ship > 5) {
				printfield();
				cout << "SHIP TYPES (and length):" << endl;
				if (carrier == 1) {
					cout << "1. Carrier (5)" << endl;
				}
				else {
					cout << "OUT OF STOCK" << endl;
				}
				if (battleship == 1) {
					cout << "2. Battleship (4)" << endl;
				}
				else {
					cout << "OUT OF STOCK" << endl;
				}
				if (cruiser == 1) {
					cout << "3. Cruiser (3)" << endl;
				}
				else {
					cout << "OUT OF STOCK" << endl;
				}
				if (submarine == 1) {
					cout << "4. Submarine (3)" << endl;
				}
				else {
					cout << "OUT OF STOCK" << endl;
				}
				if (destroyer == 1) {
					cout << "5. Destroyer (2)" << endl << endl;
				}
				else {
					cout << "OUT OF STOCK" << endl;
				}
				cout << "Try again. Enter a number between 1 and 5" << endl;
				std::cin >> ship;
				cout << endl;
			}

			//sets length of = to be placed based on ship choice or rejects the choice if the ship has already been taken
			if (ship == 1) {
				if (carrier == 1) {
					length = 5;
					carrier = carrier - 1;
					invalid = false;
				}
				else {
					cout << "You have already placed the carrier" << endl;
				}
			}
			else if (ship == 2) {
				if (battleship == 1) {
					length = 4;
					battleship = battleship - 1;
					invalid = false;
				}
				else {
					cout << "You have already placed the battleship" << endl;
				}
			}
			else if (ship == 3) {
				if (cruiser == 1) {
					length = 3;
					cruiser = cruiser - 1;
					invalid = false;
				}
				else {
					cout << "You have already placed the cruiser" << endl;
				}
			}
			else if (ship == 4) {
				if (submarine == 1) {
					length = 3;
					submarine = submarine - 1;
					invalid = false;
				}
				else {
					cout << "You have already placed the submarine" << endl;
				}
			}
			else if (ship == 5) {
				if (destroyer == 1) {
					length = 2;
					destroyer = destroyer - 1;
					invalid = false;
				}
				else {
					cout << "You have already placed the destroyer" << endl;
				}
			}
		}

		printfield();

		//accepts coordinates for where you are placing an end of the selected ship
		cout << "Pick a point to place the end of the ";
		if (ship == 1) {
			cout << "carrier";
		}
		else if (ship == 2) {
			cout << "battleship";
		}
		else if (ship == 3) {
			cout << "cruiser";
		}
		else if (ship == 4) {
			cout << "submarine";
		}
		else if (ship == 5) {
			cout << "destroyer";
		}
		cout << endl << endl << endl << endl << endl << endl << endl << endl;

		cin >> coordinates;
		convertCoordinates();
		pinpoint();

		//rejects any invalid coordinates (off the map, incorrect syntax, or there is another ship in the way)
		while (coordinates.size() != 2 || coordinates.find_first_of("ABCDEFGHIJ") > 0 || display[x][y] == '=' || (up < length - 1 && down < length - 1 && r < length - 1 && l < length - 1)) {
			undoPinpoint();
			printfield();
			cout << "That point won't work. Try another" << endl << endl << endl << endl << endl << endl << endl << endl;
			std::cin >> coordinates;
			convertCoordinates();
			pinpoint();
		}

		//chooses the diresction in which to extend the selected ship from the selected point
		bool notdone = true;
		while (notdone) {
			printfield();
			cout << "From that point, in which direction would you like to place the ";
			if (ship == 1) {
				cout << "carrier?";
			}
			else if (ship == 2) {
				cout << "battleship?";
			}
			else if (ship == 3) {
				cout << "cruiser?";
			}
			else if (ship == 4) {
				cout << "submarine?";
			}
			else if (ship == 5) {
				cout << "destroyer?";
			}
			cout << endl;

			//won't display an option if it intersects another ship or the border of the map
			if (up >= length - 1) {
				cout << "1. Up" << endl;
			}
			else {
				cout << "Can't go up from here" << endl;
			}
			if (down >= length - 1) {
				cout << "2. Down" << endl;
			}
			else {
				cout << "Can't go down from here" << endl;
			}
			if (r >= length - 1) {
				cout << "3. Right" << endl;
			}
			else {
				cout << "Can't go right from here" << endl;
			}
			if (l >= length - 1) {
				cout << "4. Left" << endl;
			}
			else {
				cout << "Can't go left from here" << endl;
			}
			cout << endl << endl << endl;

			int dir;
			cin >> dir;

			//rejects any invalid # entries
			while (dir < 1 || dir > 4) {
				printfield();
				cout << "From that point, in which direction would you like to place the ";
				if (ship == 1) {
					cout << "carrier?";
				}
				else if (ship == 2) {
					cout << "battleship?";
				}
				else if (ship == 3) {
					cout << "cruiser?";
				}
				else if (ship == 4) {
					cout << "submarine?";
				}
				else if (ship == 5) {
					cout << "destroyer?";
				}
				cout << endl;
				if (up >= length - 1) {
					cout << "1. Up" << endl;
				}
				else {
					cout << "Can't go up from here" << endl;
				}
				if (down >= length - 1) {
					cout << "2. Down" << endl;
				}
				else {
					cout << "Can't go down from here" << endl;
				}
				if (r >= length - 1) {
					cout << "3. Right" << endl;
				}
				else {
					cout << "Can't go right from here" << endl;
				}
				if (l >= length - 1) {
					cout << "4. Left" << endl;
				}
				else {
					cout << "Can't go left from here" << endl << endl;
				}
				cout << "Enter a number between 1 and 4" << endl << endl << endl;
				cin >> dir;
			}

			//up
			if (dir == 1) {
				if (up >= length - 1) {
					undoPinpoint();
					for (int j = y; j > y - length; j--) {
						display[x][j] = '=';
						field[x][j] = true;
					}
					notdone = false;
				}
			}
			//down
			else if (dir == 2) {
				if (down >= length - 1) {
					undoPinpoint();
					for (int j = y; j < y + length; j++) {
						display[x][j] = '=';
						field[x][j] = true;
					}
					notdone = false;
				}
			}
			//right
			else if (dir == 3) {
				if (r >= length - 1) {
					undoPinpoint();
					for (int i = x; i < x + length; i++) {
						display[i][y] = '=';
						field[i][y] = true;
					}
					notdone = false;
				}
			}
			//left
			else if (dir == 4) {
				if (l >= length - 1) {
					undoPinpoint();
					for (int i = x; i > x - length; i--) {
						display[i][y] = '=';
						field[i][y] = true;
					}
					notdone = false;
				}
			}
		}
	}

	printfield();

	//game time
	cout << "                F I R E   A T   W I L L" << endl;
	while (1) {
		cout << "Your turn, " << you << ". Enter the coordinates for your shot" << endl << endl << endl << endl << endl << endl << endl;
		cin >> coordinates;
		coordinates[0] = toupper(coordinates[0]);
		convertCoordinates();

		//rejects invalid coordinate entries (incorrect syntax, outside of map, or already picked)
		while (coordinates.size() != 2 || coordinates.find_first_of("ABCDEFGHIJ") > 0 || odisplay[x][y] != ' ') {
			printfield();
			cout << "That point won't work. Try another" << endl << endl << endl << endl << endl << endl << endl << endl;
			std::cin >> coordinates;
			convertCoordinates();
		}
		youShoot();

		//all enemy ships taken out at 17 hits, so victory statement prints
		if (hits == 17) {
			printfield();
			cout << endl << endl << endl << "                V I C T O R Y" << endl << endl << endl << endl << endl; //not sure about # of endl's 
			break;
		}

		//Flying Dutchman picks a point and fires based off of the current situation
		cout << "Alright, it's the Flying Dutchman's turn." << endl;
		cout << "Dutchman is thinking..." << endl << endl << endl << endl << endl << endl;
		computerShoot();

		//all ally ships taken out at 17 ouches, so defeat statement prints
		if (ouches == 17) {
			printfield();
			cout << endl << endl << endl << "                D E F E A T" << endl << endl << endl << endl << endl; //not sure about # of endl's
			break;
		}
	}

	std::system("pause");
	return 0;
}