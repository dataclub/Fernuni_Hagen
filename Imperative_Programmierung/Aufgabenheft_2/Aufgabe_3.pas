
program MatrixSummen (input, output);

{ ueberprueft bei einer Matrix von integer-Zahlen, ob
  jede Spaltensumme groesser ist als die Zeilensumme einer
  angegebenen Zeile }

const 
  ZEILENMAX = 3;
  SPALTENMAX = 4;

type 
  tMatrix = array [1..ZEILENMAX, 1..SPALTENMAX] of integer;

var 
  Matrix : tMatrix;
  ZeilenNr,
  SpaltenNr,
  Eingabe : integer;

function ZeilenSummeKleiner (var inMatrix : tMatrix;
                             inZeilenNr : integer) : boolean;
  { ergibt true, falls die Summe aller Elemente mit dem
    uebergebenen Zeilenindex kleiner ist als jede
    Spaltensumme }

var 
  ZeilenSumme: integer;         { Summe der eingegebenen Zeilenmatrix }
  SpaltenSumme: integer;        { Summe einzelner Spalten bis SPALTENMAX }
  i: integer;                   { Laufvariable Zeilenmatrix }
  j: integer;                   { Laufvariable Spaltenmatrix }

begin
  ZeilenSumme := 0;
  ZeilenSummeKleiner := true;

  { Bilden der Summe aller Spalten für die angegebene Zeile inZeilenNr}
  for i := 1 to SPALTENMAX do
    ZeilenSumme := ZeilenSumme + inMatrix[inZeilenNr][i];


  j := 1;
  repeat { Durchlaufen, bis eine der Spaltensumme kleiner ist als die Zeilensumme }
    SpaltenSumme := 0;
    for i := 1 to ZEILENMAX do
      SpaltenSumme := SpaltenSumme + inMatrix[i][j];

    j := j + 1;
  until (SpaltenSumme < ZeilenSumme) Or (j >= SPALTENMAX);


  { Erneut überprüfen, ob tatsächlich die Spaltensumme kleiner ist als Zeilensumme,
    den es gibt ja noch die Möglichkeit, dass einfach alle Spalten überprüft 
    wurden bis j>= SPALTENMAX
  }
  if (SpaltenSumme <= ZeilenSumme) then
    ZeilenSummeKleiner := false;

end;{ ZeilenSummeKleiner }

begin { Matrixelemente einlesen }
  for ZeilenNr := 1 to ZEILENMAX Do
    for SpaltenNr := 1 to SPALTENMAX Do
      read (Matrix[ZeilenNr, SpaltenNr]);
  repeat
    write ('Welche Zeile soll ueberprueft werden ? (1..', ZEILENMAX,
           ') (anderes = Ende) ');
    readln (Eingabe);
    if (Eingabe > 0) And (Eingabe <= ZEILENMAX) then
      begin
        ZeilenNr := Eingabe;
        { hier wird die Funktion ZeilenSummeKleiner aufgerufen }
        if ZeilenSummeKleiner (Matrix,ZeilenNr) then
          writeln ('Jede Spaltensumme ist groesser als die ', 'Zeilensumme der '
                   , ZeilenNr, '. Zeile.')
        else
          writeln ('Es sind nicht alle Spaltensummen groesser als die ',
                   'Zeilensumme der ', ZeilenNr, '. Zeile.')
      end;
  until (Eingabe <= 0) Or (Eingabe > ZEILENMAX)
end. { MatrixSummen }
