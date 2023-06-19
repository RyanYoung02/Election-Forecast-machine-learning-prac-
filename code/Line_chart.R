library(ggplot2)


ggplot(polls_reformatted, aes(x = modeldate)) +
    geom_line(aes(y = Trump_poll, color = "Trump")) +
    geom_line(aes(y = Clinton_poll, color = "Clinton")) +
    labs(x = "Date", y = "Polling Support", color = "Candidate") +
    scale_color_manual(values = c("Trump" = "red", "Clinton" = "blue")) +
    theme_minimal()
