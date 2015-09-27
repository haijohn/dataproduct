library(shiny)

shinyUI(navbarPage
(   "mtcars",
    #titlePanel("expore the mtcars data set"),
    tabPanel('introduction',
        verticalLayout(
                 p("In this shiny app, I'm going to expore the mtcars dataset,the first few lines
                   are show as below. the variables are mpg(Miles/(US) gallon),
                   cyl(Number of cylinders),disp(Displacement (cu.in.)),hp(Gross horsepower),
                   drat(Rear axle ratio),wt(Weight (lb/1000)),qsec(1/4 mile time),
                   vs(V/S),am(Transmission (0 = automatic, 1 = manual)),
                   gear(Number of forward gears) and carb(Number of carburetors)"),
                 p("mpg is the response variable and others as predictors"),
                 tableOutput('table'),
                 p("the first part of the app expores the relationship of mpg and 
                   other variable, you can choose boxplot or scatter plot to visulize
                   the relation"),
                 p("the second part of the app expores the relationship of mpg and 
                   other variable plus another variable visulized by color"),
                 p("the last part of the app build linear models, mpg as response
                   variable and others as predicors")
    )),
    tabPanel('one variable',
    sidebarLayout(
        sidebarPanel(
            selectInput("x","choose a x variable", 
                        choices=list("cyl","disp", "hp","drat","wt","qsec",
                                     "vs","am","gear","carb")),
            selectInput("type","choose plot type", 
                        choices=list("point","box")),
            checkboxInput('smooth','smooth the plot')
        ),
        
        mainPanel(plotOutput("plot"))
    )),
    tabPanel('two variable',
             sidebarLayout(
                 sidebarPanel(
                     selectInput("x2","choose x variable", 
                                 choices=list("cyl","disp", "hp","drat","wt","qsec",
                                              "vs","am","gear","carb")),
                     selectInput("z","choose another variable", 
                                 choices=list("cyl","disp", "hp","drat","wt","qsec",
                                              "vs","am","gear","carb")),
                     selectInput("type2","choose plot type", 
                                 choices=list("point","box")),
                     checkboxInput('smooth2','smooth')
                 ),
                 
                 mainPanel(plotOutput("plot2"))
             )),
    tabPanel('linear model',
             sidebarLayout(
                 
                 sidebarPanel(
                     helpText("choose predictors to build linear model"),
                     checkboxGroupInput("variable", "Variable:",
                                        names(mtcars)[-1])
                 ),
                 mainPanel(verbatimTextOutput("text"))
             ))
)
)
