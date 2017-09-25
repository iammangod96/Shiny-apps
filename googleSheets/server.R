library(shiny)
library(DT)
library("googlesheets")

gs_auth(new_user = FALSE, gs_auth(token = "ttt.rds"))         

shinyServer(function(input,output){
  
  mydata <- reactive({
    #loading dataset
    invalidateLater(10000)
    gs_ls()
    be <- gs_title("dydata")
    iris1 <- gs_read(ss = be)  
    iris1
  })
  
  
  output$table1 <- renderDataTable({
    datatable(mydata())
  })
  
  
  output$plot1 <- renderPlot({
    iris1 <- mydata()
    plot(iris1$X,iris1$Y)
    })
  
})