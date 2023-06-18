#!/bin/bash

 if [ $# -ne 2 ];
  then
    echo "Uso: $0 archivo_imagenes.tar.gz archivo_suma_verificacion.txt"
  exit 1
 fi

archivo_imagenes=$1
archivo_suma_verificacion=$2

if [[ $archivo_imagenes == http* ]]; then
    echo "Descargando archivo comprimido de imágenes..."
    wget -q "$archivo_imagenes" -O images.tar.gz
    
    if [ $? -ne 0 ]; then
        echo "Ocurrió un error durante la descarga del archivo de imágenes."
       exit 1
    fi
else
   
    if [ ! -f "$archivo_imagenes" ]; then
        echo "El archivo de imágenes no existe en la ubicación especificada."
        exit 1
    fi
fi



if [[ $archivo_suma_verificacion == http* ]]; then
    echo "Descargando archivo de suma de verificacion ..."
    wget -q "$archivo_suma_verificacion" -O suma_verificacion.txt 
    
    if [ $? -ne 0 ]; then
        echo "Ocurrió un error durante la descarga del archivo de suma de verificacion."
       exit 1
    fi
else

	if [ ! -f "$archivo_suma_verificacion" ]; then
        echo "El archivo de la suma de verificacion no existe en la ubicación especificada."
	exit 1
    fi
fi

echo "Verificando la suma de verificación..."
wget -q "$archivo_suma_verificacion" -O suma_verificacion.txt

suma_verificacion_calculada=$(md5sum ./images.tar.gz | awk '{print $1}' )
suma_verificacion_archivo=$(cat ./suma_verificacion.txt | awk '{print $1}' )

if [ "$suma_verificacion_calculada" != "$suma_verificacion_archivo" ]; then
    echo "La suma de verificación no coincide. El archivo podría estar corrupto."
    exit 1
fi

echo "Descomprimiendo archivo de imágenes..."
mkdir "imagenes_extraidas"
tar xf ./images.tar.gz -C "imagenes_extraidas"

rm ./images.tar.gz
rm ./suma_verificacion.txt

echo "La descompresión se completó exitosamente."
exit 0
