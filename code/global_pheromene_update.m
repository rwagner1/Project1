%Funktion für globales Pheromenupdate. Nachdem alle Agenten eine Tour
%absolviert haben wird die kürzeste ausgesucht und auf jeder
%Verbindungsstrecke zwischen den einzelnen cities zusätzlich Pheromen
%deponiert.
%
%Input:     Vektor der kürzesten Tour von der trajectory-Matrix !!!ALS VEKTOR!!, ganze
%           Matrix tau, Länge der kürzesten Tour, Anzahl Städte, Parameter
%Output:    Aktuelle Pheromenwerte in tau

function [tau] = global_pheromene_update(trajectory, tau, shortest_path, no_cities, alpha )

    for ii = 1:no_cities-1

            if (trajectory(ii) > trajectory(ii+1))
                tau(trajectory(ii+1), trajectory(ii)) = (1-alpha)*tau(trajectory(ii+1),trajectory(ii))+alpha/shortest_path;

            else
                tau(trajectory(ii), trajectory(ii+1)) = (1-alpha)*tau(trajectory(ii),trajectory(ii+1))+alpha/shortest_path;

            end  
            
    end
    
    tau (1, trajectory(no_cities)) = (1-alpha)*tau(1,trajectory(no_cities))+alpha/shortest_path;

end

