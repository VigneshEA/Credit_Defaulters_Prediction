Test data
=============================
  
  ### Test data
  
```{r}
test_file <- reactive({
  inFile <- input$file1
  #proxy <- dataTableProxy('dataTable')
  if (is.null(inFile))
    return(NULL)
  
  csv_f <- read.csv(inFile$datapath, header = input$header)
  View(csv_f)
  return(csv_f)
})

renderTable({
  as.data.frame(test_file())
})


```

library(rmarkdown)
rmarkdown::render_site()



Sidebar {.sidebar}
=====================================
  
  ```{r}

fileInput("file1", "Upload Test File as csv",
          accept = c(
            "text/csv",
            "text/comma-separated-values,text/plain",
            ".csv")
)

checkboxInput("header", "Header", TRUE)
```

install.packages("htmlwidgets")




Test
========================================
  
  ```{r}
shinyApp(
  ui = fillPage(
    fillCol(flex = c(NA, 1), 
            inputPanel(
              fileInput("file1", "Upload Test File as csv",
                        accept = c(
                          "text/csv",
                          "text/comma-separated-values,text/plain",
                          ".csv")),
              checkboxInput("header", "Header", TRUE)
            ),
            tableOutput("Plot")
    )
  ),
  server = function(input, output) {
    test_file <- reactive({
      inFile <- input$file1
      
      if (is.null(inFile))
        return(NULL)
      
      csv_f <- read.csv(inFile$datapath, header = input$header)
      View(csv_f)
      return(csv_f)
    })
    output$Plot <- renderTable({
      as.data.frame(test_file())
    })
  },
  options = list(height = 600)
)
```