library(ggplot2)

# a)
mu <- 0
sigmas <- c(0.2, 0.5, 1, 2, 3)

ggplot() +
  geom_function(fun = dnorm,
                args = list(mean = mu, sd = sigmas[1]),
                aes(colour = "sd = 0.2")) +
  geom_function(fun = dnorm,
                args = list(mean = mu, sd = sigmas[2]),
                aes(colour = "sd = 0.5")) +
  geom_function(fun = dnorm,
                args = list(mean = mu, sd = sigmas[3]),
                aes(colour = "sd = 1")) +
  geom_function(fun = dnorm,
                args = list(mean = mu, sd = sigmas[4]),
                aes(colour = "sd =2")) +
  geom_function(fun = dnorm,
                args = list(mean = mu, sd = sigmas[5]),
                aes(colour = "sd = 3")) +
  labs(title = "Normal distributions with mean 0 and different standard deviations", y = "Density") +
  xlim(-5, 5)

# b)
n <- 10000
lambda <- 50

set.seed(0)
poisson_sample <- rpois(n = n, lambda = lambda)

ggplot(data = data.frame(x = poisson_sample), mapping = aes(x = x)) + geom_histogram(aes(y = after_stat(density)),
                                                                                     binwidth = 1,
                                                                                     colour = "black") + geom_function(
                                                                                       fun = dnorm,
                                                                                       args = list(
                                                                                         mean = mean(poisson_sample),
                                                                                         sd = sd(poisson_sample)
                                                                                       ),
                                                                                       colour =  "red"
                                                                                     ) + labs(title = "Poisson distribution approximated with the normal distribution", y = "Density")
