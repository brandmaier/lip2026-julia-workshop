require("MASS")


makepdf <- function(name) {
  
  time <- 1:6
  
  pdf(name)
  
  #set.seed(12334)
  set.seed(7234)
  
  smps <- mvrnorm(n=10,mu,Sigma)
  
  traj <- function(x) {
    rep(x[1],length(time))+x[2]*(time-1)
  }
  
  trajs <- apply(FUN=traj, smps, MARGIN=1)
  
  trajs <- trajs + rnorm(n=dim(trajs)[1]*
                           dim(trajs)[2],0,err)
  
  plot( 0, type="n",xlim=c(min(time),max(time)),ylim=c(10,60), xlab="Time",ylab="Score" )
  
  for (i in 1:dim(smps)[1]) {
    lines( time,trajs[,i], lw=2,col=rainbow(10)[i])
  }
  
  mu.pred <- mu[1]+time*mu[2]# colSums(matrix(mu) %*% t(matrix(t)))
  
  lines(time,mu.pred,lw=16, col="black")
  
  
  #polygon(cord.x,cord.y,col='skyblue')#
  dev.off()
  
}

# 
#
# - - - - - - - here we go - - - - - -
#
#

# fixed intercept

mu <- c(50,0)
Sigma <- matrix(c( 
  0,0,
  0,0
),nrow=2,ncol=2)
err <- 0

makepdf("lgcm-stepbystep1.pdf")

# fixed&random intercept

mu <- c(50,0)
Sigma <- matrix(c( 
  50,0,
  0,0
),nrow=2,ncol=2)
err <- 0

makepdf("lgcm-stepbystep2.pdf")

# fixed&random intercept

mu <- c(50,0)
Sigma <- matrix(c( 
  50,0,
  0,0
),nrow=2,ncol=2)
err <- 2

makepdf("lgcm-stepbystep2b.pdf")


# fixed&random icept & fixed slope

mu <- c(50,-3.2)
Sigma <- matrix(c( 
  50,0,
  0,0
  ),nrow=2,ncol=2)
err <- 0

makepdf("lgcm-stepbystep3.pdf")

# icept & slope, no noise

mu <- c(50,-3.2)
Sigma <- matrix(c( 
  50,0,
  0,3
),nrow=2,ncol=2)
err <- 0

makepdf("lgcm-stepbystep4.pdf")
# ---

# icept & slope & correlation
mu <- c(50,-3.2)
Sigma <- matrix(c( 
  50,4,
  4,3
),nrow=2,ncol=2)
err <- 0

makepdf("lgcm-stepbystep5.pdf")

# icept & slope & correlation
mu <- c(50,-3.2)
Sigma <- matrix(c( 
  50,4,
  4,3
),nrow=2,ncol=2)
err <- 2

makepdf("lgcm-stepbystep6.pdf")

