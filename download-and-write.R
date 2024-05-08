
url <- "https://www.igj.nl/binaries/igj/documenten/publicaties/2017/08/17/register-van-gevestigde-apothekers/Apothekersregister.csv"

df <- readr::read_csv2(url)

df |> 
  readr::write_csv2("./most_recent/apothekersregister.csv")

df |> 
  readr::write_csv2(glue:glue("./history/apothekersregister_{Sys.Date()}.csv"))


