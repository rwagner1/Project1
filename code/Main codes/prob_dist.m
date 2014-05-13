%Funktion zur Berechnung von p_k aus Gleichung (2) im Report
%
%Input:   Ganze Pheromon-Matrix, !!!Vektor!!! aus Memory-Matrix für aktuellen
%         Agenten, aktueller Standort, nächster Standort, totale Anzahl
%         Städte, Parameter, Daten-Matrix
%
%Output:  Wahrscheinlichkeit p_k mit welcher eine neue Stadt gewählt wird

function [p_k] = prob_dist (tau, M_k, current_city, next_city, no_cities, beta_0, data_set)

    
    
    %Berechnung des Nenners aus Formel (2) in Report
    %Bilde eine Summe des Gewichts aller besuchten Städte
    summe = 0;

    for ii = 1:no_cities

        if M_k(ii) == 1                                                                                     %Stadt noch nicht besucht
            
            %Da tau eine obere Dreieckmatrix ist wird im Fall
            %ii < current_city der transponierte Eintrag eingelesen
            if (ii < current_city)
                
                summe = summe + tau(ii, current_city)*eta(current_city, ii, data_set)^beta_0;               %Nach Gleichung (2) im Report

            else
                
                summe = summe + tau(current_city, ii)*eta(current_city, ii, data_set)^beta_0;               %Nach Gleichung (2) im Report
                
            end %end if
            
        end %enf if M_k(ii)
        
    end %end for


    %Berechne die Probability Distribution für die Städte
    if M_k(next_city)                                                                                       %Stadt noch nicht besucht
          

          if (current_city > next_city)
              
              p_k = (tau(next_city, current_city)*eta(current_city, next_city, data_set)^beta_0)/summe;     %Nach Gleichung (2) im Report

          else
              
              p_k = (tau(current_city, next_city)*eta(current_city, next_city, data_set)^beta_0)/summe;     %Nach Gleichung (2) im Report
              
          end %end if
          
    else
           p_k = 0;
           
    end %end M_k(next_city)

end %end function