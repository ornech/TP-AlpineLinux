 
| Commande               | Fonction                                                                                                |
| ---------------------- | ------------------------------------------------------------------------------------------------------- |
| **setup-acf**          | Configure ACF (Alpine Configuration Framework) + options email & address + installation de modules ACF. |
| **setup-desktop**      | Installe un environnement de bureau standard (gnome, plasma, xfce, etc.).                               |
| **setup-interfaces**   | Configure les interfaces réseau (DHCP auto, bridging, edit `/etc/network/interfaces`, restart).         |
| **setup-proxy**        | Configure un proxy HTTP pour le système.                                                                |
| **setup-xen-dom0**     | Configure Xen Dom0 (dom0 hypervisor). → Ton système n’a pas les modules Xen.                            |
| **setup-alpine**       | Installe Alpine Linux : overlay, answer file, mode rapide, mot de passe root vide.                      |
| **setup-devd**         | Configure le gestionnaire de périphériques (mdev, mdevd, udev) + coldplug.                              |
| **setup-keymap**       | Configure le clavier (layout + variante).                                                               |
| **setup-sshd**         | Configure le serveur SSH : openssh/dropbear/none + clé root optionnelle.                                |
| **setup-xorg-base**    | Configure Xorg (installe xorg-server, active community, udev).s                                         |
| **setup-apkcache**     | Configure le dossier de cache APK (apk cache).                                                          |
| **setup-disk**         | Installe Alpine sur un disque : partitionnement, RAID, LVM, encrypt, swap, bootloader.                  |
| **setup-lbu**          | Configure le système de backup LBU (persistence config).                                                |
| **setup-timezone**     | Configure le fuseau horaire (symlink ou copie tzdata).                                                  |
| **setup-apkrepos**     | Configure les dépôts APK : community, fastest mirror, CDN, aléatoire                                    |
| **setup-dns**          | Configure `/etc/resolv.conf` (DNS + search domain).                                                     |
| **setup-mta**          | Configure l’envoi de mails via un serveur SMTP.                                                         |
| **setup-user**         | Création et configuration de compte utilisateur.                                                        |
| **setup-bootable**     | Rend un support bootable (copie fichiers + syslinux/grub + options upgrade).                            |
| **setup-hostname**     | Configure le nom de machine (`/etc/hostname`).                                                          |
| **setup-ntp**          | Configure la synchronisation NTP (busybox/openntpd/chrony/none).                                        |
| **setup-wayland-base** | Configure Wayland (elogind, community repo, udev).                                                      |
