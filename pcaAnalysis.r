library("psych")
library(factoextra)

#read in numerical columns
df <- read.csv("Downloads/Ames_num.csv",header=TRUE)
df.pca <- prcomp(df,scale.=TRUE)

#PCA summary
summary(df.pca)

#roate PCs using varimax rotation
pc1 <- principal(df, nfactors = 2,nfactors=6, rotate = "varimax")
pc1

#print loadings
df.cf <- principal(df, rotate = "varimax", nfactors = 2, score = TRUE)
print(df.cf$loadings, cutoff = 0.4, sort = TRUE)

p1 = psych::principal(df, rotate="varimax",nfactors=6, scores=TRUE)
print(p1$loadings, cutoff=.4, sort=T)

#visaulize eigen values and screeplot
fviz_eig(df.pca, addlabels = TRUE)
fviz_screeplot(df.pca, addlabels = TRUE)

variables <- get_pca_var(df.pca)
head(variables$contrib, 11)

pc.var <- df.pca$sdev^2
# Variance explained by each principal component: pve
pve <- pc.var / sum(pc.var)

#visualize cum. proportion of variance
plot(cumsum(pve), xlab = "Principal Component",
     ylab = "Cumulative Proportion of Variance Explained",
     ylim = c(0, 1),type="l")

fviz_contrib(df.pca, choice = "var", axes = 1, top = 10)
