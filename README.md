# This repo includes files from project {Project Name}:


In order to properly collaborate with this team, this repository was created. It consists of a series of folders where research files are organized, as well as the products of the research. The basic file structure, as you can see in the folder structure, include the following folders:

- config, where you will find a `global.dcf` files, which can be used to configure the project
- data, where you should put your data files
- docs, where you should include documentation for the project, or the library with references to the current work. Also, your latex bib file should be saved in here whenever possible
- graphs, where plots will be automatically saved (provided you follow the below instructions)
- munge, where you will give instructions to build the final dataset, usually using the separate files within `data`
- reports, where your reports or papers will be saved, provided you follow the below instructions
- src, where your source files should be placed


We recommend that your `src` files should be R notebooks or Rmd files, with specific intructions within the yaml header. A yaml header is a set of instructions between a pair of three dashes, see below the recommended minimal header for this type of project:


```
---
title: "The title"
date: "`r format(Sys.time(), '%d %B, %Y' )`"
lang: en
author: author name
abstract:
number-sections: true
output:
    word_document:
      toc: true
      #pandoc_args: ["-F", "pandoc-crossref"]


# Option for RStudio users, this makes the Knit button save the file in the `reports` folder
knit: (function(inputFile, encoding) {
  rmarkdown::render(inputFile, encoding = encoding, output_file = paste(Sys.Date(), "-report", ".doc", sep=""), output_dir = "../reports") }) 

# Bibliography
# bibliography: "Y:/Projects/Name/doc/library.bib"
---
```

Following the header you should also set your Rmarkdown environment with a few options. The code below is the recommended.


````

```{r setup, include=FALSE}
set.seed(42)
setwd(here::here()) # needed as we are in /src, in linux here() should be used

# Loading the project
ProjectTemplate::load.project()

# R options
options(digits = 2, scipen=999,ggplot2.continuous.colour="viridis", ggplot2.continuous.fill = "viridis") # Remove scientific notation

# Knitr options
knitr::opts_chunk$set(comment = NA, cache.path = "../cache/", fig.path="../graphs/", echo=F, cache=F, fig.width = 10, fig.height = 7, dpi = 300)
```

```{r setup-table-figures-num}
# This special function allows anchors to tables and figures
table_figure_num()
```



````







You can also use the `docs` directory to print out documentation for your project, there is an option on rmarkdown for that: github_document. When pushing the project to GitHub you can use this directory as the root for a
GitHub Pages website for the project. For more information see
https://github.com/blog/2289-publishing-with-github-pages-now-as-easy-as-1-2-3


Now to use this template, clone it into a directory in your system with:

```
git clone https://github.com/lf-araujo/cidacs
```

And set your template directory with:

```
options(ProjectTemplate.templatedir = "/path/to/your/templates/where/cidacs/is")
```

Finally, go to the desired directory where your new project will live and:

```
ProjectTemplate::create.project(project.name = "my cool project", template = "cidacs")
```


