#' Complete list of palettes
#'
#' Use \code{\link{drygate_palette}} to construct palettes of desired length.
#'
#' @export
drygate_palettes <- list(
    SevenPeaks = c("#11100f","#127a81","#21a0b5","#6ccbd2","#e0f1f2"),
    GladEyeIPA = c("#050404","#5d0015","#d61b46","#f06465","#f59392","#cfd0d2"),
    KelvinPilsner = c("#303231","#f0a33a","#d8d6d0","#7f8180","#949c94"),
    BearfaceLager = c("#0d3728","#005940","#0d9952","#4eb67d","#e5f2ee"),
    DiscoForkliftTruck = c("#2d2c2b","#f29f17","#e54b5d","#77b44a","#eee204"),
    TakeMeTotheRiver = c("#792149","#ed347e","#34b77b","#c0d73d","#fcd92c","#cfd0d2"),
    CrossingtheRubicon = c("#08162e","#cfd0d2","#eb1d56","#f05666","#f7a02d","#0fc0d2"),
    Drygate = c("#0098a7","#f67905","#fc5c03","#f5340e","#aa2b47","#622c7a"),
    CloudCity = c("#2e4163","#8a7fb1","#dd87b2","#fbc089","#d0c9d4"),
    Shred = c("#e63215","#f5a302","#e87649","#fad07b","#6ac6ec"),
    Voller = c("#241e20","#df2243","#841d3d","#f5ba43","#c3a8a7")
  )

#' A Drygate brewery palette generator
#'
#' These are a handful of color palettes from Drygate brewery.
#'
#' @param n Number of colors desired. If omitted, uses all colours.
#' @param name Name of desired palette. Choices are:
#'   \code{SevenPeaks},\code{GladEyeIPA}, \code{KelvinPilsner}, \code{BearfaceLager}, \code{DiscoForkliftTruck}, \code{TakeMeTotheRiver},  \code{CrossingtheRubicon},
#'   \code{CloudCity}, \code{Shred}, \code{Voller}, \code{Drygate},
#' @param type Either "continuous" or "discrete". Use continuous if you want
#'   to automatically interpolate between colours.
#'   @importFrom graphics rgb rect par image text
#' @return A vector of colours.
#' @export
#' @keywords colors
#' @examples
#' drygate_palette("SevenPeaks")
#' drygate_palette("GladEyeIPA")
#' drygate_palette("KelvinPilsner")
#' drygate_palette("BearfaceLager")
#' drygate_palette("DiscoForkliftTruck")
#' drygate_palette("TakeMeTotheRiver")
#' drygate_palette("CrossingtheRubicon")
#' drygate_palette("CloudCity")
#' drygate_palette("Shred")
#' drygate_palette("Voller")
#' drygate_palette("Drygate")
#'
#'
#' # If you need more colours than normally found in a palette, you
#' # can use a continuous palette to interpolate between existing
#' # colours
#' pal <- drygate_palette(21, name = "DiscoForkliftTruck", type = "continuous")
#' image(volcano, col = pal)
drygate_palette <- function(name, n, type = c("discrete", "continuous")) {
  type <- match.arg(type)

  pal <- drygate_palettes[[name]]
  if (is.null(pal))
    stop("Palette not found.")

  if (missing(n)) {
    n <- length(pal)
  }

  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what palette can offer")
  }

  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)
}

#' @export
#' @importFrom graphics rect par image text
#' @importFrom grDevices rgb
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}

