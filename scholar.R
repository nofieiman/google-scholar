# Utilizing scholar R package
# https://github.com/jkeirstead/scholar

# Install and load required packages
install.packages(c("scholar", "ggplot2", "dplyr", "tidyr"))
library(scholar)
library(ggplot2)
library(dplyr)
library(tidyr)

# Define scholar IDs (You should replace this!)
userid_1 <- 'mPNYzWMAAAAJ' # Nofie Iman
userid_2 <- '4JyFfhQAAAAJ' # Mahfud Sholihin
ids <- c(userid_1, userid_2)

# Get scholar name
name_1 <- get_profile(userid_1)$name
name_2 <- get_profile(userid_2)$name

# Get his/her citation history, i.e. citations to his/her work in a given year 
get_citation_history(userid_1)
get_citation_history(userid_2)

# Get his/her publications (a large data frame)
get_publications(userid_1)
get_publications(userid_2)

# Year-by-year publications for userid_1 (You may replace it with userid_2)
publications <- get_publications(userid_1) 

pub_counts <- publications %>%
  mutate(
    year = as.numeric(year),
    # Handle invalid years (like 9999 or NA)
    year = if_else(year > as.numeric(format(Sys.Date(), "%Y")) | 
                     year < 1900, 
                   NA_real_, year)
  ) %>%
  filter(!is.na(year)) %>%
  count(year, name = "count") %>%
  complete(
    year = seq(min(year), max(year), by = 1),
    fill = list(count = 0)
  )

ggplot(pub_counts, aes(x = year, y = count)) +
  geom_col(fill = "#2b8cbe", alpha = 0.8, width = 0.7) +
  geom_text(aes(label = ifelse(count > 0, count, "")), 
            vjust = -0.5, size = 3.2, color = "black") +
  scale_x_continuous(
    breaks = seq(min(pub_counts$year), max(pub_counts$year), by = 1),
    expand = c(0.02, 0.02)
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.1))) +
  labs(
    title = paste("Annual Publications for", name_1),
    subtitle = paste("Google Scholar profile:", userid_1),
    x = "Year",
    y = "Number of Publications",
    caption = "Data extracted via scholar R package"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    plot.subtitle = element_text(hjust = 0.5, size = 10),
    axis.text.x = element_text(angle = 45, hjust = 1, size = 10),
    panel.grid.major.x = element_blank(),
    plot.caption = element_text(color = "gray50", size = 8)
  )

# Get a data frame comparing the number of citations to their work in
# a given year 
compare_scholars(ids)

# Compare their career trajectories, based on year of first citation
compare_scholar_careers(ids)

# Get comparison data
comparison <- compare_scholars(ids)

# Plot with dynamic naming
ggplot(comparison, aes(x = year, y = cites, color = id, group = id)) +
  geom_line(linewidth = 1) +
  geom_point(size = 3) +
  scale_color_manual(
    values = c("#1f77b4", "#ff7f0e"),  # Professional color palette
    labels = c(name_1, name_2)          # Auto-map IDs to names
  ) +
  labs(
    title = "Annual Citation Comparison",
    subtitle = "Data sourced from Google Scholar",
    x = "Year", 
    y = "Citations",
    color = "Researcher"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    plot.subtitle = element_text(hjust = 0.5)
  )

# Career Trajectory Plot
career_data <- compare_scholar_careers(ids)

ggplot(career_data, aes(x = career_year, y = cites, color = id)) +
  geom_line(linewidth = 1) +
  scale_color_manual(
    values = c("blue", "red"),
    labels = c(name_1, name_2)  # Dynamic name mapping
  ) +
  labs(title = "Career Trajectory Comparison")