%Funktion f�r globales Pheromonupdate. Nachdem alle Agenten eine Tour
%absolviert haben wird die k�rzeste ausgesucht und auf jeder
%Verbindungsstrecke zwischen den einzelnen St�dten zus�tzlich Pheromon
%deponiert.
%
%Input:     Vektor der k�rzesten Tour von der trajectory-Matrix !!!ALS VEKTOR!!, ganze
%           Pheromon-Matrix, L�nge der k�rzesten Tour, Anzahl St�dte,
%           Parameter, Startwert
%
%Output:    Aktuelle Pheromon-Matrix

function [tau] = global_pheromene_update(trajectory, tau, shortest_path, no_cities, alpha, start_city )
    
    
    for ii = 1:no_cities-1
           
                                                                            %Da tau eine obere Dreiecksmatrix ist wird im Falle eines
                                                                            %Nulleintrages der transponierte Eintrag gew�hlt
            if (trajectory(ii) > trajectory(ii+1))
                %Globales Update nach Formel (4) im Report
                tau(trajectory(ii+1), trajectory(ii)) = (1-alpha)*tau(trajectory(ii+1),trajectory(ii))+alpha/shortest_path;

            else
                
                tau(trajectory(ii), trajectory(ii+1)) = (1-alpha)*tau(trajectory(ii),trajectory(ii+1))+alpha/shortest_path;

            end  %end if
            
    end %end for
    
    %Nachhauseweg mit Pheromon versorgen
    if start_city < trajectory(no_cities)
        
        tau (start_city, trajectory(no_cities)) = (1-alpha)*tau(start_city,trajectory(no_cities))+alpha/shortest_path;
        
    else
        
        tau (trajectory(no_cities), start_city) = (1-alpha)*tau(trajectory(no_cities), start_city)+alpha/shortest_path;
        
    end %end if

end %end function

