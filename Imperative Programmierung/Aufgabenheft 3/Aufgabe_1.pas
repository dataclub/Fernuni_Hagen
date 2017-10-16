
Program testeFeldZweitMax (input, output);
{ testet die Funktion FeldZweitMax }

    Const 
    FELDGROESSE = 10;

    Type 
    tIndex = 1..FELDGROESSE;
    tFeld = array [tIndex] Of integer;

    Var 
    Feld : tFeld;
    i : integer;

    function FeldZweitMax (Var inFeld : tFeld) : integer;

    var
        Max, ZweitMax: integer;
        j: integer; {Laufzeitvariable für for-Schleife}

    begin
        {Anfangswerte setzen}
        Max := inFeld[1];
        ZweitMax := inFeld[2];
        
        if(ZweitMax > Max) then {Ggf. vertauschen}
        begin
            Max := ZweitMax;
            ZweitMax := inFeld[1];
        end;

        for j := 2 to FELDGROESSE do 
        begin
            if(Max < inFeld[j]) then
            begin
                ZweitMax := Max; {Max-Wert ist nun der Zweitgrößte-Wert, da es noch größer als Max gibt}
                Max := inFeld[j];
            end
            else {Auch wenn kein Wert größer als Max, gibt es eventuell noch einen zweitgrößten Wert im Array}
                if(ZweitMax < inFeld[j]) then 
                ZweitMax := inFeld[j];
        end; {for}

        FeldZweitMax := ZweitMax;
    end; { FeldZweitMax}

    Begin { Testprogramm }
    writeln('Bitte geben Sie ', FELDGROESSE, ' Zahlen ein:');
    For i := 1 To FELDGROESSE Do
        read (Feld [i]);
    writeln('Die zweitgroesste Zahl ist ', FeldZweitMax (Feld), '.');
    End. { testeFeldZweitMax }
