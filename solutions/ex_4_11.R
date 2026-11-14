library(ggplot2)

ggplot() +
  geom_function(fun = pgamma,
                args = list(shape = 1, rate = 1),
                aes(color = "Gamma(1, 1)")) +
  geom_function(fun = pgamma,
                args = list(shape = 10, rate = 1),
                aes(color = "Gamma(10, 1)")) +
  geom_function(fun = pgamma,
                args = list(shape = 1, rate = 10),
                aes(color = "Gamma(1, 10)")) +
  labs(title = "Gamma CDF for different shape and rate parameters", y = "F") +
  xlim(0, 25)
