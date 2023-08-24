rm(list = ls())
cat("\014")

k <- 1:10
k
sum(k)
k^2
k[1:3]
x <- 2*k
x 
x[1:4]
sum(x)
prod(x)
a1 <- c(1,2,3)
a2 <- c(1,2,3)
a1+a2
a1*a2
y <- a1*a2

k <- 0:10
for (i in 1:11) {
  print(0:k[i])
  
}

for (i in 1:2){
  print(i+1)
}
