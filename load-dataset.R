file <- "https://sisa.msal.gov.ar/datos/descargas/covid-19/files/Covid19Casos.csv"

#utils::download.file(file)

# issue
# https://community.rstudio.com/t/read-lines-raw-is-not-handling-the-crlf-in-utf-16le-files/30164/5

library(readr)

archivo <- "~/Downloads/Covid19Casos.csv"

guess_encoding(archivo)

# the following does not work
dataset <- read_csv(archivo,locale=locale(encoding = "UTF-16LE"))
#Error in guess_header_(datasource, tokenizer, locale) : 
#  Incomplete multibyte sequence
dd <- read_lines(archivo,locale=locale(encoding = "UTF-16LE"))
#Error in read_lines_(ds, skip_empty_rows = skip_empty_rows, locale_ = locale,  : 
#                       Incomplete multibyte sequence

# but it works with read.csv

dataset <- read.csv(archivo, fileEncoding="UTF-16LE")
