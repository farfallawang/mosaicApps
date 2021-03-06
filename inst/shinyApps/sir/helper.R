myFun <- reactive({
  
  # set up parameters  
  ndays = 100
  dt = 0.1
  N = 1000
  Iinit <- input$initialI
  p <- input$probInfect
  ncontact <- input$nContact
  gamma <- input$duration
  births <- input$birth
  
  npoints = ceiling( ndays/dt )
  
  # build models
  S <- rep(0, npoints)
  I <- rep(0, npoints)
  R <- rep(0, npoints)
  t <- rep(0, npoints)
  S[1] <- N - Iinit;
  I[1] <- Iinit;
  
  for (k in 2:npoints) {
    conversions <- p*(ncontact/N)*I[k-1]*S[k-1]
    dS <- -conversions + births
    dI <- conversions - gamma*I[k-1]
    dR <- gamma*I[k-1]
    S[k] <- S[k-1] + dt*dS
    I[k] <- I[k-1] + dt*dI
    R[k] <- R[k-1] + dt*dR
    t[k] <- t[k-1] + dt
  }
  
  return(data.frame(S=S, I=I, R=R, t=t))
  
})

