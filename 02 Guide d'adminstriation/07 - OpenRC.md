## Comprendre OpenRC

OpenRC = **gestionnaire de services**.  
Il contrôle : démarrage, arrêt, logs basiques.

👉 **Pourquoi l’utiliser ?**

- léger
    
- simple
    
- auditable
    
- très utilisé en cybersécurité (Alpine, Gentoo)
    

Commands essentielles :

```
rc-status         # voir services
```

---

## 🔹 Exemple : activer SSH

Installons openssh

apk add openssh

  

```
rc-update add sshd
```

Cette commande active le service SSH (sshd) au démarrage, en l’ajoutant automatiquement au runlevel default. Autrement dit, le serveur SSH sera lancé à chaque boot de la machine.

  

**Un runlevel est un ensemble de services classés selon la phase dans laquelle se trouve le système, et donc les services qui doivent être exécutés à ce moment-là.**

```
rc-service sshd start 
```

👉 **Pourquoi** **activer un service****?**

- OpenRC ne démarre pas les services automatiquement → il faut les déclarer.