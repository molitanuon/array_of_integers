// Author name:   Molita   Nuon
// Program name:  How to Average Integers
// Names of files in this programming:  driver.cpp, controller.asm, display.c, compute_mean.asm, square.cpp
// Course number: CPSC 240
// Scheduled delivery date:  March 7, 2019
// Program purpose:  Software to assist teachers in computing a class average.
// Status: Finished.  No known bugs
// Date of last modification:  February 20, 2019
// Information about this module: Compile and link everything together
// This module purpose:  Driver for How to Average Integers
// File name of this module:  g++ -c -m64 -std=c++98 -o driver.o driver.cpp

#include <stdio.h>
#include <stdint.h>
extern "C" double controller();
int main()
{
  double return_code = -99;
  printf("%s","Welcome to an array of long integers.\n");
  printf("%s","This program is brought to you by Molita Nuon.\n\n");
  return_code = controller();
  printf("%s%8.4lf%s\n","\nThe driver received this unknown number:",return_code,
        ".\nThe driver will now return 0 to the operating system.");

  return 0;
}
