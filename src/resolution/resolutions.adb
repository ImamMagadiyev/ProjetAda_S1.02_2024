with TAD_Coordonnee;   use TAD_Coordonnee;
with TAD_ensemble;     use TAD_ensemble;
with TAD_grilleSudoku; use TAD_grilleSudoku;
with TAD_CasPossible;  use TAD_CasPossible;
with Pile_CasPossibles;

package body resolutions is
   -----------------------
   -- EstChiffreValable --
   -----------------------
   function estChiffreValable
     (g : in Type_Grille; v : Integer; c : Type_Coordonnee) return Boolean
   is
      solutionsLigne, solutionsColonne, solutionsCarre : Type_Ensemble;
   begin
      if not caseVide (g, c) then
         raise CASE_NON_VIDE;
      end if;

      solutionsLigne   := obtenirChiffresDUneLigne (g, obtenirLigne (c));
      solutionsColonne := obtenirChiffresDUneColonne (g, obtenirColonne (c));
      solutionsCarre   := obtenirChiffresDUnCarre (g, obtenirCarre (c));
      return
        not
        (appartientChiffre (solutionsLigne, v) or
         appartientChiffre (solutionsColonne, v) or
         appartientChiffre (solutionsCarre, v));
   end estChiffreValable;

   -------------------------------
   -- obtenirSolutionsPossibles --
   -------------------------------
   function obtenirSolutionsPossibles
     (g : in Type_Grille; c : in Type_Coordonnee) return Type_Ensemble
   is
      e : Type_Ensemble := construireEnsemble;
   begin
      if not caseVide (g, c) then
         raise CASE_NON_VIDE;
      end if;

      for v in 1 .. 9 loop
         if estChiffreValable (g, v, c) then
            ajouterChiffre (e, v);
         end if;
      end loop;

      return e;
   end obtenirSolutionsPossibles;

   ------------------------------------------
   -- rechercherSolutionUniqueDansEnsemble --
   ------------------------------------------
   function rechercherSolutionUniqueDansEnsemble
     (resultats : in Type_Ensemble) return Integer
   is
   begin
      if nombreChiffres (resultats) > 1 then
         raise PLUS_DE_UN_CHIFFRE;
      elsif ensembleVide (resultats) then
         raise ENSEMBLE_VIDE;
      end if;

      for i in 1 .. 9 loop
         if appartientChiffre (resultats, i) then
            return i;
         end if;
      end loop;

      return 0;
   end rechercherSolutionUniqueDansEnsemble;

   -----------------------
   -- prochaineCaseVide --
   -----------------------
   function prochaineCaseVide (g : in Type_Grille) return Type_Coordonnee is
      c : Type_Coordonnee;
   begin
      if estRemplie (g) then
         raise GRILLE_REMPLIE;
      end if;

      for ligne in 1 .. 9 loop
         for colonne in 1 .. 9 loop
            if caseVide (g, construireCoordonnees (ligne, colonne)) then
               c := construireCoordonnees (ligne, colonne);
               return c;
            end if;
         end loop;
      end loop;

      return construireCoordonnees (0, 0);
   end prochaineCaseVide;

   ------------------------
   -- emplierCasPossible --
   ------------------------
   procedure empilerCasPossible
     (pile : in out Pile_CasPossibles.Type_Pile; solutions : in Type_Ensemble;
      caseActuel : in     Type_Coordonnee)
   is
      casPossible : type_CasPossible;
   begin
      for valeur in 1 .. 9 loop
         if appartientChiffre (solutions, valeur) then
            casPossible := construireCasPossible (caseActuel, valeur);
            pile        := Pile_CasPossibles.empiler (pile, casPossible);
         end if;
      end loop;
   end empilerCasPossible;

   --------------------------
   -- derniereCaseAChanger --
   --------------------------
   procedure viderPileJusquASolutionsMultiples
     (g : in out Type_Grille; pile : in out Pile_CasPossibles.Type_Pile;
      caseActuel : in     Type_Coordonnee)
   is
      casPossible                 : type_CasPossible;
      derniereCase, prochaineCase : Type_Coordonnee;
   begin
      if Pile_CasPossibles.estVide (pile) then
         raise VIDER_PILE_VIDE;
      end if;

      casPossible   := Pile_CasPossibles.dernier (pile);
      prochaineCase := obtenirCoordonne (casPossible);
      derniereCase  := caseActuel;

      while obtenirColonne (derniereCase) /= obtenirColonne (prochaineCase) or
        obtenirLigne (derniereCase) /= obtenirLigne (prochaineCase)
      loop
         pile := Pile_CasPossibles.depiler (pile);
         viderCase (g, prochaineCase);
         derniereCase  := prochaineCase;
         casPossible   := Pile_CasPossibles.dernier (pile);
         prochaineCase := obtenirCoordonne (casPossible);
      end loop;
   end viderPileJusquASolutionsMultiples;

   --------------------
   -- resoudreSudoku --
   --------------------
   procedure resoudreSudoku
     (g : in out Type_Grille; trouve : out Boolean; cpt : out Integer)
   is
      caseActuel  : Type_Coordonnee;
      solutions   : Type_Ensemble;
      casPossible : type_CasPossible;
      pile        : Pile_CasPossibles.Type_Pile;
   begin
      cpt        := 0;
      trouve     := False;
      caseActuel := construireCoordonnees (1, 1);
      pile       := Pile_CasPossibles.construirePile;

      while not estRemplie (g) loop
         caseActuel := prochaineCaseVide (g);
         solutions  := obtenirSolutionsPossibles (g, caseActuel);

         if nombreChiffres (solutions) /= 0 then
            empilerCasPossible (pile, solutions, caseActuel);
         else
            viderPileJusquASolutionsMultiples (g, pile, caseActuel);
         end if;
         
         casPossible := Pile_CasPossibles.dernier (pile);
         caseActuel  := obtenirCoordonne (casPossible);
         fixerChiffre (g, caseActuel, obtenirValeur (casPossible), cpt);
      end loop;

      trouve := True;
   end resoudreSudoku;
end resolutions;
