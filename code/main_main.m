%Hauptfunktion
%Bekommt Parameter von main_initialize_system und gibt ???? aus

function[path_length]= mainASP(alpha, beta, no_agents, dataset, rounds)



%Auslesen der Anzahl Städte
no_cities = length (dataset[1]);						%Länge der ersten Spalte der Matrix auslesen

%Memory der Ameise, Matrix mit Anzahl Städten x Anzahl Agents
%1 heisst noch nicht besucht.
M_k = ones(no_cities, no_agents);

start_city = 1; 										%Agent startet bei erster Stadt
current_city = start_city;

%timesteps = rounds*no_agents*no_cities;					%Wieviele Rechenschritte, wobei ein Rechenschritt ein Vorschieben von allen Agents um eine Stadt ist


for ii = 1:rounds


	for current_agent = 1:no_agents

		while sum(M_k(:, current_agent)) > 0							%Solange es noch unbesuchte Städte gibt

			sadfa

		end

		path_length(current_agent) = path_length(current_agent) + dataset(current_city, start_city);	%Agent geht nach Hause
		M_k(:, current_agent) = ones;														%Die Memory auf Anfang setzten
		tau(start_city, current_city) = asdfasgadg;											%Pheromaninupdate

		%------------------------
		%Finde shortest path
		%------------------------

		if current_agent == 1											%Erster Path als shortest setzen														
			shortest_path = path_length(current_agent);
		else   															%Für alle weiteren Agents vergleichen
										
			if path_length(current_agent) < shortest_path

				shortest_path = path_length(current_agent);
				shortest_path_index = current_agent;					%Welcher Agent hatte shortest path, wird benötigt um später globales phenomanim update zu machen


			end

		end

		%------shortest path gefunden-------------

	end  %current_agent

	%-----------------------------------------------------
	%Globales Update
	%-----------------------------------------------------

end




		

