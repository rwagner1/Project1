#Plot alpha vs. global_shortest_path_average

#Version 2, ungerundet, altes tau, eil51
# no_agents = 10;       						
# rounds = 2000										
# start_city = 1;										
# q0 = 0.9;
# tau_init = 0.1;                               
#V = 2;

rm(list = ls())

alpha = c(0,0.05,0.1,0.15,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9)
global_shortest_path_average = c( 467.4848,435.4711,433.6548,432.8082,432.5827,433.0562,438.5247,443.3537,449.1570, 452.0009,  457.3505,457.5814)
errors = c( 2.5652,3.6174,2.0224,1.5140,2.1404,1.3963, 5.1615, 4.6702,5.7521, 3.5225,4.1459 ,4.3749)
#Grafik
par(family="serif",oma=c(0,1,0,0),mgp=c(2.9,1,0),mar=c(4,4.9,1,1),cex.lab=1.1,cex=1.1)
plot(alpha,global_shortest_path_average,type="n",
     xlim=c(0,0.9),
     ylim=c(420,480),
     xlab=expression(paste(alpha)),
     ylab=expression(paste("<shortest path>"," / ", a.u.)),
     
)

y.errorbars <- function(alpha,global_shortest_patha_average,errors,ebl=0.02){arrows(alpha,global_shortest_path_average-errors,alpha,global_shortest_path_average+errors,code=3,angle=90,length=ebl)}
y.errorbars(alpha,global_shortest_path_average,errors)

#legend(0.8,430,c(expression(paste("city"," = ","eil51")),expression(paste(beta," = ",2)),expression(paste(rounds," = ",2000)),expression(paste(no_agents," = ",10)),expression(paste(q0," = ",0.9)),expression(paste(tau_init," = ",0.1)),expression(paste(L_nn," = ",513.61))))
#arrows(0.2,410,0.2,430,length=0.1,angle=30)
#text(0.2,450,expression(paste(alpha[optimized])))
legend(0.45,480,lty=c(2,3),c("ACS Average from [1]","ACS best result from [1]"),bty="n")
abline(h=433.87,lty=2)
abline(h=429,lty=3)
points(alpha,global_shortest_path_average,cex=0.8,pc=21,bg="white")

dev.copy2pdf(file="alpha_vs_shortestpath.pdf",height=7,width=12)