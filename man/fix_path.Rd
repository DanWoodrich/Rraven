% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fix_path.R
\name{fix_path}
\alias{fix_path}
\title{Modify sound file path in Raven's selection tables}
\usage{
fix_path(path = NULL, dest.path = NULL, recursive = FALSE, parallel = 1, pb = TRUE, 
new.begin.path, sound.file.col)
}
\arguments{
\item{path}{A character string indicating the path of the directory in which to look for the 'Raven' selection (text) files. 
If not provided (default) the function searches into the current working directory.}

\item{dest.path}{A character string indicating the path of the directory in which
sound selection tables will be saved. 
If not provided (default) files will be save in the current directory.}

\item{recursive}{Logical. If \code{TRUE} the listing recurse into sub-directories.}

\item{parallel}{Numeric. Controls whether parallel computing is applied.
It specifies the number of cores to be used. Default is 1 (i.e. no parallel computing).}

\item{pb}{Logical argument to control progress bar. Default is \code{TRUE}.}

\item{new.begin.path}{A character string indicating the path of the directory where sound files 
would be located. This argument is required.}

\item{sound.file.col}{A character string with the name of the column containing the sound file names in 
the selection text files. Required.}
}
\value{
Selection table file(s) saved in 'dest.path' or in the working 
directory (by default, which overwrites existing files).
}
\description{
\code{fix_path} modifies the path column in selection tables and sound selection tables
}
\details{
The function modifiies the path field in Raven's selection tables or 
sound selection tables. This is useful when sound files have been moved to a 
different location (or computer). Note the abililty to open selections and sound files
simultaneously works as long as the "begin.path" column is refering to the directory
containing the sound files.
}
\examples{
{

#load data 
data(selection_files)

# set temporary directory
# setwd(tempdir())

# save 'Raven' selection tables in the temporary directory
out <- lapply(1:2, function(x)
writeLines(selection_files[[x]], con = names(selection_files)[x]))

# try drag and drop selection files into Raven (shouldn't work)

# now convert files
#fix_path(sound.file.path = getwd(), 
#sound.file.col = "Begin File", new.begin.path = "YOUR NEW LOCATION HERE")

# try drag and drop into Raven again (should work now)
}

}
\seealso{
\code{\link{to_sound_selection}}; \code{\link{imp_raven}}
}
\author{
Marcelo Araya-Salas (\email{araya-salas@cornell.edu})
}
