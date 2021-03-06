# global import -----------------------------------------------------------
#' @import tidyverse
#' @import ggsci
#' @import ggpubr
#' @import kableExtra
#' @importFrom hsdar SI spectra wavelength get_reflectance rededge vegindex nri
#' @importFrom caret train preProcess trainControl postResample defaultSummary getTrainPerf
#' @importFrom minpack.lm nlsLM nls.lm.control

library(tidyverse)
library(kableExtra)
library(ggpubr)
library(ggsci)



# common var --------------------------------------------------------------

# color palette-----------------------------------------------------------------
# colorblind-friendly palette
# from http://jfly.iam.u-tokyo.ac.jp/color/

#' The palette with grey:
#'
#' @return chr list
#' @export
paletteCb <- function() {
  c(
    "#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442",
    "#0072B2", "#D55E00", "#CC79A7"
  )
}

#' The palette with black:
#'
#' @return chr list
#' @export
paletteCbb <- function() {
  c(
    "#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442",
    "#0072B2", "#D55E00", "#CC79A7"
  )
}

#' heatmap palette
#'
#' @return function generate by colorRampPalette
#' @export
paletteHm <- function() {
  colorRampPalette(rev(RColorBrewer::brewer.pal(11, "Spectral")), space = "Lab")
}

#' palette Jetter
#'
#' @return function generate by colorRampPalette
#' @export
paletteJetter <- function() {
  colorRampPalette(c(
    "#00007F", "blue", "#007FFF", "cyan", "#7FFF7F",
    "yellow", "#FF7F00", "red", "#7F0000"
  ))
}

#' theme for dotchart plot
#' @return ggplot theme
#' @export
themeDotplot <- function() {
  theme_bw(14) +
    theme(
      axis.text.y = element_text(size = rel(.75)),
      axis.ticks.y = element_blank(),
      axis.title.x = element_text(size = rel(.75)),
      panel.grid.major.x = element_blank(),
      panel.grid.major.y = element_line(size = 0.5),
      panel.grid.minor.x = element_blank()
    )
}



#' not in
#'
#' @param x x
#' @param table vector
#'
#' @return vector
#' @export
`%not in%` <- function(x, table) {
  is.na(match(x, table, nomatch = NA_integer_))
}


#' df to html table using kable
#'
#' @param df data.frame
#'
#' @return html
#' @export
df2html <- function(df, digits) {
  df %>%
    mutate_if(is.numeric, round, digits) %>%
    kable(format = "html", digits = digits, escape = FALSE) %>%
    kable_styling(bootstrap_options = c("striped", "hover"))
}
