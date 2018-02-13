


fluidPage(
  titlePanel("US Border Apprehensions Showroom"),
  sidebarLayout(
    sidebarPanel(
      fileInput('datafile', 'PB monthly summaries.csv',
                accept = c(
                  'text/csv',
                  'text/comma-separated-values',
                  'text/tab-separated-values',
                  'text/plain',
                  '.csv',
                  '.tsv'
                )
      ),
      sliderInput(inputId = "n_month",
                  label = "Bandwidth adjustment:",
                  min = 1, max = 72, value = 1, step = 1)
    ),
    
      plotOutput("main_plot", height = "500px")
    
  )
)