##################################################################
# The purpose of this R script is to demonstrate useful functions from the 
# dplyr package I often use to manipulate and summarize data. 
# This was made mostly for my own reference and a way to practice
# these functions so it is far from perfect or comprehensive, but I will 
# share it for others who may find it helpful.
#
# Script by: Kim Fake
#
#
###################################################################


# Load the data and inspect it --------------------------------------------


# Load the gapminder package
library(gapminder) # the data we will work with


# convert gapminder to a data frame, which 
# is what excel data will be when you load it
# this way, what you see in this exercise will look similar
# to an excel file you load
#gapminder <- data.frame(gapminder)

# look at a short summary of a few rows of the data in the gapminder dataframe
head(gapminder)

# look at the structure of the data
# this shows you how many rows and columns in the data
# it also shows you all the columns in the data frame by name 
# and the type of data contained in each column
str(gapminder)

# As you can see, this data set contains information
# regarding countries.
# For each country the continent it is on is given,
# as well as each country's life expectancy, population, and GDP
# per capita of a given year.

# now we will go through several examples 
# of the useful functions in the dplyr package for 
# manipulating and summarizing a data set

# load dplyr --------------------------------------------------------------


#load dplyr package
library(dplyr) # the package we will use to manipulate the data


# transforming data with dplyr --------------------------------------------



# arrange function: -------------------------------------------------------


# this function allows us to arrange the data
# in a more helpful order

# we will arrange the data so they are listed 
# in ascending order of life expectancy
gapminder %>%
  arrange(lifeExp)

# now we  will arrange the data set 
# in descending order of population
gapminder %>%
  arrange(desc(pop))



# select function: --------------------------------------------------------


# this is useful if you are only interested 
# in working with data from some columns
# for example, if we only want to work with country and population...
gapminder %>%
  dplyr::select("country", "pop")#dplry:: is just to tell it to use the select function from the dplyr package

# rename function: -------------------------------------------------------

# this is can be used to rename a column to something more convient
gapminder %>%
  rename(population = pop)


# mutate function: --------------------------------------------------------


# this is useful to make a new column based on other columns in the data

# find total GDP of each country in each year
gapminder %>%
  mutate(total_gdp = gdpPercap*pop)


# filter function: --------------------------------------------------------


# this function allows you to extract the rows 
# of the data that fit a specific criteria

# we will filter rows of data that contain information regarding
# countries in Europe
gapminder %>%
  filter(continent == "Europe")

# now we will filter the data by a numerical column

#filter data from the year 1952
gapminder %>%
  filter(year == 1952)

# with numerical columns you can filter by
# logical operators too

# years later than 1966
gapminder %>%
  filter(year > 1966)

# years earlier than 1966
gapminder %>%
  filter(year < 1966)

# year later than or equal to 1966
gapminder %>%
  filter(year >= 1966)

# you can use criteria from multiple columns to
# filter the data

# data from Spain in 1962
gapminder %>%
  filter(country == "Spain", year == 1962)


# count function: ---------------------------------------------------------


# This function allows you to quickly
# count the unique values of one or more variables

# count how many rows of data there are for each country
gapminder %>%
  count(country)

# you can also use count to summarize a variable
# this code will sum the population column for all rows for each continent 
gapminder %>%
  count(continent, wt= pop, sort =TRUE) #sort=TRUE puts them in descending order of pop


# summarize and group_by functions: -----------------------------------------------------

# group_by is useful to create groups of data you want to summarize
# summarize helps you quickly perform operations 
# (such as mean, sd, se, max, min, etc.) to summarize a dataset

#calculate the mean, sd, min, and max gdp of each continent
gapminder %>%
  group_by(continent) %>%
  summarize(average_gdp = mean(gdpPercap),
            sd_gdp = sd(gdpPercap),
            min_gdp = min(gdpPercap),
            max_gdp = max(gdpPercap)
            )

# calculate the mean, min, and max gdp of each country
gapminder %>%
  group_by(country) %>%
  summarize(average_gdp = mean(gdpPercap),
            sd_gdp = sd(gdpPercap),
            min_gdp = min(gdpPercap),
            max_gdp = max(gdpPercap)
            )


# calculate the mean, min, and max gdp of each country, 
# but group by continent too
gapminder %>%
  group_by(continent, country) %>%
  summarize(average_gdp = mean(gdpPercap),
            sd_gdp = sd(gdpPercap),
            min_gdp = min(gdpPercap),
            max_gdp = max(gdpPercap)
            )


