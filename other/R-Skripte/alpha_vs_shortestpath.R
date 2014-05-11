#Plot alpha vs. global_shortest_path_average

# no_agents = 10;       						
# rounds = 2000										
# start_city = 1;										
# q0 = 0.9;
# tau_init = 0.1;                               
#V = 2;

rm(list = ls())

alpha = c(0,0.1,0.2,0.3,0.4,0.5,0.7,0.9)
global_shortest_path_average = c( 467.4848,433.6548,1,433.0562, 1,443.3537, 452.0009,457.5814)

#Grafik
par(family="serif",oma=c(0,1,0,0),mgp=c(2.9,1,0),mar=c(4,4.9,1,1),cex.lab=1,cex=1)
plot(alpha,global_shortest_path_average,type="n",
     xlim=c(0,2),
     ylim=c(400,450),
     xlab=expression(paste(alpha," / ", a.u.)),
     ylab=expression(paste("<shortest path>"," / ", a.u.)),
     
)
points(alpha,global_shortest_path_average,cex=0.7,pc=21,bg="white")

legend(1.5,670,c(expression(paste("city"," = ","eil51")),expression(paste(beta," = ",2)),expression(paste(rounds," = ",2000)),expression(paste(no_agents," = ",10)),expression(paste(q0," = ",0.9)),expression(paste(tau_init," = ",0.1)),expression(paste(L_nn," = ",513.61))))

#dev.copy2pdf(file="rounds_vs_shortestpath.pdf",height=7,width=12)