#! /usr/bin/bash
u1='X'
u2='O'
green='\033[0;32m'
clear='\033[0m'
red='\033[0;31m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
array1=( 1 2 3 4 5 6 7 8 9 )
array=( " " " " " " " " " " " " " " " " " " )
display2(){
echo -e " ${array[6]} | ${array[7]} | ${array[8]}"
echo -e "---+---+---"
echo -e " ${array[3]} | ${array[4]} | ${array[5]}"
echo -e "---+---+---"
echo -e " ${array[0]} | ${array[1]} | ${array[2]}"
}
display1(){
clear
#=============#
banner "TicTacToe"
echo
echo "____________________________________________"
echo -e "${green}index number are: ${clear}"
echo
echo -e " ${array1[6]} | ${array1[7]} | ${array1[8]}"
echo -e "---+---+---"
echo -e " ${array1[3]} | ${array1[4]} | ${array1[5]}"
echo -e "---+---+---"
echo -e " ${array1[0]} | ${array1[1]} | ${array1[2]}"
echo
echo "_____________________________________________"
echo
}


pick(){
if [ $((count % 2)) == 0 ]
then
u=$u2
echo -n -e "${blue}PLAYER 2 PICK A SQUARE(please enter a valid input): ${clear}"
else
echo -n -e "${blue}PLAYER 1 PICK A SQUARE(please enter a valid input): ${clear}"
u=$u1
fi
}
take(){
read p
while [[ ${array[$p-1]} != " " ]]
do
echo -n -e "${red}Please enter a valid input: ${clear}"
read p
done
array[$p-1]=$u
}
check(){
#_
if [[ ${array[0]} = $u ]] && [[ ${array[1]} = $u ]] && [[ ${array[2]} = $u ]]
then
echo
banner "$u Wins!!"
echo
game=0
elif [[ ${array[3]} == $u ]] && [[ ${array[4]} == $u ]] && [[ ${array[5]} == $u ]]
then
echo
banner "$u Wins!!"
echo
game=0
elif [[ ${array[6]} == $u ]] && [[ ${array[7]} == $u ]] && [[ ${array[8]} == $u ]]
then
echo
banner "$u Wins!!"
echo
game=0
#|
elif [[ ${array[0]} == $u ]] && [[ ${array[3]} == $u ]] && [[ ${array[6]} == $u ]]
then
echo
banner "$u Wins!!"
echo
game=0
elif [[ ${array[1]} == $u ]] && [[ ${array[4]} == $u ]] && [[ ${array[7]} == $u ]]
then
echo
banner "$u Wins!!"
echo
game=0
elif [[ ${array[2]} == $u ]] && [[ ${array[5]} == $u ]] && [[ ${array[8]} == $u ]]
then
echo
banner "$u Wins!!"
echo
game=0
#/
elif [[ ${array[0]} == $u ]] && [[ ${array[4]} == $u ]] && [[ ${array[8]} == $u ]]
then
echo
banner "$u Wins!!"
echo
game=0
elif [[ ${array[2]} == $u ]] && [[ ${array[4]} == $u ]] && [[ ${array[6]} == $u ]]
then
echo
banner "$u Wins !!"
echo
game=0
else
game=1
fi
}

display1
echo -n -e "${red}Do you want to play?(y/n): ${clear}"
read k
if [ $k == 'y' ]
then
display2
count=1;
game=1;
while (( game != 0 ))
do
pick
take
display1
display2
check
#echo "OK"
count=$((count+1))
if (( game == 1)) && (( count == 10 ))
then
game=0
banner "DRAW !!"
fi
done

echo
echo -e '\033[1;31m'"================================================================="
echo -e "                         Thank You"
echo -e "=================================================================${clear}"
else
echo
echo -e '\033[1;31m'"================================================================="
echo -e "                         Thank You"
echo -e "=================================================================${clear}"
fi