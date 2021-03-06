library(mosaicData)

datasets <- list("Galton" = Galton, "KidsFeet" = KidsFeet,  "Heightweight" = Heightweight,
                     "SwimRecords" = SwimRecords, "TenMileRace" = TenMileRace)
choice_lst1 <- list("Constant" = 1, "x" = 2, "x^2" = 3, "x^3" = 4, "log(x)" = 5, "exp(kx)" = 6, 
                "sin(2Pi*x/P)" = 12, "cos(2Pi*x/P)" = 13)
choice_lst2 <- list( "pnorm1(mu1, sd)" = 7, "pnorm2(mu2, sd)" = 8,
                 "pnorm3(mu3, sd)" = 9,"pnorm4(mu4, sd)" = 10,"pnorm5(mu5, sd)" = 11 )

f = list()
f[[1]] = function(x,...) rep.int(1, length(x))
f[[2]] = function(x,...) x
f[[3]] = function(x,...) x^2
f[[4]] = function(x,...) x^3
f[[5]] = function(x,...) log(abs(x)+.000001)

f[[6]] = function(x, k, ...) exp(k*x)
f[[7]] = function(x, mu, sd, ...) pnorm(q = x, mean = mu, sd = sd)
f[[8]] = function(x, mu, sd, ...) pnorm(q = x, mean = mu, sd = sd)
f[[9]] = function(x, mu, sd, ...) pnorm(q = x, mean = mu, sd = sd)
f[[10]] = function(x, mu, sd, ...) pnorm(q = x, mean = mu, sd = sd)
f[[11]] = function(x, mu, sd, ...) pnorm(q = x, mean = mu, sd = sd)

# The sines and cosines MUST go at the end since they are duplicated with a slider
f[[12]] = function(x, P, n, ...){
  res = matrix(0,nrow=length(x),ncol=n)
  for(j in 1:n) {res[,j] = sin(2*j*pi*x/P)}
  return(res)
}
f[[13]] = function(x, P, n, ...){
  res = matrix(0,nrow=length(x),ncol=n)
  for(j in 1:n) {res[,j] = cos(2*j*pi*x/P)}
   return(res)
}


