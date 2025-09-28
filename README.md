# 🧩 Projet Ada — Comparaison algorithmique (S1.02)

## 🎯 Objectif du projet
Projet réalisé dans le cadre de l’UE **S1.02 - Comparaison algorithmique**.  
L’objectif était d’implémenter et de comparer différentes approches de **résolution de Sudoku** en langage **Ada** en utilisant des **structures de données abstraites (TAD)**.

---

## 👥 Équipe
Projet réalisé en **groupe de 4 étudiants** dans le cadre du BUT Informatique à l’IUT de Toulouse.

---

## ⚙️ Fonctionnalités principales
- Lecture de grilles de Sudoku à partir de fichiers (`grilles/`).  
- Vérification de la validité des grilles.  
- Implémentation de différents **TAD** (pile, ensemble, coordonnées, cas possibles, grille Sudoku...).  
- Résolution de Sudoku avec plusieurs approches et comparaison de leurs performances.  
- Jeux de **tests unitaires** pour valider les modules et TAD.  

---

## 📂 Structure du projet
- `src/resolution/` → algorithmes de résolution (remplir grille, affichage, etc.).  
- `src/tad/` → implémentations des différents TAD utilisés.  
- `grilles/` → grilles de Sudoku pour l’expérimentation (facile → très difficile).  
- `tests/` → jeux de tests pour les TAD et les algorithmes.  
- `sudoku.gpr` → fichier projet Ada (permet compilation avec `gnatmake`).  
- `obj/` → fichiers objets générés à la compilation.  

---

## 🛠️ Compilation et exécution
1. Compiler le projet avec GNAT :  
   ```bash
   gnatmake -P sudoku.gpr
   ```

2. Lancer l’exécutable généré (souvent dans `bin/` ou à la racine) :  
   ```bash
   ./sudoku
   ```

3. Pour exécuter les tests unitaires :  
   ```bash
   gnatmake -P tests/tests_TAD/run_tests_TAD_Pile.adb
   ./tests/tests_TAD/run_tests_TAD_Pile
   ```

---

## 📊 Objectifs pédagogiques
- Découverte et maîtrise du langage **Ada**.  
- Utilisation et implémentation de **structures de données abstraites (TAD)**.  
- Mise en place de **tests unitaires**.  
- Analyse de la **complexité algorithmique** appliquée à un cas concret (résolution de Sudoku).  

---

## 🔗 Dépôt GitHub
Projet hébergé sur GitHub :  
https://github.com/im31200/ProjetAda_S1.02_2024
