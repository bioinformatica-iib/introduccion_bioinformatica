#!/bin/bash

echo -e "Paciente\tLongitud\tPos103\tPos239" > ../resultados/informe_final.tsv

for prot in $(grep "^>" ../datos/pacientes.fasta | sed 's/>//'); do
    # Extraer la secuencia completa
    secuencia=$(grep -A1 "^>$prot" ../datos/pacientes.fasta | tail -n1)
    # Calcular longitud
    longitud=${#secuencia}
    # Extraer posición 103
    aa103=$(echo "$secuencia" | cut -c103)
    # Extraer posición 239
    aa239=$(echo "$secuencia" | cut -c239)
    # Guardar en el informe
    echo -e "${prot}\t${longitud}\t${aa103}\t${aa239}" >> ../resultados/informe_final.tsv
done
