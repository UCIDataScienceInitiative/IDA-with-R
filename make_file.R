files_to_render <- fs::dir_ls(glob = "*.Rmd")

my_render <- function(x, d) {
  rmarkdown::render(here::here(x), 
                    params = list(reportdate=d)) 
}

purrr::walk(files_to_render, my_render, d="March 2, 2017")  # loop over all .Rmd files & render
