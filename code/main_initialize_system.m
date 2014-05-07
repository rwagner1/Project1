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
beta = 2;
no_agents = 10; 										%Wieviele Agents haben wir


%------------------------
%Starte die Hauptfunktion
%------------------------

mainASP(alpha, beta, no_agents, dataset);