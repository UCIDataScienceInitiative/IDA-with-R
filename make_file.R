# grab all .Rmd files in workind directory
files_to_render <- fs::dir_ls(glob = "*.Rmd")
stopifnot(length(files_to_render) >= 1)

# function to render .Rmd files to html that accepts date variable
my_render <- function(x, d) {
  rmarkdown::render(here::here(x), 
                    params = list(reportdate=d)) 
}

# loop over all .Rmd files & render with my function
purrr::walk(files_to_render, my_render, d="March 2, 2017")  
