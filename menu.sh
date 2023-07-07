#!/bin/bash

echo "Aplicativo para procesar un lote de imagenes"

while true
do
	echo "Por favor ingrese un numero (0-4): "
	echo "1- Generar imagenes utilizando un servicio web."
	echo "2- Descomprimir un archivo de comprimido con imagenes."
	echo "3- Recortar imagenes"
	echo "4- Generar lista de todas personas"
	echo "0- Salir"
	read entrada

	case $entrada in
		0)
			echo "Saliendo..."
			break
			;;
		1)
			echo "Generando imagenes..."
			break
			;;
		2)
			echo "Ingrese la ruta del archivo comprimido de imágenes: "
			read ruta_imagenes

			echo "Ingrese la ruta del archivo de suma de verificación: "
			read ruta_suma_verificacion
			./descomprimir.sh "$ruta_imagenes" "$ruta_suma_verificacion"
			;;
		3)
			echo "Recortando imagenes..."
			break
			;;
		4)
			echo "Generando lista..."
			break
			;;
		*)
			echo "El numero ingresado es incorrecto, por favor ingrese otro numero: "
			;;
	esac
done

