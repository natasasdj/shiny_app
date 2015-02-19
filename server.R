createModel<-function(){
        d <- read.csv("galton_heights_families.txt")
        d <- d[-c(1,23)]
        library(tidyr)
        d1 <- gather(d,Sex,Child,-c(Father,Mother))
        d2<-d1[d1$Child!="*",]
        d3<-d2
        d3$Sex<-as.numeric(grepl("S",d3$Sex))
        d3$Child<-as.numeric(d3$Child)+60
        d3$Father<-d3$Father+60
        d3$Mother<-d3$Mother+60
        data<-d3
        data$Child<-data$Child * 2.54
        data$Father<-data$Father * 2.54
        data$Mother<-data$Mother * 2.54
        lm(Child~.,data)
        
} 



child <- function(mother,father,sex) {
        nsex<-ifelse(sex==1,1,0)
        newdata<-data.frame(Father=father,Mother=mother,Sex=nsex)
        model<-createModel()
        predict(model,newdata)
}
shinyServer(
        function(input, output) {
                output$prediction <- renderPrint({child(input$mother,input$father,input$sex)})
        }
)