#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(data.table)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$Plot <- renderPlotly({

        # import dataset
        
        BD=as.data.frame(USArrests)
        BD=cbind(State=rownames(BD),BD)
        rownames(BD)=1:nrow(BD)
        BD=as.data.table(BD)
        
        Type=input$Type_of_Crimes
       
        # display the plot
        if(input$Sort=='Highest rates'){
        BD_1=BD[order(BD[,get(Type)],decreasing=TRUE),]
        BD_1$State=factor(BD_1$State,levels=as.vector(unique(BD_1$State)))
        plot_ly(x=BD_1[1:input$Top,State],y=BD_1[1:input$Top,get(Type)],type="bar",marker=list(color="teal"))
        } else {
        BD_2=BD[order(BD[,get(Type)],decreasing=FALSE),]
        BD_2$State=factor(BD_2$State,levels=as.vector(unique(BD_2$State)))
        plot_ly(x=BD_2[1:input$Top,State],y=BD_2[1:input$Top,get(Type)],type="bar",marker=list(color="rainbow"))
        }
    
    })

})
