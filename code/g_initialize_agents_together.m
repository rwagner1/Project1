%Hauptfunktion zum Wählen der Parameter und einlesen der Matrix mit Daten der Städte und Strecken

%Füge Pfade zu den Datensätzen dazu (ANPASSEN!)
addpath('C:\Users\Giandrin\Documents\GitHub\Solving-TSP-using-ACS\other');
%addpath('C:\Users\Raphaela Wagner\Documents\GitHub\Solving-TSP-using-ACS\other');

%Städtedaten einlesen
%cities.data = links obere Dreiecksmatrix mit Dimension: (no_cities-1) x
%(no_cities-1) mit Diagonaleinträgen

clear all
clc
close all

%Citydaten einlesen (2D euklidische Distanzen) 
% [filename, pathname] = uigetfile('*.txt', 'Please select a city environment');
%      if isequal(filename, 0)
%         disp('User selected ''Cancel''')
%         
%      else
%         disp(['User selected ', fullfile(pathname, filename)])
%         delimiterIn = ' ';
%         headerlinesIn = 9;
%         cities = importdata(filename,delimiterIn,headerlinesIn);
%         data_set = coordinates(cities.data);
%        
%      end
     
        cities = importdata('eil51.txt',' ',6);
        data_set = coordinates(cities.data);




%Citydaten einlesen (obere linke Dreiecksmatrix, zb city bayg29)
% [filename, pathname] = uigetfile('*.txt', 'Please select a city environment');
%      if isequal(filename, 0)
%         disp('User selected ''Cancel''')
%         
%      else
%         disp(['User selected ', fullfile(pathname, filename)])
%         delimiterIn = ' ';
%         headerlinesIn = 8;
%         cities = importdata(filename,delimiterIn,headerlinesIn);
%         dim_data = length(cities.data);
%         %Neuordnung City-Matrix zu linker unterer Dreiecksmatrix (Einträge
%         %oben rechts)
%         data_set = zeros(dim_data+1);                                      %Initialisieren City-Matrix
%         for ii=1:dim_data
%                for jj=1:dim_data
%                     data_set(ii,jj+1) = cities.data(ii,dim_data-jj+1);           
%                 
%                end
%                
%         end
%         
%         zero_nan = isnan(data_set);
%         data_set(zero_nan)=0;
%         data_set   
%         
%      end

     
 
alpha = 0.05;
beta_0 = 2;
no_agents = 10; 										%Wieviele Agents haben wir
rounds = 2000;											%Wieviele DurchgÃ¤nge
q0 = 0.9;
tau_init = 0.1;                                         %Pheromonmenge am Anfang


V = 2;


%------------------------
%Starte die Hauptfunktion
%------------------------


runs = 10;                                               %shortest_path wird über Anzahl runs gemittelt
global_shortest_path = zeros(runs,1);
%Fülle Vektor mit shortest_path für jeden Run
for ii=1:runs
    [global_shortest_path(ii),tau_bild, global_shortest_trajectory] = g_main_agents_together(alpha, beta_0, no_agents, data_set, rounds, q0, tau_init);
end


disp('eil51')
alpha
global_shortest_path_average = sum(global_shortest_path)/runs         %Gemittelter shortest_path
errors = std(global_shortest_path)  %Standardabweichung shortest_path
figure

%------------------------
