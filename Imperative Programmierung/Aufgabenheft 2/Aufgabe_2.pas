program merge (input, output);
{ liest ohne Eingabeueberpruefung zwei sortierte Felder mit 
  integer-Zahlen ein; beide Felder werden in einem weiteren Feld
  sortiert zusammengefuegt; das Ergebnis wird ausgegeben; ist 
  die Eingabe unsortiert, so ist das Ergebnisfeld undefiniert }
  const
  FELDLAENGE1 = 5;
  FELDLAENGE2 = 8;
  ERGEBNISFELDLAENGE = 13; { FELDLAENGE1 + FELDLAENGE2 }
        
  type
  tFeld1 = array [1..FELDLAENGE1] of integer;
  tFeld2 = array [1..FELDLAENGE2] of integer;
  tErgebnisFeld = array [1..ERGEBNISFELDLAENGE] of integer;

  var
  Feld1 : tFeld1;
  Feld2 : tFeld2;
  ErgebnisFeld : tErgebnisFeld;
  i : integer;
  j : integer;
  k : integer;
begin
  { sortierte Felder einlesen }
  writeln ('Bitte', FELDLAENGE1:2, ' Werte des ersten Feldes ',
                                         'sortiert eingeben!');
  for i := 1 to FELDLAENGE1 do
    readln (Feld1[i]);
  writeln ('Bitte', FELDLAENGE2:2, ' Werte des zweiten Feldes ',
           'sortiert eingeben!');
  for j := 1 to FELDLAENGE2 do
    readln (Feld2[j]);

  { Verschmelzungsprozess beginnen }
  i := 1;
  j := 1;
  k := 1;

  repeat
    {Beide Parallel durchlaufen, bis einer davon eher fertig ist}
    if (i <= FELDLAENGE1) And (j <= FELDLAENGE2) Then
    begin
      If Feld1[i] < Feld2[j] then {den Wert der kleiner ist in das ErgebnisFeld-Array schreiben}
      begin
        ErgebnisFeld[k] := Feld1[i];
        i := i + 1;
      end
      else
      begin
        ErgebnisFeld[k] := Feld2[j];
        j := j + 1;
      end
    end
    else If (i<=FELDLAENGE1) And (j>=FELDLAENGE2) then
    {Wenn j eher fertig war, dann noch den Rest von i durchgehen}
    begin
      ErgebnisFeld[k] := Feld1[i];
      i := i + 1;
    end
    else If (j<=FELDLAENGE2) And (i>=FELDLAENGE1) then
    {Wenn i eher fertig war, dann noch die Werte von j durchgehen}
    begin
      ErgebnisFeld[k] := Feld2[j];
      j := j + 1;
    end;
    k := k + 1; {Für das Ergebnisfeld}
  until (i>=FELDLAENGE1+1) And (j>=FELDLAENGE2+1); {bis beide durchgelaufen sind}

  writeln ('Das Ergebnisfeld ist:');
  for k := 1 to ERGEBNISFELDLAENGE do
    write (ErgebnisFeld[k], ' ');
  writeln
end.