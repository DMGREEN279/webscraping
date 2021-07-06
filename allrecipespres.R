library(ggplot2)
library(tidyr)
library(dplyr)

glufree <- allrecipes[allrecipes$recipe.type == 'gf',]



medt  <- allrecipes[allrecipes$recipe.type == 'med',]

diabet  <- allrecipes[allrecipes$recipe.type == 'diabetic',]

keeto  <- allrecipes[allrecipes$recipe.type == 'keto',]

lcarb  <- allrecipes[allrecipes$recipe.type == 'lowcarb',]

ggplot(data = allrecipes, aes(y = allrecipes$ratings)) + 
  geom_bar(aes(fill = recipe.type), position = "dodge")

#ratings
ggplot(allrecipes, aes(fill=recipe.type, y=ratings, x=recipe.type, group = recipe.type)) +
  geom_bar(position = position_dodge(width = 0.9), stat="summary", fun = mean) + ylab('Average Number of Ratings') + xlab("Recipe Type") + ggtitle("Average Number of Ratings Across Recipe Types")

#stars
ggplot(allrecipes, aes(fill=recipe.type, y=stars, x=recipe.type, group = recipe.type)) +
  geom_bar(position = position_dodge(width = 0.9), stat="summary", fun = mean) +ylab('Average Number of Stars') + xlab("Recipe Type") + ggtitle("Average Rating in Stars Across Recipe Types")

#reviews

ggplot(allrecipes, aes(fill=recipe.type, y=reviews, x=recipe.type, group = recipe.type)) +
  geom_bar(position = position_dodge(width = 0.9), stat="summary", fun = mean) + ylab('Average Number of Reviews') + xlab("Recipe Type") + ggtitle("Average Number of Reviews Across Recipe Types")

#preptime
ggplot(allrecipes, aes(fill=recipe.type, y=prep, x=recipe.type, group = recipe.type)) +
  geom_bar(position = position_dodge(width = 0.9), stat="summary", fun = mean) + ylab(' Prep time (mins)') + xlab("Recipe Type") + ggtitle("Average Prep Time Across Recipe Types")

#cooktime

ggplot(allrecipes, aes(fill=recipe.type, y=cook, x=recipe.type, group = recipe.type)) +
  geom_bar(position = position_dodge(width = 0.9), stat="summary", fun = mean) + ylab('Average Cook Time (mins)') + xlab("Recipe Type") + ggtitle("Average Cook Time Across Recipe Types")


#total

ggplot(allrecipes, aes(fill=recipe.type, y=total, x=recipe.type, group = recipe.type)) +
  geom_bar(position = position_dodge(width = 0.9), stat="summary", fun = mean) + ylab('Total Prep time (mins)') + xlab("Recipe Type") + ggtitle("Average Time to Fully Prepare Recipe Across Recipe Types")

#servings

ggplot(allrecipes, aes(fill=recipe.type, y=servings, x=recipe.type, group = recipe.type)) +
  geom_bar(position = position_dodge(width = 0.9), stat="summary", fun = mean) + ylab('Average Number of Servings') + xlab("Recipe Type") + ggtitle("Average Number of Servings Across Recipe Types")


t.test(keeto$total, diabet$total, alternative = "two.sided")

DR <- diabet$reviews
LC <- lcarb$reviews

DR
diabet$reviews
