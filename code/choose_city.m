%Mit Wahrscheinlichkeit q0 wählt Agent eine neue Stadt nach dem Modell in
%Gleichung (1). Mit Wahrscheinlichkeit (1-q0) geht er neuen Weg zu S.
%
%Input:     Pheromen-Matrix für alle Standorte, Vektor
%           in Memory-Matrix für aktuellen Agenten, aktueller Standort,
%           totale Anzahl Cities, aktueller Agent, Parameter
%
%Output:    Neu gewählte City s

function [city_s] = choose_city (tau, beta0, M_k(:,current_agent), current_city, no_cities, current_agent, q0)

    q = rand();                                 %Zufallszahl zur Bestimmung ob Model in Gleichung (1) oder nicht

    if (q <= q0)
        city_s = 0;                                 %Ausgabe Stadt als Null inizialisieren
        comp_arg = 0;                               %Vergleichsargument zur Entscheidung ob Stadt nehmen oder nicht

           %Start for-loop um alle Städte zu checken
           for ii = 1:no_cities

               if M_k(ii)                            %Falls city ii von current_agent noch nicht besucht (M_k(ii) = 1)
                   %Berechne das argument nach Formel (1) im Paper
                   if (current_city > ii)
                         argument = tau(ii, current_city)*eta(current_city, ii)^beta0;
                   else
                         argument = tau(current_city, ii)*eta(current_city, ii)^beta0;
                   end
                   
                   if (argument > comp_arg)              %Falls das Argument das grösste bis jetzt, setze city_s neu
                         city_s = ii;
                         comp_arg = argument;
                   end

               end
           end
     %Bestimme S falls nächste City nicht nach Modell in (1) gewählt wird
    else
        while (1)
            s0 = floor(rand()*no_cities);               %Generiere Zufallszahl zwischen 1 und no_cities
            p0 = rand();                                %Genierere weitere Zufallszahl um neue Stadt mit Wahrscheinlichkeit p0 anzunehmen

            if (p0 < prob_dist(tau(current_city,:), M_k(:,current_agent), current_city, s0, no_cities, beta0) && M_k(s0, current_agent) == 1)
                city_s = s0;
                break;
            end
        end %end while
    end%end else
end%end if
  
     