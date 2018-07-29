{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf400
{\fonttbl\f0\fnil\fcharset0 Monaco;}
{\colortbl;\red255\green255\blue255;\red38\green38\blue38;\red242\green242\blue242;}
{\*\expandedcolortbl;;\cssrgb\c20000\c20000\c20000;\cssrgb\c96078\c96078\c96078;}
\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl360\partightenfactor0

\f0\fs26 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 # Set libPaths.\
.libPaths("/Users/anubhavchaturvedi/.exploratory/R/3.5")\
\
# Load required packages.\
library(janitor)\
library(lubridate)\
library(hms)\
library(tidyr)\
library(stringr)\
library(readr)\
library(forcats)\
library(RcppRoll)\
library(dplyr)\
library(tibble)\
library(exploratory)\
\
# Steps to produce the output\
exploratory::read_excel_file( "/Users/anubhavchaturvedi/Desktop/user_simil_business_ratings.xlsx", sheet = "orginal", na = c('','NA'), skip=0, col_names=TRUE, trim_ws=TRUE, col_types="text") %>%\
  exploratory::clean_data_frame() %>%\
  mutate(date_x = excel_numeric_to_date(date_x), date_y = excel_numeric_to_date(date_y)) %>%\
  drop_na(business_id, user_id_x, user_id_y) %>%\
  filter(stars_x != 3 & stars_y != 3) %>%\
  mutate(stars_x = recode(stars_x, `1` = 0L, `2` = 0L, `4` = 1L, `5` = 1L), stars_y = recode(stars_y, `1` = 0L, `2` = 0L, `4` = 1L, `5` = 1L)) %>%\
  mutate(sum = stars_x + stars_y) %>%\
  filter(sum != 1)\
}