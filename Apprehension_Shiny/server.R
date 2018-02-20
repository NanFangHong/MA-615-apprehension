function(input, output) {
  df2010 <- read.csv("https://s3.us-east-2.amazonaws.com/nanfang/BP+Apprehensions+2010.csv")
  dMat2010 <- gsub(",", "", as.matrix(df2010[1:9,2:13]))
  storage.mode(dMat2010) <- "numeric"
  rownames(dMat2010) <- df2010$Sector
  df2017 <- read.csv("https://s3.us-east-2.amazonaws.com/nanfang/PB+Apprehensions+2017.csv")
  dMat2017 <- gsub(",", "", as.matrix(df2017[1:9,2:13]))
  storage.mode(dMat2017) <- "numeric"
  rownames(dMat2017) <- df2010$Sector
  filedata <- read.csv('https://s3.us-east-2.amazonaws.com/nanfang/PB+monthly+summaries.csv')
  
  
  output$main_plot <- renderPlot({
    
    if (input$graphSelection == 'Historical Time Series'){
      ts2 <- filedata
      ts4 <- ts2[2:13]
      ts5 <- rev(as.vector(t(rev(ts4))))
      n <- length(ts5)
      ts6 <- sapply(1:(n - input$n_month + 1), function(i) mean(ts5[i:(i+input$n_month-1)]))
      ts5 <- ts(ts6, start = c(2000,10), frequency=12)
      ts.plot(ts5, gpars=list(xlab="year", ylab="Apprehensions", lty=c(1:3)), main = "Historical Apprehension data from 2000 to 2017")
    }
    if (input$graphSelection == '2010 vs. 2017 Data'){
      if (input$year == 2010){
        barplot(dMat2010[(input$sector), ], main = paste('2010',input$sector, 'Monthly Apprehensions Data'))
      }
      if (input$year == 2017){
        barplot(dMat2017[(input$sector), ], main = paste('2017',input$sector, 'Monthly Apprehensions Data'))
      }
      
      
      
    }
    
    
  })
  
    
  
  
  

  
  
}