df2010 <- read.csv("https://s3.us-east-2.amazonaws.com/nanfang/BP+Apprehensions+2010.csv")
dMat2010 <- gsub(",", "", as.matrix(df2010[1:9,2:13]))
storage.mode(dMat2010) <- "numeric"
df2017 <- read.csv("https://s3.us-east-2.amazonaws.com/nanfang/PB+Apprehensions+2017.csv")
dMat2017 <- gsub(",", "", as.matrix(df2017[1:9,2:13]))
storage.mode(dMat2017) <- "numeric"


fluidPage(
  titlePanel("US Border Apprehensions Showroom"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "n_month",
                  label = "Bandwidth adjustment:",
                  min = 1, max = 72, value = 1, step = 1)
      #selectInput("year", "Year:", 
      #            choices=c(2010, 2017)),
      #selectInput("sector", "Sector:", 
      #            choices= df2010$Sector)
    ),
    plotOutput("main_plot")
  )
  
  
  
  
)