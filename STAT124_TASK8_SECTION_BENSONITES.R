# Members:
# Rosales, Celestine Joy
# Santos, Jhon Benson
# Sta Mina, Christine Isabel

#### Question Number 1 ----

set.seed(1)
X <- matrix(runif(100000),1000,100); z1 <- rep(0,1000)
for(i in 1:1000){
  for(j in 1:100){
    z1[i] <- z1[i] + X[i,j]
  }
}

# Using apply()
z_ver2 <- apply(X, 1, sum)

# Using rowSums()
z_ver3 <- rowSums(X)

# Checking if identical
identical(z1,z_ver2,z_ver3)

# Checking for system time
set.seed(1)
X <- matrix(runif(100000),1000,100); z <- rep(0,1000)
system.time(for(i in 1:1000){
  for(j in 1:100){
    z[i] <- z[i] + X[i,j]
  }
})

system.time(apply(X, 1, sum))

system.time(rowSums(X))  

#### Question Number 2 ----
set.seed(2)
n <- 100000; z2 <- rnorm(n)
zneg <- 0; j <- 1
for(i in 1:n){
  if(z2[i] <0){
    zneg[j] <- z2[i]
    j <- j+1
  }
}

# Using vectorized function
zneg_ver2 <- z2[z2<0]

# Checking if identical
identical(zneg,zneg_ver2)

# Checking systme time
set.seed(2)
n <- 100000; z2 <- rnorm(n)
zneg1 <- 0; j <- 1
system.time(for(i in 1:n){
  if(z2[i] <0){
    zneg1[j] <- z2[i]
    j <- j+1
  }
})

system.time(z2[z2<0])

# Notice that we changed variable names for the system time function to
# prevent it from overwriting our main data set. 
