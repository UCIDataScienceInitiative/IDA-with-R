# grab all .Rmd files in workind directory
files_to_render <- fs::dir_ls(path = here::here("slides"),
                              glob = "*.Rmd", 
                              recursive = TRUE)
stopifnot(length(files_to_render) >= 1)

# function to render .Rmd files to html that accepts date variable
my_render <- function(x, d) {
  rmarkdown::render(x, 
                    params = list(reportdate=d)) 
}

# loop over all .Rmd files & render with my function
purrr::walk(files_to_render, my_render, d="March 2, 2017")  
