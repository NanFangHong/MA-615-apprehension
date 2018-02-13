function(input, output) {
  
  filedata <- reactive({
    infile <- input$datafile
    if (is.null(infile)) {
      # User has not uploaded a file yet
      return(NULL)
    }
    read.csv(infile$datapath)
  })
  
  output$main_plot <- renderPlot({

    if (is.null(filedata()))
      return(NULL)
    
    ts2 <- filedata()
    ts4 <- ts2[2:13]
    ts5 <- rev(as.vector(t(rev(ts4))))
    n <- length(ts5)
    ts6 <- sapply(1:(n - input$n_month + 1), function(i) mean(ts5[i:(i+input$n_month-1)]))
    ts5 <- ts(ts6, start = c(2000,10), frequency=12)
    ts.plot(ts5, gpars=list(xlab="year", ylab="Apprehensions", lty=c(1:3)), main = "Historical Apprehension data from 2000 to 2017")
  
    
    
  })
  
  
}