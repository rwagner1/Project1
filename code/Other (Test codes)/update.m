%Diese Funktion macht ein Pheromenupdate tau(), Citynummernupdate und
%M_k()-update nachdem eine nächste Stadt city_s gewählt wurde
%
%Input:     Datensatz, Pheromenwert aus tau-Matrix an der Stelle der beiden
%           Verbindungsstädte,Vektor mit besuchten Städten für aktuellen
%           Agenten aus der trajectory-Matrix, Vektor aus Memory-Matrix für aktuellen
%           Agenten, Parameter
%
%Output:    Aktualisierte Werte in Matrizen tau(), trajectory(), M_k() and
%           fixer Stelle

function [ tau(current_city, city_s), trajectory(time_step_agent,current_agent), M_k(city_s,current_agent) ] = update(tau(current_city, city_s), trajectory(time_step_agent, current_agent), M_k(city_s, current_agent), alpha, tau0)


    tau(current_city, city_s) = (1-alpha)*tau(current_city, city_s)+alpha*tau0;         %Lokales Pheromenupdate
    trajectory (time_step_agent, current_agent) = city_s;                               %Speichere gewählte Citynummer
    M_k(city_s, current_agent) = 0;                                                     %Lösche Eintrag 1 aus Memory-Matrix M_k an der Stelle der Stadt s für den aktuellen Agenten und
end

