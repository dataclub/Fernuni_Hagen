Program Maximum (input, output);

{ bestimmt das Maximum einer Zahlenfolge von einzulesenden integer-Zahlen. 
Dabei wird die letzte 0 nicht berücksichtigt! }

Var 
  i: integer;               {Laufvariable, wird nur hochgezählt}
  Zahl, Max : integer;
  {Eingegebene Integer-Zahlen und das Maximum aller eingegeben Zahlen}

Begin
  writeln ('Geben Sie beliebig viele ganze Zahlen ein,');
  writeln ('deren Maximum bestimmt werden soll.');
  writeln ('Sie können die Zahlenfolge mit 0 beenden!');

  i := 1;

  {Liest die erste Eingabe ein!}
  write(i, '. Wert: ');
  readln (Zahl);
  Max := Zahl;

  Repeat
    Begin
      If (Zahl <> 0) Then
        Begin
          If (Zahl > Max) Then
            Max := Zahl;
            
          {Liest ab der 2.ten Eingabe ein!}
          i := i+1;
          write(i, '. Wert: ');
          readln (Zahl);
        End; {Zahl <> 0}
    End;
  Until (Zahl = 0); {repeat-schleife-ENDE} {sobald Zahl = 0}

  writeln('Leere Eingabefolge!');
  {Wenn die erste Zahl keine 0 war}
  If (i > 1) Then
    Begin
      writeln ('Das Maximum ist: ', Max, '.');
    End;

End.
