
Program binaeresSuchen(input, output);

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
  Suchwert := 105;
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

  If (auswahl = 'A') Then
  {Die Lösung ist richtig}
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
  Else If (auswahl = 'B') Then
{hier hängt sich das Programm auf, wenn man eine größere Zahl eingibt, als der max im Array-vorkommende Zahl}
    Begin
    unten := 1;
    oben := FELDGROESSE;
    Repeat
        Mitte := (oben + unten) Div 2;
        If Suchwert > Feld[Mitte] Then
        unten := Mitte
        Else
        oben := Mitte;
        gefunden := (Feld[Mitte] = Suchwert)
    Until gefunden Or (unten >= oben);
    End
  Else If (auswahl = 'C') Then
    Begin
    {hier ist das Problem, dass bei unten = oben in der while schleife abgebrochen wird, wenn man die Zahl des ersten elements sucht}
        gefunden := false;
        unten := 1;
        oben := FELDGROESSE;
        While (unten < oben) And Not gefunden Do
            Begin
            Mitte := (oben + unten) Div 2;
            If Suchwert = Feld[Mitte] Then
                gefunden := true
            Else
                If Suchwert < Feld[Mitte] Then
                oben := Mitte - 1
            Else
                unten := Mitte + 1
            End;
    End
  else if(auswahl = 'D') Then
    begin
        {Die Lösung ist richtig, da hier genau das berichtigt wurde, was in der Lösung C falsch ist!}
        gefunden := false;
        unten := 1;
        oben := FELDGROESSE;
        while (unten <= oben) and not gefunden do
        begin
        Mitte := (oben + unten) div 2;
        if Suchwert = Feld[Mitte] then
            gefunden := true
        else
            if Suchwert < Feld[Mitte] then
            oben := Mitte - 1
            else
            unten := Mitte + 1
        end;
    end
  else if(auswahl = 'E') then
    begin
        {Die Lösung ist richtig, da dieser so funktioniert, dass gleichzeitig auf den Wert geprüft wird, 
        sobald dieser gefunden wurde, wird die Grenze überschritten, damit es über den until abbricht}
        unten := 1;
        oben := FELDGROESSE;
        repeat
            Mitte := (oben + unten) div 2;
            if Suchwert <= Feld[Mitte] then
                oben := Mitte - 1;
            if Feld[Mitte] <= Suchwert then
                unten := Mitte + 1;
        until (unten > oben);
        gefunden := (Feld[Mitte] = Suchwert);
    end;

  If (gefunden) Then
    writeln('Suchwert wurde gefunden.')
  Else
    writeln('Suchwert wurde nicht gefunden.')

End.
