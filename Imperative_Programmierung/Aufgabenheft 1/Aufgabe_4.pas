program celciusRechner (input, output);
Var 
  C : real;
  F : integer;
Begin
write('Geben Sie eine Zahl für Fahrenheit ein: ');
readln(F);
C := (5 *  (F - 32)) / 9;
writeln(C);
End.
