#!/bin/bash

convert_imagem () {
	cd ~/Downloads/imagens-livros

	#Verifica de existe a pasta png dentro da pasta imagens-livros
	if [ ! -d png ]
	then
	    mkdir png
	fi
	for imagem in *.jpg
	do
	    imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
	    convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png
	done
}

#Chaman a função e as mensagens de erro vão para o arquivos erros_conversao.txt
converte_imagem 2>erros_conversao.txt
# verifica se o retorno numérico é igual a 0. 
if [ $? -eq 0 ]
then
    echo "Conversão realizada com sucesso"
else
    echo "Houve uma falha no processo"
fi
