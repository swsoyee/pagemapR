library(rmarkdown)

#' Generate `pagemap` hex sticker
#'
#' @param run default is set to \code{FALSE}, do not re-generate sticker
render_sticker <- function(run = FALSE) {
  if (run) {
    library(hexSticker)
    library(showtext)
    library(ggplot2)
    font_add_google("Rubik")

    icon_data <- data.frame(
      x1 = c(1,  6,   1,   1,   5,   5,   5,   5,   5),
      x2 = c(8,  8,   5.5, 4.5, 8,   8,   8,   8,   8),
      y1 = c(9,  6,   6,   1,   5,   4,   3,   2,   1),
      y2 = c(10, 8.5, 8.5, 5.5, 5.5, 4.5, 3.5, 2.5, 1.5),
      t = c('1', '2', '1', '2', '3', '3', '3', '3', '3')
    )

    p <- ggplot() +
      scale_x_continuous(name = "x") +
      scale_y_continuous(name = "y") +
      geom_rect(
        data = icon_data,
        mapping = aes(
          xmin = x1,
          xmax = x2,
          ymin = y1,
          ymax = y2,
          fill = t
        ),
        alpha = 0.5,
        show.legend = FALSE
      ) +
      scale_fill_manual(values = c("#999999", "#666666", "#333333")) +
      theme_void() +
      theme_transparent()

    sticker(
      p,
      package = "pagemap",
      p_size = 9,
      p_y = 1.3,
      p_color = rgb(0, 0, 0, 0.8),
      p_family = "Rubik",
      h_size = 1.5,
      h_fill = rgb(0, 0, 0, 0.1),
      h_color = rgb(0, 0, 0, 0.5),
      s_x = 1,
      s_y = 0.9,
      s_width = 1.3,
      s_height = 1,
      filename = "./vignettes/pagemap.png"
    )
    message("Re-generate hex sticker.")
  } else {
    message("Pass step of re-generate hex sticker.")
  }
}

# ==== Generate hex sticker ====
render_sticker(run = FALSE)

# ==== Render index.html ====
render(input = "./vignettes/pagemap.Rmd",
       output_file = "../docs/index.html")

# ==== Render README.md ====
render(
  input = "./vignettes/pagemap.Rmd",
  output_file = "../README.md",
  output_format = md_document("markdown_github", pandoc_args = "--wrap=preserve")
)
