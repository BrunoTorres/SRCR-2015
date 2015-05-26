######################################################### Script de resposta ao Ponto 3 do 3º Exercicio Pratico ###########################################

library("neuralnet")

#Teste 1: ESCALA: 1-7 
dataset <- read.csv("C:\\Users\\patricia\\Desktop\\SRCR-2015\\TP3\\TerceiroPonto\\DadosTP3NiveisUMaSETE.csv",header=TRUE,sep=";",dec=".")
#Teste 2: ESCALA: 1-6 (Igual a anterior) 
dataset <- read.csv("C:\\Users\\patricia\\Desktop\\SRCR-2015\\TP3\\TerceiroPonto\\DadosTP3NiveisUMaSEIS.csv",header=TRUE,sep=";",dec=".")
#Teste 3: ESCALA: 1-5 (Unindo 4 a 5) 
dataset <- read.csv("C:\\Users\\patricia\\Desktop\\SRCR-2015\\TP3\\TerceiroPonto\\DadosTP3NiveisUMaCINCOunir5e4.csv",header=TRUE,sep=";",dec=".")
#Teste 4: ESCALA: 1-5 (Unindo 2 a 3) 
dataset <- read.csv("C:\\Users\\patricia\\Desktop\\SRCR-2015\\TP3\\TerceiroPonto\\DadosTP3NiveisUMaCINCOunir2e3.csv",header=TRUE,sep=";",dec=".")
#Teste 5: ESCALA: 1-4 
dataset <- read.csv("C:\\Users\\patricia\\Desktop\\SRCR-2015\\TP3\\TerceiroPonto\\DadosTP3NiveisUMaQUATRO.csv",header=TRUE,sep=";",dec=".")
#Teste 6: ESCALA: 1-3 (Unindo 1 a 2, 4 a 5 e 6 e 7)
dataset <- read.csv("C:\\Users\\patricia\\Desktop\\SRCR-2015\\TP3\\TerceiroPonto\\DadosTP3NiveisUMaTRESunir1e2unir4e5e6e7.csv",header=TRUE,sep=";",dec=".")
#Teste 7: ESCALA: 1-3 (Unindo 1 a 2 e 3, 4 a 5, 6 a 7)
dataset <- read.csv("C:\\Users\\patricia\\Desktop\\SRCR-2015\\TP3\\TerceiroPonto\\DadosTP3NiveisUMaTRESunir1e2e3unir4e5unir6e7.csv",header=TRUE,sep=";",dec=".")
#Teste 8: ESCALA: 1-2
dataset <- read.csv("C:\\Users\\patricia\\Desktop\\SRCR-2015\\TP3\\TerceiroPonto\\DadosTP3NiveisUMaDOIS.csv",header=TRUE,sep=";",dec=".")


trainset <- dataset[1:700, ]
testset <- dataset[701:844, ]

#Usamos o a formula correspondente ao teste 3 do segundo ponto
fadiganet <- neuralnet(FatigueLevel ~ Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean+Performance.DDCMean+Performance.DMSMean+Performance.AEDMean+Performance.ADMSLMean+Performance.Task, trainset, hidden = c(20,16), threshold = 0.1)


print(fadiganet)


temp_test <- subset(testset, select = c("Performance.KDTMean","Performance.MAMean","Performance.MVMean","Performance.TBCMean","Performance.DDCMean","Performance.DMSMean","Performance.AEDMean","Performance.ADMSLMean","Performance.Task"))
fadiganet.results <- compute(fadiganet, temp_test)
results <- data.frame(actual = testset$FatigueLevel, prediction = fadiganet.results$net.result)
results$prediction <- round(results$prediction)
View(results)