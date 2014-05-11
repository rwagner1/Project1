%Städtedaten einlesen
%cities.data = links obere Dreiecksmatrix mit Dimension: (no_cities-1) x
%(no_cities-1) mit Diagonaleinträgen

addpath('C:\Users\Giandrin\Documents\GitHub\Solving-TSP-using-ACS\other');




%Citydaten einlesen (2D euklidische Distanzen) 
% [filename, pathname] = uigetfile('*.txt', 'Please select a city environment');
%      if isequal(filename, 0)
%         disp('User selected ''Cancel''')
%         
%      else
%         disp(['User selected ', fullfile(pathname, filename)])
%         delimiterIn = ' ';
%         headerlinesIn = 6;
%         cities = importdata(filename,delimiterIn,headerlinesIn);
%         coord = cities.data;
% 
%        
%      end
     
        cities = importdata('eil51.txt',' ',6);
        coord = cities.data;


     plot(coord(:,1), coord(:,2), 'o')
     hold on
     plot([10,51],[10,40], 'red')
     
