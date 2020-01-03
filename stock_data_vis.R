library(tidyr)
library(ggplot2)

df <- datasets::EuStockMarkets
head(df)

stock_df <- data.frame(X = as.matrix(df), time = time(df))

df_long <- gather(stock_df, key = "stock", value = "price", -time)

df_dax <- df_long[df_long$stock == "X.DAX", ]
# ggplot(data = df_dax, aes(x = time, y = price)) +
#   geom_point()

ggplot(data = df_dax, aes(x = time, y = price)) +
  geom_line()


ggplot(df_long, aes(x = time, y = price, color = stock)) +
  geom_line()

ggplot(df_long, aes(x = time, y = price, color = stock)) +
  geom_line() +
  ylim(c(0, 9000))

ggplot(df_long, aes(x = time, y = price)) +
  geom_line() +
  facet_wrap(~stock)

ggplot(df_long, aes(x = time, y = price)) +
  geom_line() +
  facet_wrap(~stock, scales = "free")

df_1994 <- df_long[df_long$time <= 1994, ]
ggplot(df_1994, aes(x = time, y = price)) +
  geom_line() +
  facet_wrap(~stock, scales = "free")

ggplot(df_1994, aes(x = time, y = price)) +
  geom_line() +
  facet_wrap(~stock) +
  ylim(c(0, 3500))



ggplot(df_long, aes(x = stock, y = price)) +
  geom_boxplot()
