library(rvest)
library(stringr)

url <- "https://www.igj.nl/zorgsectoren/eerstelijnszorg/publicaties/publicaties/2017/08/17/register-van-gevestigde-apothekers"

# read the html
html <- read_html(url)

# extract the date after publicatiedatum
date <- html |> 
  html_nodes("p:contains('Publicatie')") |> 
  html_text() |>
  head(1) |> 
  str_extract("\\d{2}-\\d{2}-\\d{4}") |> 
  as.Date(format = "%d-%m-%Y")
  
if (Sys.Date() == date) {
  url <- "https://www.igj.nl/binaries/igj/documenten/publicaties/2017/08/17/register-van-gevestigde-apothekers/Apothekersregister.csv"
  
  df <- read.csv2(url)
  
  write.csv2(df, "./most-recent/apothekersregister.csv", row.names = FALSE)
  write.csv2(df, paste0("./history/apothekersregister_", Sys.Date(), ".csv"), row.names = FALSE)
}
