#Plot alpha vs. global_shortest_path_average

# no_agents = 10;       						
# rounds = 2000										
# start_city = 1;										
# q0 = 0.9;
# tau_init = 0.1;                               
#V = 2;

rm(list = ls())

alpha = c(0,0.1,0.2,0.3,0.4,0.5,0.7,0.8,0.9)
global_shortest_path_average = c( 467.4848,433.6548,432.5827,433.0562,438.5247,443.3537, 452.0009,  457.3505,457.5814)

#Grafik
par(family="serif",oma=c(0,1,0,0),mgp=c(2.9,1,0),mar=c(4,4.9,1,1),cex.lab=1,cex=1)
plot(alpha,global_shortest_path_average,type="n",
     xlim=c(0,1),
     ylim=c(350,500),
     xlab=expression(paste(alpha," / ", a.u.)),
     ylab=expression(paste("<shortest path>"," / ", a.u.)),
     
)


legend(0.8,430,c(expression(paste("city"," = ","eil51")),expression(paste(beta," = ",2)),expression(paste(rounds," = ",2000)),expression(paste(no_agents," = ",10)),expression(paste(q0," = ",0.9)),expression(paste(tau_init," = ",0.1)),expression(paste(L_nn," = ",513.61))))
#arrows(0.2,410,0.2,430,length=0.1,angle=30)
text(0.2,450,expression(paste(alpha[optimized])))
arrows(-1,432.5827,0.2,432.5827,length=0,lty=2)
arrows(0.2,320,0.2,432.5827,length=0,lty=2)

points(alpha,global_shortest_path_average,cex=0.8,pc=21,bg="white")

#dev.copy2pdf(file="alpha_vs_shortestpath.pdf",height=7,width=12)