program TesteSortiereListe(input, output);

  type
  tNatZahl = 0..maxint;
  tRefListe = ^tListe;
  tListe = record
             info : tNatZahl;
             next : tRefListe;
           end;

  var
  RefListe : tRefListe;

  procedure SortiereListe (var ioRefListe : tRefListe);
  { sortiert eine lineare Liste aufsteigend }

  var
  ioRefListeKopie: tRefListe;

  function insertInList(ioRefListe, nextElement : tRefListe);
  var
  ioRefListeInsert: tRefListe;
  eingefuegt: boolean;
  begin
    if(ioRefListeInsert <> nil) then
      ioRefListeInsert := ioRefListe;
      eingefuegt := false;
      while (ioRefListeInsert^.next <> nil) and (eingefuegt = false)
      begin
        if(ioRefListeInsert^.info < nextElement^.info) then
        begin
          nextElement^.next := ioRefListeInsert;
          ioRefListeInsert := nextElement;
          eingefuegt := true;
        end
        else
          ioRefListeInsert := ioRefListeInsert^.next;
      end;

      ioRefListeInsert := ioRefListe;
    end;
  end;

  begin
    if(ioRefListeKopie <> nil) then
    begin
      ioRefListeKopie := ioRefListe;
        
      while(ioRefListeKopie^.next <> nil) do
      begin
          if(ioRefListeKopie^.info > ioRefListeKopie^.next^.info) then
          begin
              insertInList(ioRefListe, ioRefListeKopie^.next);
          end
          else
              ioRefListeKopie := ioRefListeKopie^.next;
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

