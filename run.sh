#/bin/bash
#Author name: Molita Nuon
#Program name: How to Average integers
#Assignment number: 3

rm *.o
rm *.out

echo "This is program <How to Average Integers>"

echo "Assemble the module controller.asm"
nasm -f elf64 -l controller.lis -o controller.o controller.asm

echo "Assemble the module compute_mean.asm"
nasm -f elf64 -l compute_mean.lis -o compute_mean.o compute_mean.asm

echo "Complie the C++ module driver.cpp"
g++ -c -m64 -Wall -l driver.lis -o driver.o driver.cpp -fno-pie -no-pie

echo "Complie the C module display.c"
gcc -c -m64 -Wall -l display.lis -o display.o display.c -fno-pie -no-pie

echo "Complie the C++ module square.cpp"
g++ -c -m64 -Wall -l square.lis -o square.o square.cpp -fno-pie -no-pie

echo "Link the all five object files already created"
g++ -m64 -o fpio.out driver.o controller.o display.o square.o compute_mean.o -fno-pie -no-pie

echo "The bash script file is now closing."
