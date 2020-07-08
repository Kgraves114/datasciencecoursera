
# Part 2
# Write a function that reads a directory full of files 
# and reports the number of completely observed cases in each data file

complete <- function(directory, id) {
  # file list
  files <- list.files(directory, full.names = TRUE)
  # empty dataframe
  df <- data.frame()
  for (i in id) {
    test <- read.csv(files[i])
    nobs <-sum(complete.cases(test))
    df <- rbind(df, data.frame(i,nobs))
  }
  colnames(df) <- c('id','nobs')
  return(df)
}