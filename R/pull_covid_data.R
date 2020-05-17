library(data.table)
library(ggplot2)

# 1. Pull data from NSW COVID-19 cases by location and likely source of infection
dt <- fread("https://data.nsw.gov.au/data/dataset/97ea2424-abaf-4f3e-a9f2-b5c883f42b6a/resource/2776dbb8-f807-4fb2-b1ed-184a6fc2c8aa/download/covid-19-cases-by-notification-date-location-and-likely-source-of-infection.csv")

# Prep data
dt[, notification_date := lubridate::ymd(notification_date)]
dt[likely_source_of_infection == "Overseas", 
   Inf_Source := "Overseas"]
dt[is.na(Inf_Source), Inf_Source := "Domestic"]

# 2. Graph of cases over time
ggplot(dt, aes(x = notification_date, fill = Inf_Source)) +
  geom_bar() +
  labs(x = "Date Reported", y = "Number of Cases", fill = "Infection Source*") +
  ggtitle("NSW Covid-19 Cases", ) +
  theme_bw() +
  theme(plot.title = element_text(hjust = 0.5))

