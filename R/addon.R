# pls add on --------------------------------------------------------------

## VIP returns all VIP values for all variables and all number of components,
## as a ncomp x nvars matrix.
pls_VIP <- function(object) {
  if (object$method != "oscorespls") {
    stop(
      "Only implemented for orthogonal scores algorithm.  Refit with 'method = \"oscorespls\"'"
    )
  }
  if (nrow(object$Yloadings) > 1) {
    stop("Only implemented for single-response models")
  }

  SS <- c(object$Yloadings)^2 * colSums(object$scores^2)
  Wnorm2 <- colSums(object$loading.weights^2)
  SSW <- sweep(object$loading.weights^2, 2, SS / Wnorm2, "*")
  sqrt(nrow(SSW) * apply(SSW, 1, cumsum) / cumsum(SS))
}

## VIPjh returns the VIP of variable j with h components
pls_VIPjh <- function(object, j, h) {
  if (object$method != "oscorespls") {
    stop(
      "Only implemented for orthogonal scores algorithm.  Refit with 'method = \"oscorespls\"'"
    )
  }
  if (nrow(object$Yloadings) > 1) {
    stop("Only implemented for single-response models")
  }

  b <- c(object$Yloadings)[1:h]
  T <- object$scores[, 1:h, drop = FALSE]
  SS <- b^2 * colSums(T^2)
  W <- object$loading.weights[, 1:h, drop = FALSE]
  Wnorm2 <- colSums(W^2)
  sqrt(nrow(W) * sum(SS * W[j, ]^2 / Wnorm2) / sum(SS))
}
