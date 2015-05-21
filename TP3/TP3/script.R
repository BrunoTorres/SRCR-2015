library("neuralnet")

trainset <- read.csv("C:\\Users\\patricia\\Desktop\\SRCR-2015\\TP3\\DadosTP3.csv",header=TRUE,sep=";",dec=".")

fadiganet <- neuralnet(FatigueLevel ~ Performance.KDTMean+Performance.MAMean+Performance.MVMean+Performance.TBCMean+Performance.DDCMean+Performance.DMSMean+Performance.AEDMean+Performance.ADMSLMean+Performance.Task, trainset, hidden = c(10,15), threshold = 0.01)
