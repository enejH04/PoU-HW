library(ggplot2)

set.seed(0)

n <- 10
p <- 0.5
samples <- 1000

# Samples from the binomial distribution
binomial_samples <- rbinom(n = samples, size = n, prob = p)

# Sample from uniform -> cutoff -> sum
sum_of_bernoullis <- (matrix(runif(n = n * samples), nrow = samples, ncol = n) < p) |> rowSums()

df <- data.frame(x = c(binomial_samples, sum_of_bernoullis),
                 type = c(rep("binomial", samples), rep("bernoulli_sum", samples)))

# Compute proportions based on groups
ggplot(df, mapping = aes(x = x, fill = type)) + geom_bar(aes(y = after_stat(prop), group = type), position = "dodge") + theme_minimal() + xlim(-1, 11) + scale_x_continuous(breaks = 0:10)
