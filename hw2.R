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