dataFormat <- function(s){
  # This function obtains live citi bike stations info and returns coordinates of available 
  # citi bike stations
  #
  # Input: live station data
  # Output: coordinate matrix of all stations 
  #         coordinate matrix of all stations with bikes
  #         coordinate matrix of all stations with available parking space
  
  # Remove 0 bikes stations
  s_nonzero <- s[-c(which(s$available==0)),]
  
  # Remove full bike stations
  s_nonfull <- s[-c(which(s$available == s$capacity)),]
  if (nrow(s_nonfull) == 0){
    s_nonfull = s
  }
  
  # Create pairs of lattitude and longitute for all bike stations
  pairs_all <- cbind(s$lat, s$lng)
  pairs_nonzero <- cbind(s_nonzero$lat, s_nonzero$lng)
  pairs_nonfull <- cbind(s_nonfull$lat, s_nonfull$lng)
  
  return(list(all = pairs_all, nonzero = pairs_nonzero, nonfull = pairs_nonfull))
}
