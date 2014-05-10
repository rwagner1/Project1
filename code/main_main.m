%Hauptfunktion
%Bekommt Parameter von main_initialize_system und gibt ???? aus

function[shortest_path]= main_main(alpha, beta_0, no_agents, data_set, rounds, start_city, q0)



%Auslesen der Anzahl StÃ¤dte
no_cities = length (data_set(:,1));									%LÃ¤nge der ersten Spalte der Matrix auslesen

%Memory der Ameise, Matrix mit Anzahl StÃ¤dten x Anzahl Agents
%1 heisst noch nicht besucht.
M_k = ones(no_cities, no_agents);
tau = zeros (no_cities) + 0.1;											%tau als pheromenin-matrix mit dimension no_cities x no_cities, zu beginn alles null

%Berechnen von L_nn, benÃ¶tigt fÃ¼r tau0

L_nn = calc_Lnn(data_set, no_cities, start_city)								%Function calc_Lnn aufrufen um L_nn zu berechnen
tau0 = 1/(no_cities*L_nn);



M_k(start_city, :) = 0;                                             %Memory für Startcity auf "besucht"



%-------------------------------------------------------------------------------
%Start der Berechnung mit "rounds"-DurchgÃ¤ngen
%-------------------------------------------------------------------------------


for ii = 1:rounds
    
    path_length = zeros(no_agents,1);                                    %Vektor mit länge für agents und gefüllt mit null
    trajectory = ones(no_cities, no_agents)*start_city;                  %Matrix mit nummer der Startstadt auf allen positionen
    

	for current_agent = 1:no_agents
        
        current_city = start_city;                                      %Startstadt bekannt geben
        traj_pos = 2;                                                   %die position in der Trajectory matrix
        city_s = current_city;
        
		while (sum(M_k(:, current_agent)) > 0)							%Solange es noch unbesuchte StÃ¤dte gibt

        
                
            city_s = choose_city(tau, beta_0, M_k(:,current_agent), current_city, no_cities, current_agent, q0, data_set);              %Wähle eine Stadt
            
 
            
            M_k(city_s, current_agent) = 0; %Memory dass stadt city_s besucht wurde
            
            
            %---------------pfadlänge und Pherominupdate-------------------
            if current_city < city_s
                
                path_length(current_agent) = path_length(current_agent) + data_set(current_city, city_s);
                tau(current_city, city_s) = (1-alpha)*tau(current_city, city_s)+alpha*tau0;         %Lokales Pheromenupdate
                
            else
                
                path_length(current_agent) = path_length(current_agent) + data_set(city_s, current_city);
                tau(city_s, current_city) = (1-alpha)*tau(city_s, current_city)+alpha*tau0;         %Lokales Pheromenupdate
                
            end
            %--------------------------------------------------------------
       
            
            trajectory(traj_pos, current_agent) = city_s;                                               %Trajectorymatrix updaten
            traj_pos = traj_pos + 1;                                                                    %nächste Position für nächsten durchgang
            current_city = city_s;                                                                      %neue current_city gesetzt
            
        end %while
        
        
        %----------Weg nach hause------------------
        if current_city < start_city
                
                path_length(current_agent) = path_length(current_agent) + data_set(current_city, start_city);
                tau(current_city, start_city) = (1-alpha)*tau(current_city, start_city)+alpha*tau0;         %Lokales Pheromenupdate für heimweg
                
        else
                
                path_length(current_agent) = path_length(current_agent) + data_set(start_city, current_city);
                tau(start_city, current_city) = (1-alpha)*tau(start_city, current_city)+alpha*tau0;         %Lokales Pheromenupdate für heimweg
                
        end        
        %-------------------------------------------
        
        
		M_k(:, current_agent) = 1;																							%Die Memory auf Anfang setzten
        M_k(1, current_agent) = 0;

		%------------------------
		%Finde shortest path
		%------------------------

		if current_agent == 1											%Erster Path als shortest setzen														
			shortest_path = path_length(current_agent);
            shortest_path_index = current_agent;
            
        else   															%FÃ¼r alle weiteren Agents vergleichen
										
			if path_length(current_agent) < shortest_path

				shortest_path = path_length(current_agent);
				shortest_path_index = current_agent;					%Welcher Agent hatte shortest path, wird benÃ¶tigt um spÃ¤ter globales phenomanim update zu machen
                


			end

		end

		%------shortest path gefunden-------------

	end  %current_agent ------ Wir haben Shortest_path gefunden und den Agent, der ihn machte (für trajectory benötigt)

	%-----------------------------------------------------
	%Globales Update
	%-----------------------------------------------------
    tau = global_pheromene_update(trajectory(:, shortest_path_index), tau, shortest_path, no_cities, alpha, start_city );



end %ii
trajectory(:,shortest_path_index)

		

