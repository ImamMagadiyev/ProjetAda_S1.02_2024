with TAD_ensemble;   use TAD_ensemble;
with TAD_Coordonnee; use TAD_Coordonnee;

package body TAD_grilleSudoku is
   ----------------------
   -- construireGrille --
   ----------------------
   function construireGrille return Type_Grille is
      g : Type_Grille;
   begin
      for ligne in 1 .. 9 loop
         for colonne in 1 .. 9 loop
            g (ligne, colonne) := 0;
         end loop;
      end loop;

      return g;
   end construireGrille;

   --------------
   -- caseVide --
   --------------
   function caseVide
     (g : in Type_Grille; c : in Type_Coordonnee) return Boolean
   is
   begin
      return g (obtenirLigne (c), obtenirColonne (c)) = 0;
   end caseVide;

   --------------------
   -- obtenirChiffre --
   --------------------
   function obtenirChiffre
     (g : in Type_Grille; c : in Type_Coordonnee) return Integer
   is
   begin
      if caseVide (g, c) then
         raise OBTENIR_CHIFFRE_NUL;
      end if;

      return g (obtenirLigne (c), obtenirColonne (c));
   end obtenirChiffre;

   --------------------
   -- nombreChiffres --
   --------------------
   function nombreChiffres (g : in Type_Grille) return Integer is
      cpt : Integer := 0;
   begin
      for ligne in 1 .. 9 loop
         for colonne in 1 .. 9 loop
            if g (ligne, colonne) /= 0 then
               cpt := cpt + 1;
            end if;
         end loop;
      end loop;

      return cpt;
   end nombreChiffres;

   ------------------
   -- fixerChiffre --
   ------------------
   procedure fixerChiffre
     (g   : in out Type_Grille; c : in Type_Coordonnee; v : in Integer;
      cpt : in out Integer)
   is
   begin
      if not caseVide (g, c) then
         raise FIXER_CHIFFRE_NON_NUL;
      end if;

      g (obtenirLigne (c), obtenirColonne (c)) := v;
      cpt := cpt + 1; -- Incrémente le compteur des chiffres placés
   end fixerChiffre;

   ---------------
   -- viderCase --
   ---------------
   procedure viderCase (g : in out Type_Grille; c : in out Type_Coordonnee) is
   begin
      if caseVide (g, c) then
         raise VIDER_CASE_VIDE;
      end if;

      g (obtenirLigne (c), obtenirColonne (c)) := 0;
   end viderCase;

   ----------------
   -- estRemplie --
   ----------------
   function estRemplie (g : in Type_Grille) return Boolean is
      c : Type_Coordonnee;
   begin
      for ligne in 1 .. 9 loop
         for colonne in 1 .. 9 loop
            c := construireCoordonnees(ligne, colonne);
            if caseVide(g, c) then
               return False;
            end if;
         end loop;
      end loop;

      return True;
   end estRemplie;

   ------------------------------
   -- obtenirChiffresDUneLigne --
   ------------------------------
   function obtenirChiffresDUneLigne
     (g : in Type_Grille; numLigne : in Integer) return Type_Ensemble
   is
      c : Type_Coordonnee;
      ligne : Type_Ensemble := construireEnsemble;
   begin
      for colonne in 1 .. 9 loop
         c := construireCoordonnees(numLigne, colonne);
         if not caseVide(g, c) then
            ajouterChiffre (ligne, obtenirChiffre(g, c));
         end if;
      end loop;

      return ligne;
   end obtenirChiffresDUneLigne;

   --------------------------------
   -- obtenirChiffresDUneColonne --
   --------------------------------
   function obtenirChiffresDUneColonne
     (g : in Type_Grille; numColonne : in Integer) return Type_Ensemble
   is
      c: Type_Coordonnee;
      colonne : Type_Ensemble := construireEnsemble;
   begin
      for i in 1 .. 9 loop
         c := construireCoordonnees(i, numColonne);
         if not caseVide(g, c) then
            ajouterChiffre (colonne, obtenirChiffre(g, c));
         end if;
      end loop;

      return colonne;
   end obtenirChiffresDUneColonne;

   -----------------------------
   -- obtenirChiffresDUnCarre --
   -----------------------------
   function obtenirChiffresDUnCarre
     (g : in Type_Grille; numCarre : in Integer) return Type_Ensemble
   is
      c: Type_Coordonnee;
      carre        : Type_Ensemble := construireEnsemble;
      debutLigne   : Integer;
      debutColonne : Integer;
   begin
      debutLigne   := ((numCarre - 1) / 3) * 3 + 1;
      debutColonne := ((numCarre - 1) mod 3) * 3 + 1;
      for ligne in debutLigne .. debutLigne + 2 loop
         for colonne in debutColonne .. debutColonne + 2 loop
            c := construireCoordonnees(ligne, colonne);
            if not caseVide(g, c) then
               ajouterChiffre (carre, obtenirChiffre(g, c));
            end if;
         end loop;
      end loop;
      
      return carre;
   end obtenirChiffresDUnCarre;

end TAD_grilleSudoku;
