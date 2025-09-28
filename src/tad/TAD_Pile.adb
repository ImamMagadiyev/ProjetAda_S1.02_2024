package body TAD_Pile is
   -------------------
   -- constuirePile --
   -------------------
   function construirePile return Type_Pile is
      pile : Type_Pile;
   begin
      return pile;
   end construirePile;

   -------------
   -- estVide --
   -------------
   function estVide (pile : in Type_Pile) return Boolean is
   begin
      return pile.nb_elements = 0;
   end estVide;

   -------------
   -- dernier --
   -------------
   function dernier (pile : in Type_Pile) return T is
   begin
      if estVide (pile) then
         raise PILE_VIDE;
      end if;

      return pile.elements (pile.nb_elements);
   end dernier;

   -------------
   -- empiler --
   -------------
   function empiler (pile : in Type_Pile ; e : in T) return Type_Pile is
      nouvellePile : Type_Pile;
   begin
      if pile.nb_elements = TAILLE_MAX then
         raise PILE_PLEINE;
      end if;

      nouvellePile.nb_elements := pile.nb_elements + 1;
      nouvellePile.elements := pile.elements;
      nouvellePile.elements(nouvellePile.nb_elements) := e;
      return nouvellePile;
   end empiler;

   -------------
   -- depiler --
   -------------
   function depiler (pile : in Type_Pile) return Type_Pile is
      nouvellePile : Type_Pile;
   begin
      if estVide (pile) then
         raise PILE_VIDE;
      end if;

      nouvellePile.nb_elements := pile.nb_elements - 1;
      nouvellePile.elements := pile.elements;
      return nouvellePile;
   end depiler;

end TAD_Pile;
