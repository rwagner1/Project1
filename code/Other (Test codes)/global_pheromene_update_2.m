%Funktion für globales Pheromenupdate. Nachdem alle Agenten eine Tour
%absolviert haben wird die kürzeste ausgesucht und auf jeder
%Verbindungsstrecke zwischen den einzelnen cities zusätzlich Pheromen
%deponiert.
%
%Input:     Vektor der kürzesten Tour von der trajectory-Matrix !!!ALS VEKTOR!!, ganze
%           Matrix tau, Länge der kürzesten Tour, Anzahl Städte, Parameter
%Output:    Aktuelle Pheromenwerte in tau

function [tau] = global_pheromene_update_2(trajectory, tau, shortest_path, no_cities, alpha, start_city )

    for ii = 1:no_cities-1

            if (trajectory(ii) > trajectory(ii+1))
                tau(trajectory(ii+1), trajectory(ii)) = 0.1 + (1-alpha)*tau(trajectory(ii+1),trajectory(ii))+alpha/shortest_path;

            else
                tau(trajectory(ii), trajectory(ii+1)) = 0.1 + (1-alpha)*tau(trajectory(ii),trajectory(ii+1))+alpha/shortest_path;

            end  
            
    end
    
    %Nach hause weg mit pheranomin versorgen
    if start_city < trajectory(no_cities)
        tau (start_city, trajectory(no_cities)) = 0.1 + (1-alpha)*tau(start_city,trajectory(no_cities))+alpha/shortest_path;
    else
        tau (trajectory(no_cities), start_city) = 0.1 +(1-alpha)*tau(trajectory(no_cities), start_city)+alpha/shortest_path;
    end

end

