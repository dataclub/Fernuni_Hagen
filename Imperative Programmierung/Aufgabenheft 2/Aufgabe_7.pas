
Program executeErlaubt(input, output);

Const 
  GRENZE = 10;

Type 
  tIndex = 1..GRENZE;
  tFeld = array [tIndex] Of integer;

Var 
  Feld : tFeld;
  w,
  w1,
  w2 : integer;
  auswahl: char;

Function max (ParFeld: tFeld;
              von, bis: tIndex): integer;

{ bestimmt das Maximum im Teilfeld von ParFeld[von] 
      bis ParFeld[bis] }
Var 
  Wert : integer;
  i : tIndex;
Begin
  Wert := ParFeld[von];
  For i := von + 1 To bis Do
    If ParFeld[i] > Wert Then
      Wert := ParFeld[i];
  max := Wert
End; { max }
Begin
  Feld[1] := 1;
  Feld[2] := 2;
  Feld[3] := 3;
  Feld[4] := 4;
  Feld[5] := 5;
  Feld[6] := 6;
  Feld[7] := 7;
  Feld[8] := 8;
  Feld[9] := 9;
  Feld[10] := 10;

  write('Treffen Sie eine Auswahl zwischen A-E');
  readln(auswahl);
  If (auswahl = 'A') Then
    {Falsche Lösung, Hier braucht man nur einen Wert im Array über 10 setzen}
    w := max (Feld, Feld[1], Feld[GRENZE])
  Else If (auswahl = 'B') Then
    Begin
    {Richtige Lösung}
    w := max (Feld, (GRENZE-1) Div 2,
        (GRENZE-1) Div 2);
    End
  Else If (auswahl = 'C') Then
    Begin
    {Richtige Lösung}
    If max (Feld, 1, (GRENZE-1) Div 2) >
        max (Feld, (GRENZE+1) Div 2, GRENZE)
        Then
        w := max (Feld, 1, (GRENZE-1) Div 2)
    Else
        w := max (Feld, (GRENZE+1) Div 2, GRENZE);
    End
  Else If (auswahl = 'D') Then
    Begin
    {Richtige Lösung}
    w := max (Feld, 1, GRENZE);
    If w <= GRENZE Then
        write (max (Feld, w, w));
    End
  Else If (auswahl = 'E') Then
    Begin
    {Richtige Lösung}
    w1 := max (Feld, 1, GRENZE);
    w2 := max (Feld, 4, GRENZE-1);
    If (0 < w2) And (w1 <= GRENZE) Then
        Begin
        w := max (Feld, 2, GRENZE);
        w := max (Feld, 1, w)
        End;
    End;
End.
