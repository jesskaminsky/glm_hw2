### QUESTION 1 ###

wine <- read.csv("Wine.csv")
names(wine)[1] <- "COUNTRY"

wine$log.wine <- log(wine$WINE)
wine$log.mortality <- log(wine$MORTALITY)

#### 1a ####
plot(wine$WINE, wine$MORTALITY, ylab = "CHD Mortality Rate", xlab = "Wine Consumption")
plot(wine$WINE, wine$log.mortality, ylab = "Log CHD Mortality Rate", xlab = "Wine Consumption")
plot(wine$log.wine, wine$MORTALITY, ylab = "CHD Mortality Rate", xlab = "Log Wine Consumption")
plot(wine$log.wine, wine$log.mortality, ylab = "Log CHD Mortality Rate", xlab = "Log Wine Consumption")

summary(lm(wine$WINE ~ wine$MORTALITY))
summary(lm(wine$WINE ~ wine$log.mortality))
summary(lm(wine$log.wine ~ wine$MORTALITY))
summary(lm(wine$log.wine ~ wine$log.mortality))

### QUESTION 2: The Dramatic US Presidential Election of 2000 ###

bush <- read.csv("Bush.csv")
names(bush)[1] <- "country"
for(i in 2:ncol(bush)){
  bush[,i] <- as.numeric(bush[,i])
}
#### 2a ####

remove_pb <- bush[!bush$country %in% c("PALM BEACH"),]
pb_data <- bush[bush$country %in% c("PALM BEACH"),]
plot(remove_pb$bush2000, remove_pb$buchanan2000, xlab = "Number of Votes for Bush", ylab = "Number of Votes for Buchanan", main = "Votes for George W. Bush and Pat Buchanan in 2000 Election")

attach(remove_pb)
buch_lm <- lm(buchanan2000~bush2000)


predict(buch_lm, data.frame(bush2000 = pb_data$bush2000), interval = "prediction")

### QUESTION 3: The Blood-Brain Barrier: A Controlled Experiment ###

bloodbrain <- read.csv("BloodBrain.csv")
names(bloodbrain)[1] <- "BRAIN"
