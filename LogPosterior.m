function [p] = LogPosterior(x,y,ind,measure)
if(measure~=1)
    mu    = x(1);
    tau   = x(2);
    sigma = x(3);
    theta = x(4:end);
    % Log-Prior
    log_prior = 0;
    % p(theta|mu,tau)
    for ii = 1:length(theta)
       log_prior = log_prior - (theta(ii)-mu)^2/2/tau^2 - log(tau);
    end
    % p(sigma)
    log_prior = log_prior + log(double(sigma>0));
    % p(tau)
    log_prior = log_prior + log(double(tau>0));
    % p(mu)
    log_prior = log_prior + log(1);
    % Log-Likelihood function
    log_likefun = 0;
    for ii = 1:length(theta)
       y_ii = y(ind==ii);
       for jj = 1:length(y_ii)
          log_likefun =  log_likefun - (y_ii(jj)-theta(ii))^2/2/sigma^2 - log(sigma);
       end
    end
    % Log Posterior
    p = log_prior + log_likefun;
else
    mu    = x(1);
    tau   = x(2);
    sigma = x(3);
    theta = x(4:end);
    % Log-Prior
    log_prior = 0;
    % p(theta|mu,tau)
    for ii = 1:length(theta)
       log_prior = log_prior - (theta(ii)-mu)^2/2/tau^2 - log(tau);
    end
    % p(sigma)
    log_prior = log_prior + log(double(sigma>0));
    % p(tau)
    log_prior = log_prior + log(double(tau>0));
    % p(mu)
    log_prior = log_prior + log(1);
    % Log-Likelihood function
    log_likefun = 0;
    for ii = 1:length(theta)
       y_ii_T = y(ind==ii);
       y_ii=y_ii_T(1);
       for jj = 1:length(y_ii)
          log_likefun =  log_likefun - (y_ii(jj)-theta(ii))^2/2/sigma^2 - log(sigma);
       end
    end
    % Log Posterior
    p = log_prior + log_likefun;
end
end