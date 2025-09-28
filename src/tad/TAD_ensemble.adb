pragma Ada_2012;
package body TAD_ensemble is
   ------------------------
   -- construireEnsemble --
   ------------------------
   function construireEnsemble return Type_Ensemble is
      e : Type_Ensemble;
   begin
      for i in 1 .. 9 loop
         e (i) := False;
      end loop;

      return e;
   end construireEnsemble;

   ------------------
   -- ensembleVide --
   ------------------
   function ensembleVide (e : in Type_Ensemble) return Boolean is
   begin
      for i in 1 .. 9 loop
         if e (i) then
            return False;
         end if;
      end loop;

      return True;
   end ensembleVide;

   -----------------------
   -- appartientChiffre --
   -----------------------
   function appartientChiffre
     (e : in Type_Ensemble; v : Integer) return Boolean
   is
   begin
      return e (v);
   end appartientChiffre;

   --------------------
   -- nombreChiffres --
   --------------------
   function nombreChiffres (e : in Type_Ensemble) return Integer is
      cpt : Integer := 0;
   begin
      for i in 1 .. 9 loop
         if e (i) then
            cpt := cpt + 1;
         end if;
      end loop;

      return cpt;
   end nombreChiffres;

   --------------------
   -- ajouterChiffre --
   --------------------
   procedure ajouterChiffre (e : in out Type_Ensemble; v : in Integer) is
   begin
      if appartientChiffre (e, v) then
         raise APPARTIENT_ENSEMBLE;
      end if;

      e (v) := True;
   end ajouterChiffre;

   --------------------
   -- retirerChiffre --
   --------------------
   procedure retirerChiffre (e : in out Type_Ensemble; v : in Integer) is
   begin
      if not appartientChiffre (e, v) then
         raise NON_APPARTIENT_ENSEMBLE;
      end if;

      e (v) := False;
   end retirerChiffre;

end TAD_ensemble;
