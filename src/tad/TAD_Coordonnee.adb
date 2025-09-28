package body TAD_Coordonnee is
   ---------------------------
   -- construireCoordonnees --
   ---------------------------
   function construireCoordonnees
     (ligne : Integer; colonne : Integer) return Type_Coordonnee
   is
      c : Type_Coordonnee;
   begin
      c.ligne   := ligne;
      c.colonne := colonne;
      return c;
   end construireCoordonnees;

   ------------------
   -- obtenirLigne --
   ------------------
   function obtenirLigne (c : Type_Coordonnee) return Integer is
   begin
      return c.ligne;
   end obtenirLigne;

   --------------------
   -- obetnirColonne --
   --------------------
   function obtenirColonne (c : Type_Coordonnee) return Integer is
   begin
      return c.colonne;
   end obtenirColonne;

   ------------------
   -- obtenirCarre --
   ------------------
   function obtenirCarre (c : Type_Coordonnee) return Integer is
   begin
      return
        (3 * ((obtenirLigne (c) - 1) / 3)) + ((obtenirColonne (c) - 1) / 3) +
        1;
   end obtenirCarre;

   ----------------------------
   -- obtenirCoordonneeCarre --
   ----------------------------
   function obtenirCoordonneeCarre (numCarre : Integer) return Type_Coordonnee
   is
   begin
      return
        construireCoordonnees
          (((numCarre - 1) / 3 * 3) + 1, ((numCarre - 1) mod 3) * 3 + 1);
   end obtenirCoordonneeCarre;

end TAD_Coordonnee;
