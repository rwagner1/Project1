%Funktion liest Vektor mit Koordinaten ein und gibt Distanz-Matrix (als obere Dreiecksmatrix)
%
%Input:     Koordinatenvektor in der Form (Nr., x-coord, y-coord)
%
%Output:    Distanz-Matrix, wobei der Eintrag i,j der Distanz zwischen Stadt
%           i,j entspricht. Diagonaleintr�ge sind leer


function[data_set] = coordinates(koordinaten)

	no_cities = length (koordinaten);                           %Anzahl St�dte
	data_set = zeros(no_cities);                                %Initialisiere Distanz-Matrix

	for haupt=1:(no_cities-1)                                   %Distanzen von Hauptstadt zu allen anderen St�dten eintragen

		for jj = (haupt+1):no_cities
            
            %Ungerundete Koordinaten f�r eil51, f�r oliver30 wird der
            %Befehl 'round' hinzugef�gt
			data_set(haupt, jj) = sqrt( (koordinaten(haupt, 2) - koordinaten(jj, 2))^2 + (koordinaten(haupt, 3) - koordinaten(jj, 3))^2 );

		end %for jj

	end %for haupt

end %end function

