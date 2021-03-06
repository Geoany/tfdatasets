% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dataset_iterators.R
\name{with_dataset}
\alias{with_dataset}
\title{Execute code that traverses a dataset}
\usage{
with_dataset(expr)
}
\arguments{
\item{expr}{Expression to execute}
}
\description{
Execute code that traverses a dataset
}
\details{
When a dataset iterator reaches the end, an out of range runtime error
will occur. You can catch and ignore the error when it occurs by wrapping
your iteration code in a call to \code{with_dataset()} (see the example
below for an illustration).
}
\examples{
\dontrun{
library(tfdatasets)
dataset <- text_line_dataset("mtcars.csv", record_spec = mtcars_spec) \%>\%
  dataset_prepare(x = c(mpg, disp), y = cyl) \%>\%
  dataset_batch(128) \%>\%
  dataset_repeat(10)

batch <- next_batch(dataset)

with_dataset({
  while(TRUE) {
    # use batch$x and batch$y tensors
  }
})
}

}
\seealso{
Other reading datasets: \code{\link{input_fn.tf_dataset}},
  \code{\link{next_batch}}
}
