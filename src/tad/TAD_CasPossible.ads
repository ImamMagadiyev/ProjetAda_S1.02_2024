with TAD_Coordonnee; use TAD_Coordonnee;

package TAD_CasPossible is

   type type_CasPossible is private;

   -- construit une instance de cas possible
   -- signifiant que la case c a comme valeur possible v
   function construireCasPossible
     (c : Type_Coordonnee; v : Integer) return type_CasPossible;

   -- retourne la coordonnee du cas possible cp
   function obtenirCoordonne (cp : type_CasPossible) return Type_Coordonnee;

   -- retourne la valeur du cas possible cp
   function obtenirValeur (cp : type_CasPossible) return Integer;

private
   type type_CasPossible is record
      caseGrille     : Type_Coordonnee;
      valeurPossible : Integer;
   end record;

end TAD_CasPossible;
