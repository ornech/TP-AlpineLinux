# Journalisation sous Alpine

Alpine utilise busybox pour syslog.

## Fichier principal
`/var/log/messages`

## Vérification
```sh
tail -f /var/log/messages
logread
```

