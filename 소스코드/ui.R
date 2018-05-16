

library(shiny) 

shinyUI(pageWithSidebar( 
  
  headerPanel("운전자 습관 분석"), 
  
  sidebarPanel(
    
    conditionalPanel(
      condition = "input.theTabs != 'hourly'",      
      dateRangeInput(inputId = "기간선택",  
                     label =  "Date range",
                     start = "2013-04-01",
                     max = Sys.Date()
      )
    ),
    
    checkboxInput(inputId = "smoother",
                  label = "Add smoother?",
                  value = FALSE),
    

    checkboxGroupInput(inputId = "domainShow",
                       label = "무엇이 궁금하십니까?",
                       choices = list("연비" = "NHS",
                                      "속도" = "Other"),
                       selected = c("NHS users", "Other")
    ),
    
    radioButtons(inputId = "결과",
                 label = "Output required",
                 choices = list("평가" = "visitors",
                                "그래프" = "bounceRate",
                                "다른 사람과 비교" = "timeOnSite")),
    
    sliderInput("animation", "시간",
                min = 0, max = 80, value = 0, step = 5, 
                animate=animationOptions(interval=1000, loop=FALSE)),
    
   uiOutput("reacDomains")
    
  ),
  mainPanel(
    tabsetPanel(id ="theTabs",
                tabPanel("요약", textOutput("textDisplay"),
                         textOutput("queryText"), value = "summary"), 
                tabPanel("평가", plotOutput("monthGraph"),
                         downloadButton("downloadData.trend","Download Graph"),
                         value = "monthly"),
                tabPanel("그래프", plotOutput("hourGraph"),
                         value = "hourly"),
                tabPanel("다른사람과 비교", plotOutput("animateGraph"),
                         value = "animTab")
    )
  )
))