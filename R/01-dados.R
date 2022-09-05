
readSheet <- function(path = 'curriculo_dados.xlsx'){

  all <- readxl::excel_sheets(path)

  lista <- purrr::map(all, \(x) readxl::read_excel(path, sheet = x))

  names(lista) <- all

  # list2env(lista, envir = .GlobalEnv) # entender melhor essa funcao

  purrr::map2(lista, all,
              ~ readr::write_rds(
                x = .x, file = glue::glue('index/planilhas/{.y}.rds')))

}

readSheet()



