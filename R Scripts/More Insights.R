library(ggplot2)
library(dplyr) 

heart <- read.csv('heart.csv')
heart

ylabs = c("Mean blood pressure (mm Hg)", "Exercise induced angina", "Fasting blood sugar > 120 mg/dl", "Resting electrocardiographic results")
feature_names = c("trestbps", "exang", "fbs", "restecg")
names(ylabs) = feature_names

for (feature_name in feature_names){
  ylab = ylabs[feature_name]
  barplot(c(mean(subset(heart, target==0)[,feature_name]), mean(subset(heart, target==1)[,feature_name])), 
          xlab="Heart Disease", names.arg=c("No", "Yes"), ylab=ylab,
          col=c("#00bfc4", "#f7756d"),
          horiz=TRUE,
          width=1)
}

heart$target_factor <- as.factor(heart$target)

ylabs = c("age", "cholestrol (mg/d)", "blood pressure (mm Hg)", "Maximum heart rate achieved", "ST depression induced by execercise")
feature_names = c("age", "chol", "trestbps", "thalach", "oldpeak")
names(ylabs) = feature_names

heart_boxplot <- function(column) {
  for (feature_name in feature_names){
    ylab = ylabs[feature_name]
    
    print(ggplot(heart, aes_string(x="target_factor", y=feature_name, fill="target_factor")) + 
            geom_boxplot() + 
            labs(title=paste("Box plot of", ylabs[feature_name], "per presence of heart disease"), x="Heart Disease", y = feature_name) + 
            scale_fill_manual(values=c("#00bfc4", "#f7756d"))
    )
  }
}

heart_boxplot()

#Notes: 
#Exercise induces angina (exang), ST depression induced by execercise relative to rest (oldpeak) 
#and Resting ECG (restecg) seems to be significant indicators of heart disease. 
#Fasting blood sugar (fbs) and Maximum heart rate achieved (thalach) slighlty indicates heart disease. 
#Whereas age, cholestrol and blood sugar seems to be almost similar for individuals with or without heart disease.

heart$target_factor <- as.factor(heart$target)

ggplot(data=heart, aes(x=target_factor, y=thalach, fill=target_factor))+
  geom_violin(trim=FALSE) + labs(title="Plot of maximum heart rate (thalach) by presence of heart disease",x="Heart disease", y = "Maximum heart rate") +
  scale_fill_manual(values=c("#00bfc4", "#f7756d"))+theme(panel.background = element_rect(fill = 'cadetblue'), panel.grid.major = element_blank(),
                                                          panel.grid.minor = element_blank())

ggsave("Violin heart rate.png")

ggplot(heart, aes(x=thalach, ..density..)) + 
  geom_histogram(data=subset(heart, target==0), 
                 color="darkblue", fill="#00bfc4", alpha=0.2, bins=30) + 
  geom_histogram(data=subset(heart, target==1), 
                 color="darkred", fill="#f7756d", alpha=0.2, bins=30) + labs(title="Probability distribution of Maximum heart rate by presence of heart disease")

ggplot() + 
  geom_density(data=heart[heart$target==0,], aes(thalach), color="darkblue", fill="#00bfc4", alpha=0.2) +
  geom_density(data=heart[heart$target==1,], aes(thalach), color="darkred", fill="#f7756d", alpha=0.2) + labs(title="Kernel density for Maximum heart rate by presence of heart disease")

ggplot(heart, aes(x=thalach, ..density..)) + 
  geom_histogram(data=subset(heart, target==0), bins=30, 
                 color="darkblue", fill="#00bfc4", alpha=0.2) + 
  geom_histogram(data=subset(heart, target==1), bins=30,
                 color="darkred", fill="#f7756d", alpha=0.2) + 
  geom_density(data=heart[heart$target==0,], aes(thalach), color="#00bfc4") +
  geom_density(data=heart[heart$target==1,], aes(thalach), color="#f7756d") + labs(title="Maximum heart rate by presence of heart disease")

ggplot() + 
  geom_density(data=heart[heart$target==0,], aes(oldpeak), color="darkblue", fill="#00bfc4", alpha=0.2) +
  geom_density(data=heart[heart$target==1,], aes(oldpeak), color="darkred", fill="#f7756d", alpha=0.2) + 
  labs(title="Kernel density for ST depression by presence of heart disease") + theme(panel.background = element_rect(fill = 'cornsilk'), panel.grid.major = element_blank(),
                                                                                      panel.grid.minor = element_blank())

ggplot() + 
  stat_ecdf(data=heart[heart$target==0,], aes(age), color="#00bfc4") +
  stat_ecdf(data=heart[heart$target==1,], aes(age), color="#f7756d")

ggplot()+
  stat_ecdf(data=heart[heart$target==0,], aes(exang), color="#00bfc4") +
  stat_ecdf(data=heart[heart$target==1,], aes(exang), color="#f7756d")

ggplot()+
  stat_ecdf(data=heart[heart$target==0,], aes(restecg), color="#00bfc4") +
  stat_ecdf(data=heart[heart$target==1,], aes(restecg), color="#f7756d")

ggplot()+
  stat_ecdf(data=heart[heart$target==0,], aes(thalach), color="#00bfc4") +
  stat_ecdf(data=heart[heart$target==1,], aes(thalach), color="#f7756d")

ggplot()+
  stat_ecdf(data=heart[heart$target==0,], aes(oldpeak), color="#00bfc4") +
  stat_ecdf(data=heart[heart$target==1,], aes(oldpeak), color="#f7756d") +
  labs(title="CDF of ST depression for datapoints with and without heart disease") +
  theme(panel.background = element_rect(fill = 'aliceblue'), panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())

#Notes:
#Individuals with no heart disease first order stochastically dominates those who have heart disease 
#when it comes to ST depression (oldpeak) and exercise induced angina (exang). 
#The opposite is true for maximum heart rate achieved (thalach).

ggsave('Heart rate CDF.png.png')
