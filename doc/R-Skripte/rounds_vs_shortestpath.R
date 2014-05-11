#Plot rounds vs. global_shortest_path_average

# alpha = 0.1;
# beta_0 = 2;
# no_agents = 10;   								
# rounds = 200:2000										
# start_city = 1;											
# q0 = 0.9;
# tau_init = 0.1;                                        
rm(list = ls())

#Daten einlesen
rounds = c(200,400,600,800,1000,1200,1400,1600,1800,2000)
shortest_path_average = c(614.2477,501.2961,491.6939, 465.4633,0,0,0,0,0,0)
global_shortest_path_average.V1 = c(507.3012,459.8245,447.2501,0,0,0,0,0,0,0)
global_shortest_path_average.V2 = c(507.3012,459.8245,447.2501,0,0,0,0,0,0,0)
errors.V1 = c(10.4641,8.8395,4.8312,1,1,1,1,1,1,1)                        #Standardabweichung
errors.V2 = c()

#Grafik
par(family="serif",oma=c(0,1,0,0),mgp=c(2.9,1,0),mar=c(4,4.9,1,1),cex.lab=1.1,cex=1.2)
plot(rounds,global_shortest_path_average,type="n",
     xlim=c(50,2100),
     ylim=c(400,700),
     xlab=expression(paste("rounds"," / ", a.u.)),
     ylab=expression(paste("<shortest path>"," / ", a.u.)),
   
)
y.errorbars.V1 <- function(rounds,global_shortest_path_average.V1,errors.V1,ebl=0.02){arrows(rounds,global_shortest_path_average.V1-errors.V1,rounds,global_shortest_path_average.V1+errors.V1,code=3,angle=90,length=ebl)}
y.errorbars.V1(rounds,global_shortest_path_average.V1,errors.V2)
y.errorbars.V2 <- function(rounds,global_shortest_path_average.V2,errors.V2,ebl=0.02){arrows(rounds,global_shortest_path_average.V2-errors,rounds,global_shortest_path_average.V2+errors.V2,code=3,angle=90,length=ebl)}
y.errorbars.V2(rounds,global_shortest_path_average.V2,errors.V2)
points(rounds,global_shortest_path_average.V1,cex=1,pc=21,bg="white")
points(rounds,global_shortest_path_average.V2,cex=1,pc=21,bg="red")

legend(1600,680,c(expression(paste(alpha," = ",0.1)),expression(paste(beta," = ",2)),expression(paste(no_agents," = ",10)),expression(paste(q0," = ",0.9)),expression(paste(tau_init," = ",0.1)),expression(paste(L_nn," = ",513.61))))


#dev.copy2pdf(file="rounds_vs_shortestpath.pdf",height=7,width=12)