library(ggplot2)

# a)
ggplot() +
  geom_function(fun = dbeta,
                args = list(shape1 = 2, shape2 = 2),
                aes(colour = "Beta(2, 2)")) +
  geom_function(fun = dbeta,
                args = list(shape1 = 4, shape2 = 1),
                aes(colour = "Beta(4, 1)")) +
  geom_function(fun = dbeta,
                args = list(shape1 = 1, shape2 = 4),
                aes(colour = "Beta(1, 4)")) +
  geom_function(fun = dbeta,
                args = list(shape1 = 2, shape2 = 5),
                aes(colour = "Beta(2, 5)")) +
  geom_function(
    fun = dbeta,
    args = list(shape1 = 0.1, shape2 = 0.1),
    aes(colour = "Beta(0.1, 0.1)")
  ) +
  labs(title = "Beta distribution PDFs for different values of parameters", y = "Density") +
  xlim(0, 1)

# b)
n <- 1000

set.seed(0)
beta_samples <- rbeta(n = n, shape1 = 2, shape2 = 5)

ggplot(data = data.frame(x = beta_samples), mapping = aes(x = x)) + geom_histogram(aes(y = after_stat(density)), colour = "black", bins = 50) + geom_function(fun = dbeta, args = list(shape1 = 2, shape2 = 5), colour = "red") + xlim(0, 1) + labs(title = "Samples from Beta(2, 5) compared with the theoretical PDF", y = "Density")
