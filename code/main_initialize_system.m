%Hauptfunktion zum Wählen der Parameter und einlesen der Matrix mit Daten der Städte und Strecken

%Füge Pfade zu den Datensätzen dazu (ANPASSEN!)
%addpath('C:\Users\Giandrin\Documents\GitHub\Solving-TSP-using-ACS\other');
%addpath('C:\Users\Raphaela Wagner\Documents\GitHub\Solving-TSP-using-ACS\other');

%Städtedaten einlesen
%cities.data = links obere Dreiecksmatrix mit Dimension: (no_cities-1) x
%(no_cities-1) mit Diagonaleinträgen

<<<<<<< HEAD
% [filename, pathname] = uigetfile('*.txt', 'Please select a city environment');
%      if isequal(filename, 0)
%         disp('User selected ''Cancel''')
%         
%      else
%         disp(['User selected ', fullfile(pathname, filename)])
%         delimiterIn = ' ';
%         headerlinesIn = 8;
%         cities = importdata(filename,delimiterIn,headerlinesIn);
%         data_set = cities.data;                                                %City-Matrix
%         
%      end
=======
[filename, pathname] = uigetfile('*.txt', 'Please select a city environment');
     if isequal(filename, 0)
        disp('User selected ''Cancel''')
        
     else
        disp(['User selected ', fullfile(pathname, filename)])
        delimiterIn = ' ';
        headerlinesIn = 8;
        cities = importdata(filename,delimiterIn,headerlinesIn);
        dim_data = length(cities.data);
        %Neuordnung City-Matrix zu linker unterer Dreiecksmatrix (Einträge
        %oben rechts)
        data_set = NaN(dim_data+1);                                      %Initialisieren City-Matrix
        for ii=1:dim_data
               for jj=1:dim_data
                data_set(ii,jj+1) = cities.data(ii,dim_data-jj+1);
             
               end
               
        end
           
        
     end
>>>>>>> 59f72f0ae0de4e66bf1ace8a9340fa5177020506
 

data_set =  [0 0 0 0; 5 0 0 0; 10 7 0 0; 6 11 8 0]';

alpha = 0.1;
beta_0 = 2;
no_agents = 10; 										%Wieviele Agents haben wir
rounds = 1;											%Wieviele DurchgÃ¤nge
start_city = 1;											%Bei welcher Stadt startet der Agent
q0 = 0.9;



%------------------------
%Starte die Hauptfunktion
%------------------------


<<<<<<< HEAD
shortest_path = main_main(alpha, beta_0, no_agents, data_set, rounds, start_city, q0);
shortest_path

=======

main_main(alpha, beta_0, no_agents, dataset, rounds, start_city);
>>>>>>> 59f72f0ae0de4e66bf1ace8a9340fa5177020506

