%Hauptfunktion zum W�hlen der Parameter und einlesen der Matrix mit Daten der St�dte und Strecken

%F�ge Pfade zu den Datens�tzen dazu (ANPASSEN!)
%addpath('C:\Users\Giandrin\Documents\GitHub\Solving-TSP-using-ACS\other');
addpath('C:\Users\Raphaela Wagner\Documents\GitHub\Solving-TSP-using-ACS\other');

%St�dtedaten einlesen
%cities.data = links obere Dreiecksmatrix mit Dimension: (no_cities-1) x
%(no_cities-1) mit Diagonaleintr�gen

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

     
 
alpha = 0.1;
beta_0 = 2;
no_agents = 30; 										%Wieviele Agents haben wir
rounds = 400;											%Wieviele Durchgänge
start_city = 1;											%Bei welcher Stadt startet der Agent
q0 = 0.9;



%------------------------
%Starte die Hauptfunktion
%------------------------



shortest_path = main_main(alpha, beta_0, no_agents, data_set, rounds, start_city, q0);
shortest_path



