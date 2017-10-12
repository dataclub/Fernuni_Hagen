program WasPassiert(input, output);
var
  a, b, c: Integer;

begin
  b := 0;
  c := 1;
  a := 7;
  while a > 0 do
  begin
    b := b+c*(a mod 2);
    a := a div 2;
    c := c*10;
  end;
  writeln(b)
end.