#include <stdio.h>
#include <stdlib.h>

/*
 Student Name: Isaac Webb
 Date: 01SEP17

ECE 2035 Homework 1-2

This is the only file that should be modified for the C implementation
of Homework 1.

This program computes the similarity count for the two arrays Patch1
and Patch2 and prints it out.
The similarity count is the number of times each pair of corresponding
pixels in the two arrays is within an epsilon (5) of each other.

FOR FULL CREDIT, BE SURE TO TRY MULTIPLE TEST CASES and DOCUMENT YOUR CODE.

*/

//DO NOT change the following declaration (you may change the initial value).
unsigned Patch1[] = {1, 14, 9, 10, 11, 6, 56, 60, 78, 100, 4,  5, 0,  3,  5, 9};
unsigned Patch2[] = {6, 21, 5,  7,  8, 9, 50, 68, 74, 196, 8, 12, 0, 13, 15, 14};
unsigned Similarity;
/*
For the grading scripts to run correctly, the above declarations
must be the first lines of code in this file (for this homework
assignment only).  Under penalty of grade point loss, do not change
these line, except to replace the initial values while you are testing
your code.

Also, do not include any additional libraries.
 */

int main() {

  Similarity = 0; // Initialize with no initial similarities

  // Loop through all values in each array
  for (int i = 0; i < 16; i++) {
    // Add 1 if the delta is less than 5
    Similarity += abs((int) (Patch1[i] - Patch2[i])) < 5;
  }

  // Your program should use this print statement.
  // Do not change the format!
  // Print the number of similarities to the console
  printf("%d is the similarity count.\n", Similarity);

  return 0;
}
