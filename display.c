// Author name:   Molita   Nuon
// Program name:  How to Average Integers
// Names of files in this programming:  driver.cpp, controllor.asm, display.c, compute_mean.asm, square.cpp
// Course number: CPSC 240
// Scheduled delivery date:  March 7, 2019
// Program purpose:  Software to assist teachers in computing a class average.
// Status: Finished.  No known bugs
// Date of last modification:  February 20, 2019
// Information about this module: Output the data in any array in orderly fashion
// This module purpose:  display for How to Average Integers
// File name of this module:  display.c
// Compile this module: gcc -g -Wall -c display.c
// Link this module with other objects:

#include <stdio.h>

void display(long arr[], long int size);
void display(long arr[], long int size)
{
  for(long int i = 0; i < size; i += 1)
    printf("%ld\n", arr[i]);
}
