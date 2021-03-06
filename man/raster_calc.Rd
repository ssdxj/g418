% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ulits4raster.R
\name{raster_calc}
\alias{raster_calc}
\title{Hyperspectral raster calculation}
\usage{
raster_calc(fpath_in, fpath_out, wl, nbands, fun, format = "raster",
  noData = -9999, ...)
}
\arguments{
\item{fpath_in}{input raster file path(in ENVI format)}

\item{fpath_out}{output file path(in .tif format)}

\item{wl}{input raster file wavelength}

\item{nbands}{nbands for output}

\item{fun}{do function, take hsdar::Speclib as first input param, each spectrum
is one pixel of fpath_in}

\item{format}{parameter for writeStart to control output format, default raster.}

\item{noData}{value for NA}

\item{...}{futher param for fun}
}
\value{
Hyperspectral image obj(save output to fpath_out inviable)
}
\description{
Hyperspectral raster calculation
}
