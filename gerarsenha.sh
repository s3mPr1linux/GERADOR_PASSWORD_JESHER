#!/usr/bin/env bash

#------------------------------------------------------------
# Autor: Jesher Minelli Alves
# Gerador de senhas randomicas com Shell Scripiting
# ./gerarsenha.sh
# sudo ln -s $HOME/gerarsenha.sh /usr/local/bin/gerarsenha
# Desde: Dom 01 Mai 01:59:28 BRT 2022
# Versão: 1.2
# Licença: GPLv3
#
#----------------------- VARIAVEIS --------------------------
titulo="Armazene suas senhas aqui
site-aqui.org
Senha: $cabecalho
---------------------
"
arquivo="$HOME/.senhadb"

#------------------------ TESTES ----------------------------

[[ "$UID" = "0" ]] && echo "Não é possivel executar como root!!" && exit 1

#------------------------ FUNÇÕES ---------------------------

gerarsenha(){
 # variaveis
 letras='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
 numeros='0123456789'
 chars='!@#$%^&*()+?><:{}[]'
 lista="$letras$numeros$chars" # juntamos todas as letras caracteres e números
 # total de caracteres
 max=20
 # conta o total de caracteres da string lista
 tamanho=${#lista}
 # criamos um loop do zero ao max
 for (( i=0; i < $max; i++ )); do
   # colocamos o +1 para ser diferente de zero, para usar cut tem de ser no mínimo 1
   ordem=$((RANDOM % $tamanho + 1))
   # acumulamos o caracter randomico escolhido pelo cut na variável senha
   senha=$(echo $lista | cut -c "$ordem")
   # imprimimos a variavel senha 15 vezes(max) na mesma linha -n
   echo -n $senha
 done

 echo
}

#------------------------- MAIN -----------------------------

#Testa se arquivo já existe, se não existir ele cria
[[ ! -f $arquivo ]] && echo "$titulo" > $arquivo && chmod 600 $arquivo

#chamando a função
gerarsenha
