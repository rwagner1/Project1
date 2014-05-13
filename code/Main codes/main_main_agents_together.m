%Hauptfunktion
%Alle agents werden zu Beginn zufällig auf Städte verteilt und bewegen sich dann gleichzeitig Schritt für Schritt
%
%Input:     Parameter, Anzahl agents, Daten-Matrix mit Distanzen zwischen
%           Städten, Anzahl Runden
%
%Output:    Kürzeste jemals gegangene Tour

function[global_shortest_path]= main_main_agents_together(alpha, beta_0, no_agents, data_set, rounds, q0, tau_init)



no_cities = length (data_set(:,1));                                         %Auslesen der Anzahl Städte = Länge der ersten Spalte der Matrix auslesen
tau = zeros (no_cities) + tau_init;                                         %tau als Pheromon-Matrix mit Dimension no_cities x no_cities, zu Beginn alles null
L_nn = calc_Lnn(data_set, no_cities, 1);                                    %Berechnen von L_nn, benötigt für tau0: Funktion calc_Lnn aufrufen
tau0 = 1/(no_cities*L_nn);

start_city = zeros(no_agents,1);                                            %Start_city ist für jeden agent unterschiedlich

global_shortest_path = L_nn;                                                %Globaler shortest_path vergleicht shortest_path's von allen gegangenen rounds


%--------------------------------------------------------------------------
%Start der Berechnung mit "rounds"-Durchgängen
%--------------------------------------------------------------------------


for ii = 1:rounds
    
    trajectory = zeros(no_cities, no_agents);                               %trajectory Matrix initialisieren, Abfolge der besuchten Städte für jeden Agenten
    current_city = zeros(no_agents, 1);                                     %current_city Vektor initialisieren
    city_s = zeros(no_agents, 1);                                           %s_city Vektro initialisieren
    path_length = zeros(no_agents,1);                                       %Tourlängen-Vektor mit initialisieren
    M_k = ones(no_cities, no_agents);                                       %Memory-Matrix der Ameise, Matrix mit Anzahl Städten x Anzahl Agents
                                                                            %1 heisst noch nicht besucht.


    for current_agent = 1:no_agents

        start_city(current_agent) = randi([1, no_cities]);                  %Platziere die Agents zufällig in einer Stadt
        M_k(start_city(current_agent), current_agent) = 0;                  %Memory für Startstadt setzen
        trajectory(1, current_agent) = start_city(current_agent);           %Die Startstadt jedes Agenten als erste in der Trajectory-Matrix setzen
        current_city(current_agent) = start_city(current_agent);            %Startstadt bekannt geben

    end %for current_agent
    
  

    %Start der Durchgänge, in jedem Durchgang machen alle agents nacheinander einen Schritt, gehen also eine Stadt weiter.
    %Es gibt soviele Durchgänge wie es Städte gibt und falls wir im letzten Durchgang sind, wird am Ende noch der Nachhauseweg 
    %dazugerechnet.

    for jj = 2:no_cities

        traj_pos = jj;                                                      %Position in Trajectory-Matrix


        %Alle agents gehen eine Stadt vor.
    	for current_agent = 1:no_agents
           
            %Wähle eine Stadt mittels Funktion choose_city()
            city_s(current_agent) = choose_city(tau, beta_0, M_k(:,current_agent), current_city(current_agent), no_cities, current_agent, q0, data_set);              
                             
            M_k(city_s(current_agent), current_agent) = 0;                  %Aktualisiere Memory-Matrix, dass Stadt city_s besucht wurde
                
                
            %---------------pfadlänge und Pheromonupdate-------------------
            if current_city(current_agent) < city_s(current_agent)
                
                path_length(current_agent) = path_length(current_agent) + data_set(current_city(current_agent), city_s(current_agent));
                %Lokales Pheromonupdate
                tau(current_city(current_agent), city_s(current_agent)) = (1-alpha)*tau(current_city(current_agent), city_s(current_agent))+alpha*tau0;        
                    
            else
                    
                path_length(current_agent) = path_length(current_agent) + data_set(city_s(current_agent), current_city(current_agent));
                %Lokales Pheromonupdate
                tau(city_s(current_agent), current_city(current_agent)) = (1-alpha)*tau(city_s(current_agent), current_city(current_agent))+alpha*tau0;        
                    
            end
            %--------------------------------------------------------------
           
                
            trajectory(traj_pos, current_agent) = city_s(current_agent);    %Trajectory-Matrix updaten
            current_city(current_agent) = city_s(current_agent);            %Agent rückt eine Stadt vor


            %------------------------Weg nach Hause------------------------
            if (jj == no_cities)

                if current_city(current_agent) < start_city(current_agent)
                                
                    path_length(current_agent) = path_length(current_agent) + data_set(current_city(current_agent), start_city(current_agent));
                    %Lokales Pheromonupdate für Heimweg
                    tau(current_city(current_agent), start_city(current_agent)) = (1-alpha)*tau(current_city(current_agent), start_city(current_agent))+alpha*tau0;         
                                
                else
                                
                    path_length(current_agent) = path_length(current_agent) + data_set(start_city(current_agent), current_city(current_agent));
                    %Lokales Pheromonupdate für Heimweg
                    tau(start_city(current_agent), current_city(current_agent)) = (1-alpha)*tau(start_city(current_agent), current_city(current_agent))+alpha*tau0;
                                
                end

            end % end if
            %--------------------------------------------------------------

        end  %for current_agent, Schleife über agents in einem Timestep.
             %Alle Agents bewegen sich um eine Stadt vor
        
    end % for jj, schleife über die Anzahl Städte

    
    
    %-----------------------Ermitteln des kürzesten Pfades-----------------
    shortest_path = path_length(1);                                         %Pfad des 1. Agents als kürzester Pfad gesetzt, zu Vergleichzwecken
    shortest_path_index = 1;
    for ll = 2:no_agents

        if (path_length(ll) < shortest_path)

            shortest_path = path_length(ll);                                %Neuer kürzester Pfad gefunden
            shortest_path_index = ll;                                       %Index zum Agenten mit dem kürzesten Pfad

        end %if

    end %for ll, zum Ermitteln des kürzesten Pfads


    %Globales Pheromon-Update
    tau = global_pheromene_update(trajectory(:, shortest_path_index), tau, shortest_path, no_cities, alpha, trajectory(1, shortest_path_index) );
   
    
    %Vergleiche den kürzesten Pfad dieser Runde mit dem kürzesten Pfad von allen gegangen Runden   
    if shortest_path <global_shortest_path 

        global_shortest_path = shortest_path;
        
    end

    
end %for ii, über die rounds


