library(ggplot2)

heart <- read.csv('heart.csv')
heart

max(heart$oldpeak)
min(heart$oldpeak)

ggplot(data=heart,aes(x=age, ..density..)) + 
  geom_histogram(binwidth=2, alpha=0.75,fill="tomato",color="black") +
  geom_density(kernel="gaussian") +
  ggtitle("Age Distribution")

ggsave('Age distribution.png')

ggplot(data=heart,aes(x=sex)) + 
  geom_bar(alpha=0.75,fill="orangered",color="black") +
  ggtitle("Counts of Female and Male")

ggplot(data=heart,aes(x=cp)) + geom_bar(alpha=0.75,fill="tan1",color="black") + 
  ggtitle("Chest pain type")

ggplot(data=heart,aes(x=fbs)) + geom_bar(alpha=0.75,fill="cornflowerblue",color="black") +
  ggtitle("fasting blood sugar > 120 mg/dl")

ggplot(data=heart,aes(x=restecg)) + geom_bar(alpha=0.75,fill="cornflowerblue",color="black") +
  ggtitle("resting electrocardiographic results")

ggplot(data=heart,aes(x=exang)) + geom_bar(alpha=0.75,fill="cornflowerblue",color="black") +
  ggtitle("exercise induced angina")

ggplot(data=heart,aes(x=oldpeak)) + geom_bar(alpha=0.75,fill="cornflowerblue",color="black") +
  ggtitle("ST depression induced by exercise relative to rest")

ggplot(data=heart,aes(x=slope)) + geom_bar(alpha=0.75,fill="cornflowerblue",color="black") + 
  ggtitle("the slope of the peak exercise ST segment")

ggplot(data=heart,aes(x=ca)) + geom_bar(alpha=0.75,fill="cornflowerblue",color="black") +
  ggtitle("number of major vessels (0-3) colored by flourosopy")

ggplot(data=heart,aes(x=thal)) + geom_bar(alpha=0.75,fill="cornflowerblue",color="black") +
  ggtitle("3 = normal; 6 = fixed defect; 7 = reversable defect")

ggplot(data=heart,aes(trestbps, ..density..)) + 
  geom_histogram(alpha=0.75,fill="seagreen",binwidth = 10) +
  geom_density(kernel="gaussian") +
  ggtitle("resting blood pressure (in mm Hg on admission to the hospital)")

ggplot(data=heart[heart$chol<500,],aes(chol, ..density..)) + 
  geom_histogram(alpha=0.75,fill="salmon",binwidth = 16) +
  geom_density(kernel="gaussian") +
  ggtitle("serum cholestoral in mg/dl")

ggplot(data=heart,aes(thalach, ..density..)) + 
  geom_histogram(alpha=0.75,fill="gold2",binwidth = 15) +
  geom_density(kernel="gaussian") +
  ggtitle("maximum heart rate achieved")

ggplot(data=heart,aes(x=target)) + #,colour=cp,group=cp)) + 
  geom_bar(alpha=0.75,fill="black") +
  ggtitle("Distribution of Target Value (Heart disease or not)")

boxplot(heart$age)
boxplot(heart$chol)
