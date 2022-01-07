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
