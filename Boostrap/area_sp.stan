data {
  int N;
  int S[N];
  int A[N];
  int N_new;
  int A_new[N_new];
}

parameters {
  real<lower=0> c;
  real<lower=0> sigma;
}

transformed parameters {
  real s_base[N];
  for(n in 1:N){
    s_base[n] = A[n]*c;
  }
}

model {
  for(n in 1:N){
    S[n] ~ normal(s_base[n],sigma);
  }
}

generated quantities {
  real s_base_new[N_new];
  real s_new[N_new];
  for(n in 1:N_new) {
    s_base_new[n] = A_new[n]*c;
    s_new[n] = normal_rng(s_base_new[n],sigma);
  }
}