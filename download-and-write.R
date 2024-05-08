
url <- "https://www.igj.nl/binaries/igj/documenten/publicaties/2017/08/17/register-van-gevestigde-apothekers/Apothekersregister.csv"

df <- read.csv2(url)

write.csv2(df, "./most-recent/apothekersregister.csv", row.names = FALSE)
write.csv2(df, paste0("./history/apothekersregister_", Sys.Date(), ".csv"), row.names = FALSE)
