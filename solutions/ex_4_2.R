library(ggplot2)
library(dplyr)

cdf <- function(x, p) {
  case_when(
    x < 0 ~ 0,
    x < 1 ~ x^2 / 2,
    x < 2 ~ 1 / 2 + p / 2,
    TRUE  ~ 1
  )
}

ggplot() +
  geom_function(fun = cdf, args = list(p = 0.3), n = 1000) +
  xlim(-1, 3) +
  theme_minimal() +
  labs(
    y="F(x)"
  )
