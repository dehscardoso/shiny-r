# Load R packages
library(shiny)
library(shinythemes)


  # Define UI
  ui <- fluidPage(theme = shinytheme("superhero"),
    navbarPage(
      "My first app",
      tabPanel("Navbar 1",
               sidebarPanel(
                 tags$h3("Input:"),
                 textInput("txt1", "First Name:", ""), # txt 1, txt2 will be sent to the server
                 textInput("txt2", "Last Name:", ""),
                 
               ), # sidebarPanel
               mainPanel(
                            h2("Hello (:"),
                            
                            h4("Output"),
                            verbatimTextOutput("txtout"), # txtout is generated from the server

               ) # mainPanel
               
      ), # Navbar 1, tabPanel
      tabPanel("Navbar 2", "This panel is intentionally left blank (:"),
      tabPanel("Navbar 3", "This panel is intentionally left blank too (:")
  
    ) # navbarPage
  ) # fluidPage

  
  # Define server function  
  server <- function(input, output) {
    
    output$txtout <- renderText({
      paste( input$txt1, input$txt2, sep = " " )
    })
  } # server
  

  # Create Shiny object
  shinyApp(ui = ui, server = server)