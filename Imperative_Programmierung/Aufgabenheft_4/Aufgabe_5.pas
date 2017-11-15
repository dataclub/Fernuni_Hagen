program max(input, output);

type
tRefBinBaum = ^tBinBaum;
tBinBaum = record
            info : integer;
            links,
            rechts : tRefBinBaum
            end;

var
auswahl : char;
Baum : tRefBinBaum;
Zeiger6, Zeiger3, Zeiger8, Zeiger1, Zeiger4 : tRefBinBaum;

    procedure SymAusgabeA (
                inRefWurzel : tRefBinBaum);
    {gibt die Knotenwerte eines Binärbaums in
    symmetrischer Reihenfolge aus}
    begin
    if inRefWurzel <> nil then
    begin
        write (inRefWurzel^.info);
        if inRefWurzel^.links <> nil  then
            SymAusgabeA(inRefWurzel^.links);
        if inRefWurzel^.rechts <> nil then
            SymAusgabeA(inRefWurzel^.rechts)
    end
    end; {SymAusgabeA}

    procedure SymAusgabeB (
              inRefWurzel : tRefBinBaum);
    {gibt die Knotenwerte eines Binärbaums in
    symmetrischer Reihenfolge aus}
    begin
    if inRefWurzel^.links <> nil  then
        SymAusgabeB(inRefWurzel^.links);
    write(inRefWurzel^.info);
    if inRefWurzel^.rechts <> nil then
        SymAusgabeB(inRefWurzel^.rechts)
    end; {SymAusgabeB}

    procedure SymAusgabeC (
              inRefWurzel : tRefBinBaum);
    {gibt die Knotenwerte eines Binärbaums in 
    symmetrischer Reihenfolge aus}
    begin
    if inRefWurzel <> nil then
    begin
        SymAusgabeC(inRefWurzel^.links);
        write (inRefWurzel^.info);
        SymAusgabeC(inRefWurzel^.rechts)
    end
    end; {SymAusgabeC}

    procedure SymAusgabeD (
              inRefWurzel : tRefBinBaum);
    {gibt die Knotenwerte eines Binärbaums in 
    symmetrischer Reihenfolge aus}
    begin
    if inRefWurzel <> nil then
    begin
        if inRefWurzel^.links <> nil  then
            SymAusgabeD(inRefWurzel^.links);
        if inRefWurzel^.rechts <> nil then
            SymAusgabeD(inRefWurzel^.rechts);
        write (inRefWurzel^.info)
    end
    end; {SymAusgabeD}

     	

    procedure SymAusgabeE (
                inRefWurzel : tRefBinBaum);
    {gibt die Knotenwerte eines Binärbaums in
    symmetrischer Reihenfolge aus}
    begin
        if inRefWurzel <> nil then
        begin
            if inRefWurzel^.links <> nil  then
            SymAusgabeE(inRefWurzel^.links);

            write (inRefWurzel^.info);
            if inRefWurzel^.rechts <> nil then
            SymAusgabeE(inRefWurzel^.rechts)
        end
    end; {SymAusgabeE}

begin

new(Zeiger6);
new (Zeiger3);
new (Zeiger8);
new (Zeiger1);
new (Zeiger4);


Zeiger6^.info := 6;
Zeiger6^.links := nil;
Zeiger6^.rechts := nil;

Zeiger3^.info := 3;
Zeiger3^.links := nil;
Zeiger3^.rechts := nil;

Zeiger8^.info := 8;
Zeiger8^.links := nil;
Zeiger8^.rechts := nil;

Zeiger1^.info := 1;
Zeiger1^.links := nil;
Zeiger1^.rechts := nil;

Zeiger4^.info := 4;
Zeiger4^.links := nil;
Zeiger4^.rechts := nil;


Zeiger3^.links := Zeiger1;
Zeiger3^.rechts := Zeiger4;

Zeiger6^.links := Zeiger3;
Zeiger6^.rechts := Zeiger8;

Baum := Zeiger6;


    writeln('Wählen Sie zwischen den Buchstaben A-E,');
    writeln('um den Programmablauf zu verändern.');
    read(auswahl);

    If (auswahl = 'A') Then
        SymAusgabeA(Baum)
    else If (auswahl = 'B') Then
       SymAusgabeB(Baum)
    else If (auswahl = 'C') Then
       SymAusgabeC(Baum)
    else If (auswahl = 'D') Then
       SymAusgabeD(Baum)
    else If (auswahl = 'E') Then
        SymAusgabeE(Baum)

end.