%Hauptfunktion zum Wählen der Parameter und einlesen der Matrix mit Daten der Städte und Strecken

%Füge Pfade zu den Datensätzen dazu
addpath('C:\Users\Giandrin\Documents\GitHub\Solving-TSP-using-ACS\other');

%Matrix einlesen
.
dataset = %Daten (untere Dreiecksmatrix??);
.
.

%Parameter eintragen

alpha = 0.1;
beta_0 = 2;
no_agents = 10; 										%Wieviele Agents haben wir
rounds = 10;											%Wieviele Durchgänge
start_city = 1;											%Bei welcher Stadt startet der Agent


%------------------------
%Starte die Hauptfunktion
%------------------------

mainASP(alpha, beta_0, no_agents, dataset, rounds, start_city);