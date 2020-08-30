library(rmarkdown)
render(input = "./vignettes/pagemap.Rmd",
       output_file = "../docs/index.html")
render(
  input = "./vignettes/pagemap.Rmd",
  output_file = "../README.md",
  output_format = md_document("markdown_github", pandoc_args = "--wrap=preserve")
)
