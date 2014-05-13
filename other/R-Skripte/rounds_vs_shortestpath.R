#Plot rounds vs. global_shortest_path_average für eil51

#Version 1 und 2, ungerundet(V1&V2), gerundet(V3), neues tau

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
global_shortest_path_average.V1 = c(507.3012,459.8245,447.2501,441.1628,439.9362,439.8524,438.3222, 435.6396,434.1927, 433.4670)#431.4123 (Wert für rounds=4000)
global_shortest_path_average.V2 = c(505.4319,460.0544,442.8916,442.4961,439.4602,436.5999,436.5504,435.9685, 434.4450,433.6548)#431.1795 (Wert für rounds=4000)
global_shortest_path_average.V3 = c(467.2000,455, 453.4000,449.2000,444.6000, 445.7000,441.8000,445.5000,443,446.2000) #konvergiert nur anfangs schnell und bleibt konstant:(

errors.V1 = c(10.4641,8.8395,4.8312,6.1660,3.3879,2.9796,3.3960,3.3416,2.6631,2.8202)     #1.8570     (4000)              #Standardabweichung
errors.V2 = c(10.7538,8.7496,6.1061,6.9268,3.9622,3.2160,2.7375,3.0823, 2.5062,3.1934)   #2.0224  (4000)
errors.V3 = c(8.3772,9.3690,6.6700,10.6228,6.8508,9.3696, 6.8767,6.3988,10.7083,8.5088)
min_global_shortest_path_average.V1 = c(487.4028,442.3497,442.7367,432.3335,434.8084, 436.0793, 434.7726, 431.2449,429.7371, 429.5303,429.4841)
min_global_shortest_path_average.V2 = c(482.4596, 446.6279,434.8789,431.3724,433.2166,431.9794,431.9479,431.3109, 430.3957,429.5303,428.8718)
min_global_shortest_path_average.V3 = c(459,440,446,431,435,433,431,433,429,435)

#Grafik
par(family="serif",oma=c(0,1,0,0),mgp=c(2.9,1,0),mar=c(4,4.9,1,1),cex.lab=1.1,cex=1.1)
plot(rounds,global_shortest_path_average.V1,type="n",
     xlim=c(150,2050),
     ylim=c(420,520),
     xlab=expression(paste("rounds")),
     ylab=expression(paste("<shortest path>"," / ", a.u.)),
   
)
y.errorbars.V1 <- function(rounds,global_shortest_path_average.V1,errors.V1,ebl=0.02){arrows(rounds,global_shortest_path_average.V1-errors.V1,rounds,global_shortest_path_average.V1+errors.V1,code=3,angle=90,length=ebl)}
y.errorbars.V1(rounds,global_shortest_path_average.V1,errors.V1)

y.errorbars.V2 <- function(rounds,global_shortest_path_average.V2,errors.V2,ebl=0.02){arrows(rounds,global_shortest_path_average.V2-errors.V2,rounds,global_shortest_path_average.V2+errors.V2,code=3,angle=90,length=ebl)}
y.errorbars.V2(rounds,global_shortest_path_average.V2,errors.V2)

y.errorbars.V3 <- function(rounds,global_shortest_path_average.V3,errors.V3,ebl=0.02){arrows(rounds,global_shortest_path_average.V3-errors.V3,rounds,global_shortest_path_average.V3+errors.V3,code=3,angle=90,length=ebl)}
y.errorbars.V3(rounds,global_shortest_path_average.V3,errors.V3)

abline(h=429,lty=2)
abline(h=433.87, lty=3)
legend(1400,520,pch=c(21,22,23),pt.bg=c("white","red","green"),c("Model from [1]","Model modified",expression(paste(tau(r,u),"  modified"))),bty="n")
legend(1200,490,lty=c(3,2),c("ACS Average from [1]","ACS best result from [1]"),bty="n")

points(rounds,global_shortest_path_average.V1,cex=1,pc=22,bg="red")
points(rounds,global_shortest_path_average.V2,cex=1,pc=21,bg="white")
points(rounds,global_shortest_path_average.V3,cex=1,pc=23,bg="green")

#legend(1600,550,c(expression(paste(alpha," = ",0.1)),expression(paste(beta," = ",2)),expression(paste(no_agents," = ",10)),expression(paste(q0," = ",0.9)),expression(paste(tau_init," = ",0.1)),expression(paste(L_nn," = ",513.61))))


#dev.copy2pdf(file="rounds_vs_shortestpath_eil.pdf",height=7,width=12)