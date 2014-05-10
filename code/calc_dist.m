%INFO: Berechnet die Distanz aus einem Vektor mit den Nr. der Städte und der Distanzmatrix der Städte

%INPUT: Nichts oder Vektor mit Reihenfolge der Städte und Distanzmatrix

%OUTPUT: Weglänge

function[opt_path] = calc_dist()

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
        data_set = zeros(dim_data+1);                                      %Initialisieren City-Matrix
        for ii=1:dim_data
               for jj=1:dim_data
                    data_set(ii,jj+1) = cities.data(ii,dim_data-jj+1);           
                
               end
               
        end
        
        zero_nan = isnan(data_set);
        data_set(zero_nan)=0;
        data_set   
        
     end



     trajectory = [1 28 6 12 9 26 3 29 5 21 2 20 10 4 15 18 14 17 22 11 19 25 7 23 8 27 16 13 24 1];
     opt_path = 0;
     data_set = data_set + data_set';

     for ii = 1:(length(trajectory)-1)

     	a = trajectory(ii);
     	b = trajectory(ii+1);

     	opt_path = opt_path + data_set(a, b);

     end %for ii

 end
