#Plot q0 vs. global_shortest_path_average

#Version2, gerundet, altes tau
# alpha = 0.1;
# no_agents = 10;     							
# rounds = 800																				
# tau_init = 0.001;                               

rm(list = ls())

q0 = c(0.999, 0.95, 0.9, 0.85, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2, 0.1)
global_shortest_path_average = c(425.7000, 420.8000, 420.7000, 420.4000, 420.7000, 422.4000, 427.2000, 438.6000, 444.9000, 455.9000, 463.4000, 489.7000)
error_shortest_path = c(3.1287, 0.6325, 0.4830, 0.5164, 0.6749, 1.7764, 3.8816, 6.9793, 6.3149, 7.3401, 7.3817, 8.4070)

#Grafik
par(family="serif",oma=c(0,1,0,0),mgp=c(2.9,1,0),mar=c(4,4.9,1,1),cex.lab=1.5,cex=1.5)
plot(q0,global_shortest_path_average,type="n",
     xlim=c(0,1),
     ylim=c(400,500),
     xlab=expression(paste(q[0])),
     ylab=expression(paste("shortest path"," / ", a.u.)),
     
)

abline(h = 420, lty = 3)

y.errorbars <- function(q0,global_shortest_path_average,error_shortest_path,ebl=0.02){arrows(q0,global_shortest_path_average-error_shortest_path,q0,global_shortest_path_average+error_shortest_path,code=3,angle=90,length=ebl)}
y.errorbars(q0,global_shortest_path_average,error_shortest_path)

points(q0,global_shortest_path_average,cex=1,pc=23,
       bg="white", col="red")

# legend(0.6,495,c(expression(paste(alpha," =             ",0.1)),
#                   expression(paste(rounds," =     ","800")),
#                   expression(paste('no. of ants'," = ",10)),
#                   expression(paste(runs," =           ",10)),
#                   expression(paste(tau[start]," =      ",0.001))))

dev.copy2pdf(file="q0_vs_shortestpath.pdf",height=8,width=12)