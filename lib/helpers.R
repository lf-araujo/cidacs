## dep() is a three liner that helps installing/loading packages
## This is important to avoid breaking packages during the analyses
dep <- function(x) {
  ifelse(!all(x %in% installed.packages()),
    install.packages(x[x %in% installed.packages()[, "Package"] == F],
      repos = "http://cran.us.r-project.org"
    ),
    lapply(x, require, character.only = T)
  )
}

pclean <- function() {
  print("Hey! Cleaning files at src folder, look in reports for them.")
  for (i in list.files("./src")) {
    if (grepl(i, pattern = ".html$")) {
      file.rename(from = paste0("src/", i), to = paste0("./reports/",
                                    format(Sys.Date(), "%Y-%m-%d"), "-", i))
    } else if (grepl(i, pattern = "\\.md$")) {
      file.rename(from = paste0("src/", i), to = paste0("./reports/",
                                      format(Sys.Date(), "%Y-%m-%d"), "-", i))
    } else if (grepl(i, pattern = "\\.docx$")) {
      file.rename(from = paste0("src/", i), to = paste0("./reports/",
                                    format(Sys.Date(),   "%Y-%m-%d"), "-", i))
    } else if (grepl(i, pattern = "\\.pdf$")) {
      file.rename(from = paste0("src/", i), to = paste0("./reports/",
                             format(Sys.Date(),       "%Y-%m-%d"), "-", i))
    }
  }
}
