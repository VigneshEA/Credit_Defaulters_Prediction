UCI_Crecard %>% group_by(EDUCATION,AGE) %>% summarise(mn_creditlmt=mean(LIMIT_BAL)) -> df
ggplot(df, aes(EDUCATION, AGE, fill=mn_creditlmt)) + geom_tile() + scale_fill_gradient(low="white", high="steelblue")
