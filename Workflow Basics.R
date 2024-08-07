1/200 * 30
(59+73+2)/3
sin(pi/2)
# create new object with the assignment operator <-
x <- 3 * 4
x
# combine multiple elements into a vector with c()
primes <- c(2, 3, 5, 7, 11, 13)
primes
primes * 2
primes - 1
# CALLING FUNCTIONS
# function_name(argument1 = value1, argument2 = value2, ......)
# Create a sequence of numbers from 1 to 10
seq(from = 1, to = 10)
# the above sequence can also be called like this:
seq(1, 10)
install.packages("tidyverse")
library(tidyverse)
install.packages("palmerpenguins")
library(palmerpenguins)
install.packages("ggthemes")
library(ggthemes)
penguins
# to get all the variables(column names) and first few observations of each variable
glimpse(penguins)
# Get all the column names
names(penguins)
# get first six rows of the dataframe
head(penguins)
# get last sixrows of the dataframe
tail(penguins)
# get the number of rows in the dataframe
nrow(penguins)
# get the number of columns in the dataframe
ncol(penguins)
# get the shape of the dataframe
dim(penguins)
# Creating a gglpot
ggplot(data = penguins) # this creates an empty plot
# Now we need to add aesthetics that is add the x and y axis to the plot
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
)
# to represent data on this plot we would need to add geometrical object geom:
# eg bar chart uses geom_bar(), line_chart uses geom_line(), box plot geom_boxplot()
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) + 
  geom_point() # plots a scatter plot
# The relationship between flipper length and body mass seems to be positive and 
# moderately strong with not too much scatter around the diagonal line
# ADDING AESTHETICS AND LAYERS
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) + 
  geom_point()
# Add one more layer a smooth curve displaying relationship between flipper length and body mass
# For this we would need to add geom_smooth as a layer on top of geom_point()
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) + 
  geom_point() + 
  geom_smooth(method = "lm") # lm for line of best fit
# Here we got a line for each of the species bcos here aes are defined in ggplot, at the global level
# Since we want points to be colored based on species but don't want lines to be separated out
# specify color = species for geom_point() only bcos otherwise
# we would get color for geom_smooth() too which we don't want
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) + 
  geom_point(mapping = aes(color = species)) + 
  geom_smooth(method = "lm")
# we want different shapes for each species of penguins
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)
) + 
  geom_point(mapping = aes(color = species, shape = species)) + 
  geom_smooth(method = "lm")
# Improve labels using the labs() function
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) + 
  geom_point(mapping = aes(color = species, shape = species)) + 
  geom_smooth(method = "lm") + 
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adelie, Chinstrap and Gentoo penguins",
    x = "flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species"
  ) + 
  scale_color_colorblind()