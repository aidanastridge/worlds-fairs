library(tidyverse)
library(cowplot)

worlds_fairs <- read_csv(
  'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2024/2024-08-13/worlds_fairs.csv'
)

p1 <- ggplot(worlds_fairs) + geom_point(aes(
  x = visitors,
  y = area,
  color = "#ffbe78"
)) + scale_y_continuous(position = "right") + labs(y = "Area in Hectatres", x = "") +
  theme(
    axis.title.x = element_blank(),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    panel.background = element_rect(fill = "#fce5cc"),
    panel.grid = element_blank(),
    legend.position = "none",
    plot.background = element_rect(fill = "#fce5cc", , color = "#fce5cc"),
    axis.title.y = element_text(color = "#402003", size = 8),
    axis.text.y = element_text(color = "#402003")
  )

p2 <- ggplot(worlds_fairs) + geom_point(aes(
  x = visitors,
  y = attending_countries,
  color = "#ffbe78"
)) + labs(y = "Countries", x = "") + theme(
  axis.title.x = element_blank(),
  axis.text.x =
    element_blank(),
  axis.ticks.x =
    element_blank(),
  panel.background = element_rect(fill = "#fce5cc"),
  plot.background = element_rect(fill = "#fce5cc", color = "#fce5cc"),
  panel.grid = element_blank(),
  legend.position = "none",
  axis.title.y = element_text(color = "#402003", size = 8),
  axis.text.y = element_text(color = "#402003")
)

p3 <- ggplot(worlds_fairs) + geom_point(aes(
  x = visitors,
  y = cost,
  color = "#ffbe78"
)) + labs(x = "", y = "Cost in Millions") + scale_y_continuous(position = "right") + theme(
  panel.background = element_rect(fill = "#fce5cc"),
  panel.grid = element_blank(),
  legend.position = "none",
  plot.background = element_rect(fill = "#fce5cc", color = "#fce5cc"),
  axis.title.x = element_text(size = 8, angle = 0)
  ,
  axis.title.y = element_text(color = "#402003", size = 8),
  axis.text.x = element_text(color = "#402003")
)

plot_grid(p1, p2, p3, ncol = 1, align = 'v') + ggtitle("World's Fair Visitor's:\nArea, Countries, and Cost") +
    theme(plot.title = element_text(color = "#402003", size = 20, face = "bold", family = "sans", margin=margin(0,0,30,0)),
          plot.background = element_rect(fill = "#fce5cc", color = "#fce5cc"), plot.margin = margin(1, 1, 1, 1, "cm")
          )
