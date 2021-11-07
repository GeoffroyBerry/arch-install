# Installation Arch complète
Le but de ce document est avant tout de pouvoir installer mon environnement le plus vite possible en cas de problème ou de nouvelle machine.  
Ce n'est donc pas un tuto et les explications sont avant tout destinés à moi même. Cela dit, tout le monde est libre de reproduire ou s'inspirer.  
Pour plus de détails suivez plutôt le [Wiki Arch](https://wiki.archlinux.org/title/Installation_guide_(Fran%C3%A7ais)) 

**To non-french speaking folks :** The reason why this document is in french is because a few steps are french/azerty keyboard specific and you guys probably already have enough guides anyway (even though it isn't exactly a guide)  

## OS
On change le clavier  
`loadkeys fr-latin1`

Si le dossier existe on est en mode UEFI (adapter l'installation si c'est le cas) 
`ls /sys/firmware/efi/efivars`

Un coup de ping pour savoir si on est connecté  
`ping gnu.org`

Si pas d'accès internet se connecter au wifi avec `iwctl` et réessayer de ping  

Régler l'horloge système  
`timedatectl set-ntp true` puis `timedatectl status` pour vérifier

On Partitionne le disque (`fdisk -l` pour lister) en utilisant cfdisk (plus pratique que fdisk)
`cfdisk /dev/sd[lettre]`
- Une partition de boot (ne pas oublier de flag en boot) - facultatif
- Une partition swap - facultatif
- Une partition principale

On formate les partitions de boot et principale en ext4  
`mkfs.ext4 /dev/sd[lettre][num]`
On initialise la partition swap avec  
`mkswap /dev/[partition swap]`

On mount la partition principale  
`mount /dev/[partition principale] /mnt`

On mount la partition boot (créer le dossier avant)  
`mount /dev/[partition boot] /mnt/[boot|efi]`

On active la partition swap  
`swapon /dev/[partition swap]`

Installation des paquets  
`pacstrap /mnt base base-devel linux linux-firmware vim networkmanager grub git`

Génération de fstab  
`genfstab -U /mnt >> /mnt/etc/fstab`

Vérifier le contenu du fichier et éditer si besoin  

Connection au système  
`arch-chroot /mnt`

## Configuration (time, lang, clavier, NetworkManager et Grub)
git clone ce repo puis lancer le script de config (lire et adapter avant...)  
`./sys-config.sh`

on retourne à l'iso
`exit`

umount to be safe
`umount -R /mnt`

`reboot`

## Création de l'utilisateur principale
Via le script  
`./user-config.sh`

Ne pas oublier d'éditer le fichier /etc/sudoers (visudo pour être safe)  
Et ce log avec le user

## Installation de l'environnement et dotfiles
Work in progress...

Via le script  
`./install-env.sh`
