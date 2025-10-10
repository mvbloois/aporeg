today <- format(Sys.Date(), "%Y%m%d")
today <- "20251009"
url <- paste0("https://www.igj.nl/site/binaries/site-content/collections/documents/2017/08/17//register-van-gevestigde-apothekers/apothekersregister", today, ".csv")

response <- tryCatch({
  con <- url(url, "rb")
  close(con)
  TRUE
  }, error = function(e) {
    FALSE
})
  
if (!response) {
  stop("URL is not accessible or does not exist")
}

df <- read.csv2(url)
write.csv2(df, "./most-recent/apothekersregister.csv", row.names = FALSE)
write.csv2(df, paste0("./history/apothekersregister_", today, ".csv"), row.names = FALSE)
