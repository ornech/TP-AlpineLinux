![[Ressources/00 - Présentation.png]]
# 🔹 Qu’est-ce qu’Alpine Linux ?
 Alpine se définie comme une **distribution “orientée sécurité, légère et efficace”** 

> [!cite] Orienté sécurité
> La légèreté d’Alpine (peu de paquets, binaires minimaux) signifie **moins de composants potentiellement vulnérables** - > “moins de surface = moins de risques potentiels”

> [!cite] Légère
>  La base minimale d’Alpine tient en **quelques mégaoctets** pour un conteneur, ou environ **130 Mo** pour une installation minimale sur disque. ([alpinelinux.org](https://alpinelinux.org/about/?utm_source=chatgpt.com "About"))

> [!cite] Efficace
> L’installation d’Alpine Linux est l’une des plus rapides qui existent.  le système s’installe en quelques secondes,  et l’ensemble du processus (paramétrage interactif inclus) prend à peine 1 à 2 minutes contre 20 à 30 minutes pour un Ubuntu Server.

Alpine Linux s'appuie sur : 

 1.  OpenRC pour le système d’initialisation. 
 2. Le gestionnaire de paquets  APK (Alpine Package Keeper)
 3. BusyBox comme ensemble d’outils système “all-in-one” (ls, cp, ps, adduser, etc.)
 4.  musl libc comme bibliothèque standard C. (au lieu de glibc)

##  Points forts d’Alpine Linux

| Avantage                                                    | Pourquoi / Comment                                                                                                                                                                                                              |
| ----------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Faible espace mémoire / disque**                          | Grâce à musl + BusyBox + APK minimaliste, une installation minimale reste très légère, adaptée aux serveurs, conteneurs, systèmes embarqués. ([alpinelinux.org](https://alpinelinux.org/about/?utm_source=chatgpt.com "About")) |
| **Minimaliste**                                             | Chaque paquet est minimal, ce qui permet de n’installer que ce qui est nécessaire : le système reste “propre”, clair et prévisible. ([alpinelinux.org](https://alpinelinux.org/about/?utm_source=chatgpt.com "About"))          |
| **Adapté aux conteneurs / microservices / systèmes légers** | Sa légèreté et modularité en font une base très prisée pour les conteneurs Docker, LXC, systèmes embarqués ou serveurs minimalistes.                                                                                            |
| **Liberté de configuration / modularité**                   | Package split, pas d’installer “tout d’un coup” : l’administrateur contrôle exactement ce qui entre dans l’image ou l’installation. ([alpinelinux.org](https://alpinelinux.org/about/?utm_source=chatgpt.com "About"))          |
## Alpine Linux, pour quel usage ?

###  Un excellent choix pour ...
- Conteneurs Docker / LXC / microservices
- Serveurs minimalistes
- Systèmes embarqués ou ressources limitées
- Environnements de tests, sandboxes, bastions

### Oui mais ...
- Certains logiciels propriétaires pas toujours compatible (musl libc VS glibc)
- Peu adapté au station de travail bureautique ou “desktop linux” peu 

> [!note] Alpine Linux ->  Petit · Simple · Secure
> - Minimaliste, conçu autour de musl + BusyBox + OpenRC
> - Très léger, rapide, facile à contrôler
> - Sécurité renforcée par construction (PIE, stack-smashing)
> - Excellent pour serveurs, conteneurs, systèmes légers
> - Mais moins bien pour compatibilité logicielle ou usage desktop “tout-venant”


---
**Auteur :** J-F Ornech 
**Formation :** BTS SIO – SISR  
**Établissement :** Lycée Merleau-Ponty
Année : 2025–2026

---
