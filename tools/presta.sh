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

cat > /srv/dev/README_dev.txt << 'EOF'
Règles de développement :
1. Ne pas commiter les mots de passe (lol)
2. Penser à la doc.
EOF

chmod 664 /srv/dev/specs_API_client_XYZ.txt
chmod 664 /srv/dev/todo_refonte_back.log
chmod 644 /srv/dev/README_dev.txt
# Simulation : nlambert a copié ces fichiers lui-même
chown nlambert:root /srv/dev/specs_API_client_XYZ.txt

# Ajouts fichiers DEV (Code source et oublis)
cat > /srv/dev/config_db_prod.php << 'EOF'
<?php
$db_host = "192.168.1.10";
$db_user = "admin";
$db_pass = "Admin123!"; // TODO: Supprimer ce fichier apres debug
?>
EOF
chmod 644 /srv/dev/config_db_prod.php
chown tgarcia:root /srv/dev/config_db_prod.php

touch /srv/dev/main.py /srv/dev/utils.js /srv/dev/test_runner.sh
chmod 777 /srv/dev/test_runner.sh # Script de test executable par tous
chown dvasseur:root /srv/dev/main.py

# Ajout de bruit DEV : Fichier caché et fausse image
cat > /srv/dev/.env << 'EOF'
DB_PASSWORD=SuperSecretPassw0rd
API_KEY=12345-ABCDE
EOF
chmod 644 /srv/dev/.env
chown mthomas:root /srv/dev/.env

echo "Ceci n'est pas une image, c'est du texte renommé." > /srv/dev/logo_v2.png
chown lhenry:root /srv/dev/logo_v2.png

# --- Ajout CHAOS DEV ---
# Versionning manuel horrible
touch /srv/dev/api_v1.py /srv/dev/api_v1_final.py /srv/dev/api_v1_final_v2.py /srv/dev/api_v1_final_v2_fix.py
chown dvasseur:root /srv/dev/api_v*
# Dump SQL qui traîne avec des données
cat > /srv/dev/dump_prod_2024.sql << 'EOF'
INSERT INTO users (user, password) VALUES ('admin', '123456');
INSERT INTO users (user, password) VALUES ('root', 'toor');
EOF
chmod 644 /srv/dev/dump_prod_2024.sql
chown tgarcia:root /srv/dev/dump_prod_2024.sql
# Dossier "poubelle" typique node_modules ou venv
mkdir -p /srv/dev/tmp_build_trash
touch /srv/dev/tmp_build_trash/error.log /srv/dev/tmp_build_trash/unknown_dependency.js
chmod -R 777 /srv/dev/tmp_build_trash
chown nlambert:root /srv/dev/tmp_build_trash

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

# FAILLE CRITIQUE : Script modifiable par tout le monde (777)
# Permet une escalade de privilèges si exécuté par root via cron
chmod 777 /srv/infra/script_backup.sh
chmod 644 /srv/infra/README_infra.txt

# Ajouts fichiers INFRA (La fameuse clé SSH oubliée)
cat > /srv/infra/id_rsa << 'EOF'
-----BEGIN OPENSSH PRIVATE KEY-----
MIIEowIBAAKCAQEA... (Ceci est une fausse clé privée qui traine)
...
-----END OPENSSH PRIVATE KEY-----
EOF
chmod 644 /srv/infra/id_rsa # Clé privée lisible par tout le monde !
chown rduval:root /srv/infra/id_rsa

# Ajout bruit INFRA : Schéma réseau et script vide
touch /srv/infra/topology_network_v2.drawio
chown jmorel:root /srv/infra/topology_network_v2.drawio
touch /srv/infra/ping_test.sh
chmod 777 /srv/infra/ping_test.sh # Script vide mais executable

# --- Ajout CHAOS INFRA ---
# Configuration équipement sensible lisible
cat > /srv/infra/switch_coeur_config.cfg << 'EOF'
hostname CoreSwitch
enable secret 5 $1$ConfigMalSecurisee
username admin password cisco
EOF
chmod 644 /srv/infra/switch_coeur_config.cfg
chown jmorel:root /srv/infra/switch_coeur_config.cfg
# Fichier de capture réseau (données sensibles potentielles)
touch /srv/infra/capture_wireshark_incident.pcap
chown rduval:root /srv/infra/capture_wireshark_incident.pcap

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
# Simulation : lroux est propriétaire de ses dossiers
chown lroux:root /srv/commerciaux/catalogue_2024.pdf

# Ajouts fichiers COMMERCIAUX (Propositions et présentations)
touch /srv/commerciaux/propale_client_Tartenpion.docx
touch /srv/commerciaux/presentation_kickoff_2025.pptx
chmod 666 /srv/commerciaux/propale_client_Tartenpion.docx
chown sbernard:root /srv/commerciaux/propale_client_Tartenpion.docx

# Ajout bruit COMMERCIAUX : Dossier d'archives vide et objectifs
mkdir -p /srv/commerciaux/Archives_2023
chmod 777 /srv/commerciaux/Archives_2023
touch /srv/commerciaux/Objectifs_Q1_2025_Draft.xlsx
chown jmartin:root /srv/commerciaux/Objectifs_Q1_2025_Draft.xlsx

# --- Ajout CHAOS COMMERCIAUX ---
# Dossier "Urgent" fourre-tout
mkdir -p /srv/commerciaux/A_TRAITER_URGENT
chmod 777 /srv/commerciaux/A_TRAITER_URGENT
touch /srv/commerciaux/A_TRAITER_URGENT/contrat_perdu_a_refaire.docx
# Note de frais abusive
cat > /srv/commerciaux/Note_de_frais_resto_luxe.txt << 'EOF'
Champagne : 150e
Repas : 400e
Client : Inconnu
EOF
chown sbernard:root /srv/commerciaux/Note_de_frais_resto_luxe.txt
chmod 644 /srv/commerciaux/Note_de_frais_resto_luxe.txt

cat > /srv/direction/budget_previsionnel_2025.xlsx << 'EOF'
Budget prévisionnel 2025 - ultra confidentiel.
EOF

cat > /srv/direction/strategies_fusion_acquisition.txt << 'EOF'
Stratégies de fusion/acquisition - accès strict direction.
EOF

chmod 644 /srv/direction/budget_previsionnel_2025.xlsx
chmod 644 /srv/direction/strategies_fusion_acquisition.txt

# Ajouts fichiers DIRECTION (Données sensibles / RGPD)
cat > /srv/direction/salaires_octobre_2025.csv << 'EOF'
Nom;Salaire;Prime
Dupont;5000;1000
Martin;3200;500
EOF
chmod 644 /srv/direction/salaires_octobre_2025.csv # Visible par les autres si dossier traversable

# Ajout bruit DIRECTION : Note de service
touch /srv/direction/note_service_absences.pdf
chown acarlier:root /srv/direction/note_service_absences.pdf
chmod 600 /srv/direction/note_service_absences.pdf # Seul acarlier peut lire (pour l'instant)

# --- Ajout CHAOS DIRECTION ---
# Document inquiétant pour les employés
cat > /srv/direction/plan_licenciement_2026.docx << 'EOF'
Liste des postes à supprimer au service INFRA et DEV (Confidentiel).
EOF
chmod 600 /srv/direction/plan_licenciement_2026.docx
chown mdupont:root /srv/direction/plan_licenciement_2026.docx

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

# Le classique "Post-it" avec les mots de passe
cat > /srv/commun/mots_de_passe_wifi.txt << 'EOF'
WIFI INVITE : Bienvenue123!
WIFI ADMIN : SuperSecretRoot!
Compte admin de l'imprimante : admin / 1234
EOF
chmod 644 /srv/commun/mots_de_passe_wifi.txt

# Ajouts fichiers COMMUN (Vie d'entreprise)
touch /srv/commun/menu_cantine_semaine_42.pdf
touch /srv/commun/photos_pot_depart_michel.zip
chown invite1:root /srv/commun/menu_cantine_semaine_42.pdf

# Ajout bruit COMMUN : Blague et exécutable Windows inutile
cat > /srv/commun/blague_du_jour.txt << 'EOF'
C'est un sysadmin qui rentre dans un bar...
EOF
chown invite2:root /srv/commun/blague_du_jour.txt
touch /srv/commun/setup_bonzi_buddy.exe
chmod 777 /srv/commun/setup_bonzi_buddy.exe

# --- Ajout CHAOS COMMUN ---
# Usage personnel du serveur
mkdir /srv/commun/Musique_Piratee
touch /srv/commun/Musique_Piratee/track01.mp3
touch /srv/commun/Musique_Piratee/track02.mp3
chmod 777 /srv/commun/Musique_Piratee
# Recette de cuisine
cat > /srv/commun/recette_crepes_maman.txt << 'EOF'
500g de farine, 1L de lait, 2 oeufs...
EOF
chown invite1:root /srv/commun/recette_crepes_maman.txt

cat > /srv/backup_admins/full_backup_2025-11-01.tar.gz << 'EOF'
Archive complète (factice).
EOF

cat > /srv/backup_admins/sauvegarde_home_admin1.tar.gz << 'EOF'
Sauvegarde du home admin1 (factice).
EOF

chmod 777 /srv/backup_admins/full_backup_2025-11-01.tar.gz
chmod 777 /srv/backup_admins/sauvegarde_home_admin1.tar.gz

# Ajout bruit BACKUP : Fichier corrompu ou étrange
touch /srv/backup_admins/dump_sql_ERROR.log
chown admin1:root /srv/backup_admins/dump_sql_ERROR.log

# --- Ajout CHAOS BACKUP ---
# Sauvegarde ratée 
touch /srv/backup_admins/backup_FAILED_2025-10-30.log
chown admin2:root /srv/backup_admins/backup_FAILED_2025-10-30.log

# Sabotage final : Umask global à 0000 (tout le monde peut tout faire sur les nouveaux fichiers)
echo "Modification du /etc/profile pour casser le umask..."
echo "umask 0000" >> /etc/profile


echo "=== L'environnement massacré par le prestataire est prêt ==="
echo "=== La direction vous remercie === "
