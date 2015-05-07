# Manipulating Data with dplyr

mydf <- read.csv(path2csv,stringsAsFactors = FALSE)

library(dplyr)

cran <- tbl_df(mydf)

select(cran, ip_id, package, country)

select(cran, r_arch:country)

# The negative sign in front of time tells select() that we DON'T want the time column. 
select(cran, -time)

filter(cran, package == "swirl")

filter(cran, r_version == "3.1.1", country == "US")

filter(cran, !is.na(r_version))

arrange(cran2, ip_id)

arrange(cran2, desc(ip_id))

mutate(cran3, size_mb = size / 2^20)

summarize(cran, avg_bytes = mean(size))

# Grouping and Chaining with dplyr

by_package <- group_by(package)


pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size))


quantile(pack_sum$count, probs = 0.99)

top_counts <- filter(pack_sum, count > 679)

arrange(top_counts, desc(count))

###

result2 <-
  arrange(
    filter(
      summarize(
        group_by(cran,
                 package
        ),
        count = n(),
        unique = n_distinct(ip_id),
        countries = n_distinct(country),
        avg_bytes = mean(size)
      ),
      countries > 60
    ),
    desc(countries),
    avg_bytes
  )

print(result2)

###

# you can pronounce the %>% operator as the word 'then'.

result3 <-
  cran %>%
  group_by(package) %>%
  summarize(count = n(),
            unique = n_distinct(ip_id),
            countries = n_distinct(country),
            avg_bytes = mean(size)
  ) %>%
  filter(countries > 60) %>%
  arrange(desc(countries), avg_bytes)


cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb <= 0.5) %>%
  arrange(desc(size_mb) %>%
  print

####### Tidying Data with tidyr

library(tidyr)

gather(students, sex, count, -grade)

res <- gather(students2, sex_class, count, -grade)

separate(data = res, col = sex_class, into = c("sex", "class") )

# OR

students2 %>%
  gather( sex_class, count, -grade ) %>%
  separate( col = sex_class , into = c("sex", "class") ) %>%
  print


students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread(test, grade) %>%
  mutate(class = extract_numeric(class)) %>%
print

###### Dates and Times with lubridate

library(lubridate)






























