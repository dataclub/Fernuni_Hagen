program Maximum (input, output);

{ bestimmt das Maximum einer Zahlenfolge von einzulesenden integer-Zahlen. 
Dabei wird die letzte 0 nicht berücksichtigt! }

var 
  i: integer;               {Laufvariable, wird nur hochgezählt}
  Zahl, Max : integer;
  {Eingegebene Integer-Zahlen und das Maximum aller eingegeben Zahlen}

begin
  writeln ('Geben Sie beliebig viele ganze Zahlen ein,');
  writeln ('deren Maximum bestimmt werden soll.');
  writeln ('Sie können die Zahlenfolge mit 0 beenden!');

  i := 1;

  {Liest die erste Eingabe ein!}
  write(i, '. Wert: ');
  readln (Zahl);
  Max := Zahl;

  if(Zahl = 0) then
    writeln('Leere Eingabefolge!')
  else
  begin
    repeat
      if (Zahl <> 0) then
      begin
        if (Zahl > Max) then
          Max := Zahl;
          
        {Liest ab der 2.ten Eingabe ein!}
        i := i+1;
        write(i, '. Wert: ');
        readln (Zahl);
      end; {Zahl <> 0}
    until (Zahl = 0); {repeat-schleife-ENDE} {sobald Zahl = 0}
    writeln ('Das Maximum ist: ', Max, '.');
  end;
end.
