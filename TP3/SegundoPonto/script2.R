
library("neuralnet")


dataset <- read.csv("C:\\Users\\patricia\\Desktop\\SRCR-2015\\TP3\\DadosTP3_2.csv",header=TRUE,sep=";",dec=".")
trainset <- dataset[1:700, ]

testset <- dataset[701:844, ]

1
fadiganet <- neuralnet(FatigueLevel ~ Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean+Performance.DDCMean+Performance.DMSMean+Performance.AEDMean+Performance.ADMSLMean+Performance.Task, trainset, hidden = c(8,6), threshold = 0.1)
2
fadiganet <- neuralnet(FatigueLevel ~ Performance.MAMean+Performance.MVMean+Performance.DDCMean+Performance.AEDMean, trainset, hidden = c(16,8), threshold = 0.1)
3
fadiganet <- neuralnet(FatigueLevel ~ Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean+Performance.DDCMean+Performance.DMSMean+Performance.AEDMean+Performance.ADMSLMean+Performance.Task, trainset, hidden = c(20,16), threshold = 0.1)
4
fadiganet <- neuralnet(FatigueLevel ~ Performance.MAMean+Performance.MVMean, trainset, hidden = c(4,2), threshold = 0.01)
5
fadiganet <- neuralnet(FatigueLevel ~ Performance.MAMean+Performance.MVMean+Performance.DDCMean+Performance.DMSMean, trainset, hidden = c(8,6), threshold = 0.1)
6
fadiganet <- neuralnet(FatigueLevel ~ Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean+Performance.DDCMean+Performance.DMSMean+Performance.AEDMean+Performance.ADMSLMean, trainset, hidden = c(10,8), threshold = 0.1)
7
fadiganet <- neuralnet(FatigueLevel ~ Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean+Performance.DDCMean+Performance.DMSMean+Performance.AEDMean+Performance.ADMSLMean+Performance.Task, trainset, hidden = c(30,15), threshold = 0.1)
8
fadiganet <- neuralnet(FatigueLevel ~ Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean+Performance.DDCMean+Performance.DMSMean+Performance.AEDMean+Performance.ADMSLMean+Performance.Task, trainset, hidden = c(50,40), threshold = 0.1)


1,3,7,8
temp_test <- subset(testset, select = c("Performance.KDTMean","Performance.MAMean","Performance.MVMean","Performance.TBCMean","Performance.DDCMean","Performance.DMSMean","Performance.AEDMean","Performance.ADMSLMean","Performance.Task"))
2
temp_test <- subset(testset, select = c("Performance.MAMean","Performance.MVMean","Performance.DDCMean","Performance.AEDMean"))
4
temp_test <- subset(testset, select = c("Performance.MAMean","Performance.MVMean"))
5
temp_test <- subset(testset, select = c("Performance.KDTMean","Performance.MAMean","Performance.MVMean","Performance.TBCMean","Performance.DDCMean","Performance.DMSMean","Performance.AEDMean","Performance.ADMSLMean"))


print(fadiganet)
?neuralnet

fadiganet.results <- compute(fadiganet, temp_test)
results <- data.frame(actual = testset$FatigueLevel, prediction = fadiganet.results$net.result)

results$prediction <- round(results$prediction)
View(results)
#results
results$prediction <- round(results$prediction)
