myFun <- function(mu=mu, sigma=sigma, n=n)
{ #set.seed(seed)
  samp <- rnorm(n,mean=mu,sd=sigma)
  mu0 <-5
  x.bar <- mean(samp)
  margin <- qt(0.975,df=n-1)*sd(samp)/sqrt(n)
  low <- x.bar-margin
  high <- x.bar+margin
  t.stat <- (x.bar-mu0)*sqrt(n)/sd(samp)
  p.value <- round(2*(1-pt(abs(t.stat),df=n-1)),3)
  hist=histogram(samp,ylab="Density", type="density",
            xlim=c(0,10),xaxt="n",xlab="",
            main="Power of a Hypothesis (t) Test",
            sub=paste("P-value = ",p.value),
            col=rgb(0,.5,.9,.7),
            panel=function(x,...){
              panel.histogram(x,...)
              #panel.densityplot(x, col="orange")
              llines(x=c(low,high), y=c(0,0), col="red", lwd=10)
              lpoints(x=x.bar, y=0, col="green", cex=1.3, pch=19)
              grid.text(label=expression(mu), x=unit(x.bar,"native"), y=unit(.1, "npc"))
              lpoints(x=mu0, y=0, col="black", cex=1.3, pch=19)
              grid.text(label=expression(mu[0]==5), x=unit(mu0,"native"), y=unit(.03, "npc"))
            })
  print(hist)
}