
Program muenzenRechner (input, output);
{ liest Geldmünzen zwischen 1 und 99 Cent ein und verteilt 
diese Geldmünzen über die Münzen, die im Umlauf sind  }

Const 
  MUENZENLAENGE = 6;

Type 
  tMuenzen = array [1..MUENZENLAENGE] Of integer;

Var 
  MuenzenImUmlauf : tMuenzen;   {die Münzen, die im Umlauf sind}
  MuenzenVerteilt : tMuenzen;   {das Ergebnis der Verteilung}
  Betrag: integer;
  {einzulesende Betrag, der zwischen 1 bis 99 liegt}
  Zaehler: integer;             {zählt wie oft eine Münze vorkommt}

  i: integer;
Begin
  MuenzenImUmlauf[1] := 50;
  MuenzenImUmlauf[2] := 20;
  MuenzenImUmlauf[3] := 10;
  MuenzenImUmlauf[4] := 5;
  MuenzenImUmlauf[5] := 2;
  MuenzenImUmlauf[6] := 1;

  write ('Eingabe: ');
  read(Betrag);

  For i := 1 To MUENZENLAENGE Do
    Begin
      Zaehler := 0;
      Repeat

        If (Betrag >= MuenzenImUmlauf[i]) Then
          Begin

            Betrag := Betrag - MuenzenImUmlauf[i];
            Zaehler := Zaehler + 1;
          End
      Until (Betrag < MuenzenImUmlauf[i]);

      write ( Zaehler, ' ');
    End;

  writeln;
End.
