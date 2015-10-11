setwd("~/ShinyApps/list")          # set your directory list application, example: list

url <- "http://shiny.leg.ufpr.br" # insert your url,     example: http://200.17.213.89:3838
user <- "daniel"                   # insert yor username, example: daniel



directory <- list.dirs(path = "../", full.names = FALSE, recursive = FALSE)
directory <- directory[directory != "log" ]  # exclude directory log files
directory <- directory[directory != "list"] # exclude directory list application
directory <- directory[directory != "general"] # exclude directory list application

url.list <- lapply(directory,
                   function(x){
                     do.call(tags$a, c(list(href=paste(url, user, x, sep="/"), target="_blank"), x))
                   })

shinyUI(fluidPage(theme = "styles.css",
                  
                  headerPanel("Shiny Apps"),
                  tags$html("Example"),  # insert your text here
                  sidebarLayout(
                    tags$ol(lapply(url.list[1:length(directory)],tags$li)),
                    
                    mainPanel()
                  )
                  
))