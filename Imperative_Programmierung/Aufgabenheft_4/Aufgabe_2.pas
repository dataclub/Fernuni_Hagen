program TesteBlattMax (input, output);

type
  tNatZahl = 1..maxint;
  tRefBinBaum = ^tBinBaum;
  tBinBaum = record
               Wert:tNatZahl;
               links:tRefBinBaum;
               rechts:tRefBinBaum
             end;
           
var
  Wurzel : tRefBinBaum;
  blaetterSindMax : Boolean;
  
function BlattMax ( inRefWurzel : tRefBinBaum; inPfadMax : tNatZahl) : Boolean;
  { prüft ob alle Blätter des Baumes die Maxima der Pfade zu ihnen sind }
  var returnValue : boolean;    { Zusätzlicher Rückgabe-Wert, womit geprüft wird, ob Blatt größer/kleiner als inPfadMax ist}

  begin
    returnValue := true; { Default: es wird angenommen, dass Baum sein eigener inPfadMax ist}

    if inRefWurzel <> nil then { Jeder durchzulaufende Knoten/Baum ist nicht leer}
    begin

        if (inRefWurzel^.links <> nil) or (inRefWurzel^.rechts <> nil) then 
        begin { Sollten weitere Knoten rechts oder links vorhanden sein, dann muss weiter durchgegangen werden, weil Blatt noch nicht erreicht! }
            { Wenn der inPfadMax vom vorherigen Knoten kleiner ist, dann ist "inPfadMax = Der Wert des neuen Knoten",
              d.h. alle inPfad-Werte der weiteren Knoten müssen größer sein, als der neugesetzte inPfadMax, da sonst der Baum kaputt ist }
            if(inPfadMax < inRefWurzel^.Wert) then 
              inPfadMax := inRefWurzel^.Wert;

            { Es müssen linke und rechte-Knoten weiter geprüft werden}
            if inRefWurzel^.links <> nil  then
            begin
                returnValue := BlattMax(inRefWurzel^.links, inPfadMax);
            end; { inRefWurzel^.links <> nil }
            
            if (inRefWurzel^.rechts <> nil) and (returnValue = true) then
            begin { Die Abfrage auf "returnValue = true" muss sein, da für den false-Fall sonst der returnValue überschrieben wird}
                returnValue := BlattMax(inRefWurzel^.rechts, inPfadMax);
            end; { inRefWurzel^.rechts <> nil }
        
        end
        else
        begin { Der Baum wird solange durchlaufen, bis man auf ein Blatt stößt, hier folgt nun: }
            { Ist ein Blatt gefunden, da weder links noch rechts weitere Knoten vorhanden sind, dann muss der Wert des Blattes größer sein als inPfadMax! }
            if(inRefWurzel^.Wert < inPfadMax) then { Wenn Blatt kleiner als inPfadMax, dann false}
              returnValue := false;
        end; { if (inRefWurzel^.links <> nil) or (inRefWurzel^.rechts <> nil) }
    end;

    BlattMax := returnValue;
  end;
  
procedure BaumAufbauen (var outWurzel : tRefBinBaum) ;
  var 
    index,
    Zahl : integer;
    elter, neuerKnoten : tRefBinBaum;    
     
  function KnotenVonIndex (baum : tRefBinBaum; index : integer) : tRefBinBaum;
    var
      elter : tRefBinBaum;
    begin
      if (index = 1) then
        KnotenVonIndex := baum
      else
      begin
        elter := KnotenVonIndex(baum, index div 2);
        if ( (index mod 2 ) = 0 ) then
          KnotenVonIndex := elter^.links
        else
          KnotenVonIndex := elter^.rechts
      end;
    end;{ KnotenVonIndex }

  begin
    read (index);
    new (outWurzel);
    read (Zahl);
    outWurzel^.Wert := Zahl;
    outWurzel^.links := nil;
    outWurzel^.rechts := nil;
    read (index);
    while (index <> 0) do
    begin            
      elter := KnotenVonIndex(outWurzel, index div 2);
      new (neuerKnoten);
      read (Zahl);    
      neuerKnoten^.Wert := Zahl;  
      neuerKnoten^.links := nil;
      neuerKnoten^.rechts := nil;
      if ( (index mod 2 ) = 0 ) then
        elter^.links := neuerKnoten
      else
        elter^.rechts := neuerKnoten;
      read (index);      
    end;    
  end; { BaumAufbauen }

begin
  writeln('Bitte Baum in level-order eingeben Eingabeformat: Immer erst der Index eines Knotens, dann dessen Wert:');
  BaumAufbauen (Wurzel);
  blaetterSindMax := BlattMax(Wurzel, 1);
  if blaetterSindMax then
    writeln ('Alle Blaetter sind groesser als alle Knoten auf den jeweiligen Pfaden zu ihnen.')
  else
    writeln ('Mind. ein Blatt ist nicht groesser als alle Knoten auf seinem Pfad.');

end. { TesteBBKnotenzahl }