
library(shiny)
library(ggplot2)

#each application has same skeleton, this is what we see below 

# GUI 
#fluidpage --> if have browser and try to resize, it will automatically resize what is in your browser 
#check online cheat sheet 

ui <- fluidPage(
  titlePanel("Diamonds Data"),
  sidebarLayout(
    sidebarPanel(
      helpText("This app is to visualize diamonds dataset"),
      textInput(inputId = "title", 
                label = "Chart title", 
                value = ""),
      selectInput(inputId = "pos",
                  label = "Position",
                  choices = list("stack", "dodge"),
                  selected = "stack")
      
      
    ),
    mainPanel(
      plotOutput(outputId = "plot")
    )
  )
)#in the sidebar, we wanted the helptext to tell what app is about. not interacting with title so don't need ID
#need input id 

#if have sidebarpanel, must also have main panel
#specify outputId. #inputId is R variable name
#for every single object or widget or output you are going to create, make sure there is an ID 
# Server 

server <- function(input, output){
  
  output$plot = renderPlot({
    ggplot(diamonds, aes(x = cut, fill = clarity))+
      geom_bar(position = input$pos)+
      ggtitle(input$title)
    
  })
  #here use {} because using more than 1 line of code 
}
##Here, server takes input and output always. title and plot are in input and output list
##We need to render anything that we want to output
##should be rendered and sent back to gui
##when we render, we need to assign it to where we are putting it. we want to put render plot in main panel
#give it the name of that area but it is part of output. 

#notice, server between curly brackets. already a function, give it an argument 
#fluidpage use (), defining new function 
# Run the App
shinyApp(ui, server)
#code to run the app






#remember to close! 

#in fluid page can write   h1("I am header 1"), h2("I am header 2")



