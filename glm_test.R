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

mod <- glm(Survived ~ Age + Sex,
           data=Titanic,
           family="binomial")

# Test Statistic
# Null Deviance - Residual Deviance = 964.52 - 749.96 = 214.56
summary(mod)

# p-value
1 - pchisq(214.56,df=713-711)
# 0

mod_red <- glm(Survived ~ Age + Sex,
           data=Titanic,
           family="binomial")

mod_full <- glm(Survived ~ Age + Sex + as.character(Pclass),
                data=Titanic,
                family="binomial")

# Test Statistic
# Difference in Residual deviance from reduced and full model
anova(mod_red,mod_full)
# 102.67

# p-value
# degrees of freedom from anova
1 - pchisq(102.67,df=2)
# 0

# Choose Maximum Model
mod_max <- glm(Survived ~ Age + Sex + as.character(Pclass) +
                 SibSp + Parch + Fare + Embarked,
               data=Titanic,
               family="binomial")

# Model Selection performed the same as linear regression
best_mod <- step(mod_max)

# Log-likelihood of best model
# 636.56/-2






