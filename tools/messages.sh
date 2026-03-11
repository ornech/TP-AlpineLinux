#!/bin/sh

# Chemin du script final
DEST="/usr/local/bin/fortune_alpine.sh"

echo "--- Installation automatique des messages de session ---"

# 1. Création du script de citations
cat << 'EOF' > "$DEST"
#!/bin/sh
# Liste des citations
quotes='Quand tu hésites devant une commande, Bash a déjà pris sa décision.
No such file or directory — Linux n’invente rien.
« Ça marchait hier » n’est pas un diagnostic.
Ajax n’est pas une marque de lessive.
Si vous ne lisez pas les logs, les logs ne vous liront pas non plus.
Le DNS casse tout. Toujours. Même quand ce n’est pas sa faute.
‘Permission denied’ →  À méditer avant d'\''appuyer sur Entrée.
Un ping qui répond n'\''est pas forcément un certificat de bonne santé.
‘It works’ était le dernier mot qu'\''il a prononcé avant le carnage.
A chaque fois que vous mettez 8.8.8.8, Google vous remercie.
Un serveur silencieux n’est pas un serveur stable : il prépare quelque chose.
‘Connection refused’ : au moins c’est honnête...
Il y a deux façons d’écrire des programmes sans erreur ; seule la troisième fonctionne.
Un service qui fonctionne est juste un service dont les logs n’ont pas encore été lus.
Il existe deux types d'\''administrateurs : ceux qui ont déjà cassé resolv.conf, et ceux qui mentent.
Ne touchez jamais aux permissions '\''pour voir'\'' : ça finit toujours mal.
Le problème vient rarement d'\''Apache… sauf quand c'\''est Apache.
Systemctl est ton ami ... jusqu’à ce qu’il te trahisse.
Avant de lancer une commande, demande-toi si tu veux vraiment en assumer les conséquences.
Quand Linux vous dit “No such file or directory”, il ne ment jamais.
Une erreur http 500 n’est pas une énigme mystique. C’est votre faute ...
Le message d’erreur est ton ami. Le message d’erreur t’aime. Lis-le...
Lire console.log, c’est bien. Le comprendre, c’est mieux.
La fichier "test2_final_correction_285_OK.js ne trompe personne.
Si tu ne trouves vraiment pas le bug, regarde entre la chaise et le clavier.
Un commit de 2000 lignes n’est pas un commit. C’est le plus court chemin pour te faire des ennemis à vie ...
Si tu tapes la commande "rm -rf /", je te bannie à vie d'\''internet.
Si ton code a besoin d’un dessin pour être compris, c’est mauvais signe.
Si ton code ne plante pas, c’est qu’il n’a pas encore été exécuté.
Nmap connaît ton réseau mieux que toi.
Le réseau ne tombe pas en panne par magie. Tu l’as aidé.
Le DNS ne pardonne jamais. Jamais !!!
“C’est pas moi” n’a jamais corrigé un bug et en plus ça trompe personne
Dès que tu penses “ça ne risque rien”, il est déjà trop tard.
Le meilleur debugger s’appelle “lire vraiment ton code”.
Les tests en local, ce n’est pas la prod .. je sais ... Dommage !
Un `chmod 777` n’a jamais rendu quelqu’un compétent.
Ta VM n’est pas lente. Elle attend que tu comprennes.
Tout problème peut être résolu par : lire, réfléchir, ou dormir.
Si tu te demandes si c’est grave, c’est que c'\''est grave.
Quand tu dis à un professeur “j’ai pas compris le TP”, il sait déjà que tu as sauté les trois premières lignes.
Quand tu dis à un professeur “je comprends rien”, il sait que tu n’as rien lu.
Quand tu copies une commande sans la lire, une VM meurt quelque part.
Quand tu tapes `sudo` sans réfléchir, un pingouin tombe quelque part de sa chaise.
Quand tu fais un rm -rf trop large, c’est comme te raser les sourcils : tu t’en veux longtemps.
Quand tu touches à Apache sans sauvegarde, c’est comme faire un créneau trop serré : tu sais que ça va frotter.
Quand tu mets une IP au hasard, c’est comme envoyer un message à la mauvaise personne : ça fait des histoires.
Unix n'\''est pas rustre. Il est juste très sélectif avec ses amis. 
Pour vraiment tout casser, il faut un ordinateur.
As-tu essayé d’éteindre et de rallumer ?
"Système Unix détecté… je connais." (Jurassic Park)
Parler ne coûte rien. Montre-moi ton code plutôt ...
Tu crois que tu contrôles l’ordinateur, mais l’ordinateur sait que tu mens. 
À quoi ça sert d’être root si c’est pour avoir peur d’appuyer sur "entrer" ? 
Si ton PC plante, tape fort… en 1998 des fois ça marchait.
Les vrais savent : avec Windows Alt+F4, c’est une philosophie.
Sauvegarde avant que ton futur toi ne te maudisse.
Le seul endroit où ça marche toujours, c’est dans ta tête.
Un ordinateur ne te juge pas… il se contente de planter.
Tu peux tout détruire avec une seule commande. Bash t’applaudira quand même.
Un script Bash qui marche du premier coup est un mensonge.
Bash, c’est comme un partenaire jaloux : un détail mal placé et tout déraille.
Bash adore les surprises. Toi, beaucoup moins. 
"set -e" ... la commande préférée des gens qui aiment vivre dangereusement.
$RANDOM n’est pas ton ami. Il ne l’a jamais été.
awk et sed : quand tu veux te faire du mal, mais proprement.
Qui vit par le "rm -rf" , périra par le "rm -rf".
Sur Linux, tout est un fichier… même tes regrets.
Un “Ctrl+C” tardif, c’est comme une seconde chance trop courte.
Quand tu lis la doc après avoir tout cassé, la doc te regarde en silence.
Quand tu dis “j’ai rien compris”, le professeur comprends "tu n’as rien lu".
La doc explique tout, sauf pourquoi tu refuses de la lire.
Une doc ignorée se venge toujours.
L’IA n’est pas ton ami : c’est un marteau. Et pour un marteau, tout finit par ressembler à un clou. Alors fais attention où tu mets les doigts…
L’IA est un peu comme une boussole. Elle indique une direction, pas une destination. À toi de savoir où tu vas.
L’IA c’est une sorte de projecteur. L'\''IA éclaire une zone, mais laisse dans l’ombre ce qu’elle ignore. Ne prends pas la lumière pour une vérité.
L’IA n’est pas un expert : c’est un stagiaire trop pressé. Il répond vite, souvent bien, parfois complètement à côté — et il ne sait même pas quand il se trompe.
Quand la doc dit “ne faites jamais ça”, elle sait très bien que tu vas le faire.
Si tu veux vraiment souffrir, commence sans la doc.'

# Calcul et affichage aléatoire (compatible Alpine/Busybox)
count=$(echo "$quotes" | wc -l)
selected=$(echo "$quotes" | awk -v n=$count 'BEGIN{srand(); target=int(rand()*n)+1} NR==target')

echo -e "\n\033[0;33m[Sagesse du Terminal]\033[0m"
echo -e "\033[0;36m$selected\033[0m\n"
EOF

# 2. Permissions
chmod +x "$DEST"
echo "[OK] Script créé dans $DEST"

# 3. Activation automatique à l'ouverture de session
# On vérifie si la ligne n'est pas déjà présente pour éviter les doublons
if ! grep -q "$DEST" /etc/profile; then
    echo "$DEST" >> /etc/profile
    echo "[OK] Ajouté à /etc/profile pour exécution au login."
else
    echo "[Info] Déjà configuré dans /etc/profile."
fi

echo "--- Installation terminée ! Reconnecte-toi pour voir le résultat. ---"