library(shiny)
library(shinydashboard)

ui <- dashboardPage(
  
  dashboardHeader(title = "Requirement"),
  dashboardSidebar(),
  dashboardBody(
    fluidPage(
      fluidRow(
        box(
          title = "Iris",
          dataTableOutput(outputId = "text")
        )
      )
    )
  )
)

server <- function(input,output){
  iris <- read.csv("E:/shinyapps/venky/data/IRIS.csv", header = FALSE)
  iris <- subset(iris, select = -c(2,4,6,8,5,7,9))
  colnames(iris) <- c("Sepal_length", "Sepal_width")
  
  iris_len <- sum(iris$Sepal_length < 5.5)
  iris_wi <- sum(iris$Sepal_width < 4)
  iris_table <- data.frame(x = iris_len, y = iris_wi)
  iris_len <- sum(iris$Sepal.Length<5.5)
  iris_w <- sum(iris$Sepal.Width<4)
  output$text <- renderDataTable({
    data.frame(x=iris_len,y=iris_w)
  })
  # observe({
  #   click <- input$map_marker_click
  # })
}
shinyApp(ui = ui , server = server)