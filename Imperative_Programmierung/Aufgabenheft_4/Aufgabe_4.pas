program max(input, output);

const
UNTEN = 0; { Array-Untergrenze }
OBEN = 10; { Array-Obergrenze }

type
tIndex = UNTEN..OBEN;
tFeld = array[tIndex] of integer;

var
auswahl : char;
Feld : tFeld;
Maximum : integer;
    function FeldMaxA (
    var inFeld : tFeld;
        inUnten,
        inOben : tIndex) : integer;
    { bestimmt rekursiv das Maximum in einem Feld
    mit den Grenzen inUnten und inOben }

    var
        Mitte : tIndex;
        MaxL,
        MaxR : integer;

    begin
        if inUnten = inOben then
            FeldMaxA := inFeld[inUnten]
        else
        begin
            Mitte := (inUnten + inOben) div 2;
            MaxL := FeldMaxA (inFeld,inUnten,Mitte);
            MaxR := FeldMaxA (inFeld,Mitte+1,inOben);
            if MaxL > MaxR then
                FeldMaxA := MaxL
            else
                FeldMaxA := MaxR
        end
    end; { FeldMaxA }

    function FeldMaxB (
        var inFeld : tFeld;
            inUnten,
            inOben : tIndex) : integer;
    { bestimmt rekursiv das Maximum in einem
    Feld mit den Grenzen inUnten und inOben }

    var
        Mitte : tIndex;
        MaxL,
        MaxR : integer;

    begin
        if inUnten = inOben then
            FeldMaxB := inFeld[inUnten]
        else
        begin
            Mitte := (inUnten + inOben) div 2;
            MaxL := FeldMaxB (inFeld,inUnten,Mitte);
            MaxR := FeldMaxB (inFeld,Mitte,inOben);
            if MaxL > MaxR then
            FeldMaxB := MaxL
            else
            FeldMaxB := MaxR
        end
    end; { FeldMaxB }

    function FeldMaxC (
    var inFeld : tFeld;
        inUnten,
        inOben : tIndex) : integer;
    { bestimmt rekursiv das Maximum in einem Feld  
    mit den Grenzen inUnten und inOben }

    var
        Mitte : tIndex;
        MaxL,
        MaxR : integer;

    begin
        if inUnten > inOben then
            FeldMaxC := inFeld[inUnten]
        else
        begin
            Mitte := (inUnten + inOben) div 2;
            MaxL := FeldMaxC (inFeld,inUnten,Mitte);
            MaxR := FeldMaxC (inFeld,Mitte+1,inOben);
            if MaxL > MaxR then
                FeldMaxC := MaxL
            else
                FeldMaxC := MaxR
        end
    end; { FeldMaxC }

    function FeldMaxD (
    var inFeld : tFeld;
        inUnten,
        inOben : tIndex) : integer;
    { bestimmt rekursiv das Maximum in einem Feld
    mit den Grenzen inUnten und inOben }

    var
        Mitte : tIndex;
        MaxL,
        MaxR : integer;

    begin
        if inUnten > inOben then
            FeldMaxD := inFeld[inUnten]
        else
        begin
            Mitte := (inUnten + inOben) div 2;
            MaxL := FeldMaxD (inFeld,inUnten,Mitte);
            MaxR := FeldMaxD (inFeld,Mitte,inOben);
            if MaxL > MaxR then
                FeldMaxD := MaxL
            else
                FeldMaxD := MaxR
        end
    end; { FeldMaxD }

    function FeldMaxE (
    var inFeld : tFeld;
        inUnten,
        inOben : tIndex) : integer;
    { bestimmt iterativ das Maximum in einem Feld
    mit den Grenzen inUnten und inOben }

    var
        i : tIndex;
        HilfMax : integer; { Hilfsvariable }

    begin
        HilfMax := 0;
        for i := inUnten to inOben do
            if inFeld[i] > HilfMax then
                HilfMax := inFeld[i];
        FeldMaxE := HilfMax
    end; { FeldMaxE }

begin
    Feld[0] := -2;
    Feld[1] := 2;
    Feld[2] := 20;
    Feld[3] := -20;
    Feld[4] := -123;
    Feld[5] := 23;
    Feld[6] := 222;
    Feld[7] := 15;
    Feld[8] := -10;
    Feld[9] := 16;
    Feld[10] := 161;

    writeln('Wählen Sie zwischen den Buchstaben A-E,');
    writeln('um den Programmablauf zu verändern.');
    read(auswahl);

    If (auswahl = 'A') Then
        { Richtige Lösung. }
        Maximum := FeldMaxA(Feld, UNTEN, OBEN)
    else If (auswahl = 'B') Then
        { Falsche Lösung, weil es bei MaxR zur Endlos-Schleife führt.
        Das Programm wird für MaxR nie beendet }
        Maximum := FeldMaxB(Feld, UNTEN, OBEN)
    else If (auswahl = 'C') Then
        { Falsche Lösung, weil es bei MaxL zur Endlos-Schleife führt.
        Exakt wie bei der Auswahl D }
        Maximum := FeldMaxC(Feld, UNTEN, OBEN)
    else If (auswahl = 'D') Then
        { Falsche Lösung, weil es bei MaxL zur Endlos-Schleife führt.
        Es wird nie inUnten > inOben sein! }
        Maximum := FeldMaxD(Feld, UNTEN, OBEN)
    else If (auswahl = 'E') Then
    begin
        { Falsche Lösung, da für die negativen Zahlen in dem Array 
        immer 0 als Maximum-Wert zurückgegegben wird. }
       Maximum := FeldMaxE(Feld, UNTEN, OBEN);
    end;
    writeln('Max ist:', Maximum);
end.