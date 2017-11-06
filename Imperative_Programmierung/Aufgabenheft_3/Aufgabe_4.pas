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
  ioRefListeScheife, ioRefListeInsert, PredZeiger, Zeiger, PredZeigerInsert, ZeigerInsert: tRefListe;
  eingefuegt: boolean;



  begin
    if(ioRefListe <> nil) then
    begin
      ioRefListeScheife := ioRefListe;

      PredZeiger := ioRefListeScheife;
      Zeiger := nil;
      if(ioRefListeScheife^.next <> nil) then
      begin
        Zeiger := ioRefListeScheife^.next;
        ioRefListeScheife := Zeiger;
      end;


      while(ioRefListeScheife <> nil) do
      begin

          if(Zeiger^.info < PredZeiger^.info) then { der aktuelle Wert ist kleiner, als der vorherige }
          begin

            { Liste erneut durchlaufen und Zeiger an die richtige Stelle einfügen}
            ioRefListeInsert := ioRefListe;
            eingefuegt := false;

            PredZeigerInsert := ioRefListeInsert;
            ZeigerInsert := nil;
            if(ioRefListeScheife^.next <> nil) then
            begin
              ZeigerInsert := ioRefListeInsert^.next;
              ioRefListeInsert := ZeigerInsert;
            end;
            
            
            while(ioRefListeInsert <> nil) and (eingefuegt = false) do
            begin
              if (Zeiger^.info > PredZeigerInsert^.info) and (Zeiger^.info <= ZeigerInsert^.info) then
              begin
                { Zwischen der Liste einfügen}
                eingefuegt := true;
                PredZeiger^.next := Zeiger^.next;
                
                Zeiger^.next := PredZeigerInsert^.next;
                PredZeigerInsert^.next := Zeiger;

                Zeiger := PredZeiger;

              end
              else if(Zeiger^.info <= PredZeigerInsert^.info) then
              begin
                { Zu Anfang der Liste einfügen}
                eingefuegt := true;
                PredZeiger^.next := Zeiger^.next;

                Zeiger^.next := PredZeigerInsert;
                PredZeigerInsert := Zeiger;
                ioRefListe := PredZeigerInsert;

                Zeiger := PredZeiger;
              end
              else
              begin
                PredZeigerInsert := ZeigerInsert;
                ZeigerInsert := ioRefListeInsert^.next;
                ioRefListeInsert := ZeigerInsert;
              end
            end
          end;

          PredZeiger := Zeiger;
          Zeiger := PredZeiger^.next;
          ioRefListeScheife := Zeiger;
      end;
    end;
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

