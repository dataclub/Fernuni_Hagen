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
        end
        outMax := Maximum;
    end;
  end; {ListenMaxBestimmen}