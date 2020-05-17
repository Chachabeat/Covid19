library(data.table)
library(ggplot2)

# 1. Pull ASX 200 data
asx <- fread("https://query1.finance.yahoo.com/v7/finance/download/%5EAXJO?period1=1558079247&period2=1589701647&interval=1d&events=history")

# Prep data
asx[, Date := lubridate::ymd(Date)]

# 2. Graph ASX 200 over time
ggplot(asx[Date >= "2020-01-16"], aes(x = Date, y = `Adj Close`)) +
  geom_line() +
  labs(title = "ASX 200 Closing Price") +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))


## test graph
library(cowplot)
plot_grid(a, b, ncol = 1)
