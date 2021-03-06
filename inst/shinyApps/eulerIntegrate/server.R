library(shiny)
library(mosaic)
library(lattice)
library(grid)


# tryCatch(.mEulerIntegrate.core(), 
#           error=function(e){ 
#             stop(paste(e,"Need newer version of RStudio", collapse="\n"))
#           })

trajectory <<- reactiveValues(
  one = list(x = 0.5, t = 0), # see ui.r "xval0" for the initial value of x
  two = list(x = 0.5, t = 0),
  three = list(x = 0.5, t = 0)
) # this was "foo" in Andrew Rich's original manipulate program


shinyServer(
  function(input, output, session){
    dyn_fun <- reactive({
      dynfunname <- input$dynfun
# TO DO: PUT BACK THIS EDITING FUNCTIONALITY.  WILL NEED AN EDITABLE TEXT INPUT      
      
#       if (input$editfun ){
#         if( dynfunname=="linear" ) exponential <<- edit(exponential)
#         if( dynfunname=="logistic") logistic <<- edit(logistic)
#         if( dynfunname=="Gompertz") gompertz <<- edit(gompertz)
#         if( dynfunname=="Newton Cooling") cooling <<- edit(cooling)
#         if( dynfunname=="cows") cows <<- edit(cows)
#         if( dynfunname=="pills") pills <<- edit(pills)
#       }
      if( dynfunname=="linear" ) dynfun <- exponential
      if( dynfunname=="logistic") dynfun <- logistic
      if( dynfunname=="gompertz") dynfun <- gompertz
      if( dynfunname=="Newton Cooling") dynfun <- cooling
      if( dynfunname=="cows") dynfun <- cows
      if( dynfunname=="pills") dynfun <- pills
      
      return (dynfun)
    }) 
    
    # start the trajectory over again, from the indicated origin value for x
    observeEvent(input$restart,{ 
#      browser()
      trajectory$one <<- list(x=input$xval0, t=0) #trajectory is the reactive value
    })

    # ======================================
    
    observeEvent(input$ntraj, {
      #browser()
      if(input$ntraj == "1"){
        traj_now <<- trajectory$one
      }
      if(input$ntraj == "2"){
        traj_now <<- trajectory$two
      }
      if(input$ntraj == "3"){
        traj_now <<- trajectory$three
      }
      
    })
    
    
    # =======================================
    # Calculates nstep more points in the trajectory
    observeEvent(input$go, {
      dynfun <- dyn_fun()
      dt <- isolate(input$dt)
      for (k in 1:isolate(input$nsteps) ) {
        npts = length(traj_now$x)
        traj_now$t[npts+1] <<- traj_now$t[npts] + dt
        traj_now$x[npts+1] <<- traj_now$x[npts] + dt*dynfun(traj_now$x[npts],traj_now$t[npts])
      }
    })
    
    # ================================
    # Calculate the equilibria
    # Plot them as needed in the renderPlot()
    equilibria_locations <- reactive({
      dynfun <- dyn_fun()
      input$showeq
      return(c(0, .5, .7))
      ..thisfun <<- function(x){dynfun(x,0)}
      eqs = findZeros( ..thisfun(x)~x, xlim=c(xmin,xmax))
      # Hand this off to geom_hline()
    })
    
    
    
    
    #================================
    draw.state <- reactive({
      npts = length(traj_now$x)
      dynfun <- dyn_fun()
      #Figure out the time and x-scale
      tmin = 0
      tmax = pmax(10, max(1.2*traj_now$t + input$dt*input$nsteps))
      xmax = pmax(1.2, max(1.2*traj_now$x) )
      xmin = pmin(0, min(traj_now$x))
      # make the min of the frame a little bit below the trajectory
      xmin <- xmin - 0.1*(xmax-xmin)

      p <- ggplot(data = as.data.frame(traj_now), aes(x=t, y=x)) + ylab("State x") + xlab("Time t") + geom_point() + geom_line() + xlim(tmin,tmax) +
        ylim(xmin,xmax)
    
      # draw the integration line (the black line showing which way the next step will go)
      if( npts > 1 ) { # There is a trajectory
        slope = dynfun(traj_now$x[npts-1],traj_now$t[npts-1])
        p <- p + geom_segment(x = traj_now$t[npts-1] - 3, xend = traj_now$t[npts-1] + 3 , 
                              y = traj_now$x[npts-1] - 3*slope , yend = traj_now$x[npts-1] + 3*slope, col = "black")
      }
 
    })
    

   #============================================================== 
    output$graph <- renderPlot({
      p <- draw.state()
      # Show the equilibria values
      if (input$showeq) {
        eq <- data.frame(x = equilibria_locations() )
        p <- p + geom_hline(data=eq, aes(yintercept=x)) # then do a geom_hline() with the values in eq
      }
      
      p
      
    })  

    
  }
  
)


