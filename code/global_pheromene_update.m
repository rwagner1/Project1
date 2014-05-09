%Funktion f�r globales Pheromenupdate. Nachdem alle Agenten eine Tour
%absolviert haben wird die k�rzeste ausgesucht und auf jeder
%Verbindungsstrecke zwischen den einzelnen cities zus�tzlich Pheromen
%deponiert.
%
%Input:     Vektor der k�rzesten Tour von der trajectory-Matrix, ganze
%           Matrix tau, L�nge der k�rzesten Tour, Anzahl St�dte, Parameter
%Output:    Aktuelle Pheromenwerte in tau

function [tau] = global_pheromene_update( trajectory(:,shortest_path_index), tau, shortest_path, no_cities, alpha )

    for ii = 1:no_cities

            if (trajectory(ii) > trajectory(ii+1))
                tau(trajectory(ii+1), trajectory(ii)) = (1-alpha)*tau(trajectory(ii+1),trajectory(ii))+alpha/shortest_path;

            else
                tau(trajectory(ii), trajectory(ii+1)) = (1-alpha)*tau(trajectory(ii),trajectory(ii+1))+alpha/shortest_path;

            end  
            
    end
end

