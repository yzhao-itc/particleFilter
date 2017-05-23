function [ X_next ] = PF( X, U, y, f, pmdl )
%basic particle filter by basic importance sampling and stochastic
%universal sampling for resampling
%   model:
%           x(k+1) = f(x(k), u(k)) + noise
%           y(k+1) = g(x(k)) + noise
%   X - samples of states (each row a sample)
%   U - controls
%   y - output measurement
%   f - state transition function
%   g - output measurement model
%   pmdl - probability model of posterior, i.e. p(y|x)
N = size(X,1);
X_next = nan(size(X));
w = nan(N,1);
for i=1:N
    temp = f(X(i,:),U);
    X_next(i,:) = temp(:).'; % forward
    w(i) = pmdl(X_next(i,:),y);
end
w = w/sum(w);
if sum(w)<1-1e-4
    return;
end

X_next = resampling(X_next,w);



end

