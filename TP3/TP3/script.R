set.seed(1234567890)
library("neuralnet")
library(hydroGOF);

dataset <- read.csv("/Users/brunopereira/Documents/SourceTree/SRCR/TP3/DadosTP3.csv",header=TRUE,sep=";",dec=".")
trainset <- dataset[1:700, ]

testset <- dataset[701:844, ]


fadiganet <- neuralnet(FatigueLevel ~ Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean+Performance.DDCMean+Performance.DMSMean+Performance.AEDMean+Performance.ADMSLMean+Performance.Task, trainset, hidden = c(8,6), threshold = 0.1)
plot(fadiganet, rep = "best")

temp_test <- subset(testset, select = c("Performance.KDTMean","Performance.MAMean","Performance.MVMean","Performance.TBCMean","Performance.DDCMean","Performance.DMSMean","Performance.AEDMean","Performance.ADMSLMean","Performance.Task"))
fadiganet.results <- compute(fadiganet, temp_test)
results <- data.frame(actual = testset$FatigueLevel, prediction = fadiganet.results$net.result)

results$prediction <- round(results$prediction)
View(results)
results
results$prediction <- round(results$prediction)

rmse(c(testset$FatigueLevel),c(results$prediction))