trainraw <- read.csv("Data/sfcrime.csv")
saveRDS(trainraw, "Data/sfcrime.RDS")
traintest <- readRDS("Data/sfcrime.RDS")