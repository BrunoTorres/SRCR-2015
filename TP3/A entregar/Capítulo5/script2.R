######################################################### Script de resposta ao Ponto 1 do Exercicio Pratico 3 para Performance.Task ###########################################
library("neuralnet")

dataset <- read.csv("/Users/brunopereira/Documents/SourceTree/SRCR/TP3/DadosTP3_2.csv",header=TRUE,sep=";",dec=".")
trainset <- dataset[1:845, ]
testset <- dataset[600:700, ]

#Teste 1
tasknet <- neuralnet(Performance.Task ~ Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean+Performance.DDCMean+Performance.DMSMean+Performance.AEDMean+Performance.ADMSLMean+FatigueLevel, trainset, hidden = c(8,6), threshold = 0.1)
#Teste 2
tasknet <- neuralnet(Performance.Task ~ Performance.MAMean+Performance.MVMean+Performance.DDCMean+Performance.AEDMean, trainset, hidden = c(30,15), threshold = 0.1)
#Teste 3
tasknet <- neuralnet(Performance.Task ~ Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean+Performance.DDCMean+Performance.DMSMean+Performance.AEDMean+Performance.ADMSLMean+FatigueLevel, trainset, hidden = c(30,15), threshold = 0.1)



#Para os testes 1,3
temp_test <- subset(testset, select = c("Performance.KDTMean","Performance.MAMean","Performance.MVMean","Performance.TBCMean","Performance.DDCMean","Performance.DMSMean","Performance.AEDMean","Performance.ADMSLMean","FatigueLevel"))
#Para os testes 2
temp_test <- subset(testset, select = c("Performance.MAMean","Performance.MVMean","Performance.DDCMean","Performance.AEDMean"))


print(tasknet)

tasknet.results <- compute(tasknet, temp_test)
results <- data.frame(actual = testset$Performance.Task, prediction = tasknet.results$net.result)

results$prediction <- round(results$prediction)
View(results)