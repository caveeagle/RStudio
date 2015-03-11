
| One of the great advantages of using a statistical
| programming language like R is its vast collection of
| tools for simulating random numbers.

...

  |==                                                 |   3%

| This lesson assumes familiarity with a few common
| probability distributions, but these topics will only be
| discussed with respect to random number generation. Even
| if you have no prior experience with these concepts, you
| should be able to complete the lesson and understand the
| main ideas.

...

  |===                                                |   6%

| The first function we'll use to generate random numbers is
| sample(). Use ?sample to pull up the documentation.

> ?sample

| You got it right!

  |=====                                              |   9%

| Let's simulate rolling four six-sided dice: sample(1:6, 4,
| replace = TRUE).

> sample(1:6, 4, replace = TRUE)
[1] 4 5 1 2

| That's correct!

  |======                                             |  12%

| Now repeat the command to see how your result differs.
| (The probability of rolling the exact same result is
| (1/6)^4 = 0.00077, which is pretty small!)

> sample(1:6, 4, replace = TRUE)
[1] 4 1 5 2

| That's the answer I was looking for.

  |========                                           |  16%

| sample(1:6, 4, replace = TRUE) instructs R to randomly
| select four numbers between 1 and 6, WITH replacement.
| Sampling with replacement simply means that each number is
| "replaced" after it is selected, so that the same number
| can show up more than once. This is what we want here,
| since what you roll on one die shouldn't affect what you
| roll on any of the others.

...

  |==========                                         |  19%

| Now sample 10 numbers between 1 and 20, WITHOUT
| replacement. To sample without replacement, simply leave
| off the 'replace' argument.

> sample(1:20, 10, replace = FALSE)
 [1]  4 13 16 20 19 10  6  5 11  2

| Try again. Getting it right on the first try is boring
| anyway! Or, type info() for more options.

> sample(1:20, 10)
 [1] 10 20 13 16  5 12 11  3 14 18

| Perseverance, that's the answer.

  |===========                                        |  22%

| Since the last command sampled without replacement, no
| number appears more than once in the output.

...

  |=============                                      |  25%

| LETTERS is a predefined variable in R containing a vector
| of all 26 letters of the English alphabet. Take a look at
| it now.

> sample(LETTERS, 10)
 [1] "I" "R" "C" "F" "B" "E" "Q" "H" "D" "Y"

| Not quite! Try again. Or, type info() for more options.

| Type LETTERS to print its contents to the console.

> LETTERS
 [1] "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N"
[15] "O" "P" "Q" "R" "S" "T" "U" "V" "W" "X" "Y" "Z"

| Excellent work!

  |==============                                     |  28%

| The sample() function can also be used to permute, or
| rearrange, the elements of a vector. For example, try
| sample(LETTERS) to permute all 26 letters of the English
| alphabet.

> sample(LETTERS)
 [1] "O" "W" "N" "M" "U" "Y" "J" "D" "I" "R" "B" "G" "F" "Q"
[15] "P" "K" "C" "Z" "S" "H" "L" "T" "A" "V" "X" "E"

| You are amazing!

  |================                                   |  31%

| This is identical to taking a sample of size 26 from
| LETTERS, without replacement. When the 'size' argument to
| sample() is not specified, R takes a sample equal in size
| to the vector from which you are sampling.

...

  |==================                                 |  34%

| Now, suppose we want to simulate 100 flips of an unfair
| two-sided coin. This particular coin has a 0.3 probability
| of landing 'tails' and a 0.7 probability of landing
| 'heads'.

...

  |===================                                |  38%

| Let the value 0 represent tails and the value 1 represent
| heads. Use sample() to draw a sample of size 100 from the
| vector c(0,1), with replacement. Since the coin is unfair,
| we must attach specific probabilities to the values 0
| (tails) and 1 (heads) with a fourth argument, prob =
| c(0.3, 0.7). Assign the result to a new variable called
| flips.

> flips <- sample(c(0,1),size=100,replace=TRUE,prob=c(0.3,0.7))

| You're the best!

  |=====================                              |  41%

| View the contents of the flips variable.
| All that hard work is paying off!

  |======================                             |  44%

| Since we set the probability of landing heads on any given
| flip to be 0.7, we'd expect approximately 70 of our coin
| flips to have the value 1. Count the actual number of 1s
| contained in flips using the sum() function.

> sum(flips)
[1] 75

| That's correct!

  |========================                           |  47%

| A coin flip is a binary outcome (0 or 1) and we are
| performing 100 independent trials (coin flips), so we can
| use use rbinom() to simulate a binomial random variable.
| Pull up the documentation for rbinom() using ?rbinom.

> ?rbinom

| Great job!

  |==========================                         |  50%

| Each probability distribution in R has an r*** function
| (for "random"), a d*** function (for "density"), a p***
| (for "probability"), and q*** (for "quantile"). We are
| most interested in the r*** functions in this lesson, but
| I encourage you to explore the others on your own.

...

  |===========================                        |  53%

| A binomial random variable represents the number of
| 'successes' (heads) in a given number of independent
| 'trials' (coin flips). Therefore, we can generate a single
| random variable that represents the number of heads in 100
| flips of our unfair coin using rbinom(1, size = 100, prob
| = 0.7). Note that you only specify the probability of
| 'success' (heads) and NOT the probability of 'failure'
| (tails). Try it now.

> rbinom(1, size = 100, prob = 0.7)
[1] 69

| All that hard work is paying off!

  |=============================                      |  56%

| Equivalently, if we want to see all of the 0s and 1s, we
| can request 100 observations, each of size 1, with success
| probability of 0.7. Give it a try, assigning the result to
| a new variable called flips2.

> flips2 <- rbinom(1, size = 100, prob = 0.7)

| Try again. Getting it right on the first try is boring
| anyway! Or, type info() for more options.

| Call rbinom() with n = 100, size = 1, and prob = 0.7 and
| assign the result to flips2.

> flips2 <- rbinom(n=100, size = 1, prob = 0.7)

| Keep working like that and you'll get there!

  |==============================                     |  59%

| View the contents of flips2.

| Your dedication is inspiring!

  |================================                   |  62%

| Now use sum() to count the number of 1s (heads) in flips2.
| It should be close to 70!

> sum(flips2)
[1] 69

| You're the best!

  |=================================                  |  66%

| Similar to rbinom(), we can use R to simulate random
| numbers from many other probability distributions. Pull up
| the documentation for rnorm() now.

> ?rnorm

| Perseverance, that's the answer.

  |===================================                |  69%

| The standard normal distribution has mean 0 and standard
| deviation 1. As you can see under the 'Usage' section in
| the documentation, the default values for the 'mean' and
| 'sd' arguments to rnorm() are 0 and 1, respectively. Thus,
| rnorm(10) will generate 10 random numbers from a standard
| normal distribution. Give it a try.

> rnorm(10)
 [1]  1.350639611 -0.386763123  0.852431494 -1.345184342
 [5] -0.772095748 -1.310116352  0.075044500 -0.002860426
 [9] -0.419758551 -0.101916889

| All that hard work is paying off!

  |=====================================              |  72%

| Now do the same, except with a mean of 100 and a standard
| deviation of 25.

> play()

| Entering play mode. Experiment as you please, then type
| nxt() when you are ready to resume the lesson.

> R<-rnorm(1000)
> plot(R)
> hist(R,breaks=40)
> hist(R,breaks=100)
> hist(R,breaks=1000)

| Resuming lesson...


| Now do the same, except with a mean of 100 and a standard
| deviation of 25.

> rnorm(10,mean=100,sd=25)
 [1]  90.25933  83.83511 137.41027 103.70212 109.65601
 [6]  94.45024  86.87427  99.36073 173.08204  81.09782

| Keep up the great work!

  |======================================             |  75%

| Finally, what if we want to simulate 100 *groups* of
| random numbers, each containing 5 values generated from a
| Poisson distribution with mean 10? Let's start with one
| group of 5 numbers, then I'll show you how to repeat the
| operation 100 times in a convenient and compact way.

...

  |========================================           |  78%

| Generate 5 random values from a Poisson distribution with
| mean 10. Check out the documentation for rpois() if you
| need help.

> ?rpois
> rpois(n=5,lambda=10)
[1] 14 13  5 14  9

| Your dedication is inspiring!

  |=========================================          |  81%

| Now use replicate(100, rpois(5, 10)) to perform this
| operation 100 times. Store the result in a new variable
| called my_pois.

> my_pois <- replicate(100, rpois(5, 10))

| That's the answer I was looking for.

  |===========================================        |  84%

| Take a look at the contents of my_pois.

!                                             Perseverance, that's the answer. !

  |=============================================      |  88%

| replicate() created a matrix, each column of which
| contains 5 random numbers generated from a Poisson
| distribution with mean 10. Now we can find the mean of
| each column in my_pois using the colMeans() function.
| Store the result in a variable called cm.

> cm <- colMeans(my_pois)

| That's the answer I was looking for.

  |==============================================     |  91%

| And let's take a look at the distribution of our column
| means by plotting a histogram with hist(cm).

> hist(cm)

| You nailed it! Good job!

  |================================================   |  94%

| Looks like our column means are almost normally
| distributed, right? That's the Central Limit Theorem at
| work, but that's a lesson for another day!

...

  |=================================================  |  97%

| All of the standard probability distributions are built
| into R, including exponential (rexp()), chi-squared
| (rchisq()), gamma (rgamma()), .... Well, you see the
| pattern.

...

  |===================================================| 100%

| Simulation is practically a field of its own and we've
| only skimmed the surface of what's possible. I encourage
| you to explore these and other functions further on your
| own.

