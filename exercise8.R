rm(list = ls())

#Game score plot
game <- read.table("UWvMSU_1-22-13.txt", header = TRUE, sep = "\t", stringsAsFactors = FALSE)
scoreMSU <- 0
scoreUW <- 0
len = nrow(game)
gm.df <- data.frame("Time"=rep(0,len),"UW"=rep(0,len),"MSU"=rep(0,len))
for(i in 1:len){
  t = game[i,1]
  if(game[i,2]=="MSU"){
    scoreMSU = scoreMSU + game[i,3]
  }
  else if(game[i,2]=="UW"){
    scoreUW = scoreUW + game[i,3]
  }
  gm.df[i,] <- c(t, scoreUW, scoreMSU)
}
plot(gm.df$Time, gm.df$UW, type = "l", xlab = "Time", ylab = "Score", col = "red")
lines(gm.df$Time, gm.df$MSU, col = "green")

#GUESSING GAME 
guess = function(){
  set = c(1:100) 
  code = sample(set, 1)
  i = 0
  guess = -1
  while(i < 10 & guess!=code){
    guess = readline(prompt = "guess a number between 1 and 100: ")
    if(guess > code){
      print("lower")
      i = i+1
    }
    else if(guess < code){
      print("higher")
      i = i+1
    }
    else if (guess==code){
      print("You WIN!")
    }
  }
}
