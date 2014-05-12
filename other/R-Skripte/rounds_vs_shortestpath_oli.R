#Plot rounds vs. global_shortest_path_average für oliver30

#Version 1 und 2, ungerundet(V1&V2), gerundet(V3), neues tau

# alpha = 0.1;
# beta_0 = 2;
# no_agents = 10;     							
# rounds = 50:1000										
# start_city = 1;											
# q0 = 0.9;
# tau_init = 0.1 oder 0.001;    

rm(list = ls())

#Daten einlesen
rounds = c(50,100,200,300,400,500,600,700,800,900,1000)
global_shortest_path_average = c(496.7000,479.3000,440.1000,421.8000,420.5000,420.6000,420.7000,1,1,1,1)
min_global_shortest_path_average = c(469,464,426,420,420,1,1,1,1,1,1)
errors <- c(15.7343,11.0559,10.0935,10.0935,2.2509,0.5270,0.6992,0.4830,1,1,1)

#Grafik
par(family="serif",oma=c(0,1,0,0),mgp=c(2.9,1,0),mar=c(4,4.9,1,1),cex.lab=1.1,cex=1.1)
plot(rounds,global_shortest_path_average,type="n",
     xlim=c(50,1000),
     ylim=c(400,550),
     xlab=expression(paste("rounds")),
     ylab=expression(paste("<shortest path>"," / ", a.u.)),
     
)
y.errorbars <- function(rounds,global_shortest_path_average,errors,ebl=0.02){arrows(rounds,global_shortest_path_average-errors,rounds,global_shortest_path_average+errors,code=3,angle=90,length=ebl)}
y.errorbars(rounds,global_shortest_path_average,errors)


abline(h=420,lty=2)
points(rounds,global_shortest_path_average,cex=0.8,pc=21,bg="white")
#legend(1000,550,c(expression(paste(alpha," = ",0.1)),expression(paste(beta," = ",2)),expression(paste(no_agents," = ",10)),expression(paste(q0," = ",0.9)),expression(paste(tau_init," = ",0.1)),expression(paste(L_nn," = ",513.61))))
legend(650,550,lty=c(2,NA),c("Optimal Tour Length"),bty="n")


dev.copy2pdf(file="rounds_vs_shortestpath_oli.pdf",height=7,width=12)