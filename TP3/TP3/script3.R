library("neuralnet")
#ESCALA: 1-7 
dataset <- read.csv("/Users/brunopereira/Documents/SourceTree/SRCR/TP3/DadosTP3_3.csv",header=TRUE,sep=";",dec=".")
#ESCALA: 0-7 
#ESCALA: 0-7 
#ESCALA: 0-7 
#ESCALA: 0-7 
#ESCALA: 0-7 
#ESCALA: 0-7 
#ESCALA: 0-7 
#ESCALA: 0-7 
trainset <- dataset[1:700, ]

testset <- dataset[701:845, ]

fadiganet <- neuralnet(FatigueLevel ~ Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean+Performance.DDCMean+Performance.DMSMean+Performance.AEDMean+Performance.ADMSLMean+Performance.Task, trainset, hidden = c(24,20,16), threshold = 0.1)
print(fadiganet)


temp_test <- subset(testset, select = c("Performance.KDTMean","Performance.MAMean","Performance.MVMean","Performance.TBCMean","Performance.DDCMean","Performance.DMSMean","Performance.AEDMean","Performance.ADMSLMean","Performance.Task"))

fadiganet.results <- compute(fadiganet, temp_test)
results <- data.frame(actual = testset$FatigueLevel, prediction = fadiganet.results$net.result)

results$prediction <- round(results$prediction)
View(results)