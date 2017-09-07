library(shiny)
suppressMessages(library(UsingR))
data("father.son")

shinyServer(function(input, output) {
        model <- lm(sheight ~ fheight, data = father.son)
     
        modelpred <- reactive({
                hInput <- input$sliderHeight
                predict(model, newdata = data.frame(fheight = hInput))
        })
        
       output$plot1 <- renderPlot({
                
               hInput <- input$sliderHeight
                
               plot(father.son$fheight, father.son$sheight, xlab = "Father's height", 
                     ylab = "Son's height", bty = "n", pch = 16,
                     xlim = c(40, 90), ylim = c(40, 90))
                
                if(input$showModel){
                        abline(model, col = "red", lwd = 2)
                }
                
                points(hInput, modelpred(), col = "red", pch = 16, cex = 2)
               
        })
        
        output$pred <- renderText({
                modelpred()
        })
        
})
        