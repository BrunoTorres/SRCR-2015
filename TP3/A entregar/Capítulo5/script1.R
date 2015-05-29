######################################################### Script de resposta ao Ponto 1 do Exercicio Pratico 3 para Performance.Task ###########################################
library("neuralnet")

library("neuralnet")
dataset <- read.csv("/Users/brunopereira/Documents/SourceTree/SRCR/TP3/DadosTP3.csv",header=TRUE,sep=";",dec=".")
trainset <- dataset[1:845, ]
testset <- dataset[600:700, ]

#Teste 1
tasknet <- neuralnet(Performance.Task ~ Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean+Performance.DDCMean+Performance.DMSMean+Performance.AEDMean+Performance.ADMSLMean+FatigueLevel, trainset, hidden = c(20,16), threshold = 0.01)
#Teste 2
tasknet <- neuralnet(Performance.Task ~ Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean+Performance.DDCMean+Performance.DMSMean+Performance.AEDMean+Performance.ADMSLMean+FatigueLevel, trainset, hidden = c(8,6), threshold = 0.1)
#Teste 3
tasknet <- neuralnet(Performance.Task ~ Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean, trainset, hidden = c(16,8), threshold = 0.1)
#Teste 4
tasknet <- neuralnet(Performance.Task ~ Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean+Performance.DDCMean+Performance.DMSMean+Performance.AEDMean+Performance.ADMSLMean+FatigueLevel, trainset, hidden = c(20,16,8), threshold = 0.01)
#Teste 5
tasknet <- neuralnet(Performance.Task ~ Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean+Performance.DDCMean+Performance.DMSMean+Performance.AEDMean+Performance.ADMSLMean+FatigueLevel, trainset, hidden = c(16,8), threshold = 0.1)
#Teste 6
tasknet <- neuralnet(Performance.Task ~ Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean+Performance.DDCMean+Performance.DMSMean+Performance.AEDMean+Performance.ADMSLMean+FatigueLevel, trainset, hidden = c(20,16), threshold = 0.1)


#Para os testes todos excepto 3
temp_test <- subset(testset, select = c("Performance.KDTMean","Performance.MAMean","Performance.MVMean","Performance.TBCMean","Performance.DDCMean","Performance.DMSMean","Performance.AEDMean","Performance.ADMSLMean","FatigueLevel"))
#Para os testes 3
temp_test <- subset(testset, select = c("Performance.KDTMean","Performance.MAMean","Performance.MVMean","Performance.TBCMean"))

print(tasknet)

tasknet.results <- compute(tasknet, temp_test)
results <- data.frame(actual = testset$Performance.Task, prediction = tasknet.results$net.result)

results$prediction <- round(results$prediction)
View(results)