%Test Funktionen

clear all
close all, clc

%Variablen und Parameter setzen
no_cities = 29;
no_agents = 10;
beta0 = 2;

%Matrizen setzen
tau = randi([0,10],28,28);         %tau-Matrix mit rnd integers
tau = triu(tau)-diag([diag(tau)]);          %erzeuge Dreiecksmatrix ohne Diagelemente   

M_k = ones(no_cities,no_agents);    %Memory-Matrix

current_agent = randi([1,no_agents]);
current_city = randi([1,29]);
next_city = randi([1,29]);

while (next_city == current_city)
    next_city = randi([1,29]);
end

main_initialize_system();

%Teste Funktionen

