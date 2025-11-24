![[Ressources/00 - Présentation.png]]
# Introduction au TP Alpine Linux

Alpine Linux est une distribution minimaliste, modulaire, pensée pour la sécurité.

Ce cours/TP couvre :
- installation de la distribution,
- configuration réseau,
- compréhension et usage d’OpenRC,
- gestion des paquets (apk),
- sécurisation SSH,
- gestion des services,
- permissions, utilisateurs, logs système,
- outils systèmes indispensables.

Objectif global :
→ comprendre un système Unix minimal, lisible, contrôlable et prévisible.


> [!NOTE] Mais pourquoi Alpine Linux ?
> Voici un constat simple : plus un système accumule de fonctionnalités dans un même ensemble logiciel, plus il devient complexe et difficile à maîtriser. La tradition Unix repose sur un principe clair : un composant = une fonction, et il doit la faire correctement.
> 
> Depuis quelques années pourtant, certaines distributions Linux s’éloignent de cette approche en adoptant des composants beaucoup plus larges, intégrant plusieurs rôles autrefois séparés. C’est la logique du “gros service qui s’occupe de tout”, comparable au fonctionnement des instances de svchost.exe sous Windows, qui hébergent plusieurs services essentiels dans la même infrastructure.
> 
> Dans les distributions basées sur Debian, cette centralisation se manifeste surtout à travers systemd, dont la base de code atteint environ 1,3 million de lignes. Ce qui était à l’origine un outil d’initialisation du système s’est progressivement s’étendre à la gestion des logs (journald), réseau, DNS (resolved), sessions, timers, montages, règles de sandboxing, et bien d’autres aspects du système. Autrement dit, une quantité importante de fonctions critiques dépend désormais d’un même ensemble logiciel, fortement interconnecté.
> 
> Cette centralisation a un effet direct : la surface d’attaque augmente. Plus un composant gère de domaines, plus les points d’entrée potentiels se multiplient. Et, sans surprise, plusieurs vulnérabilités sérieuses ont été découvertes dans différents sous-composants de systemd (journald, networkd, resolved). Comme il s’agit du cœur de l’infrastructure d’initialisation, une faille dans un de ces modules peut avoir des répercussions bien plus larges que si chacune de ces fonctions était assurée par des outils Unix distincts.
> 
> À l’inverse, les systèmes qui appliquent strictement la philosophie “un processus = une fonctionnalité” conservent une surface d’attaque plus réduite et surtout mieux compartimentée. Une vulnérabilité touche alors un outil isolé, sans provoquer d’effet domino. En d'autres termes, un bug dans un composant ne compromet pas tout le système.
> 
> C’est exactement pour cette raison que nous allons étudier **Alpine Linux.**
> 
> **Alpine est une distribution qui applique strictement une philosophie minimaliste et modulaire : pas de services inutiles, pas de composants géants, pas d’empilements opaques. C’est un excellent exemple de système Unix moderne, simple, lisible et conçu pour réduire la surface d’attaque.
> 
> En d’autres termes, Alpine active presque rien par défaut — et c’est précisément ce qui le rend intéressant. On ne se retrouve pas avec des démons lancés automatiquement, des sous-composants dont on ignore l’existence, ou des services qui tournent en arrière-plan sans qu’on les ait explicitement installés.
> 
> En gros seul ce que vous activez fonctionnera, rien d’autre...**
