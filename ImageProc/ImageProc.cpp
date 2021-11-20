#include <iostream>
#include <fstream>
#include <string>
#include "ImageProc.h"

using namespace std;

ifstream image;
string header, input;
int width, height, max_val, choice;

void print_filters() {
	cout << "	0 --- Gaussian Blur\n";
}

int main() {
	// will only accept .ppm P3 format!
	cout << "Would you like to create some test .ppm files? y/n: ";
	cin >> input;
	if (input == "y") {
		int w, h;
		cout << "Enter the desired dimensions (in pixels)\nWidth: ";
		cin >> w;
		cout << "Height: ";
		cin >> h;
		create_tests(w, h);
		cout << "Test files grid.ppm, circle.ppm, & gradient.ppm created successfully.\n\n";
	}

	cout << "Enter file name to open (please include .ppm extension): ";
	cin >> input;
	cout << "Opening " << input << "...\n";
	image.open(input);
	
	if (!image) {
		cout << "File not found" << endl;
		exit(1); // terminate with error
	}

	cout << "File opened successfully.\n\nLoading file data into program...\n";

	image >> header; // "P3" header, we know it's a P3 already tho
	image >> width; // get width in pixels
	image >> height; // get height in pixels
	image >> max_val; // get max value of pixels

	// allocate memory to store data:
	// will be stored in a single line, rather than two-dimensionally, and in blocks of 3 (for the R, G, & B values.
	// [RGB][RGB][RGB][RGB][RGB][RGB][RGB][RGB]...
	int* data = new int[width * height * 3];
	// begin reading in pixel values now
	{
		int n = 0;
		while (image >> data[n++])
			; // do nothing in the loop, everything is handled in the conditional statement
	}

	image.close();
	cout << "Completed.\n\n";
	// all pixel values have been loaded into data[]

	cout << "Make a choice of filter:\n";
	print_filters();
	cout << "Choice: ";
	cin >> choice;
	switch (choice) {
	case 0:
		do {
			cout << "\nLevel of Gaussian blur (positive number): ";
			cin >> choice;
		} while (choice <= 0);
		cout << "\nOutput filename (please include .ppm extension): ";
		cin >> input;
		gaussian_blur(data, width, height, input, choice);
		break;
	default:
		cout << "Invalide choice\n";
	}

	delete[] data;
	return 0;
}