function(input, output) {
  
  filedata <- read.csv('https://s3.us-east-2.amazonaws.com/nanfang/PB+monthly+summaries.csv')
  
    output$main_plot <- renderPlot({
      ts2 <- filedata
      ts4 <- ts2[2:13]
      ts5 <- rev(as.vector(t(rev(ts4))))
      n <- length(ts5)
      ts6 <- sapply(1:(n - input$n_month + 1), function(i) mean(ts5[i:(i+input$n_month-1)]))
      ts5 <- ts(ts6, start = c(2000,10), frequency=12)
      ts.plot(ts5, gpars=list(xlab="year", ylab="Apprehensions", lty=c(1:3)), main = "Historical Apprehension data from 2000 to 2017")
    })
  
  
  

  
  
}