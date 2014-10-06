1;

# octave.m file 
# -------------------------------------------------------------------------------------------------------------------
# We have two opaque bags with two balls each. One has 2 black balls and the other has a black and withe ball 
# you pick a bag at random and then pick one of the ball from the back, if the ball is balck what is the probability 
# that the second is also black ? 
#
# Solving this exercise using a closed-form expression
# -------------------------------------------------------------------------------------------------------------------
#
# Bayes Law (conditional event)
#
# P(A|B) = (P(B|A) P(A)) / P(B)
#
# P(B) = 1/2 * 1 + 1/2 * 1/2
#      = 1/2 + 1/4
#      = 3/4
#
# For the 2nd ball to be black, then I must have picked the 1st bag, so:
#
# P(1st bag | B) = P(1st bag ^ B) / P(B)
#                = (1/2 * 1) / (3/4)
#                = 4/6
#
# 
# But we interest to solving the quitz with the Machine Help 

# ------------------------------------------------- set the Variable  ----------------------------------------------
# iterations, we need more iteration to converge 
iters = 10000;
# balls for every bags 
nballs = 2; 
# the bags (with black-1 and withe-0 balls) 
bags = [[0 1], [1 1]];

# pick at random a bag (randperm(2) -> [1 2] or [2 1] i hold only the first (1, :)) 
bag = bags(randperm (length (bags)), :)(1, :);

# shuffle the balls in the bag 
balls = bag(randperm(nballs), :)








