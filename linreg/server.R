library(shiny)
library(DT)

#loading dataset
iris <- read.csv("data/IRIS.csv", header = FALSE)
iris <- subset(iris, select = -c(2,4,6,8))
colnames(iris) <- c("Sepal_length", "Sepal_width", "Petal_length", "Petal_width", "Species")


shinyServer(function(input,output){
  output$table1 <- renderDataTable({
    datatable(iris[,c(input$select1, input$select2)])
  })
  
  
  
  output$plot1 <- renderPlot({
    plot(iris[,input$select1], iris[,input$select2], 
         xlab = input$select1, ylab = input$select2, main="IRIS", 
         col="red", cex = 1.5, col.lab="blue", pch=19)
    lm_model <- lm(iris[,input$select2] ~ poly((iris[,input$select1]),(input$selectOrder), raw=F ))
    lines(sort(iris[,input$select1]),fitted(lm_model)[order(iris[,input$select1])], col="green", type="l", pch=19,lwd=2)
  })
})