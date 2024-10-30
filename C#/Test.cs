#include <stdio.h>

internal class Program
{
    private static void Main(string[] args)
    {
        void main()
        {
            T = tab[0] = -1;  //-1 marks the last value
                              //use
            add(tab, 12);
            display(tab);
            printf("Mean: % i / n", means(tab));
        }
    }
}

Table distribution(Table t)   //Parcourir le tableau t; le résultat/distrib est 1 tableau de 21 valeurs initialisées à 0
{
    Table result = new_Table(21);
    int i = 0;
    for (int i; i <= 21; i++) add(result, 0);
    while (t[i] != -1) { 
        int v = t[i];
        result[v]++;
        i++;
    }
    return result;            
}