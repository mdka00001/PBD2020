library("ggplot2")
library("dplyr")
library("haven")
library("VIM")

ms_toy <- read.delim("A://AI/Process/ms_toy.txt")


ms1 = ms_toy
ms2 = ms1
ms3 = ms2


ms_toy[is.na(ms_toy)]=0

mean = mean(ms_toy$ctrl.1)
stdev = sd(ms_toy$ctrl.1)

mean
stdev

#Mean and Standard Deviation
new <- rbind(mean, stdev)
new
#Mean generated from lower quantile
mean_der <- qnorm(0.25, mean)


mean_der
summary(ms_toy$ctrl.1)


#new standard deviation
sd_der <- qnorm(0.75, stdev)
sd_der

#value distribution based on lower quantile of the mean
ms1[is.na(ms1$ctrl.1)]<- rnorm(ms1$ctrl.1[is.na(ms1$ctrl.1)], mean_der, sd_der)

ms1$ctrl.1




ggplot(ms1, aes(x = ctrl.1))+
  geom_histogram(color="blue", binwidth = 0.1)+
  labs(x="intensity", y="Frequency", title = "Histogram of ctrl.1+imputed value")


  
