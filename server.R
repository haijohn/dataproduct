library(ggplot2)

mtcars$am = as.factor(mtcars$am)
mtcars$cyl = as.factor(mtcars$cyl)
mtcars$vs = as.factor(mtcars$vs)
mtcars$gear = as.factor(mtcars$gear)
mtcars$carb = as.factor(mtcars$carb)
shinyServer(function(input, output) { 
    output$plot <- renderPlot({
        g = ggplot(data=mtcars,aes_string(x=input$x,y='mpg'))    
        if(input$type == 'point'){
            g = g + geom_point(size=4, color='lightblue')
            if(input$smooth){
                g + geom_smooth()
            } else{
                g
            }
        }else if(input$type == 'box'){
            g + geom_boxplot()
        }        
    })
    output$plot2 <- renderPlot({
        g = ggplot(data=mtcars,aes_string(x=input$x2, y='mpg'))
        if(input$type2 == 'point'){
            g = g + geom_point(size=4,aes_string(color=input$z))
            if(input$smooth2){
                g + geom_smooth()
            } else{
                g
            }
        }else if(input$type2 == 'box'){
            g + geom_boxplot(aes_string(fill=input$z))
        }        
    })
    f = reactive({paste('mpg ~ ',paste(input$variable,collapse=' + '))})
    fit = reactive({lm(as.formula(f()), data=mtcars)})
    output$text <- renderPrint ({
        summary(fit())
    })
    output$table <- renderTable({
        head(mtcars)
    })
})
