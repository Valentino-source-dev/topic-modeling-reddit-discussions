library(RedditExtractoR)
library(dplyr)
library(tibble)

# Definisco i subreddit
subreddits <- c("technology", "space", "TeslaMotors")

all_urls <- tibble()

for (sub in subreddits) {
  cat("Buscando hilos en r/", sub, "\n")
  
  urls_sub <- find_thread_urls(
    subreddit = sub,
    sort_by   = "top",
    period    = "month"
  ) %>%
    mutate(subreddit = sub)
  
  all_urls <- bind_rows(all_urls, urls_sub)
}

thread_urls <- unique(all_urls$url)
thread_urls <- thread_urls[1:min(200, length(thread_urls))]

# Descargo los comentarios
all_comments <- tibble()

for (u in thread_urls) {
  cat("Descargando hilo:", u, "\n")
  
  tmp <- tryCatch(
    get_thread_content(u),
    error = function(e) NULL
  )
  
  if (is.null(tmp) || is.null(tmp$comments)) next
  
  comments_df <- as_tibble(tmp$comments) %>%
    mutate(thread_url = u)
  
  all_comments <- bind_rows(all_comments, comments_df)
  
  Sys.sleep(1.5)
}

# Guardo el resultado
saveRDS(all_comments, "data/all_comments.rds")

file.exists("data/all_comments.rds")

