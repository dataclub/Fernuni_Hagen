program Parameter1 (output);
{ Dieses Programm hat keine sinnvolle Semantik, zeigt schlech-
  ten Programmierstil und dient nur zum Ueben der Parameterueber-
  gabearten. }

  var 
  a,
  b,
  c : integer;

  procedure globalProc (var d, e, f: integer);

    var 
    a : integer; 

    procedure lokalProc (var g, h, i: integer);

      var 
      b : integer;

    begin
      g := h + i;
      b := c;
      a := 2 * b;
      i := a + b
    end; { lokalProc }

  begin
    a := 4;
    b := 5;
    c := 6;
    d := e - f;
    lokalProc (a, d, e);
    e := f - d
  end; { globalProc }

begin
  a := 1;
  b := 2;
  c := 3;
  globalProc (c, b, a);
  writeln (a, ' ', b, ' ', c)
end. { Parameter1 }

{
    Die Alternativen A und C sind richtig
zu
A) Das Programm liefert die Ausgabe: 1 -3 4
zu
B) Das Programm liefert die Ausgabe: 1 5 6
zu
C) Das Programm liefert die Ausgabe: 1 -3 4
zu
D) Das Programm liefert die Ausgabe: 1 5 6
zu
E)
Wie die Alternativen A) - D) zeigen, hängt die Ausgabe sehr wohl von der Art der
Parameterübergabe ab.
}