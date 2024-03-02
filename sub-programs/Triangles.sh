#! /usr/bin/bash

read -p "Enter side1: " "side1"
read -p "Enter side2: " "side2"
read -p "Enter side3: " "side3"

green='\033[0;32m'
clear='\033[0m'
red='\033[0;31m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'

sum1=$((side1+side2))
sum2=$((side2+side3))
sum3=$((side1+side3))

if (( $side1 >= $side2 && $side1 >= $side3))
then
max=$side1
a=$side2
b=$side3
elif (( $side2 >= $side1 && $side2 >= $side3))
then
max=$side2
a=$side1
b=$side3
else
max=$side3
a=$side1
b=$side2
fi
c=0
echo " "
if (( $sum1 < $side3 || $sum2 < $side1 || $sum3 < $side2))
then
    echo -e "${red}The triangle is not possible.${clear}"
    echo " "
else
    echo -e "${green}The triangle is possible.${clear}"
    echo " "
    c=1
fi
f=1
if (( $c==1 ))
then
echo -e "${cyan}Now enter the options corresponding to the given statements: ${clear}"
echo " "
while((f>=1 || f<0))
do
echo -e "${yellow}1. Perimeter of Triangle"
echo -e "2. Area of Triangle"
echo -e "3. Type of Triangle${clear}"
echo " "
read option

case $option in
1)perimeter=$((side1+side2+side3))
echo "The Perimeter of the Triangle is: " $perimeter
echo " "
;;

2)p=$((side1+side2+side3))
s=$((p/2))
if (( $p % 2!=0 ))
then
s=$(echo "$s+0.5" | bc)
fi
result1=$(echo "$s-$side1" | bc)
result2=$(echo "$s-$side2" | bc)
result3=$(echo "$s-$side3" | bc)
result=$(echo "$s * $result1 * $result2 * $result3" | bc)
square_root=`echo "scale=4; sqrt($result)" | bc`
echo "The Area of the Triangle is: " $square_root
echo " "
;;

3)if (( $side1==$side2 && $side2==$side3 ))
then
echo "It is an Equilateral Triangle"
echo " "
echo -e  "${cyan}     *   "
echo "    * *  "
echo "   *   *  "
echo "  *     * "
echo " *       *"
echo -e "* * * * * *${clear}"
elif (( $side1!=$side2 && $side2!=$side3 && $max * $max!=($a * $a + $b * $b) ))
then
echo "It is a scalene Triangle"
else
if (( $max * $max==($a * $a + $b * $b) && $a==$b))
then
echo "It is an isosceles right-angled Triangle"
elif (( $max * $max==($a * $a + $b * $b) ))
then
echo "It is a right-angled Triangle"
echo "  "
echo -e "${cyan} *      "
echo " **     "
echo " * *    "
echo " *  *   "
echo " *   *  "
echo -e " ****** ${clear}"
else
echo "It is an Isosceles Triangle"
fi
fi
;;
*)echo -e "${red}Please enter a valid option.Select between 1 to 3.${clear}"
esac
echo " "
echo -e "${blue}To terminate press 0 or any non-numeric character.${clear}"
read f
done
fi
