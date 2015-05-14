library(shiny)

shinyUI (pageWithSidebar(
     headerPanel("Predict your child's adult height"),
     sidebarPanel(
          numericInput(inputId="inp1", label = "Please enter the Mother's height in cm",""),
          numericInput(inputId="inp2", label = "Please enter the Father's height in cm", ""),
          radioButtons(inputId="gen", label="Please select the child's Gender:", c("Boy"="Boy", "Girl"="Girl")),
          actionButton("goButton", "Calculate"),
          
          p(''),
          p("This App is based on a linear regression prediction model calculated using the data from the famous study of Francis Galton (1886). http://galton.org/essays/1880-1889/galton-1886-jaigi-regression-stature.pdf"),
          p(''),
          p('This App is also an assignment for the Course Developing Data Products from the Data Science Specialization from Coursera and John Hopkins University')
          
          ),
          mainPanel (
               textOutput('gen'),
               tableOutput( 'out')
          )
     ))
