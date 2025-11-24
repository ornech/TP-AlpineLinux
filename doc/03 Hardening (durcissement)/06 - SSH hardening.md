# Sécurisation SSH sur Alpine

## Objectifs
- Désactiver login root
- Imposer clé SSH
- Limiter tentatives

## Fichier de configuration
`/etc/ssh/sshd_config`

Exemples :
```sh
PermitRootLogin no
PasswordAuthentication no
PubkeyAuthentication yes
MaxAuthTries 3
LoginGraceTime 20
```


