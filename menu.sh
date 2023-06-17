#!/bin/bash

echo "Aplicativo para procesar un lote de imagenes"

	while true
	do
	 echo "Por favor ingrese un numero (0-4): "
	 echo "1- Generar imagenes utilizando un servicio web."
	 echo "2- Descargar un archivo comprimido de imagenes."
	 echo "3- Recortar imagenes"
	 echo "4- Generar lista de todas personas"
	 echo "0- Salir"
	 read entrada
	 
	  if [ "$entrada" == "0" ]; then
		 echo "Saliendo..." 
		 break
	  elif [ "$entrada" == "1" ]; then 
		 echo "Generando imagenes..."
		 break 
	  elif [ "$entrada" == "2" ]; then 
		 echo "Descargando imagenes..."
		 break
	  elif [ "$entrada" == "3" ]; then 
		 echo "Recortando imagenes..."
		 break
	  elif [ "$entrada" ==  "4" ]; then 
		 echo "Generando lista..."
		 break
	  else 
		 echo "El numero ingresado es incorrecto, por favor ingrese otro numero: "
	  fi
	 done
