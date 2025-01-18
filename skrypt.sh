#!/bin/bash

#pierwszy parametr to link, drugi to numer indeksu a trzeci to X (powinna byc to liczba) - potrzebny w 5 i 9 zadaniu

if [ $# != 3 ]
then
	echo "Zla ilosc argumentow!"
	exit 1
fi

#2
mkdir "$2"
cd "$2"

git clone $1

#3
echo "S32990" > README.md
git add README.md
git add .
git commit -m "Utworzenie README.md"

#4
mkdir Dane Dokumenty Zadania
cd Dokumenty
mkdir Produkty
cd Produkty
mkdir AMD Nvidia
cd AMD
touch plik.txt
cd ../Nvidia
touch plik.txt
cd ../../..
cd Zadania
touch plik.txt

#5
touch "$3.txt"
echo "Producent	VRam	Cena
AMD	16GB	4599
Nvidia	24GB	5999
Nvidia	12GB	3250
Nvidia	16GB	4399
AMD	24GB	5999
AMD	20GB	5699
Nvidia	16GB	4799
Nvidia	20GB	5699
AMD	12GB	3250
AMD	8GB	2150
Nvidia	8GB	2150
Nvidia	20GB	5750
Nvidia	24GB	5999
Nvidia	12GB	3450
AMD	20GB	5750
AMD	8GB	1999
AMD	16GB	4399
Nvidia	12GB	3550
AMD	8GB	1999
AMD	20GB	5850
Nvidia	16GB	4450
AMD	12GB	3399
AMD	16GB	4799
Nvidia	8GB	1799
AMD	12GB	3550
Nvidia	20GB	5599
AMD	24GB	5999
Nvidia	8GB	1899
AMD	24GB	5999
Nvidia	24GB	5999" >> "$3.txt"

#6
cd ..
git add .
git commit -m "Utworzenie struktury danych i plikow"
git checkout -b Zestawienie

#7
cd Zadania
mv "$3.txt" ../Dane/"Karty_graficzne.txt"

#8
cd ..
cd Dane
echo "Producent	VRAM	CENA" >../Dokumenty/Nvidia/"Karty_AMD.txt"
grep "AMD" "Karty_graficzne.txt" >>../Dokumenty/Nvidia/"Karty_AMD.txt"
echo "Producent	VRAM	CENA" >../Dokumenty/AMD/"Karty_Nvidia.txt"
grep "Nvidia" "Karty_graficzne.txt" >>../Dokumenty/AMD/"Karty_Nvidia.txt"

#9
echo "Producent	VRAM	CENA" >../Dokumenty/Produkty/"Zestawienie.txt"
head -$3 "Karty_graficzne.txt" >>../Dokumenty/Produkty/"Zestawienie.txt"

#10
cd ../..
git add .
git commit -m "Dodanie pliku Zestawienie.txt"
git checkout main
git merge

#11
cd Dokumenty/Produkty/AMD
mv "Karty_Nvidia.txt" ../Nvidia
cd ../Nvidia
mv "Karty_AMD.txt" ../AMD
cd ..
cd ..
cd ..
git add .
git commit -m "Zamienienie miejscami plikow Karty_AMD i Karty_Nvidia"

#12
git checkout -b Cofanie
git reset --mixed HEAD~3
git add .
git commit -am "Cofniecie poprzedniego commita z zachowaniem plikow"

#13
git checkout main
cd Zadania
touch "Zepsuty.txt"

#14
git push origin main
