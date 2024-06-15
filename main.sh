#! /usr/bin/bash
a=1
while (( $a==1 ))
do
echo " "
echo "1. Tic-Tac-Toe"
echo "2. Triangle Fun"
echo " "
read -p "Choose your Option: " "x"
if (( $x == 1 ))
then
./sub-programs/Tic-Tac-Toe.sh
elif (( $x == 2 ))
then
./sub-programs/Triangles.sh
else
echo "Please choose 1"
fi
echo " "
read -p "Do You Want To Continue?(1/0): " "a"
done
