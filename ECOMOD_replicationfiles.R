

# 加载必要的包
install.packages("MatchIt")
install.packages("tidyverse")


library("MatchIt")
library("tidyverse")

# 读入数据
data <- read.csv("C:/Users/x/Downloads/dataset.csv")

# 进行倾向得分匹配
psmodel <- glm(child_adversity ~ marriage + lnage + edu1 + sex + left_home + vaccination + forwent_treatment + financial_support + region, data = data, family = binomial)
pscore <- predict(psmodel, type = "response")
matched_data <- matchit(child_adversity ~ marriage + lnage + edu1 + sex + left_home + vaccination + forwent_treatment + financial_support + region, data = data, method = "nearest", distance = "logit", caliper = 0.2, ratio = 1, replace = FALSE)

# 对得到的匹配样本进行回归分析
logitmodel <- glm(depress ~ adversity + marriage + lnage + edu1 + sex + left_home + vaccination + forwent_treatment + financial_support + region, data = matched_data, family = binomial)
psmmodel <- glm(depress ~ adversity + matched_data$distance + marriage + lnage + edu1 + sex + left_home + vaccination + forwent_treatment + financial_support + region, data = matched_data, family = binomial)

# 输出结果
summary(logitmodel)
summary(psmmodel)
