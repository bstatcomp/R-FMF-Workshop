setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

claim_data <- read.csv("./summeRworkshop-master/data/insurance01.csv")
claim_data$charges_per_person <- claim_data$charges / (claim_data$children + 1)

classify_bmi <- function (bmi) {
  bmi_classes <- rep("underweight", times = length(bmi))
  bmi_classes[bmi >= 18.5 & bmi < 25] <- "normal"
  bmi_classes[bmi >= 25]              <- "overweight"
  bmi_classes <- factor(bmi_classes, levels = c("underweight", 
                                                "normal", 
                                                "overweight"),
                        ordered = TRUE)
  return(bmi_classes)
}

claim_data$bmi_class <- classify_bmi(claim_data$bmi)

agg_data <- aggregate(claim_data$charges, by = list("smoker" = claim_data$smoker, "bmi" = claim_data$bmi_class), FUN = mean)
agg_data

few_data <- agg_data[agg_data$smoker == "yes" & agg_data$bmi %in% c("underweight", "normal"), ]

ggplot(data = few_data, aes(x = bmi, y = x)) +
  geom_col() +
  coord_cartesian(ylim = c(18500, 20000))

ggplot(data = agg_data, aes(x = bmi, y = x)) +
  geom_col() +
  facet_wrap(~smoker)


ggplot(data = claim_data, aes(x = charges, fill = smoker)) +
  geom_histogram(position = "dodge")

ggplot(data = claim_data, aes(x = charges, fill = smoker)) +
  geom_density(alpha = 0.5)

ggplot(data = claim_data, aes(x = charges, fill = bmi_class)) +
  geom_histogram(position = "dodge")
