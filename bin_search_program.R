#### Binary Search Program
#### James R. Hunter
#### March 13, 2018
#### 
# Read file `players_list.rds` into memory as `players`
players <- readRDS("players_list.rds")
# Have a look at the structure `str` of `players`
str(players)

# Put `players` in alphabetical order with `sort` 
players <- sort(players)

# Initializing variables and finding middle_entry
size <- length(players)
lower_limit <- 1 
upper_limit <- size 
middle_entry <- size %/% 2
finished <- FALSE
iter <- 1
guesses <- middle_entry
target <- "Mantle"

# loop
while (!finished) { # keep repeating until finished == TRUE
  if (players[middle_entry] == target) { # passes test; go to end
    print(paste(target, "is entry number", middle_entry, "in the list."))
    print(paste("We used", iter, "iterations to find the target."))
    finished <- TRUE
  }
  else { # Needs additional iteration
    iter <- iter + 1 # increase iteration counter
    ifelse(target > players[middle_entry],               # test
           lower_limit <- middle_entry + 1,  # TRUE
           upper_limit <- middle_entry - 1)  # FALSE
    new_size <- upper_limit - lower_limit + 1 
    # 1 needed to include both end points
    middle_entry <- lower_limit + (new_size %/% 2)
    guesses <- c(guesses, middle_entry) # tally what inidices chosen
  }
}
