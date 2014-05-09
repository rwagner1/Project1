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
        data_set = cities.data;                                                %City-Matrix
        
     end
 

%Parameter eintragen
alpha = 0.1;                                            
beta = 2;
q0 = 0.9;
no_agents = 10; 										


%------------------------
%Starte die Hauptfunktion
%------------------------

%mainASP(alpha, beta, no_agents, data_set);