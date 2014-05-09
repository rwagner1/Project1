%Hauptfunktion zum W�hlen der Parameter und einlesen der Matrix mit Daten der St�dte und Strecken

%F�ge Pfade zu den Datens�tzen dazu (ANPASSEN!)
%addpath('C:\Users\Giandrin\Documents\GitHub\Solving-TSP-using-ACS\other');
addpath('C:\Users\Raphaela Wagner\Documents\GitHub\Solving-TSP-using-ACS\other');

%St�dtedaten einlesen
%cities.data = links obere Dreiecksmatrix mit Dimension: (no_cities-1) x
%(no_cities-1) mit Diagonaleintr�gen

[filename, pathname] = uigetfile('*.txt', 'Please select a city environment');
     if isequal(filename, 0)
        disp('User selected ''Cancel''')
        
     else
        disp(['User selected ', fullfile(pathname, filename)])
        delimiterIn = ' ';
        headerlinesIn = 8;
        cities = importdata(filename,delimiterIn,headerlinesIn);
        dim_data = length(cities.data);
        %Neuordnung City-Matrix zu linker unterer Dreiecksmatrix (Eintr�ge
        %oben rechts)
        data_set = NaN(dim_data+1);                                      %Initialisieren City-Matrix
        for ii=1:dim_data
               for jj=1:dim_data
                data_set(ii,jj+1) = cities.data(ii,dim_data-jj+1);
             
               end
               
        end
           
        
     end
 


alpha = 0.1;
beta_0 = 2;
no_agents = 10; 										%Wieviele Agents haben wir
rounds = 10;											%Wieviele Durchgänge
start_city = 1;											%Bei welcher Stadt startet der Agent



%------------------------
%Starte die Hauptfunktion
%------------------------



%main_main(alpha, beta_0, no_agents, dataset, rounds, start_city);

