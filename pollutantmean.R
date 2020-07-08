
# Part 1
# Pollutant mean 

pollutantmean <- function(directory, pollutant, id=1:332) {
  # file list
  files <- list.files(directory, full.names = TRUE)
  # empty dataframe
  df <- data.frame()
  for (i in id) {
    df <- rbind(df, read.csv(files[i]))
  }
  #calc mean
  avg_data <- mean(df[,pollutant], na.rm = TRUE)
  return(avg_data)
}