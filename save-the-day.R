library(dplyr)
library(tidyr)

date <- "2024-06-27"

url <- "https://www.igj.nl/site/binaries/site-content/collections/documents/2017/08/17/register-van-gevestigde-apothekers/apothekersregister.csv"

col_names <- c("KvKnr", "Officiëlenaam", "Adresbezoek", "Postcode", "Plaats", "Typerelatie", "BIGregistratienr", "Vrl", "Tussenvg.", "Achternaam")

df <- read.csv(url, sep = "\t", skip = 1, header = F) |> 
  tidyr::separate(V1, into = col_names, sep = "\t") |> 
  mutate(KvKnr = as.numeric(KvKnr),
         BIGregistratienr = as.numeric(BIGregistratienr))

write.csv2(df, "./most-recent/apothekersregister.csv", row.names = FALSE)
write.csv2(df, paste0("./history/apothekersregister_", date, ".csv"), row.names = FALSE)
