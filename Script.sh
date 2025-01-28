#!/bin/bash

//Executa veri
if [[ $(date +%d) -lt 10 ]];
then

    if [[ $(date +%w) -eq 2 ]] || [[ $(date +%w) -eq 4 ]];
    then
        dia="TER/QUI"
    else
        dia="SEG/QUA/SEX"
    fi

    sudo mount -t cifs //10.150.200.7/h$ /mnt/backup -o username=****,password=****,iocharset=utf8
    echo
    echo "Espaço de armazenamento de $dia no HD de backup do servidor SRVX3"
    df -h /mnt/backup
    sudo umount /mnt/backup

    sudo mount -t cifs //10.150.200.8/g$ /mnt/backup -o username=****,password=****,iocharset=utf8
    echo
    echo "Espaço de armazenamento de $dia no HD de backup do servidor SRVX8"
    df -h /mnt/backup
    sudo umount /mnt/backup

    sudo mount -t cifs //10.150.200.3/c$ /mnt/backup -o username=****,password=****,iocharset=utf8
    echo
    echo "Espaço de armazenamento no servidor SERV03, de acesso remoto"
    df -h /mnt/backup
    sudo umount /mnt/backup

    echo
    read -p "Pressione a tecla "ENTER" para fechar janela!"

fi
