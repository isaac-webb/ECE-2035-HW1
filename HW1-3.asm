# HW1-3
# Student Name: Isaac Webb
# Date: 01SEP17
#
# This program computes the similarity count for the two arrays Patch1
# and Patch2 and stores it at the memory location labeled Similarity.
# The similarity count is the number of times each pair of corresponding
# pixels in the two arrays is within an epsilon (5) of each other.

.data
# DO NOT change the following three labels (you may change the initial values):
Patch1:     .word 1, 14, 9, 10, 11, 6, 56, 60, 78, 100, 4, 5, 0, 3, 5, 9
Patch2:     .word 1, 18, 7, 16, 12, 1, 68, 49, 70, 826, 2, 9, 9, 9, 9, 9
Similarity: .alloc 1

.text
# Register Contents
# $1: Memory offset (loop counter)
# $2: 1st pixel value/value difference/delta > -5
# $3: 2nd pixel value/delta < 5
# $4: Similarity count
# $5: -5
                addi $4, $0, 0          # Initialize the count to 0
                addi $1, $0, 64         # Initialize the memory offset variable
                addi $5, $0, -5         # Initialize constant comparison register
PatchLoop:      addi $1, $1, -4         # Decrement the memory offset
                lw   $2, Patch1($1)     # Load the Patch1 value into a register
                lw   $3, Patch2($1)     # Load the Patch2 value into a register
                sub  $2, $2, $3         # Calculate the difference
                slti $3, $2, 5          # See if the difference is less than 5
                beq  $3, $0, Condition  # Skip rest if first condition isn't met
                slt  $2, $5, $2         # See if the difference is greater than 5
                add  $4, $4, $2         # Add the output of the comparison
Condition:      bne  $1, $0, PatchLoop  # Repeat the loop if there are more values
                sw   $4, Similarity($0) # Save the value to memory
                jr   $31                # Return to OS
