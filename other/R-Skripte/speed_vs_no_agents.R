#Plot speed vs. no_agents

#Mass für 'speed': Falls die kürzeste Tour 3x hintereinander erreicht
#wurde gilt sie als gefunden.
#Es wird die Anzahl benötigte Runden ermittelt um dies zu erreichen.
#Gemittelt über 10 runs. Mittlere Rundenanzahl und minimale Rundenanzahl geplottet

agents <- c(5,10,15,20,25,30,35,40,45,50)
rounds_needed_average <- c(4977.4,3445.5,1237.7,912.3,751.4,1319.7,1996.5,1282,2157.1,3129.2)
min_rounds_needed <- c(862,274,207,157,129,90,118,85,207,102)
errors <- c(6188.8,3266.8,1033.7,705.3459,756.9026,1657.6,2121.6,1204.6,2837.9,3280.3)
#Grafik
par(family="serif",oma=c(0,1,0,0),mgp=c(2.9,1,0),mar=c(4,4.9,1,1),cex.lab=1.1,cex=1.1)
plot(agents,rounds_needed_average,,type="n",
     xlim=c(0,50),
     ylim=c(0,6000),
     xlab=expression(paste(agents)),
     ylab=expression(paste("<rounds needed>"," / ", a.u.)),
     
)

y.errorbars <- function(agents,rounds_needed_average,errors,ebl=0.02){arrows(agents,rounds_needed_average-errors,agents,rounds_needed_average+errors,code=3,angle=90,length=ebl)}
y.errorbars(agents,rounds_needed_average,errors)

#legend(0.8,430,c(expression(paste("city"," = ","oliver30")),expression(paste(beta," = ",2)),expression(paste(q0," = ",0.9)),expression(paste(tau_init," = ",0.1)))))
#arrows(0.2,410,0.2,430,length=0.1,angle=30)
#text(0.2,450,expression(paste(rounds_needed_average[optimized])))
#arrows(-1,432.5827,0.2,432.5827,length=0,lty=2)
#arrows(0.2,320,0.2,432.5827,length=0,lty=2)
legend(30,6000,pch=c(21,22),pt.bg=c("white","red"),c("<rounds needed>","minimal round achived"),bty="n")
points(agents,rounds_needed_average,cex=0.8,pc=21,bg="white")
points(agents,min_rounds_needed,cex=0.8,pc=22,bg="red")

dev.copy2pdf(file="rounds_needed_average_vs_shortestpath.pdf",height=7,width=12)