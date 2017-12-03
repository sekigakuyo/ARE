d_base = read.csv("randam.txt",row.names=1)
d = d_base
set.seed(123)

spcs_nm = function(x){
  summer = apply(x,1,sum)
  summer[summer>1] = 1
  return(sum(summer))
}

N = ncol(d_base)
smpl_nm = 10000
smpl = c()

making <- function(d,N){
  d$null = rep(0,nrow(d))
  for(i in 1:N){
    for(n in 1:smpl_nm){
      ex = sample(x= 1:N, size= i, replace= T)
      value = transform(d[ex],d$null)
      smpl = c(smpl,spcs_nm(value))
      }
  }
  return(smpl)
}

vec = making(d,N)
A_new = 1:20
data = list(S= vec, N= length(vec), A= rep(1:N,each=smpl_nm), A_new= A_new, N_new= length(A_new))
mt = matrix(vec,ncol=N)
