sat_score<-read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/SAT_original.csv?fbclid=IwAR3ZBoDzFOMiVQnwZLA5jxEllreZeXt2GpjaC9Rqkdl1QI3hP7jKv3VZNF4")
View(sat_score)
library(readr)      # A fast and friendly way to read rectangular data
library(stringr)    # Character manipulation
library(assertive)  # Readable check functions to ensure code integrity
sat_score$math_score <- sat_score$math_score %>% as.numeric()
sat_score$reading_score <- sat_score$reading_score %>% as.numeric()
sat_score$writing_score <- sat_score$writing_score %>% as.numeric()

#How many observation of this dataset (before cleaning) ?
glimpse(sat_score) #Rows: 485 , Colums: 5
#Are there duplicate data sets ? (If have duplicate data, list the data that duplicate)
sat_score %>% duplicated() %>% table() #FALSE: 478 , TRUE: 7
#How many distinct school in this dataset ? (Know after drop duplicate data)
sat_score %>% filter(duplicated(sat_score))
sat_score <- sat_score %>% distinct()
glimpse(sat_score) #Rows: 478 , Colums: 5
#What is min, max, average, quartile of each part in SAT ?
sat_score %>% summarise(max(sat_score$math_score,na.rm = T)) #7735
sat_score %>% summarise(min(sat_score$math_score,na.rm = T)) #34
sat_score %>% summarise(mean(sat_score$math_score,na.rm = T)) #430

sat_score %>% summarise(max(sat_score$reading_score,na.rm = T)) #679
sat_score %>% summarise(min(sat_score$reading_score,na.rm = T)) #37
sat_score %>% summarise(mean(sat_score$reading_score,na.rm = T)) #399

sat_score %>% summarise(max(sat_score$writing_score,na.rm = T)) #4030
sat_score %>% summarise(min(sat_score$writing_score,na.rm = T)) #35
sat_score %>% summarise(mean(sat_score$writing_score,na.rm = T)) #401
#What is min, max, average, quartile of total score in SAT ?
#Which school is get highest SAT score ?
sat_score <- sat_score %>% mutate(total = math_score+reading_score+writing_score) 
sat_score %>% summarise(max(total,na.rm = T)) #9096
sat_score %>% summarise(min(total,na.rm = T)) #106
sat_score %>% summarise(mean(total,na.rm = T)) #1230.19

sat_score %>% select(school_name,total) %>% arrange(desc(total))
std_room %>% filter(mid_score==max(mid_score,na.rm = T))#STUYVESANT HIGH SCHOOL 