%Funktion zur Berechnung von p_k aus Gleichung (2) im Paper
%
%INFO:    Funktion eta() ist extern definiert und muss NICHT als Input
%         gegeben werden! Kann innerhalb von prob_dist() aufgerufen werden.
%         Indem Variablen innerhalb einer Funktion als global definiert werden (z.b. 'global X') 
%         entfällt mehrfaches einlesen.
%
%Input:   Ganze Pheromen-Matrix und nicht nur Vektor für aktuelle Stadt, da nur Dreiecksmatrix, Vektor aus Memory-Matrix für aktuellen
%         Agenten, aktueller Agent, aktueller Standort,
%         nächster Standort, totale Anzahl Cities, Parameter
%Output:  Wahrscheinlichkeit p_k mit welcher eine neue Stadt gewählt wird

function [p_k] = prob_dist (tau, M_k, current_agent, current_city, next_city, no_cities, beta0)
    
    
    %Bilde eine Summe des Gewichts aller noch nicht besuchten Städte
    summe = 0;

    for ii = 1:no_cities

        if M_k(ii, current_agent)
            
            if (ii < (current_city+1))
                summe = summe + tau(ii, current_city)*eta(current_city, ii)^beta0;
               
            else
                summe = summe + tau(current_city, ii)*eta(current_city, ii)^beta0;
                
            end
        end
    end


    %Berechne die Probability Distr für die Städte
      if M_k(next_city, current_agent)
          
          if (current_city > (next_city+1))
              p_k = (tau(next_city, current_city)*eta(current_city, next_city)^beta0)/summe;

          else
              p_k = (tau(current_city, next_city)*eta(current_city, next_city)^beta0)/summe;
          end 
          
      else
           p_k = 0;
           
      end

end