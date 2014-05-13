%Hauptfunktion zum W�hlen der Parameter und einlesen der Matrix mit Daten der St�dte und Strecken

%F�ge Pfade zu den Datens�tzen dazu (ANPASSEN!)
%addpath('C:\Users\Giandrin\Documents\GitHub\Solving-TSP-using-ACS\other');
%addpath('C:\Users\Raphaela Wagner\Documents\GitHub\Solving-TSP-using-ACS\other');

%St�dtedaten einlesen
%cities.data = rechte obere Dreiecksmatrix mit Dimension: no_cities x no_cities ohne Diagonaleintr�gen
%Der Eintrag i,j entspricht der Distanz zwischen Stadt i und j

clear all
clc
close all

%Citydaten einlesen (2D euklidische Distanzen) 
[filename, pathname] = uigetfile('*.txt', 'Please select a city environment');
     if isequal(filename, 0)
        disp('User selected ''Cancel''')
        
     else
        disp(['User selected ', fullfile(pathname, filename)])
        delimiterIn = ' ';
        headerlinesIn = 6;
        cities = importdata(filename,delimiterIn,headerlinesIn);
        data_set = coordinates(cities.data);
       
     end
     

%Citydaten einlesen (falls Distanzangaben in Matrixform)
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
%         %Neuordnung City-Matrix zu linker unterer Dreiecksmatrix (Eintr�ge
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

     
%Setze Parameter
alpha = 0.1;                                            %Updaterate
beta_0 = 2;                                             %Gewichtung Pheromon und N�he der St�dte
no_agents = 10; 										%Anzahl Ameisen=agents
rounds = 2000;											%Anzahl Durchg�nge von allen agents ausgef�hrt
q0 = 0.9;                                               %Wahrscheinlichkeit einen Pfad nach Pheromongehalt auszuw�hlen
tau_init = 0.1;                                         %Pheromonmenge am Anfang
version = 2;                                            %Programmversion                                                

%------------------------
%Starte die Hauptfunktion
%------------------------

runs = 10;                                              %shortest_path wird �ber Anzahl runs gemittelt
global_shortest_path = zeros(runs,1);                   %Vektor f�r runs verschiedene gefundene shortest_path


%F�lle Vektor mit shortest_path f�r jeden run
for ii=1:runs
    [global_shortest_path(ii),tau_bild] = main_main_agents_together(alpha, beta_0, no_agents, data_set, rounds, q0, tau_init);
end

%Ausgabe am Ende des Programms zur Strukturierung der Resultate
disp('eil51')
global_shortest_path
global_shortest_path_average = sum(global_shortest_path)/runs           %Gemittelter shortest_path
errors = std(global_shortest_path)                                      %Standardabweichung shortest_path

%------------------------
