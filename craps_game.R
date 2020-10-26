#Craps Markov model
#Define States:
#1: Win
#2: Lose
#3: Point=4,10
#4: Point=5,9
#5: Point=6,8
#6: Start

#Create Projection Matrix
P <- matrix(0.,6,6)

#Define roll probabilities
p2 <- 1./36.
p12 <- p2
p3 <- 2./36.
p11 <- p3
p4 <- 3./36.
p10 <- p4
p5 <- 4./36.
p9 <- p5
p6 <- 5./36.
p8 <- p6
p7 <- 6./36.

#Transition from Start state to Win
P[1,6] <- p7+p11
#Transition from Start state to Lose
P[2,6] <- p2+p3+p12
#Transition from Start state to Point=4,10
P[3,6] <- p4+p10
#Transition from Start state to Point=5,9
P[4,6] <- p5+p9
#Transition from Start state to Point=6,8
P[5,6] <- p6+p8

#Transition from Win to Win and Lose to Lose
P[1,1] <- 1.
P[2,2] <- 1.

#Transition from Point=4,10 to Win
P[1,3] <- p4  
#Transition from Point=4,10 to Lose
P[2,3] <- p7
#Transition from Point=4,10 to Point=4,10
P[3,3] <- 1.-p4-p7

#Transition from Point=5,9 to Win
P[1,4] <- p5
#Transition from Point=5,9 to Lose
P[2,4] <- p7
#Transition from Point=5,9 to Point=5,9
P[4,4] <- 1.-p5-p7

#Transition from Point=6,8 to Win
P[1,5] <- p6
#Transition from Point=6,8 to Lose
P[2,5] <- p7
#Transition from Point=6,8 to Point=6,8
P[5,5] <- 1.-p6-p7

S <- matrix(0,6,1)
S[6,1] <- 1.

for (i in 1:5) {
     S <- P%*%S
}
cat("Win %=",S[1],"\n")
cat("Lose %=",S[2],"\n")
cat("Still playing %=",S[3]+S[4]+S[5]+S[6],"\n")

