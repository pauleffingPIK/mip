% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mipAreaPattern.R
\name{mipAreaPattern}
\alias{mipAreaPattern}
\title{Generic area plot function. Automatically creates facet grid from data. Optionally adds total line. Supports patterns.}
\usage{
mipAreaPattern(
  x,
  stack_priority = c("variable", "region"),
  total = TRUE,
  scales = "fixed",
  shorten = TRUE,
  hist = NULL,
  hist_source = "first",
  patternDensity = 0.35,
  patternKeyScale = 0.6
)
}
\arguments{
\item{x}{Data to plot. Allowed data formats: magpie or quitte. NOTE: To ensure correct conversion to quitte objects,
the dimension that contains the variables must have one of the following names: variable, scenario, or model.}

\item{stack_priority}{Name of column you want to stack. If you provide more than one column name the
function will scan the columns in the given order and use the first dimension for stacking that has
more than one element.}

\item{total}{total data to plot. Allowed inputs: magpie, quitte or boolean. If total data is
provided by user in magpie or quitte format it will be added to the plot. If user sets total to
TRUE total will be calculated by the function and added to the plot. If total is FALSE the plot
will ignore it.}

\item{scales}{scales can be fixed ("fixed", default), free ("free"), or free in one dimension ("free_x", "free_y")?}

\item{shorten}{Shorten variable names (default is TRUE) by removing categories only if they are identical (for short
names in the legend)}

\item{hist}{Historical data. Allowed data formats: magpie or quitte. NOTE: To ensure correct conversion to quitte
objects, the dimension that contains the variables must have one of the following names: variable, scenario, model.}

\item{hist_source}{If there are multiple historical sources the name of the source that you want to be plotted.}

\item{patternDensity}{Sets globally the density of all patterns}

\item{patternKeyScale}{Sets globally the size of all patterns in the legend items}
}
\description{
Generic area plot function. Automatically creates facet grid from data. Optionally adds total line. Supports patterns.
}
\section{Example Plot}{

\if{html}{\figure{mipAreaPattern.png}{example plot}}
}

\examples{
p <- mipAreaPattern(x = mip_example_data)
# create plot with best-guess design (internally using theme_mip(size=12))
p <- mipAreaPattern(mip_example_data)
# override default theme with theme_grey and move legend to top
library(ggplot2)
p <- p + theme_grey() + theme(legend.position = "top")
# go back to theme_mip and increase font size
p <- p + theme_mip(size = 18)
# change facetting
p <- p + facet_grid(region ~ scenario)

# patterns and color scales can be added manually here:
# p <- p + scale_pattern_manual(values = patternValues,
                     labels = labels) +
# p <- p + scale_pattern_spacing_manual(values= spacingValues,
                               labels = labels)+
# p <- p + scale_fill_manual(values=colorFillValues,
                    labels = labels)
}
\author{
David Klein, Jan Philipp Dietrich, Paul Effing
}
