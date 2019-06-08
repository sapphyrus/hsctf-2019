# Broken GPS

# Description
Written by: Disha and Shray

> Ella is following a broken GPS. The GPS tells her to move in the opposite direction than the one she should be travelling in to get to her destination, and she follows her GPS exactly. For instance, every time she is supposed to move west, the GPS tells her to move east and she does so. Eventually she ends up in a totally different place than her intended location. What is the shortest distance between these two points? Assume that she moves one unit every time a direction is specified. For instance, if the GPS tells her to move "north," she moves one unit north. If the GPS tells her to move "northwest," then she moves one unit north and one unit west.
>
> Input Format:
You will receive a text file with N directions provided to her by the GPS (the ones that she will be following) (1<=N<=1000). The first line in the file will be N, and each consequent line will contain a single direction: “north,” “south,” “east,” “west,” “northwest,” “northeast,” “southwest,” or “southeast.”
>
> Output Format:
Round your answer to the nearest whole number and then divide by 26. Discard the quotient (mod 26). Each possible remainder corresponds to a letter in the alphabet. (0=a, 1=b… 25=z).

> Find the letter for each test case and string them together. The result is the flag. (For instance, a, b, c becomes “abc”). Remember to use the flag format and keep all letters lowercase!

# Solution
This one was less of a challenge and more of a programming task so we just do exactly what was requested:

- Go through each instruction file
- Follow all the instructions in it and save the resulting coordinate
- Go through all resulting coords (sorted), calculate distance to real coordinate (just the length * 2), modulo 26, add 97 (ascii code for "a"), convert to a char
