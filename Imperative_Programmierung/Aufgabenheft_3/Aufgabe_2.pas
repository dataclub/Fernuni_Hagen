program testeListenMaxBestimmen (input, output);
{ Testet die Prozedur ListenMaxBestimmen }

  type
  tRefListe = ^tListe;
  tListe = record
             info : integer;
             next : tRefListe
           end;

  var
  Liste : tRefListe;
  Max : integer;
  OK : boolean;


  procedure ListenMaxBestimmen (    inRefAnfang: tRefListe; 
                                var outMax : integer; 
                                var outOK : boolean);
  { Bestimmt das Maximum der Liste.
    Wenn die Liste leer ist wird outOK mit dem Wert false zurückgegeben, 
    sonst wird dieser mit true und einem Wert in outMax zurückgegeben
    }
  var
  Maximum: integer;

  begin
    outOK := true;

    if(inRefAnfang = nil) then {Leere Liste}
        outOK := false
    else
    begin
        Maximum := inRefAnfang^.info; {Initiasierung des Anfangswerts als Maximum}
        inRefAnfang := inRefAnfang^.next; {Fang ab dem zweiten Wert in der Liste an}

        while(inRefAnfang <> nil) do {bis die Liste durchgelaufen ist}
        begin
            if(Maximum < inRefAnfang^.info) then
            begin
                Maximum := inRefAnfang^.info;
            end;

            inRefAnfang := inRefAnfang^.next; {Setz den Zeiger auf den nächsten Wert}
        end;

        outMax := Maximum;
    end; {if(inRefAnfang = nil)}
  end; {ListenMaxBestimmen}

  
  procedure LiesListe(var outListe : tRefListe);
  { Liest eine (evtl. leere) Liste ein und gibt deren Anfangszeiger outListe zurueck. }

    var
    Anzahl : integer;
    i : integer;
    neueZahl : integer;
    Listenanfang,
    Listenende : tRefListe;


  begin
    Listenanfang := nil;
    repeat
      write ('Wie viele Zahlen wollen Sie eingeben? ');
      readln (Anzahl);
    until Anzahl >= 0;
 
    write ('Bitte geben Sie ', Anzahl, ' Zahlen ein: ');

    { Liste aufbauen }
    for i := 1 to Anzahl do
    begin
      read (neueZahl);
      if Listenanfang = nil then
      begin
        new (Listenanfang);
        Listenanfang^.next := nil;
        Listenanfang^.info := neueZahl;
        Listenende := Listenanfang;
      end
      else
      begin
        new (Listenende^.next);
        Listenende := Listenende^.next;
        Listenende^.next := nil;
        Listenende^.info := neueZahl
      end  { if Liste = nil }
    end; { for }
    outListe := Listenanfang;
    writeln
  end; { LiesListe }


begin 
  LiesListe (Liste);
  ListenMaxBestimmen(Liste, Max, OK);
  if OK then 
    writeln ('Das Maximum ist ', Max, '.')
  else
    writeln ('Leere Eingabefolge!');
end. { testeListenMaxBestimmen }