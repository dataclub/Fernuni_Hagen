
Program transponiereMatrix(input, output);

Const 
  GROESSE = 5;

Type 
  tMatrix = array [1..GROESSE,1..GROESSE] Of integer;

Var 
  A : tMatrix;
  tauschPuffer,
  i,
  j : integer;
  auswahl: char;
Begin
  A[1,1] := 15;
  A[1,2] := 8;
  A[1,3] := 1;
  A[1,4] := 24;
  A[1,5] := 17;

  A[2,1] := 16;
  A[2,2] := 14;
  A[2,3] := 7;
  A[2,4] := 5;
  A[2,5] := 23;

  A[3,1] := 22;
  A[3,2] := 20;
  A[3,3] := 13;
  A[3,4] := 6;
  A[3,5] := 4;

  A[4,1] := 3;
  A[4,2] := 21;
  A[4,3] := 19;
  A[4,4] := 12;
  A[4,5] := 10;

  A[5,1] := 9;
  A[5,2] := 2;
  A[5,3] := 25;
  A[5,4] := 18;
  A[5,5] := 11;

  writeln('Treffen Sie eine Entscheidung zwischen A-E');
  readln(auswahl);
  If (auswahl = 'A') Then
  {Richtige Lösung}
    Begin
      For i := 1 To GROESSE-1 Do
        For j := i+1 To GROESSE Do
          Begin
            tauschPuffer := A[i,j];
            A[i,j] := A[j,i];
            A[j,i] := tauschPuffer
          End;

    End
  Else If (auswahl = 'B') Then
  {Richtige Lösung}
    Begin
    For i := 1 To GROESSE Do
        Begin
        For j := 1 To i Do
            Begin
            tauschPuffer := A[i,j];
            A[i,j] := A[j,i];
            A[j,i] := tauschPuffer
            End
        End;
    End
  Else If (auswahl = 'C') Then
  {Falsche Lösung}
    Begin
    For i := 1 To GROESSE Do
        For j := 1 To GROESSE Do
        Begin
            tauschPuffer := A[i,j];
            A[i,j] := A[j,i];
            A[j,i] := tauschPuffer
        End
    End
  Else If (auswahl = 'D') Then
  {Falsche Lösung}
    Begin
    For i := 1 To GROESSE Do
        For j := 1 To GROESSE-i Do
        Begin
            tauschPuffer := A[i,j];
            A[i,j] := A[j,i];
            A[j,i] := tauschPuffer
        End
    End
  Else If (auswahl = 'E') Then
  {Falsche Lösung}
    Begin
    For i := 1 To GROESSE-1 Do
        For j := i+1 To GROESSE Do
        Begin
            tauschPuffer := A[i,j];
            A[j,i] := A[i,j];
            A[j,i] := tauschPuffer
        End
    End;

  { Ausgebene der Matrixwerte für A: }
  For i := 1 To GROESSE Do
    Begin
      For j := 1 To GROESSE Do
        Begin
          If (A[i,j] < 10) Then
            write(' ');
          write (A[i,j], ' ');
        End;
      writeln;
    End;


End.
