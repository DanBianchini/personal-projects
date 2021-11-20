Hello, and thank you so much for taking the time to check out my projects!

This ImageProc directory is dedicated to a C++ program I have written from scratch that will be able to apply multiple different filters/effects to an image file in P3 .ppm format.

To use, compile & run ImageProc.cpp. Any .ppm files that will be used should be located within the same directory as ImageProc.cpp, unless specifying a path. Some .ppm files have already been included in the directory, however, the program will ask if you would like to generate some to use. Follow the instructions in the program and it will produce an output file with a .ppm extension containing the results.

To view a .ppm file, there are sources online that can display them, however, just for fun I've thrown together Viewer.java. Once compiled, it accepts a filename (.ppm) as the first command line argument. The program then displays the .ppm file (only works for P3!).

To compile & run Viewer.java from the command line, it will look something like:
$ javac Viewer.java
$ java Viewer <filename>.ppm

The program will run & open the specified file if it exists.

Enjoy!