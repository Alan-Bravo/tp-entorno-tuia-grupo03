#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Datos erroneos, por favor intente otra vez"
    exit 1
fi

archivo_imagenes=$1
archivo_suma_verificacion=$2

if [ ! -f "$archivo_imagenes" ]; then
    echo "El archivo de imágenes no existe en la ubicación especificada."
    exit 1
fi

if [ ! -f "$archivo_suma_verificacion" ]; then
    echo "El archivo de la suma de verificación no existe en la ubicación especificada."
    exit 1
fi

echo "Verificando la suma de verificación..."
suma_verificacion_calculada=$(md5sum "$archivo_imagenes" | awk '{print $1}')
suma_verificacion_archivo=$(cat "$archivo_suma_verificacion" | awk '{print $1}')

if [ "$suma_verificacion_calculada" != "$suma_verificacion_archivo" ]; then
    echo "La suma de verificación no coincide. El archivo podría estar corrupto."
    exit 1
fi

echo "Descomprimiendo archivo de imágenes..."
mkdir "imagenes_extraidas"
tar xf "$archivo_imagenes" -C "imagenes_extraidas"

echo "La descompresión se completó ha exitosamente."
exit 0



