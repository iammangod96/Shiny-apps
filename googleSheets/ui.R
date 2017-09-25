#loading libraries
library(shiny)
library(DT)
library("googlesheets")
library(rsconnect)

#shinyUI
shinyUI(fluidPage(
  navbarPage("Google sheets data"),
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      plotOutput("plot1"),
      dataTableOutput("table1")
    )
  )
))
