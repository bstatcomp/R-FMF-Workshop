## ----setup, include=FALSE------------------------------------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## ---- eval=FALSE---------------------------------------------------------------------------------------------------
## setwd("C:/Author")


## ---- error=TRUE---------------------------------------------------------------------------------------------------
n            <- 20
x            <- 2.7
m            <- n # m gets value 20
my_flag      <- TRUE
student_name <- "Luke"
student_name <- Luke # because there is no variable named Luke, it returns an error


## ------------------------------------------------------------------------------------------------------------------
typeof(n)
typeof(student_name)
typeof(my_flag)


## ---- error=TRUE---------------------------------------------------------------------------------------------------
typeof(as.integer(n))
typeof(as.character(n))


## ---- error=TRUE---------------------------------------------------------------------------------------------------
some_date <- as.Date("2019-01-01", format = "%Y-%m-%d")
some_date


## ----error=TRUE----------------------------------------------------------------------------------------------------
n
m
my_flag
student_name


## ------------------------------------------------------------------------------------------------------------------
n + x
n - x
diff <- n - x # variable diff gets the difference between n and x
diff
n * x
n / x
x^2
sqrt(x)
n > 2 * n # logical is greater
n == n # equals
n == 2 * n
n != n # not equals


## ------------------------------------------------------------------------------------------------------------------
paste(student_name, "is", n, "years old")
paste0(student_name, "is", n, "years old")
L_username <- paste0(student_name, n)


## ------------------------------------------------------------------------------------------------------------------
# ?paste
paste(student_name, "is", n, "years_old", sep = "_")


## ------------------------------------------------------------------------------------------------------------------
student_ages  <- c(20, 23, 21)
student_names <- c("Luke", "Jen", "Mike")
passed        <- c(TRUE, TRUE, FALSE)


## ------------------------------------------------------------------------------------------------------------------
student_ages[2]
student_names[2]
passed[2]


## ------------------------------------------------------------------------------------------------------------------
length(student_names)


## ----error = TRUE--------------------------------------------------------------------------------------------------
a <- c(1, 3, 5)
b <- c(2, 2, 1)
d <- c(6, 7)
a + b
a * b
a + d # not the same length, d becomes (6, 7, 6)
a + 2 * b
a %*% b # scalar product
a > b # logical relations between elements
b == a


## ----error = TRUE--------------------------------------------------------------------------------------------------
a[c(TRUE, TRUE, FALSE)] # selection based on logical vector
a[c(1,2)] # selection based on indexes
a[a < 5] # selection based on logical condition


## ----error = TRUE--------------------------------------------------------------------------------------------------
a[a > 2 & a < 4]
a[a < 2 | a > 4]


## ----error = TRUE--------------------------------------------------------------------------------------------------
car_brand <- factor(c("Audi", "BMW", "Mercedes", "BMW"), ordered = FALSE)
car_brand
freq      <- factor(x       = NA,
                    levels  = c("never","rarely","sometimes","often","always"),
                    ordered = TRUE)
freq[1:3] <- c("rarely", "sometimes", "rarely")
freq
freq[4]   <- "quite_often" # non-existing level, returns NA
freq


## ------------------------------------------------------------------------------------------------------------------
my_matrix <- matrix(c(1, 2, 1,
                      5, 4, 2),
                    nrow  = 2,
                    byrow = TRUE)
my_matrix
my_square_matrix <- matrix(c(1, 3,
                             2, 3),
                           nrow  = 2)
my_square_matrix


## ------------------------------------------------------------------------------------------------------------------
my_matrix[1,2] # first row, second column
my_matrix[2, ] # second row
my_matrix[ ,3] # third column


## ------------------------------------------------------------------------------------------------------------------
nrow(my_matrix) # number of matrix rows
ncol(my_matrix) # number of matrix columns
dim(my_matrix) # matrix dimension
t(my_matrix) # transpose
diag(my_matrix) # the diagonal of the matrix as vector
diag(1, nrow = 3) # creates a diagonal matrix
det(my_square_matrix) # matrix determinant


## ----error = TRUE--------------------------------------------------------------------------------------------------
my_matrix + 2 * my_matrix
my_matrix * my_matrix # element-wise multiplication
my_matrix %*% t(my_matrix) # matrix multiplication
my_square_matrix %*% my_matrix
my_matrix %*% my_square_matrix # wrong dimensions


## ----error = TRUE--------------------------------------------------------------------------------------------------
my_vec <- as.vector(my_matrix)
my_vec


## ------------------------------------------------------------------------------------------------------------------
my_array <- array(c(1, 2, 3, 4, 5, 6, 7, 8), dim = c(2, 2, 2))
my_array[1, 1, 1]
my_array[2, 2, 1]
my_array[1, , ]
dim(my_array)


## ------------------------------------------------------------------------------------------------------------------
student_data           <- data.frame(student_names, student_ages, passed,
                                     stringsAsFactors = FALSE)
colnames(student_data) <- c("Name", "Age", "Pass")
student_data


## ------------------------------------------------------------------------------------------------------------------
student_data <- data.frame("Name" = student_names, 
                           "Age"  = student_ages, 
                           "Pass" = passed)
student_data


## ------------------------------------------------------------------------------------------------------------------
student_data[ , c("Name", "Pass")]
student_data[student_data$Pass == TRUE, ]
student_data$Pass


## ------------------------------------------------------------------------------------------------------------------
first_list  <- list(student_ages, my_matrix, student_data)
second_list <- list(student_ages, my_matrix, student_data, first_list)


## ------------------------------------------------------------------------------------------------------------------
first_list[[1]]
second_list[[4]]
second_list[[4]][[1]] # first element of the fourth element of second_list


## ------------------------------------------------------------------------------------------------------------------
length(second_list)


## ------------------------------------------------------------------------------------------------------------------
second_list[[length(second_list) + 1]] <- "add_me"
second_list[[length(second_list)]] # check, what is on the last index


## ------------------------------------------------------------------------------------------------------------------
names(first_list) <- c("Age", "Matrix", "Data")
first_list$Age


## ----eval = FALSE--------------------------------------------------------------------------------------------------
## install.packages("car") # install package
## library(car) # load the package into workspace


## ----eval = FALSE--------------------------------------------------------------------------------------------------
## remove.packages("car")


## ------------------------------------------------------------------------------------------------------------------
library(utils)
claim_data <- read.csv("./data/insurance01.csv")
head(claim_data)


## ----eval = FALSE--------------------------------------------------------------------------------------------------
## claim_data <- read.csv("./data/insurance02.csv", sep = ";", dec = ",")


## ----eval = TRUE---------------------------------------------------------------------------------------------------
tmp_list <- list(df = claim_data, x = c(1,2))
saveRDS(tmp_list, "./RDS_files/my_saved_RDS.rds")
tmp_load <- readRDS("./RDS_files/my_saved_RDS.rds")
head(tmp_load$df)
tmp_load$x


## ------------------------------------------------------------------------------------------------------------------
x <- 5
if (x < 0) {
  print("x is smaller than 0")
} else if (x == 0) {
  print("x is 0")
} else {
  print("x is greater than 0")
}



## ------------------------------------------------------------------------------------------------------------------
my_sum <- 0
for (i in 1:10) { # 1:10 returns a vector of natural numbers between 1 and 10
  my_sum <- my_sum + i
}
my_sum


## ------------------------------------------------------------------------------------------------------------------
my_sum       <- 0
some_numbers <- c(2, 3.5, 6, 100)
for (i in some_numbers) {
  my_sum <- my_sum + i
}
my_sum


## ------------------------------------------------------------------------------------------------------------------
regions <- unique(claim_data$region) # returns unique values in region column
for (reg in regions) {
  tmp_data   <- claim_data[claim_data$region == reg, ]
  charges    <- tmp_data$charges
  print(paste0("Region: ", reg, 
               ", average charges: ", mean(charges)))
}


## ------------------------------------------------------------------------------------------------------------------
1:10 # special function that returns a sequence of numbers
sum(1:10) # sum of first 10 natural numbers
sum(c(3,5,6,3))
rep(1, times = 5) # returns a vector of lenght 5, where all values are 1
rep(c(1,2), times = 5) # returns a vector of length 5 where 1 and 2 are periodically changing
seq(0, 2, by = 0.5) # vector from 0 to 2, by adding 0.5
prod(1:10) # multiply first 10 numbers
round(5.24)
5^5 # square
sqrt(16) # square root
as.character(c(1,6,3)) # transforms a numerical vector to a character vector


## ------------------------------------------------------------------------------------------------------------------
summary(student_ages)
summary(student_names)
summary(passed)
summary(car_brand)
summary(freq)
summary(student_data) # summary of the whole data frame


## ------------------------------------------------------------------------------------------------------------------
sum_first_n_elements <- function (n) {
  my_sum <- 0
  for (i in 1:n) {
    my_sum <- my_sum + i
  }
  return (my_sum)
}
sum_first_n_elements(10)


## ------------------------------------------------------------------------------------------------------------------
get_transpose_and_det <- function (mat) {
  trans_mat <- t(mat)
  det_mat   <- det(mat)
  out       <- list("transposed"  = trans_mat,
                    "determinant" = det_mat)
  return (out)
}
mat_vals <- get_transpose_and_det(my_square_matrix)
mat_vals$transposed
mat_vals$determinant


## ------------------------------------------------------------------------------------------------------------------
set.seed(0)
norm_dat  <- rnorm(1000, 5, 6) # generate 1000 samples from the normal
                               # distribution with mean 5 and standard deviation 6
count_dat <- rpois(2000, 8) # generate 2000 samples from the Poisson
                            # distribution with mean 8
unif_dat  <- runif(1000, -2, 5) # generate 1000 samples from the uniform
                                # distribution form -2 to 5


## ------------------------------------------------------------------------------------------------------------------
mean(norm_dat)
var(norm_dat) # variance
sd(norm_dat) # standard deviation
max(norm_dat)
min(norm_dat)
quantile(norm_dat) # calculates 5 quantiles of the data


## ------------------------------------------------------------------------------------------------------------------
st_dat <- scale(norm_dat)
mean(st_dat)
var(st_dat)


## ------------------------------------------------------------------------------------------------------------------
claim_data <- read.csv("./data/insurance01.csv")
head(claim_data)

head(claim_data[order(claim_data$age), ])
head(claim_data[order(claim_data$age, claim_data$charges), ])


## ------------------------------------------------------------------------------------------------------------------
claim_data$charges_per_person <- claim_data$charges / (claim_data$children + 1)
head(claim_data)


## ------------------------------------------------------------------------------------------------------------------
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
head(claim_data)


## ------------------------------------------------------------------------------------------------------------------
cbind_data <- cbind(claim_data[ ,c("age", "sex")], claim_data[ ,c("charges", "charges_per_person")])
head(cbind_data)

rbind_data <- rbind(claim_data[1:2, ], claim_data[claim_data$age == "20", ])
head(rbind_data)


## ------------------------------------------------------------------------------------------------------------------
claim_data2    <- claim_data
agg_claim_data <- aggregate(claim_data$charges, by = list("smoker" = claim_data$smoker, "bmi" = claim_data$bmi_class), FUN = mean)
agg_claim_data



## ---- warning = FALSE----------------------------------------------------------------------------------------------
library(tidyr)
stock_df <- readRDS("./data/stocks.rds")
df_long  <- gather(stock_df, key = "stock", value = "price", -time)
head(df_long)
df_wide  <- spread(df_long, key = "stock", value = "price")
head(df_wide)


## ---- warning = FALSE----------------------------------------------------------------------------------------------
library(ggplot2)
df_dax <- df_long[df_long$stock == "X.DAX", ]
ggplot(data = df_dax, aes(x = time, y = price)) +
  geom_line()


## ---- warning = FALSE----------------------------------------------------------------------------------------------
df_sub <- df_dax[as.numeric(df_dax$time) > 1995.25 & as.numeric(df_dax$time) < 1995.75, ]
ggplot(data = df_sub, aes(x = time, y = price)) +
  geom_line()


## ---- warning = FALSE----------------------------------------------------------------------------------------------
df_sub <- df_dax[as.numeric(df_dax$time) > 1995.25 & as.numeric(df_dax$time) < 1995.75, ]
ggplot(data = df_sub, aes(x = time, y = price)) +
  geom_line() +
  coord_cartesian(ylim = c(0,2300))


## ---- warning = FALSE, message = FALSE-----------------------------------------------------------------------------
ggplot(data = df_long, aes(x = time, y = price, color = stock)) +
  geom_line() +
  coord_cartesian(ylim = c(0, 8100)) +
  ggtitle("Four stock prices from 1991 to 1999") +
  theme_bw()


## ---- warning = FALSE----------------------------------------------------------------------------------------------
ggplot(data = agg_claim_data, aes(x = bmi, y = x, fill = smoker)) +
  geom_col(position = "dodge")


## ---- warning = FALSE----------------------------------------------------------------------------------------------
ggplot(data = agg_claim_data, aes(x = bmi, y = x)) +
  geom_col(position = "dodge") +
  facet_wrap(~ smoker)


## ---- warning = FALSE----------------------------------------------------------------------------------------------
agg_claim_data2 <- aggregate(claim_data2$charges, by = list("smoker" = claim_data2$smoker, "bmi" = claim_data2$bmi_class, "sex" = claim_data2$sex), FUN = mean)
ggplot(data = agg_claim_data2, aes(x = bmi, y = x)) +
  geom_col() +
  facet_wrap(sex ~ smoker)


## ---- warning = FALSE----------------------------------------------------------------------------------------------
tmp_data <- claim_data2[claim_data2$smoker == "no" & claim_data2$bmi_class %in% c("normal", "overweight"), ]
agg_tmp_data <- aggregate(tmp_data$charges, by = list("bmi" = tmp_data$bmi_class), FUN = mean)
ggplot(data = agg_tmp_data, aes(x = bmi, y = x)) +
  geom_col() +
  coord_cartesian(ylim = c(7650, 8700)) +
  labs(y = "charges")


## ---- warning = FALSE----------------------------------------------------------------------------------------------
ggplot(data = claim_data2, aes(x = bmi_class, y = charges)) +
  geom_boxplot() +
  facet_wrap(sex ~ smoker)


## ---- warning = FALSE----------------------------------------------------------------------------------------------
ggplot(data = claim_data2, aes(x = charges, fill = smoker)) +
  geom_density(alpha = 0.2)

ggplot(data = claim_data2, aes(x = charges, fill = smoker)) +
  geom_histogram(position = "dodge")


## ---- warning = FALSE----------------------------------------------------------------------------------------------
movies_df <- read.csv2("./data/movies.csv")
head(movies_df)


## ---- warning = FALSE----------------------------------------------------------------------------------------------
ggplot(data = movies_df, aes(x = budget, y = rating)) +
  geom_point()


## ---- warning = FALSE----------------------------------------------------------------------------------------------
ggplot(data = movies_df, aes(x = budget, y = rating)) +
  geom_point(alpha = 0.2) +
  ggtitle("Ratings of movies based on budget") +
  scale_x_continuous(breaks = c(seq(from = 0, to = 200000000, by = 10000000))) +
  coord_cartesian(ylim = c(0, 10))


## ---- warning = FALSE----------------------------------------------------------------------------------------------
ggplot(data = movies_df, aes(x = budget, y = rating)) +
  geom_point(alpha = 0.2) +
  ggtitle("Ratings of movies based on budget") +
  scale_x_continuous(breaks = c(seq(from = 0, to = 200000000, by = 10000000))) +
  coord_cartesian(ylim = c(0, 10)) +
  theme(axis.text.x = element_text(angle = 90)) +
  geom_smooth(method = "lm")

