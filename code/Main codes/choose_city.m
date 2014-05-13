%Funktion zur Bestimmung einer neuen Stadt.
%Mit Wahrscheinlichkeit q0 wählt Agent eine neue Stadt nach Pheromonkriterium. Mit Wahrscheinlichkeit (1-q0) geht er einen neuen Weg zu S.
%
%Input:     Pheromon-Matrix für alle Standorte, Memory-Matrix, aktueller Standort,
%           totale Anzahl Cities, aktueller Agent, Parameter, Daten-Matrix
%
%Output:    Neu gewählte City s

function [city_s] = choose_city (tau, beta_0, M_k, current_city, no_cities, current_agent, q0, data_set)

    q = rand();                                                             %Zufallszahl zur Bestimmung ob Zufallsstadt S gewählt wird oder nicht
   
    if (q <= q0)
        city_s = 0;                                                         %Ausgabe Stadt als Null initialisieren
        comp_arg = 0;                                                       %Vergleichsargument zur Entscheidung ob Stadt nehmen oder nicht

           %Start for-loop um alle Städte zu checken
           for ii = 1:no_cities


               if (M_k(ii)  == 1)                                           %Falls city ii von current_agent noch nicht besucht (M_k(ii) = 1)

                   
                   %Berechne das argument nach Formel (1) im Report
                   if (current_city > ii)
                       
                         argument = tau(ii, current_city)*eta(current_city, ii, data_set)^beta_0;
                         
                   else
                       
                         argument = tau(current_city, ii)*eta(current_city, ii, data_set)^beta_0;
                         
                   end %end if
                   
                   %Falls das Argument das grösste bis jetzt, setze city_s neu
                   if (argument >= comp_arg)              
                      
                         city_s = ii;
                         comp_arg = argument;
                   end

               end %if M_k(ii)
               
           end %for ii
           
           %nächste Stadt gefunden ----> city_s
           
    %Bestimme S falls nächste City nicht nach Modell in Gleichung (1) von Report gewählt wird
    else
        
        while (1)
            
            s0 = floor(rand()*no_cities)+1;                                 %Generiere Zufallszahl zwischen 1 und no_cities, floor generiert zwischen 0 und no_cites-1, deshalb +1
            p0 = rand();                                                    %Genierere weitere Zufallszahl um neue Stadt mit Wahrscheinlichkeit p0 anzunehmen
            
            %Agent wählt eine City mit Wahrscheinlichkeit p0, falls er sie noch nicht besucht hat
            if (M_k(s0) == 1 && p0 < prob_dist(tau, M_k, current_city, s0, no_cities, beta_0, data_set))  
                
                city_s = s0;
                
                break;                                                      %Stadt city_s wurde gewählt
                
            end
            
            %nächste Stadt gefunden -----> city_s
            
        end %end while
        
    end%end if else
    
end%end function
  
     