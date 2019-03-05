commandtop()
{
top;
}

commandps()
{
ps -aux;
}

commandroot()
{
top -u root;
}

commandmcpu()
{
top -u root -o %CPU | head -12;
}

commandcourbe()
{
ps -eo pid,pcpu --sort=-%cpu | head -n 6 >cpudata.tsv;
gnuplot -p ex.gnu < cpudata.tsv;
gnuplot -p "graph.dat";
}

commandhelp()
{
echo "1.Montrer les processus active en mode dynamique.
2.Montrer tous les processus du system en mode statics sans mise a jour.
3.Montrer tous les processus active du root en mode dynamique.
4.Montrer les 5 processus avec le plus taux d'utilisation de CPU.
5.Montrer les 5 processus avec le taux d'ulisation le plus eleves de CPU en statistiques sur deux graph.
6.pour les intrusctions vous etes la.
7.pour quitter le programme." ;
}


menu()
{
if [[ $# -eq 0 ]]
then while [[ $choix != 7 ]]
do
echo "entrée pour continuer"
read x
clear
echo "1.lancer la commande ltop
2.lancer la commande lps
3.montrer les processus de root
4.filtrer
5.statistiques
6.help
7.quitter"

read choix
case $choix in
1) 
	commandtop ;;
2)
	commandps ;;
3) 
	commandroot ;;
4) 
	commandmcpu ;;
5)
	commandcourbe ;;
6)
        commandhelp ;;
*)
	echo "mauvais choix" ;;
esac
done
elif [[ $1 = "-ltop" ]]
	then commandtop
elif [[ $1 = "-lps" ]]
	then commandps
elif [[ $1 = "-root" ]]
	then commandroot
elif [[ $1 = "-mcpu" ]]
	then commandmcpu
elif [[ $1 = "-plot" ]]
	then commandcourbe
elif [ $1 = "-h" ] || [ $1 = "-help" ]
	then commandhelp
else echo "mauvais choix"
fi
}


menu $1;
