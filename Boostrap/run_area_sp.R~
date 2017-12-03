library(rstan)
library(ggmcmc)

rstan_options(auto_write=TRUE)
options(mc.cores=parallel::detectCores())



model = stan_model(file= "area_sp.stan")
fit = sampling(model,
               data= data,
               seed= 123
              )
   
