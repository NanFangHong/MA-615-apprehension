df2010 <- read.csv("https://s3.us-east-2.amazonaws.com/nanfang/BP+Apprehensions+2010.csv")

bootstrapPage(
  
  selectInput(inputId = "graphSelection",
              label = "Choose a graph:",
              choices = c('Historical Time Series', '2010 vs. 2017 Data'),
              selected = 'Historical Time Series'),
  # Display this only if the input.graphSelection == 'Historical Time Series'
  conditionalPanel(condition = "input.graphSelection == 'Historical Time Series'",
                   sliderInput(inputId = "n_month",
                               label = "Bandwidth adjustment:",
                               min = 1, max = 72, value = 1, step = 1)
  ),
  # Display this only if the input.graphSelection == '2010 vs. 2017 Data'
  conditionalPanel(condition = "input.graphSelection == '2010 vs. 2017 Data'",
                   selectInput("year", "Year:", choices=c(2010, 2017)),
                   selectInput("sector", "Sector:", choices= c('Big Bend', 
                                                               'Del Rio',
                                                               'El Centro',
                                                               'El Paso',
                                                               'Laredo',
                                                               'Rio Grande Valley',
                                                               'San Diego',
                                                               'Tucson',
                                                               'Yuma'))
  ),
  
  plotOutput(outputId = "main_plot", height = "400px")
  
  
  
  
)
