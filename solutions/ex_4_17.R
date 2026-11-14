library(ggplot2)

n <- 1000
mu <- 0.5
sigma <- 0.4

set.seed(0)
lognorm_samples <- rlnorm(n = n, meanlog = mu, sdlog = sigma)

ggplot(data = data.frame(x = lognorm_samples), aes(x = x)) + geom_histogram(aes(y = after_stat(density)), colour = "black") + labs(title = "Samples from the lognormal distribution")

transformed_samples <- log(lognorm_samples)

ggplot(data = data.frame(x = transformed_samples), aes(x = x)) + geom_histogram(aes(y = after_stat(density)), colour = "black") + geom_function(
  fun = dnorm,
  args = list(mean = mu, sd = sigma),
  colour = "red"
) + labs(title = "Log-transformed samples from the lognormal distribution")
