load("basic_data.RData") #choose the data
all_vec = data.frame(in1,in2,in3,fr1,fr2,fr3,ba1,ba2,ba3) #change values before you use
N_cod = ncol(in1) #change value
N_sec = ncol(all_vec)/N_cod

name = paste0("X",(1:N_cod))
dataset = list()

for(i in 1:N_cod){
  exnum = seq(i,180,by= N_cod)
  dataset = c(dataset,list(all_vec[exnum]))
}
###############################################

set.seed(1)
smpl_nm = 1000
smpl = c()

spcs_nm = function(x){
  summer = apply(x,1,sum)
  summer[summer>1] = 1
  return(sum(summer))
}

making = function(d,N){
  d = as.data.frame(d)
  d$null = rep(0,nrow(d))
  for(i in 1:N){
    for(n in 1:smpl_nm){
      ex = sample(x= 1:N, size= i, replace= T)
      value = transform(d[ex],d$null)
      smpl = c(smpl,spcs_nm(value))
      }
  }
  mt = matrix(smpl,ncol=N)
  return(as.data.frame(mt))
}


bootstrip_data = lapply(dataset,making,N_sec)
prb_data = lapply(bootstrip_data,apply,2,quantile,c(0.02,0.5,0.975))



#A_new = 1:20
#data = list(S= vec, N= length(vec), A= rep(1:N,each=smpl_nm), A_new= A_new, N_new= length(A_new))
#mt = matrix(vec,ncol=N)
