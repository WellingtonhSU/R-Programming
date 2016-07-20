
Calcountry <- function(data, country) {
  data_country = data.frame()

  for (i in 1:nrow(data)) {
    if(data[i,4] == country)
    {
      data_country = rbind(data_country, data[i,])
    }
  }
  country_t = aggregate(nkill ~ year, data_country,sum)
  plot(country_t)
  lines(country_t, col=1:5)
}
