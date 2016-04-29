library("ClustOfVar")

data <- read.csv("train_enc.csv")

data <- data[!names(data) %in% c("X", "VisitNumber", "Sunday")]

dept <- data[8:length(names(data))]

dept_uni <- dept

dept_uni[dept != 0] <- 1

tree <- hclustvar(dept_uni)

plot(tree)

P3<-cutreevar(tree,10)

P3$var

cluster_list <- names(P3$var)

# a <- rownames(P3$var[['cluster1']])
# b <- which(names(data) %in% rownames(P3$var[['cluster1']]))-1
# df <- data.frame(do.call(cbind, list(a, b)))
# colnames(df) <- c("var_name", "var_index")
# df["cluster"] <- 'cluster1'
df_all <- data.frame()

for (i in 1:length(cluster_list)) {
  variables <- rownames(P3$var[[cluster_list[i]]])
  var_index <- which(names(data) %in% variables)-1
  df <- data.frame(do.call(cbind, list(variables, var_index)))
  colnames(df) <- c("var_name", "var_index")
  df["cluster"] <- cluster_list[i]
  df_all <- do.call(rbind, list(df_all, df))
}



