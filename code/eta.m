%Funktion eta() welche in p_k gebraucht wird.
%Ist gegeben als das Inverse der Distanz zwischen current_city und
%next_city

%Input:     Aktueller und neuer Standort
%Output:    1/(Distanz der beiden Standorte)

function [distance] = eta(current_city, next_city, no_cities)
    global data_set;
    
    if (next_city > no_cities-current_city+1)
         eta_gespiegelt = data_set(no_cities-next_city, no_cities-current_city)
    else
         eta_nicht_gepsiegelt = data_set(current_city, next_city)
    end
    
    
    if (next_city > (no_cities-current_city+1))
        distance = 1/(data_set(no_cities-next_city, no_cities-current_city));
    else
        distance = 1/(data_set(current_city, next_city));
    end
end


