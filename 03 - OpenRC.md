# OpenRC — Gestionnaire de services d’Alpine Linux

## Objectifs
- Comprendre rc-status, rc-service, rc-update
- Activer/désactiver des services au boot
- Inspecter l’état des services

## Commandes essentielles
```sh
rc-status
rc-service sshd start
rc-update add sshd
```

## Architecture
- /etc/init.d/
- /etc/runlevels/

