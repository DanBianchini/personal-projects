#pragma once
#include <iostream>
#include <fstream>
#include <cmath>
#include <string>

using namespace std;

// converts (x, y, rgb) to precise index to make referencing easier
// rgb = 0 for RED, 1 for GREEN, 2 for BLUE
int cnvrt(int x, int y, int rgb, int width) {
	return 3 * (y * width + x) + rgb;
}

// creates three files: grid.ppm, circle.ppm, & gradient.ppm
void create_tests(int width, int height) {
	ofstream circle, grid, gradient;
	const int GRID_SIZE = 8;

	circle.open("circle.ppm");
	if (!circle.is_open()) {
		cout << "opening circle.ppm failed" << endl;
		exit(1);
	}
	grid.open("grid.ppm");
	if (!grid.is_open()) {
		cout << "opening grid.ppm failed" << endl;
		exit(1);
	}
	gradient.open("gradient.ppm");
	if (!gradient.is_open()) {
		cout << "opening gradient.ppm failed" << endl;
		exit(1);
	}

	// P3 header information
	circle << "P3\n" << width << ' ' << height << "\n255\n";
	grid << "P3\n" << width << ' ' << height << "\n255\n";
	gradient << "P3\n" << width << ' ' << height << "\n255\n";

	// pixel values
	for (int y = 0; y < height; y++) {
		for (int x = 0; x < width; x++) {
			// grid
			if ((x / (width / GRID_SIZE) + y / (width / GRID_SIZE)) % 2) // addition property: even + even = even // odd + odd = even // even + odd = odd // odd + even = odd
				grid << "0 0 0\n";
			else
				grid << "255 255 255\n";

			// circle
			int dist = sqrt(pow(x - width / 2, 2) + pow(y - height / 2, 2)) / (height / (2 * GRID_SIZE)); // distance from the center scaled down
			switch (dist % 3) { // r g b pattern repeats every three rings
			case 0:
				circle << "255 0 0\n";
				break;
			case 1:
				circle << "0 255 0\n";
				break;
			case 2:
				circle << "0 0 255\n";
				break;
			default:
				circle << "0 0 0\n";
			}

			// gradient
			double xscale = 256.0 / (double)width;
			double yscale = 256.0 / (double)height;
			gradient << "0 " << x * xscale << ' ' << y * yscale << endl;
		}
	}
	grid.close();
	circle.close();
	gradient.close();
}

// creates a .ppm file that is a blurred image of the one given
void gaussian_blur(int *data, int width, int height, string name, int level = 1) {
	ofstream output;

	cout << "Beginning Gaussian Blur...\n";

	output.open(name);
	if (!output.is_open()) {
		cout << "unable to open gaussian_blur.ppm\n";
		exit(1);
	}

	output << "P3\n" << width << ' ' << height << "\n255\n"; // assuming max value is 255, P3 ppm

	for (int y = 0; y < height; y++) {
		for (int x = 0; x < width; x++) {
			int rsum = 0, gsum = 0, bsum = 0, num = 0;
			for (int j = y - level; j <= y + level; j++)
				for (int i = x - level; i <= x + level; i++)
					if (((i >= 0) && (i < width)) && ((j >= 0) && (j < height))) {
						rsum += data[cnvrt(i, j, 0, width)];
						gsum += data[cnvrt(i, j, 1, width)];
						bsum += data[cnvrt(i, j, 2, width)];
						num++;
					}
			output << rsum / num << ' ' << gsum / num << ' ' << bsum / num << endl;
		}
	}

	output.close();
	cout << "Completed.\n\n";
}