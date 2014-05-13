%INFO: Berechnet die Distanz aus einem Vektor mit den Nr. der Städte und der Distanzmatrix der Städte

%INPUT: Nichts oder Vektor mit Reihenfolge der Städte und Distanzmatrix

%OUTPUT: Weglänge

function[opt_path] = calc_dist()

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
    
    
     trajectory_obtained = [1 22 8 26 31 28 3 36 35 20 2 29 21 16 50 34 30 9 49 10 39 33 45 15 44 42 40 19 41 13 25 14 24 43 7 23 48 6 27 51 46 12 47 18 4 17 37 5 38 11 32 1];
     
     trajectory_solution = [1 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 25 24 26 27 28 29 30 2 1];
     opt_path = 0;
     data_set = data_set + data_set';
     pathlength = length(trajectory_obtained);
     for ii = 1:(pathlength-1)

     	a = trajectory_obtained(ii);
     	b = trajectory_obtained(ii+1);

     	opt_path = opt_path + data_set(a, b);

     end %for ii
       
 end
