
# Part 3
# Write a function that takes a directory of data files and a threshold for 
# complete cases and calculates the correlation between sulfate and nitrate for 
# monitor locations where the number of completely observed cases (on all variables) is 
# greater than the threshold. 

corr <- function(directory, threshold = 0) {
  #create list of all files
  files <- list.files(directory, full.names= TRUE)
  # create empty data set
  dat <- vector(mode = "numeric", length = 0)
  for(i in 1:length(files))
  {
    # Read File
    tmp <- read.csv(files[i])
    #Calculate csum    
    csum <- sum((!is.na(tmp$sulfate)) & (!is.na(tmp$nitrate)))
    if (csum > threshold)
    {
      sul <- tmp[which(!is.na(tmp$sulfate)), ]
      nit <- sul[which(!is.na(sul$nitrate)), ]
      dat <- c(dat, cor(nit$sulfate, nit$nitrate))
    }
  }
  dat
}
