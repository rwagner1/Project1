%Funktion zur Berechnung von L_nn 
%
%Input:        Daten-Matrix, Anzahl cities, Startpunkt
%
%Output:       L_nn = nearest neighbour heuristic tour length ist =
%              Tourl�nge, falls man immer zum n�chsten Nachbarn geht

function[total_length] = calc_Lnn(data_set, no_cities, start_city)

	longest_distance = max(max(data_set))+1;													%Maximale Distanz zwischen zwei cities.
                                                                                                %Eins mehr als die l�ngste Distanz, wird also nie gew�hlt
	current_city = 1;                                                                           %Aktueller Standort wird eins gesetzt
	city_memory = zeros(no_cities,1);                                                           %Erinnerung ob wir in einer Stadt schon waren
	city_memory(start_city) = 1;
	distances = data_set + data_set' + diag([ones(no_cities,1)])*longest_distance;				%Bildet die komplette Matrix. Auf der Diagonalen sind gr�ssere Distanzen 
                                                                                                %als die Maximaldistanz zweier St�dte, damit diese nicht gew�hlt werden
    total_length = 0;

	for ii = 2:no_cities																		%no_cities-1 Durchg�nge f�hrt zu letzten Stadt																						


		test = 1;																				%initialisiere Test variabel
		distance_vector = distances(:, current_city);											%Alle Distanzen in andere St�dte von der jetzigen Stadt aus gesehen

		while(test)

			[shortest_length, current_city] = min(distance_vector);								%Gibt als shortest_length den kleinsten Eintrag und als current_city die aktuelle Position
           
			if (city_memory(current_city) == 0)													%Falls Stadt noch nicht besucht

				total_length = total_length + shortest_length;									%Distanz zu dieser Stadt dazu addieren
				test = 0;																		%und aus while-Schleife aussteigen
				city_memory(current_city) = 1;

			else       																			%Falls Stadt schon besucht 
																								%Distanz wird l�nger gew�hlt als maximale Distanz,
                                                                                                %so dass sie sicher nicht mehr ausgew�hlt wird
				distance_vector(current_city) = longest_distance;

            end %end if
           

        end %end while


	end %end ii

	total_length = total_length + distances(1, current_city);									%Addiere noch die Distanz nach Hause dazu

end %end function
















