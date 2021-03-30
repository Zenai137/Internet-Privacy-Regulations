#Impacts of Privacy Regulations on Data Mining

getwd()
setwd("C:/Users/medma/Documents/MBA/Data Mining/rcode")

# Pull in dataset found here: 
# https://www.kaggle.com/econdata/internet-privacy-poll?select=AnonymityPoll.csv

internet <- read.csv("../data/AnonymityPoll.csv",stringsAsFactors = TRUE)

# This dataset includes those that answered that they do not use the Internet.
# These people will not help us any so we can get rid of them.

internet_users <- subset(internet,internet$Internet.Use>0)

# Let's look at bias.

table(internet_users$Sex)
table(internet_users$State)

# Seems to be split amongst gender as well as states.
# So do people worry about their information being online?

table(internet_users$Worry.About.Info)

# Another split down the middle; 390 say no they aren't worried whereas
# 383 are worried.

# Is privacy on the internet important to these people?

hist(internet_users$Privacy.Importance,main="How Important is Privacy on the 
     Internet?", xlab="Scale of Importance (0 being Not Important to 100
     being Extremely Important)",col="darkred")

# To most people, internet privacy is very important. There are a few people
# in the middle of this decision; it's important but not extremely.

# So from a list of 11 items (email address, home address, phone number, etc.)
# how many do you think are available on the Internet?

hist(internet_users$Info.On.Internet,main="How Many Items About You Are
     Available on the Internet?", xlab="Number of Options (0 to 11)",
     col="purple")

# People in this poll thought little to no information about them is available
# online.

# Last quick check: How many people feel as if the current privacy laws are
# effective in providing protection for internet users?

table(internet_users$Privacy.Laws.Effective)

# Something of interest here. 532 people think current laws are ineffective,
# whereas 181 think they are. This goes against everything we looked at above.