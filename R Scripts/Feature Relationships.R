library(corrplot)
library(ggplot2)
library(LaplacesDemon)

heart <- read.csv('heart.csv')
heart

corr<-cor(heart)
p.mat <- cor.mtest(heart)

corrplot(corr, order="hclust", method="color")

col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))
corrplot(corr, method="color", col=col(200),  
         type="upper", order="hclust", 
         addCoef.col = "black",addCoefasPercent=TRUE,
         tl.col="black", tl.srt=45,
         diag=FALSE 
)

#Notes:
#Age and maximum heart rate achieved (thalch) are inversely correlated (-40%).
#High correlation between oldpeak and slope is ignored because they are known to be related features. 
#The target is comapritively highly correlated with execised induced angina (exang, -44%), 
#ST depression induced by execercise relative to rest (oldpeak, -43%), 
#chest pain type (cp, 43%), maximum heart rate achieved (thalach, 42%) and number of 
#major vessels colored by flourosopy (ca, -39%). On the other hand age, cholostrol and 
#blood pressure seems to have low correlation with the target. 
#This insight maybe unreliable because most of the highly correlated features take less number of values 
#than their counterparts most of whom are continuous. Further analysis is required.

('corplot.png')

scatter.smooth(heart$chol, heart$trestbps)
scatter.smooth(heart$age, heart$thalach)
scatter.smooth(heart$thalach, heart$oldpeak)
scatter.smooth(heart$chol, heart$thalach)
scatter.smooth(heart$thalach, heart$trestbps)
scatter.smooth(heart$oldpeak, heart$chol)

require(GGally)

pairs <- ggpairs(data=heart[,c('chol','trestbps','thalach','oldpeak')],
                 columns=1:3, 
                 upper = list(continuous = "density"),
                 lower = list(combo = "facetdensity"),
                 title="Cholestrol, blood pressure and heart rate") + theme(panel.background = element_rect(fill = 'cyan3'), panel.grid.major = element_blank(),
                                                                            panel.grid.minor = element_blank())
pairs

ggsave("Feature relations.png")

joint.pr.plot(heart$chol, heart$thalach)
title(main="Cholestrol vs maximum heart rate achieved", 
      xlab="Cholestrol", ylab="Maximum heart rate achieved")

joint.pr.plot(heart$age, heart$oldpeak)
title(main="Age vs ST depression", 
      xlab="Age", ylab="ST depression")
