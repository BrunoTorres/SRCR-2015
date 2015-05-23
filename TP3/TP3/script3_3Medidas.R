library("neuralnet")
dataset <- read.csv("/Users/brunopereira/Documents/SourceTree/SRCR/TP3/DadosTP3_3.csv",header=TRUE,sep=";",dec=".")
trainset <- dataset[1:700, ]

testset <- dataset[701:845, ]

fadiganet <- neuralnet(FatigueLevel ~ Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean+Performance.DMSMean, trainset, hidden = c(24,20,16), threshold = 0.1)
print(fadiganet)


temp_test <- subset(testset, select = c("Performance.KDTMean","Performance.MAMean","Performance.MVMean","Performance.TBCMean","Performance.DMSMean","Performance.Task"))

#temp_test <- subset(testset, select = c("Performance.MAMean","Performance.MVMean","Performance.DDCMean","Performance.AEDMean"))

fadiganet.results <- compute(fadiganet, temp_test)
results <- data.frame(actual = testset$FatigueLevel, prediction = fadiganet.results$net.result)

results$prediction <- round(results$prediction)
View(results)