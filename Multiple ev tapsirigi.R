df <- read.csv('income_evaluation.csv')
glimpse(df)
skim(df)
df <- df[-14]
levels(df$sex) <-c(0,1)
df$sex <- as.numeric(as.character(df$sex))
levels(df$race) <- c(1,2,3,4,5)
df$race <-as.numeric(as.character(df$race))
levels(df$relationship) <- c(1,2,3,4,5,6)
df$relationship <- as.numeric(as.character(df$relationship))
levels(df$occupation) <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)
df$occupation<- as.numeric(as.character(df$occupation))
levels(df$marital.status) <- c(1,2,3,4,5,6,7)
df$marital.status <- as.numeric(as.character(df$marital.status))
levels(df$workclass) <- c(1,2,3,4,5,6,7,8,9)
df$workclass <- as.numeric(as.character(df$workclass))
levels(df$education) <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16)
df$education <- as.numeric(as.character(df$education))
levels(df$income) <- c(0,1)
df$income <- as.numeric(as.character(df$income))


attach(df)

# MULTIPLE LINEAR  model qururuq
library(caTools)
set.seed(123)
split = sample.split(df$income, SplitRatio = 0.8)
training_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)

regressor = lm(formula = income ~ .,
               data = training_set)
summary(regressor)

y_pred = predict(regressor, newdata = test_set)
y_pred


# suallar

# tapsiriqda nie predicte baxan zaman 0 ve 1 araligi faiz alinmir,ferqli reqemler alinir
# R squared 26 faiz olma sebebi nedendir? nie zeif olub model








