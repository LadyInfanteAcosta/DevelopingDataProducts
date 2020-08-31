#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(data.table)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Arrests in USA"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            selectInput("Type_of_Crimes", "Type of crime:",
                        c("Assault","Murder","Rape")),
            
            sliderInput("Top",
                        "Display Top:",
                        min = 5,
                        max = 50,
                        value = 20,
                        step = 5),
            
            selectInput("Sort", "Sort by:",
                        c("Highest rates","Lowest rates")),
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h3("Number of arrests per 100,000 by State"),
            plotlyOutput("Plot")
        )
    )
))
