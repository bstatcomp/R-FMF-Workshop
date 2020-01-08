n <- 20
x <- 2.7
m <- n
my_flag <- TRUE
student_name <- "Luke"

typeof(n)

n2 <- as.integer(n)
as.character(n)

some_date <- as.Date("2020-01-01", format = "%Y-%m-%d")
some_date

n + x
n - x
n / x
n * x
n^2
n^4

my_diff <- n - x
my_diff

# logicne operacije
n == n
is_same <- n == n

n == x
n != n
n > x
n < x
n >= x

# strings
paste(student_name, "je star", n, "let.")

# vector
student_ages  <- c(20, 23, 21)
student_names <- c("Luke", "Jen", "Mike")
passed        <- c(TRUE, TRUE, FALSE)

student_ages[2]
student_ages[c(1,3)]
student_ages[c(3,1)]

c(student_ages, 22)
c(student_ages, student_ages)

length(student_ages)

# racunanje z vektorji
a <- c(1, 3, 5)
b <- c(2, 2, 1)
d <- c(6, 7)

a + b
a + d

a + 2
2 * a + b

a %*% b

a > b

# dostop do elementov
a[1]
a[c(1,3)]

a[c(TRUE, FALSE, TRUE)]

a[a < 5]

a <- c(2, 6, 3, 7, 3, 1, 5)

(a < 3) | (a > 5)
(a > 3) & (a <= 5)
a[(a > 3) & (a <= 5)]


# faktorji
car_brand <- factor(c("Audi", "BMW", "Mercedes", "Audi"),
                    ordered = FALSE)
car_brand

car_brand[5] <- "Renault"
car_brand

freq <- factor(x = NA,
               levels = c("never", "rarely", "sometimes", "often", "always"),
               ordered = T)
freq[1:3] <- c("rarely", "sometimes", "often")
freq


# matrike
my_matrix <- matrix(c(1,2,1,
                      5,4,2),
                    nrow = 2,
                    byrow = TRUE)
my_matrix

my_square_matrix <- matrix(c(1,3,
                             2,3),
                           nrow = 2)
my_square_matrix

my_matrix[1,1]
my_matrix[2,3]
my_matrix[1,c(2,3)]
my_matrix[2, ]
my_matrix[ ,3]
my_matrix[ ,c(1,3)]

my_matrix + 1
my_matrix + my_matrix

dim(my_matrix)
t(my_matrix)
diag(my_square_matrix)
diag(my_matrix)

diag(c(1,5,3))

my_matrix %*% my_square_matrix

t(my_matrix) %*% my_square_matrix

my_matrix * my_matrix


# razpredelnice
c("ime", 6, TRUE)
c(6, TRUE)

student_data <- data.frame("Name" = student_names,
                           "Age"  = student_ages,
                           "Pass" = passed,
                           stringsAsFactors = F)
student_data

student_data[1, ]
student_data[ ,3]

student_data[ ,"Name"]
student_data[ ,c("Name", "Age")]

student_data[student_data[ ,"Pass"] == T, ]
student_data[ ,"Name"]
student_data$Name

student_data[student_data$Pass == T, ]


# Seznami
first_list <- list("student_data" = student_data,
                   "x"  = 2,
                   "names" = student_names)
first_list
first_list$student_data
first_list[[1]]
first_list[[3]]
first_list[[4]] <- c(2,4)
first_list[[4]]

# branje podatkov
claim_data <- read.csv(file = "./data/insurance01.csv")
head(claim_data)

claim_data <- read.csv2(file = "./data/insurance02.csv")
head(claim_data)

# RDS
save_this <- list("data" = claim_data,
                  "student_data" = student_data)
saveRDS(save_this, "./RDS_files/my_save.rds")
load_this <- readRDS("./RDS_files/my_save.rds")
load_this[[2]]


# if
x <- 5
if (x < 0) {
  print("x is smaller than 0")
} else if (x == 0) {
  print("x is equal to 0")
} else {
  print("x is greater than 0")
}

# zanke
my_sum <- 0
1:10
for (i in 1:10) {
  my_sum <- my_sum + i
}
my_sum

my_sum <- 0
some_numbers <- c(2, 3.5, 6, 100)
for (i in some_numbers) {
  my_sum <- my_sum + i
  
}
my_sum

# funkcij
sum(1:10)
sum(some_numbers)

rep(c(3,5), times = 5)
seq(-2, 3, by = 0.1)

summary(student_data)


# pisanje funkcij
n <- 10
sum(1:n)
sum_first_n_elements <- function (n) {
  my_sum <- 0
  for (i in 1:n) {
    my_sum <- my_sum + i
  }
  return (my_sum)
}
sum_first_n_elements(10)
my_sum <- sum_first_n_elements(10)
my_sum

source("test_fun.R")
test_fun(10)


set.seed(1)
x <- rnorm(n = 100, mean = 2, sd = 4)


# manipulacija podatkov
head(claim_data)
student_names
student_names[c(3,1)]

x <- c(5, 2, 4, 3, 1)
order(x)

x[order(x)]

ordered_df <- claim_data[order(claim_data$age), ]
head(ordered_df)

ordered_df <- claim_data[order(claim_data$age,
                               claim_data$charges), ]

new_df <- ordered_df
new_df$charges_per_person <- claim_data$charges / 
                              (1 + claim_data$children)
head(new_df)

df1 <- new_df[ ,c("age", "sex")]
df2 <- new_df[ ,c("charges", "smoker")]

binded_df <- cbind(df1, df2)

head(claim_data)
mean(claim_data$charges)

agg_claim_df <- aggregate(claim_data$charges,
                          by = list(claim_data$smoker, 
                                    claim_data$region),
                          FUN = mean)
agg_claim_df

# wide/long
library(tidyr)
stock_df <- readRDS("./data/stocks.rds")

long_df <- gather(stock_df, key = "stock", 
                  value = "value",
                  - time)
head(long_df)

wide_df <- spread(long_df, key = "stock", value = "value")
head(wide_df)


# vizualizacija
library(ggplot2)
df_dax <- long_df[long_df$stock == "X.DAX", ]
ggplot(data = df_dax, mapping = aes(x = time, y = value)) +
  geom_line() +
  coord_cartesian(ylim = c(0, 6500))

ggplot(data = long_df, mapping = aes(x = time, 
                                     y = value, 
                                     color = stock)) +
  geom_line() +
  coord_cartesian(ylim = c(0, 8100)) +
  theme_bw()

ggplot(data = long_df, mapping = aes(x = time, 
                                     y = value)) +
  geom_line() +
  coord_cartesian(ylim = c(0, 8100)) +
  theme_bw() +
  facet_wrap(~ stock, scales = "free")

# scatterplot
movies_df <- read.csv2("./data/movies.csv")
head(movies_df)

ggplot(movies_df, aes(x = budget, y = rating)) +
  geom_point(alpha = 0.2) +
  coord_cartesian(ylim = c(0,10)) +
  ggtitle("Ratings of movies based on budget") +
  geom_smooth(method = "lm")
