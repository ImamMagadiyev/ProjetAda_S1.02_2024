with TAD_Coordonnee;   use TAD_Coordonnee;
with TAD_ensemble;     use TAD_ensemble;
with TAD_grilleSudoku; use TAD_grilleSudoku;
with TAD_CasPossible;  use TAD_CasPossible;
with Pile_CasPossibles;

package resolutions is

   PLUS_DE_UN_CHIFFRE : exception;
   CASE_NON_VIDE      : exception;
   ENSEMBLE_VIDE      : exception;
   GRILLE_REMPLIE     : exception;
   VIDER_PILE_VIDE    : exception;

   -- retourne VRAI si la valeur v peut rentrer dans la case c de la grille g
   -- et FAUX sinon
   -- nécessite la case c est vide
   -- lève l'exception CASE_NON_VIDE si la case n'est pas vide
   function estChiffreValable
     (g : in Type_Grille; v : Integer; c : Type_Coordonnee) return Boolean;

   -- retourne l'ensemble des valeurs possibles pour la case c de la grille g
   -- necessite que la case c soit vide
   -- lève l'exception CASE_NON_VIDE si la case étudiée n'est pas vide
   function obtenirSolutionsPossibles
     (g : in Type_Grille; c : in Type_Coordonnee) return Type_Ensemble;

   -- retourne la valeur unique de v dans le tableau resultats
   -- nécessite qu'il n'y ait qu'un seul chiffre dans resultats
   -- lève l'exception PLUS_DE_UN_CHIFFRE s'il y a plus d'un chiffre dans resultats
   -- lève l'exception ENSEMBLE_VIDE si résultat est vide
   function rechercherSolutionUniqueDansEnsemble
     (resultats : in Type_Ensemble) return Integer;

   -- Renvoi la coordonnée de la prochaine case vide de la grille g
   -- nécessite que la grille n'est pas vide
   -- lève l'exception GRILLE_VIDE si la grille est vide
   function prochaineCaseVide (g : in Type_Grille) return Type_Coordonnee;

   -- Empile les cas possibles de la case caseActuel avec ses solutions possibles
   procedure empilerCasPossible
     (pile : in out Pile_CasPossibles.Type_Pile; solutions : in Type_Ensemble;
      caseActuel : in     Type_Coordonnee);

   -- Vide la pile jusqu'à trouver une case a modifier (plus de 1 solution)
   -- caseActuel devient la case a modifier
   -- nécessite pile non vide
   -- lève l'exeption VIDER_PILE_VIDE si pile est vide
   procedure viderPileJusquASolutionsMultiples
     (g : in out Type_Grille; pile : in out Pile_CasPossibles.Type_Pile;
      caseActuel : in     Type_Coordonnee);

   -- si la solution a ete trouve pour la grille g, alors Trouve est a VRAI et
   -- la grille est complete
   -- sinon Trouve est a FAUX et la grille n'a aucune valeur significative
   -- parcours la grille
   procedure resoudreSudoku
     (g : in out Type_Grille; trouve : out Boolean; cpt : out Integer);

end resolutions;
