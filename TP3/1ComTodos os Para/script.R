
library("neuralnet")
#temp_test <- subset(testset, select = c("Performance.MAMean","Performance.MVMean","Performance.DDCMean","Performance.AEDMean"))


dataset <- read.csv("/Users/brunopereira/Documents/SourceTree/SRCR/TP3/DadosTP3.csv",header=TRUE,sep=";",dec=".")
trainset <- dataset[1:820, ]

testset <- dataset[821:845, ]


fadiganet <- neuralnet(FatigueLevel ~ Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean+Performance.DMSMean, trainset, hidden = c(24,20), threshold = 0.8)
print(fadiganet)

#plot(fadiganet, rep = "best")

temp_test <- subset(testset, select = c("Performance.KDTMean","Performance.MAMean","Performance.MVMean","Performance.TBCMean","Performance.DDCMean","Performance.DMSMean","Performance.AEDMean","Performance.ADMSLMean","Performance.Task"))


fadiganet.results <- compute(fadiganet, temp_test)
results <- data.frame(actual = testset$FatigueLevel, prediction = fadiganet.results$net.result)

results$prediction <- round(results$prediction)
View(results)
#results
