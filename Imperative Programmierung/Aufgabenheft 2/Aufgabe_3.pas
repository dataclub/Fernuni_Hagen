
Program MatrixSummen (input, output);

{ ueberprueft bei einer Matrix von integer-Zahlen, ob
  jede Spaltensumme groesser ist als die Zeilensumme einer
  angegebenen Zeile }

Const 
  ZEILENMAX = 3;
  SPALTENMAX = 4;

Type 
  tMatrix = array [1..ZEILENMAX, 1..SPALTENMAX] Of integer;

Var 
  Matrix : tMatrix;
  ZeilenNr,
  SpaltenNr,
  Eingabe : integer;

Function ZeilenSummeKleiner (Var inMatrix : tMatrix;
                             inZeilenNr : integer) : boolean;

{ ergibt true, falls die Summe aller Elemente mit dem
      uebergebenen Zeilenindex kleiner ist als jede
      Spaltensumme }

Var 
  ZeilenSumme: integer;         { Summe der eingegebenen Zeilenmatrix }
  SpaltenSumme: integer;        { Summe einzelner Spalten bis SPALTENMAX }
  i: integer;                   { Laufvariable Zeilenmatrix }
  j: integer;                   { Laufvariable Spaltenmatrix }

Begin
  ZeilenSumme := 0;
  ZeilenSummeKleiner := true;

  { Bilden der Summe aller Spalten für die angegebene Zeile inZeilenNr}
  For i := 1 To SPALTENMAX Do
    Begin
      ZeilenSumme := ZeilenSumme + inMatrix[inZeilenNr][i];
    End;


  j := 1;
  Repeat
{ Für alle Spalten durchlaufen, bis eine der Spaltensumme kleiner ist als die Zeilensumme }
    SpaltenSumme := 0;
    Begin
      For i := 1 To ZEILENMAX Do
        Begin
          SpaltenSumme := SpaltenSumme + inMatrix[i][j];
        End;

      j := j + 1;
    End;
  Until (SpaltenSumme < ZeilenSumme) Or (j >= SPALTENMAX);


{ Erneut überprüfen, ob tatsächlich die Spaltensumme kleiner ist als Zeilensumme,
    den es gibt ja noch die Möglichkeit, dass einfach alle Spalten überprüft 
    wurden bis j>= SPALTENMAX
  }
  If (SpaltenSumme <= ZeilenSumme) Then
    Begin
      ZeilenSummeKleiner := false;
    End;

End;{ ZeilenSummeKleiner }

Begin { Matrixelemente einlesen }
  For ZeilenNr := 1 To ZEILENMAX Do
    For SpaltenNr := 1 To SPALTENMAX Do
      read (Matrix[ZeilenNr, SpaltenNr]);
  Repeat
    write ('Welche Zeile soll ueberprueft werden ? (1..', ZEILENMAX,
           ') (anderes = Ende) ');
    readln (Eingabe);
    If (Eingabe > 0) And (Eingabe <= ZEILENMAX) Then
      Begin
        ZeilenNr := Eingabe;
        { hier wird die Funktion ZeilenSummeKleiner aufgerufen }
        If ZeilenSummeKleiner (Matrix,ZeilenNr) Then
          writeln ('Jede Spaltensumme ist groesser als die ', 'Zeilensumme der '
                   , ZeilenNr, '. Zeile.')
        Else
          writeln ('Es sind nicht alle Spaltensummen groesser als die ',
                   'Zeilensumme der ', ZeilenNr, '. Zeile.')
      End;
  Until (Eingabe <= 0) Or (Eingabe > ZEILENMAX)
End. { MatrixSummen }
