%Berechnet L_nn, welches die nearest neighbour heuristic tour length ist,
%also tourlänge falls man immer zum nächsten nachbarn geht

function[total_length] = calc_Lnn(data_set, no_cities)

	longest_distance = max(data_set)+1;																			%eins mehr als die längste distanz, wird also nie gewählt
	current_city = 1;
	city_memory = zeros(no_cities);																				%Erinnerung ob wir in einer Stadt schon waren
	city_memory(1) = 1
	distances = data_set + data_set' + diag(ones(no_cities)*longest_distance)									%Bildet die komplette Matrix mit überlangen distancen auf der diagonale, damit die nicht gewählt werden


	for ii = 2:no_cities																						%no_cities-1 durchgänge führt zu letzten stadt																						


		test = 1;																								%initialisiere Test variabel
		distance_vector = distances(:, current_city);															%Alle distancen in andere Städte von der jetzigen Stadt aus

		while(test)

			current_city=find(min(distance_vector);																%Finde die Stadt zu welcher wir als nächstes gehen

			if city_memory(current_city) = 0																	%Falls Stadt noch nicht besucht

				total_length = total_length + distance_vector(current_city);									%Distance zu dieser Stadt dazu addieren
				test = 0;																						%und aus while-Schleife aussteigen
				city_memory(current_city) = 1;

			else       																							%Falls Stadt schon besucht mach die Distanz länger als die Längste,
																												%dass sie sichen nicht mehr ausgewählt wird
				distance_vector(current_city) = longest_distance;

			end

		end


	end %ii

	total_length = total_length + distances(1, current_city);													%addiere noch die distanz nach hause dazu

end
















