%Funktion liest Vektor mit Koordinaten ein und gibt Distanz-Matrix (als obere Dreiecksmatrix)
%
%Input:     Koordinatenvektor in der Form (Nr., x-coord, y-coord)
%
%Output:    Distanz-Matrix, wobei der Eintrag i,j der Distanz zwischen Stadt
%           i,j entspricht. Diagonaleinträge sind leer


function[data_set] = coordinates(koordinaten)

	no_cities = length (koordinaten);                           %Anzahl Städte
	data_set = zeros(no_cities);                                %Initialisiere Distanz-Matrix

	for haupt=1:(no_cities-1)                                   %Distanzen von Hauptstadt zu allen anderen Städten eintragen

		for jj = (haupt+1):no_cities
            
            %Ungerundete Koordinaten für eil51, für oliver30 wird der
            %Befehl 'round' hinzugefügt
			data_set(haupt, jj) = sqrt( (koordinaten(haupt, 2) - koordinaten(jj, 2))^2 + (koordinaten(haupt, 3) - koordinaten(jj, 3))^2 );

		end %for jj

	end %for haupt

end %end function

