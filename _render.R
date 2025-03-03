# render only completed chapters ----
# edit _bookdown_v1.yml to add or remove chapters to rmd_files:
xfun::in_dir("H:/ads-v2", bookdown::render_book(config_file = "_bookdown_v1.yml"))
browseURL("docs/index.html")

# run if anything in book/data changes ----
# zip the data files
zipfile <- "H:/ads-v2/data/data"
if (file.exists(zipfile)) file.remove(zipfile)
f.zip <- list.files("H:/ads-v2/data", full.names = TRUE)
zip(zipfile, c(f.zip), flags = "-j")

# copy data directory to docs
R.utils::copyDirectory(
  from = "H:/ads-v2/data",
  to = "docs/data",
  overwrite = TRUE,
  recursive = TRUE)


#-------------------------------------------------------------------------
# render a draft book
# comment out chapters to render a subset
xfun::in_dir("book", bookdown::render_book(config_file = "_bookdown_draft.yml"))
browseURL("docs/draft/index.html")
