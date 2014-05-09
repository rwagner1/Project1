%Funktion eta() welche in p_k gebraucht wird.
%Ist gegeben als das Inverse der Distanz zwischen current_city und
%next_city

%Input:     Aktueller und neuer Standort
%Output:    1/(Distanz der beiden Standorte)

function [distance] = eta(current_city, next_city, data_set)
       
<<<<<<< HEAD
    if (next_city > current_city)
=======
    if (next_city < (current_city+1))
        distance = 1/data_set(next_city, current_city);
    else
>>>>>>> 59f72f0ae0de4e66bf1ace8a9340fa5177020506
        distance = 1/data_set(current_city, next_city);
    else
        distance = 1/data_set(next_city, current_city);
    end
end


