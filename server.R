library(shiny)

shinyServer(function(input, output) {

     output$inp1 <- renderText({input$inp1})
     output$inp2 <- renderText({input$inp2})
     output$gen <- renderText({
          input$goButton
          isolate(paste("Predicted adult height of a ", input$gen," child:"))
          })

output$out <- renderTable({
               
               if (input$goButton == 0)
                    return()
               
               input$goButton
               
               isolate({
                    library(UsingR)    
                    galtoncm <- galton*2.54                         
                    galtoncm.lm <- lm(child ~ parent, data=galtoncm)  
                    father<- input$inp2
                    mother<- input$inp1
                    midp<-(father+1.08*mother)/2
                    nd <- data.frame(parent=midp)
                    predchild<-predict(galtoncm.lm, newdata=nd, interval="prediction") 
                    genadj<-ifelse((input$gen == "Girl") ,1.08,1)
                    out<-isolate(predchild/genadj)
                    row.names(out)<-'Height in cm'
                    colnames(out)<- (c("Most probably the height of yout child will be around:"
                        , "With a 95% confidence your child will be taller than:","and smaller than:"))
                    out.T <- t(out)
                    out.T
                    })  
    })
})
