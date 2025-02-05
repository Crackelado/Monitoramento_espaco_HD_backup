#!/bin/bash

# Executa se verificar que o dia do mês é menor que 10 e for segunda-feira (1) ou terça-feira (2)
if [[ $(date +%d) -lt 10 ]] && [[ $(date +%w) -lt 3 ]];
then

    # Se o dia da semana for terça-feira, coloca a descrição equivalente (há 2 HD's de backup, por dia, para cada servidor)
    if [[ $(date +%w) -eq 2 ]];
    then
        dia="TER/QUI"
    else
        dia="SEG/QUA/SEX"
    fi

    # Comando para montar unidade de rede na pasta "/mnt/backup"
    sudo mount -t cifs //10.150.200.7/h$ /mnt/backup -o username=****,password=****,iocharset=utf8

    # Salta uma linha para as informações não ficarem todas juntas
    echo

    # Exibi cabeçalho de qual HD e dia da semana é o backup
    echo "Espaço de armazenamento de $dia no HD de backup do servidor SRV01"

    # Exibi espaço ocupado e livre do HD
    df -h /mnt/backup

    # Libera pasta e unidade de rede montada
    sudo umount /mnt/backup

    sudo mount -t cifs //10.150.200.8/g$ /mnt/backup -o username=****,password=****,iocharset=utf8
    echo
    echo "Espaço de armazenamento de $dia no HD de backup do servidor SRV02"
    df -h /mnt/backup
    sudo umount /mnt/backup

    sudo mount -t cifs //10.150.200.3/c$ /mnt/backup -o username=****,password=****,iocharset=utf8
    echo
    echo "Espaço de armazenamento no servidor SRV03, de acesso remoto"
    df -h /mnt/backup
    sudo umount /mnt/backup

    echo

else

    # Exibi mensagem de erro, caso o dia não seja a primeira segunda-feira ou terça-feria do mês
    echo "O dia atual não é a primeira segunda-feira ou terça-feira do mês."
    
fi

# Não fecha a janela do terminal esperando ação do usuário
read -p "Pressione a tecla "ENTER" para fechar janela!"
