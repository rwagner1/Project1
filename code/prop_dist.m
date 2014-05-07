%Funktion zur Bestimmung wie wahrscheinlich eine Stadt gewählt wird

function [p_k] = prop_dist (tau, eta, beta, M_k, current_city, no_cities, k )



%Bilde eine Summe des Gewichts aller noch nicht besuchten Städte
summe = 0;
for ii = 1:no_cities
    
    if M_k(ii, k)
        summe = summe + tau(current_city, ii)*eta(current_city, ii)^beta
    end
end


%Berechne die Probability Distr für die Städte
for jj = 1:no_cities
    
    if M_k(jj, k)
        p_k(current_city, jj) = (tau(current_city, jj)*eta(current_city, jj)^beta)/summe;
        
    else
        p_k(current_city, jj) = 0;
    end
end

