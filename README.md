# Template for internal projects within CIDACS



The idea is to separate data from scripts, reports, and figures. For this I use a combination of
 ProjectTemplate.net with rmarkdown.


Examples of how this looks like can be found in the /reports folder.

These are the roles for each folder:

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
abstract: This is an abstract
number-sections: true
output:
  html_notebook:
    code_folding: hide
    highlight: zenburn
    theme: flatly
    toc: yes
    toc_float: yes
    df_print: paged
    code_downloading: yes
# Bibliography
# bibliography: "Y:/Projects/Name/doc/library.bib"
---
```

Following the header you should also set your Rmarkdown environment with a few options. The code below is the recommended.


````

```{r setup, include=FALSE}
library(tidyverse)

set.seed(42)
setwd(here::here()) # needed as we are in /src, in linux here() should be used

# Loading the project
ProjectTemplate::load.project()
pclean()

# R options
options(
  digits = 2, # Only two decimal digits
  scipen = 999 # Remove scientific notation for pretty printing
)

# Knitr options
knitr::opts_chunk$set(
  comment = NA, # remove comment symbol
  cache.path = "../cache/", # where should I save cache?
  fig.path = "../graphs/", # where should I save figures?
  echo = T, # dont echo by default
  cache = F, # dont cache by default
  fig.width = 10, # setting the best witdth for figures
  fig.height = 7, # best height
  dpi = 300, # high dpi for publication quality
  error = F,
  warning = F
)
```



````



You can also use the `docs` directory to print out documentation for your project, there is an option on rmarkdown for that: github_document. When pushing the project to GitHub you can use this directory as the root for a
GitHub Pages website for the project. For more information see
https://github.com/blog/2289-publishing-with-github-pages-now-as-easy-as-1-2-3




Now to use this template, clone it into a directory in your system with:

```
git clone https://github.com/lf-araujo/cidacs
```

# Optional extra steps

Set your template directory with:

```
options(ProjectTemplate.templatedir = "/path/to/your/templates/where/cidacs/is")
```

Finally, go to the desired directory where your new project will live and:

```
ProjectTemplate::create.project(project.name = "my cool project", template = "cidacs")
```
