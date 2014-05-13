#Plot tauinit vs. global_shortest_path_average

#Version2, gerundet, altes tau
# alpha = 0.1;
# no_agents = 10;     							
# rounds = 1200										
# start_city = 1;										
# q0 = 0.9;
# tau_init = 0.1;                               

rm(list = ls())

tauinit = c(0.0005, 0.001, 0.002, 0.006, 0.008, 0.02, 0.04, 0.06, 0.08, 0.2, 0.4, 0.6, 0.8, 1, 4, 8, 10, 40, 80, 100)
shortest_path_average = c(432.8000, 433.6000, 432.4000, 435.7000, 435.3000, 432.9000, 431.6000, 433.2000, 433.1000,  431.3000, 433.5000, 432.9000, 434.8000, 435.2000, 431.7000, 432.7000, 432.3000, 434.9000, 432.7000, 434.4000)
error_shortest_path = c(3.6454, 3.7771, 3.6271, 3.4010, 3.0569, 3.6040, 4.0607, 3.0478, 3.5730, 4.0014, 3.8079, 4.9542, 5.2239, 1.7512, 3.1287, 3.7727, 4.2701, 3.1780, 5.9264, 2.9136)
#Grafik
par(family="serif", mfrow=c(1,1), oma=c(0,1,0,0), mgp=c(2.9,1,0),mar=c(4,4.9,1,1),cex.lab=1.2,cex=1.2)
plot(tauinit,shortest_path_average,type="n", ,axes=F, frame.plot=T,
     xlim=c(0.0004,100), log = 'x',
     ylim=c(425,440),
     xlab=expression(paste(tau[start]," / ", a.u.)),
     ylab=expression(paste("<shortest path>"," / ", a.u.)),
     
)
#Logskala
beschriftung = c(-4, -3, -2, -1, 0, 1, 2)
intervalle.lab = c(10^(-4:2))
intervalle<-c((1:9)*10^-4, (1:9)*10^-3, (1:9)*10^-2, (1:9)*10^-1, (1:9), (1:10*10))
axis(side = 1, at=intervalle, tcl = -0.25, labels = F) #Kleine Striche
axis(side = 1, at=intervalle.lab, labels = paste(beschriftung)) #Grosse Striche und labels
axis(2)

y.errorbars <- function(tauinit,shortest_path_average,error_shortest_path,ebl=0.02){arrows(tauinit,shortest_path_average-error_shortest_path,tauinit,shortest_path_average+error_shortest_path,code=3,angle=90,length=ebl)}
y.errorbars(tauinit,shortest_path_average,error_shortest_path)

points(tauinit,shortest_path_average,cex=1,pc=21,bg="white")

#legend(0.001,428,c(expression(paste(alpha," = ",0.1)),expression(paste(rounds," = ","1200")),expression(paste(no_agents," = ",10)),expression(paste(q0," = ",0.9)),expression(paste(tau_init," = ",0.1)),expression(paste(L_nn," = ",513.61))))
#legend(1,424, expression(paste("problem 'eil51'")))
dev.copy2pdf(file="tauinit_vs_shortestpath.pdf",height=7,width=12)