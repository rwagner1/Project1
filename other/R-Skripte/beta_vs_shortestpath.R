#Plot beta vs. global_shortest_path_average

#Version2, gerundet, altes tau, oliver30
# alpha = 0.1;
# no_agents = 10;     							
# rounds = 400										
# start_city = 1;										
# q0 = 0.9;
# tau_init = 0.1;                               

rm(list = ls())

beta = c(0.1,1,2,4,5,6,7,8,9,10)
global_shortest_path_average = c(522.4500, 425.5000,424.6000,423.5500,422.8000,422.3500,422.5500,422.6000,422.5000,422.8000)
errors = c(15.3913,5.3852,4.8166,2.4597,1.3611, 0.7452,0.8256,0.5982,0.5130,0.5231)

#Grafik
par(family="serif",oma=c(0,1,0,0),mgp=c(2.9,1,0),mar=c(4,4.9,1,1),cex.lab=1.1,cex=1.1)
plot(beta,global_shortest_path_average,type="n",
     xlim=c(0,10),
     ylim=c(420,430),
     xlab=expression(paste(beta)),
     ylab=expression(paste("<shortest path>"," / ", a.u.)),
     
)

y.errorbars <- function(beta,global_shortest_path_average,errors.V1,ebl=0.02){arrows(beta,global_shortest_path_average-errors.V1,beta,global_shortest_path_average+errors.V1,code=3,angle=90,length=ebl)}
y.errorbars(beta,global_shortest_path_average,errors)

legend(5,430,lty=c(2,NA),c("ACS best result"),bty="n")
abline(h=433.87,lty=2)
abline(h=420,lty=2)
points(beta,global_shortest_path_average,cex=0.8,pc=21,bg="white")


dev.copy2pdf(file="beta_vs_shortestpath.pdf",height=7,width=12)