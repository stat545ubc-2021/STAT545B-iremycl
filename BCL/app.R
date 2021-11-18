library(shiny)
library(tidyverse)
bcl <- read.csv("bcl-data.csv")
options(shiny.autoreload = TRUE)
max_price <- max(bcl$Price, na.rm = TRUE) #You can use this inside the sliderinput function instead of 200.

# Define UI for application that draws a histogram. The output of FluidPage is HTML.
ui <- fluidPage( #Add as many arguments as you wish.
    #fileInput to allow user to upload their own data, needs more work to specify the columns etc.
    plotOutput(outputId = "my_plot"), #Put a blank space on html page to put the plot. You open up a slot named my_plot, then you need to fill it, inside the server function below.
    sliderInput(inputId = "my_slider", label = "Select a price range", min = 0, max = 200, value = c(10,30)) #Open up something "blank" AND put the slider in, so has more arguments. Value is a vector with 2 values since it is a range.

)

# Define server logic required to draw a histogram
server <- function(input, output) { #Has to be wrapped in special function, eg renderPlot
    output$my_plot <- renderPlot( #This whole code chunk is rerun with updated slider values.
        bcl %>%
            filter(Price < input$my_slider[2],
                   Price > input$my_slider[1]) %>%
        ggplot( aes(Alcohol_Content)) +
            geom_histogram()
    )
}

# Run the application
shinyApp(ui = ui, server = server)
