%Falls q <= q0 gibt diese funktion die nächste zu besuchende Stadt nach
%Formel (1) im Paper wobei Gross S für q > q0 ausserhalb separat bestimmt
%wird.

function [city_s] = choose_city ( dataset, tau, eta, beta, M_k, current_city, k)


upperlimit = length(dataset(:,1)+1);        %Anzahl Städte bestimmen
city_s = 0;                                 %Ausgabe Stadt als Null inizialisieren
comp_arg = 0;                               %Vergleichsargument zur Entscheidung ob Stadt nehmen oder nicht

%Start for-loop um alle Städte zu checken

for ii = 1:upperlimit
    
    city = ii;                              %Setze city von 1 bis upperlimit
    
    if M_k(city,k)                            %Falls city von agent k noch nicht besucht (M_k(city) = 1)
        %Berechne das argument nach Formel (1) im Paper
        argument = tau(current_city,city)*eta(current_city,city)^beta;
        if argument > comp_arg              %Falls das Argument das grösste bis jetzt, setze city_s neu
            city_s= city;
        end
    end
end
