%Funktion eta() welche in p_k gebraucht wird.
%Ist gegeben als das Inverse der Distanz zwischen current_city und
%next_city

%Input:     Aktueller und neuer Standort
%
%Output:    1/(Distanz der beiden Standorte)

function [distance] = eta(current_city, next_city, data_set)
       
    
    if (next_city > current_city)
        
        distance = 1/data_set(current_city, next_city);
        
    %Falls next_city < current_city wird der transponierte Eintrag in der Daten-Matrix gewählt.
    %Da es sich um obere Dreiecksmatrix handelt
    else
        
        distance = 1/data_set(next_city, current_city);                                                    
        
    end %end if
    
end %end function



