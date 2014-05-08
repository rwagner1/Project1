%Funktion eta() welche in p_k gebraucht wird.
%Ist gegeben als das Inverse der Distanz zwischen current_city und
%next_city

%Input:     Aktueller und neuer Standort
%Output:    1/(Distanz der beiden Standorte)

function [distance] = eta(current_city, next_city)

    distance = 1/(data_set(current_city,next_city));
 
end