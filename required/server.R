library(shiny)
library(DT)

shinyServer(function(input, output) {
  
  iris <- read.csv("data/iris.data", header = F)
  colnames(iris) <- c('Sepal_length','Sepal_width','Petal_length','Petal_width','Species')
  
  table1 <- data.frame(x = c(nrow(iris[iris$Sepal_length < 5.5,])), y = c(nrow(iris[iris$Sepal_width < 2.9,])), z = c(nrow(iris[iris$Petal_length < 3.5,])))
  output$tableold = renderDataTable(table1,selection = list(target = 'column'))
  
  output$tablenew = renderDataTable({
    s = input$tableold_columns_selected
    if (length(s)) {
      iris[,s]
    }
  })
  
})