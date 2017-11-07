program TesteSortiereListe(input, output);

  type
  tNatZahl = 0..maxint;
  tRefListe = ^tListe;
  tListe = record
             info : tNatZahl;
             next : tRefListe;
           end;

  var
  RefListe: tRefListe;

  procedure SortiereListe (var ioRefListe : tRefListe);
  { sortiert eine lineare Liste aufsteigend }

  var
  outRefListe,
  outRefListeScheife,          { Zeigerdurchlauf, für die erste Schleife, läuft einmal die Liste durch }
  outRefListeInsert,           { Zeigerdurchlauf, für die zweite Schleife, zum Sortieren }
  PredZeiger,                 { Vorheriger Wert des Zeigers der ersten Schleife}
  Zeiger,                     { Aktueller Wert des Zeigers der ersten Schleife}
  PredZeigerInsert,           { Vorheriger Wert des Zeigers der zweiten Schleife}
  ZeigerInsert: tRefListe;    { Aktueller Wert des Zeigers der zweiten Schleife}
  eingefuegt: boolean;        { Abbruchkriterum der zweiten While-Schleife }

  begin
    outRefListe := ioRefListe;
    if(outRefListe <> nil) then { Liste nicht leer }
    begin
      outRefListeScheife := outRefListe; { Initialisierung Schleifen-Zeiger, erste Schleife }

      PredZeiger := outRefListeScheife; { Initialisierung Zeiger, vorheriger Wert }
      Zeiger := nil;
      if(outRefListeScheife^.next <> nil) then
      begin
        Zeiger := outRefListeScheife^.next; { Initialisierung Zeiger, aktueller Wert }
        outRefListeScheife := Zeiger;
      end; { if(outRefListeScheife^.next <> nil)}

      if(Zeiger <> nil) then { Darf nicht leer sein, da mind. 2 Werte zum Sortieren erforderlich sind }
      while(outRefListeScheife <> nil) do
      begin
        { Liste ist noch unsortiert }
        if(Zeiger^.info < PredZeiger^.info) then 
        begin 

          { Kleinerer Wert gefunden, daher die Liste erneut durchlaufen, 
            um den Zeiger an die richtige Position einfügen}
          outRefListeInsert := outRefListe;
          eingefuegt := false;  { Initialisierung Abbruchkriterium }

          PredZeigerInsert := outRefListeInsert; { Initialisierung Zeiger, vorheriger Wert, zweite Schleife }
          ZeigerInsert := nil;
          if(outRefListeScheife^.next <> nil) then
          begin
            ZeigerInsert := outRefListeInsert^.next;  { Initialisierung Zeiger, aktueller Wert, zweite Schleife }
            outRefListeInsert := ZeigerInsert;
          end;
          
          { Da (outRefListeScheife^.next = nil) ist, ist das der letzte Zeiger }
          if(ZeigerInsert = nil) then 
            ZeigerInsert := PredZeiger;

          { Durchlaufe, bis Abbruchkriterium oder bis die zweite Schleife durchgelaufen ist }
          while(outRefListeInsert <> nil) and (eingefuegt = false) do
          begin
            { Falls Zeigerwert größer als der vorherige und kleiner als der nachfolgende, dann dazwischen einfügen}
            if (Zeiger^.info > PredZeigerInsert^.info) and (Zeiger^.info <= ZeigerInsert^.info) then
            begin
              { Zeiger zwischen den Werten der Liste einfügen}
              eingefuegt := true;
              PredZeiger^.next := Zeiger^.next; { Alten Wert des Zeigers puffern}
              
              Zeiger^.next := PredZeigerInsert^.next;
              PredZeigerInsert^.next := Zeiger;

              Zeiger := PredZeiger; { aktuellen Zeiger der ersten Schleife mit dem nächsten Wert fortsetzen}
            end {(Zeiger^.info > PredZeigerInsert^.info) and (Zeiger^.info <= ZeigerInsert^.info)}
            { Der Wert des Zeigers ist kleiner als der erste Zeigerwert, daher am Anfang einfügen}
            else if(Zeiger^.info <= PredZeigerInsert^.info) then
            begin
              { Zum Anfang der Liste einfügen}
              eingefuegt := true;
              PredZeiger^.next := Zeiger^.next;

              Zeiger^.next := PredZeigerInsert;
              PredZeigerInsert := Zeiger;
              outRefListe := PredZeigerInsert;

              Zeiger := PredZeiger; { aktuellen Zeiger der ersten Schleife mit dem nächsten Wert fortsetzen}
            end { if(Zeiger^.info <= PredZeigerInsert^.info) }
            else
            { sonst, vorherigen und aktuellen Zeiger setzen und mit der zweite Schleife weitermachen, 
              bis obere Bedingungen zutreffen, oder die Liste zu Ende läuft}
            begin
              PredZeigerInsert := ZeigerInsert;
              ZeigerInsert := outRefListeInsert^.next;
              outRefListeInsert := ZeigerInsert;
            end
          end
        end; { if(Zeiger^.info < PredZeiger^.info) }

        { Setzen der Zeiger und weitermachen mit der ersten Schleife,
          bis kleinerer Wert gefunden wurde, sodass es auch sortiert werden kann}
        PredZeiger := Zeiger;
        Zeiger := PredZeiger^.next;
        outRefListeScheife := Zeiger;
      end; { while(outRefListeScheife <> nil)}
    end;
    ioRefListe := outRefListe;
  end;

  procedure Anhaengen(var ioListe : tRefListe;
                        inZahl : tNatZahl);
{ Haengt inZahl an ioListe an }
  var Zeiger : tRefListe;
begin
  Zeiger := ioListe;
  if Zeiger = nil then
  begin
    new(ioListe);
    ioListe^.info := inZahl;
    ioListe^.next := nil;
  end
  else
  begin
    while Zeiger^.next <> nil do
      Zeiger := Zeiger^.next;
    { Jetzt zeigt Zeiger auf das letzte Element }
    new(Zeiger^.next);
    Zeiger := Zeiger^.next;
    Zeiger^.info := inZahl;
    Zeiger^.next := nil;
  end;
end;

procedure ListeEinlesen(var outListe:tRefListe);
{ liest eine durch Leerzeile abgeschlossene Folge von Integer-
  Zahlen ein und speichert diese in der linearen Liste RefListe. }
  var
  Liste : tRefListe;
  Zeile : string;
  Zahl, Code : integer;
begin
  writeln('Bitte geben Sie die zu sortierenden Zahlen ein.');
  writeln('Beenden Sie Ihre Eingabe mit einer Leerzeile.');
  Liste := nil;
  readln(Zeile);
  val(Zeile, Zahl, Code); { val konvertiert String nach Integer }
  while Code=0 do
  begin
    Anhaengen(Liste, Zahl);
    readln(Zeile);
    val(Zeile, Zahl, Code);
  end; { while }
  outListe := Liste;
end; { ListeEinlesen }

procedure GibListeAus(inListe : tRefListe);
{ Gibt die Elemente von inListe aus }
  var Zeiger : tRefListe;
begin
  Zeiger := inListe;
  while Zeiger <> nil do
  begin
    writeln(Zeiger^.info);
    Zeiger := Zeiger^.next;
  end; { while }
end; { GibListeAus }

begin
  ListeEinlesen(RefListe);
  SortiereListe(RefListe);
  GibListeAus(RefListe)
end.

