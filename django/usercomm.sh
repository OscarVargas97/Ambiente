#!/bin/bash      
plist(){
	echo "pfirst"
	echo "callcommand"
	echo "pcom"
	echo "pinstall"
	echo "pupdate"
	echo "pmode parametro1=(dev or prod or unitest or nothing)"
	echo "dockerclear"
}
pman(){
	echo "pfirst: "
	echo "callcommand: "
	echo "pcom: "
	echo "pinstall: "
	echo "pupdate: "
	echo "pmode parametro1=(dev or prod or unitest or nothing): "
	echo "dockerclear: "
}

pcom(){
	callcommand $1
}

dockerclear(){
	echo '¡¡¡WARNING!!!'
	echo ' este comando detendra y eliminara todas las imagenes, contenedores y volumenes que tengas en el equipo'
	echo 'Estas seguro que deseas continuar'
	#Poner un si o no
	if [ 1 = 1 ]; then
		docker stop $(docker ps -a -q)
		docker rm $(docker ps -a -q)
		docker rmi $(docker images -a -q)
		docker volume rm $(docker volume ls -q) 
	else
		echo 'comando cancelado'
	fi
}

pfirst(){
	pinstall
	pcom up
}

callcommand(){
	cd ./docker
	./command.sh $1
	cd ..
}

pinstall(){
	cd docker
	./install.sh
	cd ..
}
prdb(){
	./restordatabase.sh
}
pupdate(){
	source usercomm.sh
}
pmode(){
	if ! [ -z $1 ] ; then
		if ! [ $1 = "prod"  ] && ! [ $1 = "local"  ] && ! [ $1 = "unitest" ] && ! [ $1 = "dev"  ] || ! [ -z $2 ] ; then
			echo "Esta funcion debe recibir como maximo un parametro con uno de los siguientes valores"
			echo "unitest | dev | prod | local"
			echo "El no ingreso se toma como dev"
		else
			#verificar que la linea 5 efectivamente es mode
			sed -i "4s/.*/mode=${1} #Valores validos= prod or local or unitest or dev or local/" ./docker/config/var.sh
			echo "Cambiando al entorno de ${1}, archivo docker/config/var.sh modificado en la linea 5" 
		fi
	else
		#verificar que la linea 4 efectivamente es mode
		sed -i "4s/.*/mode=dev #Valores validos= prod or local or unitest or dev or local/" ./docker/config/var.sh
		echo "Cambiando al entorno de dev, archivo docker/config/var.sh modificado en la linea 5" 
	fi
}




