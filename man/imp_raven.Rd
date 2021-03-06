% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/imp_raven.R
\name{imp_raven}
\alias{imp_raven}
\title{Import 'Raven' selections}
\usage{
imp_raven(path = NULL, sound.file.col = NULL, all.data = FALSE, recursive = FALSE,
 name.from.file = FALSE, ext.case = NULL, freq.cols = TRUE, waveform = FALSE, 
 parallel = 1, pb = TRUE, unread = FALSE, rm.dup = FALSE)
}
\arguments{
\item{path}{A character string indicating the path of the directory in which to look for the 'Raven' selection (text) files. 
If not provided (default) the function searches into the current working directory.}

\item{sound.file.col}{A character string with the name of the column containing the sound files in 
the selection text files. Default is \code{NULL}. If provided, the output data
frame will contained all columns needed for subsequent analysis in the acoustic analysis package \code{\link{warbleR}}. 
Duplicated rows, as when "waveform" and "spectrogram" information are included for the same selection, will be removed.
All selection files must contain "Selection", "Begin.Time" and "End.Time" columns.}

\item{all.data}{Logical. If \code{TRUE} all columns in the selection files are returned, 
keeping the name columns as in the 'Raven' files. Default is \code{FALSE}. Columns absent in some selection files will be filled with NA's.}

\item{recursive}{Logical. If \code{TRUE} the listing recurse into sub-directories.}

\item{name.from.file}{Logical. If \code{TRUE} the sound file names are extracted from the selection text file name. 
It asssumes that selections files contained the suffix "Table.1.selections.txt" or "selections.txt". 
Note that by default it will assume that the extension file name is ".wav". This can be control using the
argumet 'ext.wav'. Default is \code{FALSE}). Ignored if sound.file.col' is provided and/or all.data is \code{TRUE}).}

\item{ext.case}{Character string of length 1 to specify whether sound file extensions are in upper or lower case. This should match the extension of the
of the .wav files from which the selection were made. It must be either 'upper' or 'lower'. Only needed when 'name.from.file' is \code{TRUE}. 
Ignored if 'sound.file.col' is provided and/or all.data is \code{TRUE}.}

\item{freq.cols}{Logical. If \code{TRUE} 'Low Freq' and 'High Freq' columns are also imported. Ignored if all.data is \code{TRUE}.}

\item{waveform}{Logical to control if waveform view data should be included (this data is typically duplicated in spectrogram view data).  Default is \code{FALSE} (not to include it).}

\item{parallel}{Numeric. Controls whether parallel computing is applied.
It specifies the number of cores to be used. Default is 1 (i.e. no parallel computing).}

\item{pb}{Logical argument to control progress bar. Default is \code{TRUE}.}

\item{unread}{Logical. If \code{TRUE} a list (instead of a data frame). The first element of the list contains the selections\
whole the second one is a character vector with the names of sound files that could not be read. Default is \code{FALSE}.}

\item{rm.dup}{Logical. If \code{TRUE} duplicated rows and columns are removed. Usefull when 
selection files have been duplicated. Default is \code{FALSE}.}
}
\value{
A single data frame with information of the selection files. If \code{unread = TRUE} the function returns a list of length 2 with
 the selection data frame and a vector with the names of files that could not be read (see 'unread' argument).  
 If 'all.data' argument is set to \code{FALSE} the data frame contains the following columns: selec, start, end, and selec.file. 
 If sound.file.col is provided the data frame  will also contain a 'sound.files' column. In addition, all rows with duplicated 
 data are removed. This is useful when both spectrogram and waveform views are included in the 'Raven' selection files. If all.data is set to \code{TRUE} then all columns in the 'Raven' selection files are returned. 
 If individual selection files contain information about multiple sound files the function will correct the time
 parameters (start and end) only if 1) the 'File Offset (s)' is also included in the selection file and 2) the sound file column has been provided (using 'sound.file.col' or 'name.from.file' arguments).
}
\description{
\code{imp_raven} imports 'Raven' selection files simultaneously from many files. Files must be in '.txt' format.
}
\details{
The function import 'Raven' selection data from many files simultaneously. Files must be in '.txt' format. Selection 
files including data from mulitple recordings can also be imported.
}
\examples{

#load data 
data(selection_files)

# set temporary directory
# setwd(tempdir())

#save 'Raven' selection tables in the temporary directory 
out <- lapply(1:2, function(x) 
writeLines(selection_files[[x]], con = names(selection_files)[x]))

\donttest{
#providing the name of the column with the sound file names
rvn.dat <- imp_raven(sound.file.col = "Begin.File", all.data = FALSE)

# View(rvn.dat)
}

}
\seealso{
\code{\link{imp_syrinx}}
}
\author{
Marcelo Araya-Salas (\email{araya-salas@cornell.edu})
}
