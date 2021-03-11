# Okay lets us again just do some minor data exploration.
# This time using the ISLR Dataset 
library("ISLR")

# Let us now assign the dataset to a variable.
Data <- Carseats
Data

# If we want to actually look at this dataset through a window rather
# than terminal we can use view option. 
view(Data)

#Check the first few entries. 
head(Data)

#Check the dimension 
dim(Data)

#Check out the columns 
colnames(Data)

#Let us check out the structure of this dataset, see what type of datatypes we are dealing
#with and also the different factor levels if any. Useful for later. 
str(Data)

#Get a summary of the dataset and also check to see if we have any NA's. We don't, good.
summary(Data)

#If we wanted to focus on say one column at a time. Lets say income.

#Might want to know the median value.
median(Data$Income)

#Or what range of incomes are we dealing with.  
range(Data$Income)

#check the standard dev.Again we could do this for more than one column depending on
#what we think is relevent for our task. 
sd(Data$Income)

#If we were interested in some summary stats for one col.
summary(Data$Income)

#Now lets look at the entire dataset rather than one col. 
library('psych')

#Lets check.
describe(Data)

#In some circumstances we might want to look at a filtered dataset. Say for example 
#People who are above the age of 40. We could do this doing the following.
Data_40 <- filter(Data, Data$Age > 40 )
range(Data_40$Age)

#In addition, maybe we would want to do some sort of linear/Multiple Regression.
#In that case it might be useful to consider the correlation among various varbles. 
#One at a time or mutiple at a time. 
cor(Data$Income,Data$Sales)
cor(Data[,1:5])

#In some cases we might want to filter our data to look at 
#specific things. So maybe see based on Urban or not what is 
#the mean and sd of the income. 
Data %>%
  group_by(Urban) %>%
  summarise(mean_income = mean(Income),
            Sd_income = sd(Income))

#Now that we have done some preliminary stats. Lets get some visual exploration.
#This might give us more of an intuitive feeling for the dataset. 

# Load Tidyverse
library(tidyverse)

#Maybe we want to look at a histogram of the Income
ggplot(data = Data) +
  geom_histogram(aes(Income))

#Or a density plot might be better visually. 
ggplot(data =Data, aes(Income)) +
  geom_density()

#Maybe we would like to o a bit more fine grained and
#see if income and US residenace has any sort of impact
ggplot(data =Data, aes(Income))+
  geom_density()+
  facet_grid(Data$US ~.)

#Maybe we want to look at other type of interactions in the data.
ggplot(data =Data, aes(Income)) +
  geom_density()+
  facet_grid(Data$ShelveLoc ~.)

#Lets just see what a comparison of income looks like
#depending on the Urban cateogry. lets color code this for 
#more of an illustrator effect. 
ggplot(data =Data, aes(Income,fill = Urban)) +
  geom_density(alpha = 0.5)+
  facet_grid(Urban ~.)

#Instead we might want to look at the distribution of income when we 
#consider both urban and US residency. 
ggplot(data =Data, aes(Income,fill = Urban)) +
  geom_density(alpha = 0.5)+
  facet_grid(Data$US ~.)

#Tha concludes this very quick data eploration in R. 

