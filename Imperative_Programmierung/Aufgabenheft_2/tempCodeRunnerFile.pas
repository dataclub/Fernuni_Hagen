rogram binaeresSuchen(input, output);

Const 
  FELDGROESSE = 7;

Var 
  unten, oben, Mitte : integer;
  Feld : array[1..FELDGROESSE] Of integer;
  Suchwert : integer;
  gefunden : boolean;
  auswahl: char;
  i: integer;
Begin

  For i := 0 To FELDGROESSE Do
    Begin
      Feld[i] := Random(i) + i * 10;
    End;

  gefunden := false;
  unten := 1;
  oben := FELDGROESSE;

  writeln('Wählen Sie zwischen den Buchstaben A-E,');
  writeln('um den Programmablauf zu verändern.');
  read(auswahl);

  Case auswahl Of 
    'A':
         Begin
           unten := 1;
           oben := FELDGROESSE;
           Repeat
             Mitte := (oben + unten) Div 2;
             If Suchwert > Feld[Mitte] Then
               unten := Mitte + 1;
             If Suchwert < Feld[Mitte] Then
               oben := Mitte - 1;
             gefunden := (Suchwert = Feld[Mitte])
           Until gefunden Or (unten > oben);
         End

         Else

  End;


  If (gefunden) Then
    writeln("Suchwert wurde gefunden.");
  Else
    writeln("Suchwert wurde nicht gefunden.");
End;
