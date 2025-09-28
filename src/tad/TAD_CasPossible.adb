with TAD_Coordonnee; use TAD_Coordonnee;

package body TAD_CasPossible is
   --------------------------
   -- constuireCasPossible --
   --------------------------
   function construireCasPossible
     (c : Type_Coordonnee; v : Integer) return type_CasPossible
   is
      casPossible : type_CasPossible;
   begin
      casPossible.caseGrille     := c;
      casPossible.valeurPossible := v;
      return casPossible;
   end construireCasPossible;

   -----------------------
   -- obtenirCoordonnee --
   -----------------------
   function obtenirCoordonne (cp : type_CasPossible) return Type_Coordonnee is
   begin
      return cp.caseGrille;
   end obtenirCoordonne;

   -------------------
   -- obtenirValeur --
   -------------------
   function obtenirValeur (cp : type_CasPossible) return Integer is
   begin
      return cp.valeurPossible;
   end obtenirValeur;

end TAD_CasPossible;
