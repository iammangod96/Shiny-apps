#loading libraries
library(shiny)
library(shinythemes)
library(DT)
library(data.table)
library("googlesheets")


setwd("E://shinyapps/googleSheets")
#loading dataset
gs_ls()
be <- gs_title("dydata")
iris1 <- gs_read(ss = be)  
iris <- read.csv("data/IRIS.csv", header = FALSE)
iris <- subset(iris, select = -c(2,4,6,8))
colnames(iris) <- c("Sepal_length", "Sepal_width", "Petal_length", "Petal_width", "Species")


#shinyUI
shinyUI(fluidPage(theme = shinytheme("cosmo"),
  navbarPage("IRIS DATASET"),
  sidebarLayout(
    sidebarPanel(
      p("This app will allow you to visualise",span("simple linear regressions", style="color:red")," between different variables."),
      selectInput("select1",strong("Variable X :"), names(iris[,-5])),
      selectInput("select2",strong("Variable Y :"), names(iris[,-5])),
      numericInput("selectOrder", strong("Regression order :"), 1,min = 1, max = 10)
    ),
    mainPanel(
      plotOutput("plot1"),
      hr(),
      dataTableOutput("table1")
    )
  )
))
