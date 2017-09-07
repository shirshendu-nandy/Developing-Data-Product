library(shiny)
shinyUI(fluidPage(
        titlePanel("Predict son's height from father's height"),
        sidebarLayout(
                sidebarPanel(
                        sliderInput("sliderHeight", "What is the height of the father?", 50, 80, value = 65),
                        checkboxInput("showModel", "Show/Hide Model", value = TRUE)
                             ),
                mainPanel(
                        plotOutput("plot1"),
                        h3("Predicted son's height from Model:"),
                        textOutput("pred")
                          )
        )
))