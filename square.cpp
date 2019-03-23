// Author name:   Molita   Nuon
// Program name:  How to Average Integers
// Names of files in this programming:  driver.cpp, controller.asm, display.c, compute_mean.asm, square.cpp
// Course number: CPSC 240
// Scheduled delivery date:  March 7, 2019
// Program purpose:  Software to assist teachers in computing a class average.
// Status: Finished.  No known bugs
// Date of last modification:  February 20, 2019
// Information about this module: Square the data in an array
// This module purpose:  Square for How to Average Integers
// File name of this module:  square.cpp
// Compile this module: g++ -g -Wall -c square.cpp
// Link this module with other objects:

#include <iostream>
using namespace std;

extern "C" void square(long arr[], long int size);
void square(long arr[], long int size)
{
    long int i = 0;
    for(i = 0; i < size; i++)
      arr[i] = arr[i] * arr[i];

}
