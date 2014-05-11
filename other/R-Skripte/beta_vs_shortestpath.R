#Plot beta vs. global_shortest_path_average

# alpha = 0.1;
# no_agents = 10;     							
# rounds = ?										
# start_city = 1;										
# q0 = 0.9;
# tau_init = 0.1;                               

rm(list = ls())

beta = c(0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5)
global_shortest_path_average = c()

#Grafik
par(family="serif",oma=c(0,1,0,0),mgp=c(2.9,1,0),mar=c(4,4.9,1,1),cex.lab=1.2,cex=1.2)
plot(rounds,shortest_path_average,type="n",
     xlim=c(0,6),
     ylim=c(400,700),
     xlab=expression(paste("beta"," / ", a.u.)),
     ylab=expression(paste("shortest path"," / ", a.u.)),
     
)
points(rounds,shortest_path_average,cex=1,pc=21,bg="white")

legend(1600,670,c(expression(paste(alpha," = ",0.1)),expression(paste(rounds," = ","?")),expression(paste(no_agents," = ",10)),expression(paste(q0," = ",0.9)),expression(paste(tau_init," = ",0.1)),expression(paste(L_nn," = ",513.61))))

#dev.copy2pdf(file="rounds_vs_shortestpath.pdf",height=7,width=12)