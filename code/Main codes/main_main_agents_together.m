%Hauptfunktion
%Alle agents werden zu Beginn zuf�llig auf St�dte verteilt und bewegen sich dann gleichzeitig Schritt f�r Schritt
%
%Input:     Parameter, Anzahl agents, Daten-Matrix mit Distanzen zwischen
%           St�dten, Anzahl Runden
%
%Output:    K�rzeste jemals gegangene Tour

function[global_shortest_path]= main_main_agents_together(alpha, beta_0, no_agents, data_set, rounds, q0, tau_init)



no_cities = length (data_set(:,1));                                         %Auslesen der Anzahl St�dte = L�nge der ersten Spalte der Matrix auslesen
tau = zeros (no_cities) + tau_init;                                         %tau als Pheromon-Matrix mit Dimension no_cities x no_cities, zu Beginn alles null
L_nn = calc_Lnn(data_set, no_cities, 1);                                    %Berechnen von L_nn, ben�tigt f�r tau0: Funktion calc_Lnn aufrufen
tau0 = 1/(no_cities*L_nn);

start_city = zeros(no_agents,1);                                            %Start_city ist f�r jeden agent unterschiedlich

global_shortest_path = L_nn;                                                %Globaler shortest_path vergleicht shortest_path's von allen gegangenen rounds


%--------------------------------------------------------------------------
%Start der Berechnung mit "rounds"-Durchg�ngen
%--------------------------------------------------------------------------


for ii = 1:rounds
    
    trajectory = zeros(no_cities, no_agents);                               %trajectory Matrix initialisieren, Abfolge der besuchten St�dte f�r jeden Agenten
    current_city = zeros(no_agents, 1);                                     %current_city Vektor initialisieren
    city_s = zeros(no_agents, 1);                                           %s_city Vektro initialisieren
    path_length = zeros(no_agents,1);                                       %Tourl�ngen-Vektor mit initialisieren
    M_k = ones(no_cities, no_agents);                                       %Memory-Matrix der Ameise, Matrix mit Anzahl St�dten x Anzahl Agents
                                                                            %1 heisst noch nicht besucht.


    for current_agent = 1:no_agents

        start_city(current_agent) = randi([1, no_cities]);                  %Platziere die Agents zuf�llig in einer Stadt
        M_k(start_city(current_agent), current_agent) = 0;                  %Memory f�r Startstadt setzen
        trajectory(1, current_agent) = start_city(current_agent);           %Die Startstadt jedes Agenten als erste in der Trajectory-Matrix setzen
        current_city(current_agent) = start_city(current_agent);            %Startstadt bekannt geben

    end %for current_agent
    
  

    %Start der Durchg�nge, in jedem Durchgang machen alle agents nacheinander einen Schritt, gehen also eine Stadt weiter.
    %Es gibt soviele Durchg�nge wie es St�dte gibt und falls wir im letzten Durchgang sind, wird am Ende noch der Nachhauseweg 
    %dazugerechnet.

    for jj = 2:no_cities

        traj_pos = jj;                                                      %Position in Trajectory-Matrix


        %Alle agents gehen eine Stadt vor.
    	for current_agent = 1:no_agents
           
            %W�hle eine Stadt mittels Funktion choose_city()
            city_s(current_agent) = choose_city(tau, beta_0, M_k(:,current_agent), current_city(current_agent), no_cities, current_agent, q0, data_set);              
                             
            M_k(city_s(current_agent), current_agent) = 0;                  %Aktualisiere Memory-Matrix, dass Stadt city_s besucht wurde
                
                
            %---------------pfadl�nge und Pheromonupdate-------------------
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
            current_city(current_agent) = city_s(current_agent);            %Agent r�ckt eine Stadt vor


            %------------------------Weg nach Hause------------------------
            if (jj == no_cities)

                if current_city(current_agent) < start_city(current_agent)
                                
                    path_length(current_agent) = path_length(current_agent) + data_set(current_city(current_agent), start_city(current_agent));
                    %Lokales Pheromonupdate f�r Heimweg
                    tau(current_city(current_agent), start_city(current_agent)) = (1-alpha)*tau(current_city(current_agent), start_city(current_agent))+alpha*tau0;         
                                
                else
                                
                    path_length(current_agent) = path_length(current_agent) + data_set(start_city(current_agent), current_city(current_agent));
                    %Lokales Pheromonupdate f�r Heimweg
                    tau(start_city(current_agent), current_city(current_agent)) = (1-alpha)*tau(start_city(current_agent), current_city(current_agent))+alpha*tau0;
                                
                end

            end % end if
            %--------------------------------------------------------------

        end  %for current_agent, Schleife �ber agents in einem Timestep.
             %Alle Agents bewegen sich um eine Stadt vor
        
    end % for jj, schleife �ber die Anzahl St�dte

    
    
    %-----------------------Ermitteln des k�rzesten Pfades-----------------
    shortest_path = path_length(1);                                         %Pfad des 1. Agents als k�rzester Pfad gesetzt, zu Vergleichzwecken
    shortest_path_index = 1;
    for ll = 2:no_agents

        if (path_length(ll) < shortest_path)

            shortest_path = path_length(ll);                                %Neuer k�rzester Pfad gefunden
            shortest_path_index = ll;                                       %Index zum Agenten mit dem k�rzesten Pfad

        end %if

    end %for ll, zum Ermitteln des k�rzesten Pfads


    %Globales Pheromon-Update
    tau = global_pheromene_update(trajectory(:, shortest_path_index), tau, shortest_path, no_cities, alpha, trajectory(1, shortest_path_index) );
   
    
    %Vergleiche den k�rzesten Pfad dieser Runde mit dem k�rzesten Pfad von allen gegangen Runden   
    if shortest_path <global_shortest_path 

        global_shortest_path = shortest_path;
        
    end

    
end %for ii, �ber die rounds


