
## Mise en place de mises à jour quotidiennes automatiques

Créer un script :

``` sh
echo "apk update && apk upgrade --available" > /etc/periodic/daily/update
chmod +x /etc/periodic/daily/update
```

👉 **Pourquoi ?**

- Maintient le système à jour.    
- **Alpine utilise** `le répertoire periodic pour` **→ exécution automatique.**

