install.packages("tidyverse")
library(tidyverse)
top_songs <- read_csv("top_songs_2025.csv")
glimpse(top_songs)
head(top_songs)
summary(top_songs)
=colnames(top_songs)

ggplot(top_songs, aes(x = streams_2025_billions)) + 
  geom_histogram(binwidth = 0.5, fill = "steelblue", color = "black") +
  theme_minimal()

ggplot(top_songs, aes (x = danceability)) + 
  geom_histogram(binwidth = 0.05, fill = "darkgreen", color = "black")+
  theme_minimal()

top_songs %>% 
  select(danceability, energy, valence, acousticness, streams_2025_billions) %>%
  cor()

ggplot(top_songs, aes(x = energy, y = streams_2025_billions)) +
  geom_point(color = "firebrick", size = 3, alpha = 0.6) +
  theme_minimal()

ggplot(top_songs, aes(x = danceability, y = streams_2025_billions)) +
  geom_point(color = "purple", size = 3, alpha = 0.6) +
  theme_minimal()

top_songs %>% 
  group_by(primary_genre) %>% 
  summarise(avg_streams = mean(streams_2025_billions), count = n()) %>%
  arrange(desc(avg_streams))

ggplot(top_songs, aes(x = streams_2025_billions)) +
  geom_histogram(binwidth = 0.5, fill = "steelblue", color = "black") +
  theme_minimal() +
  labs(
    title = "Distribution of Streams",
    x = "Streams (Billions)",
    y = "Count"
  )