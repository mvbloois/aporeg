
url <- "https://www.igj.nl/zorgsectoren/eerstelijnszorg/publicaties/publicaties/2017/08/17/register-van-gevestigde-apothekers"

# read the html
html <- rvest::read_html(url)

# extract the date after publicatiedatum
date_text <- html |> 
  rvest::html_nodes("p:contains('Publicatie')") |> 
  rvest::html_text() |>
  tail(1) 

# Use base R functions to extract the date
date <- regmatches(date_text, regexpr("\\d{2}-\\d{2}-\\d{4}", date_text))
date <- as.Date(date, format = "%d-%m-%Y")
  
if (Sys.Date() == date) {
  url <- "https://www.igj.nl/binaries/igj/documenten/publicaties/2017/08/17/register-van-gevestigde-apothekers/Apothekersregister.csv"
  
  df <- read.csv2(url)
  
  write.csv2(df, "./most-recent/apothekersregister.csv", row.names = FALSE)
  write.csv2(df, paste0("./history/apothekersregister_", date, ".csv"), row.names = FALSE)
}
