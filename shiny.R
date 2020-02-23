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
      withProgress({setProgress(message = "Getting Data...")
        inFile <- input$file1
        
        if (is.null(inFile))
          return(NULL)
        
        csv_f <- read.csv(inFile$datapath, header = input$header)
        #View(csv_f)
        return(csv_f)
      })
    })
    output$Plot <- renderTable({
      withProgress({setProgress(message = "Getting Data...")
        as.data.frame(test_file())
      })
    })
  },
  options = list(height = 600)
)