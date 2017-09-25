library(shiny)
library(DT)

iris <- read.csv("data/iris.data", header = F)
colnames(iris) <- c('Sepal_length','Sepal_width','Petal_length','Petal_width','Species')

shinyUI(fluidPage(
  
  title = 'Requirement',
  h1('IRIS'),
  
  fluidRow(
    column(6, dataTableOutput('tableold')),
    column(6, dataTableOutput('tablenew'))
  )
  
))