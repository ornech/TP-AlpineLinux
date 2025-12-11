# 0 Pré-requis
**🎉 Félicitations !**  
Vous venez d’être embauchés comme admin système chez **CorpTech**, une entreprise  _à la pointe de l’innovation informatique_… 

Dès votre arrivée, la direction vous confie la gestion du serveur de fichiers.  
En discutant avec vos nouveaux collègues, vous découvrez que son installation a été sous-traitée à une société **low-cost** — dirigée, semble-t-il, par le cousin du patron… un incompétent notoire.

Résultat : tout est a refaire,  la restriction des droits est absurde, les dossiers sont accessibles comme un hall de gare et l'organisation des dossier est si chaotique qu’on hésite entre en rire ou pleurer.

Heureusement, c’est désormais **votre** problème.

Votre mission : **rattraper le carnage et surtout faire croire à la direction que tout était prévu.**

Bienvenue chez CorpTech !!!

MAis avant de commencer copier ce script et lancez le sur machine Alpine.

```sh
#!/bin/sh
# Initialisation de l'env TP Alpine Linux

echo "=== Initialisation de l'environnement TechCorp ==="

# 1) Création des utilisateurs
USERS="mdupont acarlier lroux sbernard jmartin nlambert tgarcia dvasseur mthomas lhenry rduval jmorel admin1 admin2 invite1 invite2"

for u in $USERS; do
    if id "$u" >/dev/null 2>&1; then
        echo "Utilisateur $u déjà existant, ignoré."
    else
        echo "Création de l’utilisateur $u ..."
        adduser -D "$u"     # -D = default, pas de questions
        echo "$u:achanger" | chpasswd
    fi
done

echo ">>> Tous les utilisateurs ont le mot de passe : achanger"


echo "Création des dossiers /srv/ ..."
mkdir -p /srv/dev
mkdir -p /srv/infra
mkdir -p /srv/commerciaux
mkdir -p /srv/direction
mkdir -p /srv/commun
mkdir -p /srv/backup_admins
chown root:root /srv/*
chmod 755 /srv/dev
chmod 755 /srv/infra
chmod 775 /srv/commerciaux
chmod 755 /srv/direction
chmod 777 /srv/commun
chmod 777 /srv/backup_admins

echo "Création des fichiers de test ..."
cat > /srv/dev/specs_API_client_XYZ.txt << 'EOF'
Spécifications API REST pour le client XYZ.
Contient des endpoints sensibles et des clés d’accès.
EOF

cat > /srv/dev/todo_refonte_back.log << 'EOF'
TODO refonte back-end :
- migrer framework
- supprimer endpoints obsolètes
EOF

chmod 664 /srv/dev/specs_API_client_XYZ.txt
chmod 664 /srv/dev/todo_refonte_back.log

cat > /srv/infra/script_backup.sh << 'EOF'
#!/bin/sh
# Script de sauvegarde (incomplet)
echo "Backup en cours (simulation)..."
EOF

cat > /srv/infra/README_infra.txt << 'EOF'
Notes internes INFRA :
- Plan IP
- Procédures d'intervention
- Scripts divers
EOF

chmod 644 /srv/infra/script_backup.sh
chmod 644 /srv/infra/README_infra.txt

cat > /srv/commerciaux/catalogue_2024.pdf << 'EOF'
Catalogue commercial 2024 - données internes TechCorp.
EOF

cat > /srv/commerciaux/liste_clients_confidentiel.csv << 'EOF'
client;contact;telephone;CA_estime
BigCorp;M.Dupont;+33 1 23 45 67 89;250000
StartupX;Mme Martin;+33 6 11 22 33 44;80000
EOF

chmod 666 /srv/commerciaux/catalogue_2024.pdf
chmod 666 /srv/commerciaux/liste_clients_confidentiel.csv

cat > /srv/direction/budget_previsionnel_2025.xlsx << 'EOF'
Budget prévisionnel 2025 - ultra confidentiel.
EOF

cat > /srv/direction/strategies_fusion_acquisition.txt << 'EOF'
Stratégies de fusion/acquisition - accès strict direction.
EOF

chmod 644 /srv/direction/budget_previsionnel_2025.xlsx
chmod 644 /srv/direction/strategies_fusion_acquisition.txt

cat > /srv/commun/note_interne_migration.txt << 'EOF'
Migration réalisée par le prestataire "QuickIT". Travail incomplet.
EOF

cat > /srv/commun/tableau_suivi_projets.csv << 'EOF'
projet;service;etat
RefonteSite;DEV;en cours
VPNRemote;INFRA;à tester
Campagne2024;COM;validé
EOF

chmod 666 /srv/commun/note_interne_migration.txt
chmod 666 /srv/commun/tableau_suivi_projets.csv

cat > /srv/backup_admins/full_backup_2025-11-01.tar.gz << 'EOF'
Archive complète (factice).
EOF

cat > /srv/backup_admins/sauvegarde_home_admin1.tar.gz << 'EOF'
Sauvegarde du home admin1 (factice).
EOF

chmod 777 /srv/backup_admins/full_backup_2025-11-01.tar.gz
chmod 777 /srv/backup_admins/sauvegarde_home_admin1.tar.gz

echo "=== L'environnement massacré par le prestataire est prêt ==="
echo "=== La direction vous remercie === "
```

Rappel d’usage :

```sh
su - root
nano env.sh      # coller le script, CTRL+s CTRL+x 
sh env.sh
```