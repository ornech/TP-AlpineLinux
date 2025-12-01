# **1. Comptes utilisateurs**

- Suppression des comptes inutiles
- HOME en 700
- umask utilisateur = 0077
- Shell correct pour chaque compte
- Pas de shell pour les comptes système
- Groupe administrateur strictement contrôlé (`wheel` / `sudo` / `doas`)