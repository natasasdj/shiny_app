shinyUI(
        navbarPage("",
        tabPanel("Application",
        pageWithSidebar(
                # Application title
                headerPanel("Expected Height of Your Child"),
                sidebarPanel(
                        numericInput('mother', 'Mother height in cm', 160, min = 120, max = 200, step = 1),
                        numericInput('father', 'Father height in cm', 170, min = 120, max = 220, step = 1),
                        radioButtons("sex", label = p("Child sex"),
                                     choices = list("male" = 1, "female" = 2)),
                        submitButton('Submit')
                        
                        
                ),
                mainPanel(
                        h3('Predicted child height cm'),
                        verbatimTextOutput("prediction")
                       
                )
                
        )),
        tabPanel('Docummentation',
                 helpText(p("This application predicts the adult height of a child,
                             based on the parents' heights and wether the child is a male or a female."),
                          h4("Input:"),
                          p("- the height (in cm) of the child's mother"),                         
                          p("- the height (in cm) of the child's mother"),
                          p("- the sex of the child"),
                          h4("Output:"),
                          "- the predicted height (in cm) of the child"
                          ))
        )
      
)