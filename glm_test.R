### Remember to set your working directory!!

Titanic <- read.csv("Data/Titanic.csv")
Titanic <- na.omit(Titanic)

# glm stands for generalized linear model

mod <- glm(Survived ~ Age,
           data=Titanic,
           family="binomial")

summary(mod)

# family = "binomial" means we assume the response is binary 
# (or follows a binomial distribution)
