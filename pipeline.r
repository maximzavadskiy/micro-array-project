# Install bioconductor
source("https://bioconductor.org/biocLite.R")
biocLite()

# Install required libraries to work with the microarray  data of the given format
biocLite("oligo")
library(oligo)

# Download and extract dataset
download.file("https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE8524&format=file",destfile="micro-array-data.tar.gz")
untar("micro-array-data.tar.gz", list=TRUE)

# Next we will use oligo to import individual CEL files...
celFiles <- list.celfiles(".", listGzipped=TRUE)
rawData <- read.celfiles(celFiles) # Magic! It will automatically detect the format of data and parse it for us!

