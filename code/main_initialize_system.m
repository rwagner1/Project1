%Hauptfunktion zum Wählen der Parameter und einlesen der Matrix mit Daten der Städte und Strecken

%Füge Pfade zu den Datensätzen dazu (ANPASSEN!)
%addpath('C:\Users\Giandrin\Documents\GitHub\Solving-TSP-using-ACS\other');
addpath('C:\Users\Raphaela Wagner\Documents\GitHub\Solving-TSP-using-ACS\other');

%Städtedaten einlesen
%cities.data = links obere Dreiecksmatrix mit Dimension: (no_cities-1) x
%(no_cities-1) mit Diagonaleinträgen

[filename, pathname] = uigetfile('*.txt', 'Please select a city environment');
     if isequal(filename, 0)
        disp('User selected ''Cancel''')
        
     else
        disp(['User selected ', fullfile(pathname, filename)])
        delimiterIn = ' ';
        headerlinesIn = 8;
        cities = importdata(filename,delimiterIn,headerlinesIn);
        data_set = cities.data;                                                %City-Matrix
        
     end
 


alpha = 0.1;
beta_0 = 2;
no_agents = 10; 										%Wieviele Agents haben wir
rounds = 10;											%Wieviele DurchgÃ¤nge
start_city = 1;											%Bei welcher Stadt startet der Agent



%------------------------
%Starte die Hauptfunktion
%------------------------


main_main(alpha, beta_0, no_agents, dataset, rounds, start_city);

