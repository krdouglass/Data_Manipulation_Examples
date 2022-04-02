##################################################################
# The purpose of this R script is to demonstrate useful ways of joining
# data sets. This was made mostly for my own reference and a way to practice
# these functions so it is far from perfect or comprehensive, but I will 
# share it for others who may find it helpful.
#
# Script by: Kim Fake
#
#
###################################################################


# make data to work with --------------------------------------------------


# create a data set about college
# biology courses, with the class ID number,
# the class instructor's name, and the class' 
# average grade.

# create vectors of data to be each column in the data frame
Class_ID <- c(20220, 20222, 20223, 20227, 20228)
Instructor <- c("Mark", "Ben", "John", "Sarah", "Jenny")
Avg_Grade <- c(88, 75, 80, 72, 91)

# put the vectors together into data frame A
df_A <- data.frame(Class_ID, Instructor, Avg_Grade)
  
# create a second data set that contains information regarding 
# science courses taught the same semester with the class ID numbers,
# and the number of seniors, juniors, sophomores, 
# and freshman in each course.
  
#create vectors of data to be each column in the data frame
Class_ID <- c(20221, 20222, 20223, 20224, 20225, 20226, 20227, 20228)
Seniors <-      c(3, 2, 1, 3, 2, 1, 3, 2)
Juniors <-      c(2, 2, 3, 1, 1, 2, 0, 1)
Sophomores <-   c(7, 8, 7, 9, 7, 7, 8, 6)
Freshmen <-     c(12, 12, 13, 11, 14, 14, 13, 15)

# put the vectors together into data frame B  
df_B <-  data.frame(Class_ID, Seniors, Juniors, Sophomores, Freshmen)


# load dplyr --------------------------------------------------------------

# load the package dplyr 
# with useful joining functions
library(dplyr)

# here is a website with great visuals of each of the join functions
# https://statisticsglobe.com/r-dplyr-join-inner-left-right-full-semi-anti

# inner_join --------------------------------------------------------------

# returns all rows from df_A where there are matching values in df_B,
# and all columns from df_A and df_B. 
# If there are multiple matches between df_A and df_B, 
# all combination of the matches are returned. 
inner_join(df_A,df_B, by = "Class_ID")

# note that the new data frame only includes courses (class_IDs)
# that are present in both data sets 

# left_join ---------------------------------------------------------------

# returns all rows from df_A, and all columns from df_A and df_B. 
# Rows in df_A with no match in df_B will have NA values in 
# the new columns. If there are multiple matches between df_A and df_B
# all combinations of the matches are returned.
left_join(df_A,df_B, by = "Class_ID")

# note that the new data frame inserts
# NAs for the numbers of each classmen for course 20220,
# because course 20220 is not present in df_B

# right_join --------------------------------------------------------------

# returns all rows from df_B, and all columns 
# from df_A and df_B. Rows in df_B with no match in 
# df_A will have NA values in the new columns. 
# If there are multiple matches between df_A and df_B, 
# all combinations of the matches are returned.
right_join(df_A,df_B, by = "Class_ID")

# note that the new data frame only includes courses (class_IDs)
# that are present in df_B (i.e. course 20220 is not included), 
# and NA are entered for the instructor
# and grade columns for the courses that are not in df_A 
# (20221, 20224, 20225, 20226).

# full_join ---------------------------------------------------------------

# returns all rows and all columns from both df_A and df_B. 
# Where there are not matching values, returns NA for 
# the one missing.
full_join(df_A,df_B, by = "Class_ID")

# note that the new data frame includes all courses (class_IDs)
# from both data sets, and introduces NAs as needed for courses
# in one data frame but not the other.



# semi_join ---------------------------------------------------------------

# returns all rows from df_A where there are matching values in df_B, 
# keeping just columns from df_A.

semi_join(df_A,df_B, by = "Class_ID")

# note that course 20220 is not included because it is
# not present in df_B


# anti_join ---------------------------------------------------------------

# returns all rows from df_A where there are not matching 
# values in df_B, keeping just columns from df_A.

anti_join(df_A,df_B, by = "Class_ID")

# only  course 20220 is included because it
# is the only course preent in df_a that
# is not in df_B

